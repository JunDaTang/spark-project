package com.ibeifeng.sparkproject.spark.product;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.httpclient.util.DateUtil;
import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaPairRDD;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.api.java.function.Function;
import org.apache.spark.api.java.function.PairFunction;
import org.apache.spark.api.java.function.VoidFunction;
import org.apache.spark.sql.DataFrame;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.RowFactory;
import org.apache.spark.sql.SQLContext;
import org.apache.spark.sql.api.java.UDF3;
import org.apache.spark.sql.types.DataTypes;
import org.apache.spark.sql.types.StructField;
import org.apache.spark.sql.types.StructType;

import com.alibaba.fastjson.JSONObject;
import com.ibeifeng.sparkproject.conf.ConfigurationManager;
import com.ibeifeng.sparkproject.constant.Constants;
import com.ibeifeng.sparkproject.dao.ITaskDAO;
import com.ibeifeng.sparkproject.dao.factory.DAOFactory;
import com.ibeifeng.sparkproject.domain.Task;
import com.ibeifeng.sparkproject.util.ParamUtils;
import com.ibeifeng.sparkproject.util.SparkUtils;

import scala.Function1;
import scala.Function2;
import scala.Tuple2;
import scala.runtime.BoxedUnit;

/*
1、查询task，获取日期范围，通过Spark SQL，查询user_visit_action表中的指定日期范围内的数据，过滤出，商品点击行为，click_product_id is not null；click_product_id != 'NULL'；click_product_id != 'null'；city_id，click_product_id
2、使用Spark SQL从MySQL中查询出来城市信息（city_id、city_name、area），用户访问行为数据要跟城市信息进行join，city_id、city_name、area、product_id，RDD，转换成DataFrame，注册成一个临时表
3、Spark SQL内置函数（case when），对area打标记（华东大区，A级，华中大区，B级，东北大区，C级，西北大区，D级），area_level
4、计算出来每个区域下每个商品的点击次数，group by area, product_id；保留每个区域的城市名称列表；自定义UDAF，group_concat_distinct()函数，聚合出来一个city_names字段，area、product_id、city_names、click_count
5、join商品明细表，hive（product_id、product_name、extend_info），extend_info是json类型，自定义UDF，get_json_object()函数，取出其中的product_status字段，if()函数（Spark SQL内置函数），判断，0 自营，1 第三方；（area、product_id、city_names、click_count、product_name、product_status）
6、开窗函数，根据area来聚合，获取每个area下，click_count排名前3的product信息；area、area_level、product_id、city_names、click_count、product_name、product_status
7、结果写入MySQL表中
 */
public class AreaTop3ProductSpark {
	public static void main(String[] args) {
		// init
		SparkConf conf = new SparkConf().setAppName("AreaTop3ProductSpark");
		SparkUtils.setMaster(conf);
		JavaSparkContext sc = new JavaSparkContext(conf);
		SQLContext sqlContext = SparkUtils.getSQLContext(sc.sc());
		
		// 定义udf自定义函数:concat_long_string：返回结果，例：“1,北京”
		sqlContext.udf().register("concat_long_string", new UDF3<Long, String, String, String>(){
			private static final long serialVersionUID = 1L;

			@Override
			public String call(Long cityId, String cityName, String split) throws Exception {
				// TODO Auto-generated method stub
				return cityId.toString() + split + cityName;
			}
		}, DataTypes.StringType);
		// 生成数据
		SparkUtils.mockData(sc, sqlContext);
		
		//1、查询task，获取日期范围，通过Spark SQL，查询user_visit_action表中的指定日期范围内的数据，过滤出，商品点击行为，click_product_id is not null；click_product_id != 'NULL'；click_product_id != 'null'；city_id，click_product_id
		
		// 获取taskid,查询task，获取日期范围
		Long taskid = ParamUtils.getTaskIdFromArgs(args, Constants.SPARK_LOCAL_TASKID_PRODUCT);
		ITaskDAO taskDAO = DAOFactory.getTaskDAO();
		Task task = taskDAO.findById(taskid);
		JSONObject taskParam = JSONObject.parseObject(task.getTaskParam());
		String startDate = ParamUtils.getParam(taskParam, Constants.PARAM_START_DATE);
		String endDate = ParamUtils.getParam(taskParam, Constants.PARAM_END_DATE);
		
		// 查询user_visit_action表中的指定日期范围内的数据，过滤出，商品点击行为; 
		// RDD:<cityid,商品点击行为> -> <city_id,(city_id, product_id)>
		// 技术点1：Hive数据源的使用
		JavaPairRDD<Long, Row> cityid2clickActionRDD = getcityid2ClickActionRDDByDate(sqlContext, startDate,endDate);
		
		System.out.println("cityid2clickActionRDD: " + cityid2clickActionRDD.count());  
		
		// 2、使用Spark SQL从MySQL中查询出来城市信息（city_id、city_name、area），用户访问行为数据要跟城市信息进行join，city_id、city_name、area、product_id，RDD，转换成DataFrame，注册成一个临时表
		
		// 从MySQL中查询城市信息,RDD: <city_id, (city_id, city_name, area) >
		// 技术点2：异构数据源之MySQL的使用
		JavaPairRDD<Long, Row> cityid2cityInfoRDD = getcityid2CityInfoRDD(sqlContext);
		System.out.println("cityid2CityInfoRDD: " + cityid2cityInfoRDD.count()); 
		
		
		// 生成点击商品基础信息临时表
		// 技术点3：将RDD转换为DataFrame，并注册临时表
		enerateTempClickProductBasicTable(sqlContext, cityid2clickActionRDD, cityid2cityInfoRDD);
		
		
		
		//4、计算出来每个区域下每个商品的点击次数，group by area, product_id；保留每个区域的城市名称列表；自定义UDAF，group_concat_distinct()函数，聚合出来一个city_names字段，area、product_id、city_names、click_count
		// 1 北京
		// 2 上海
		// 1 北京
		// group by area,product_id
		// 1:北京,2:上海
		
		// 两个函数
		// UDF：concat2()，将两个字段拼接起来，用指定的分隔符
		// UDAF：group_concat_distinct()，将一个分组中的多个字段值，用逗号拼接起来，同时进行去重
		sc.close();
	}
	
	/**生成点击商品基础信息临时表
	 * @param sqlContext
	 * @param cityid2clickActionRDD 商品点击行为
	 * @param cityid2CityInfoRDD 城市信息
	 */
	public static void enerateTempClickProductBasicTable(SQLContext sqlContext, 
			JavaPairRDD<Long, Row> cityid2clickActionRDD,
			JavaPairRDD<Long, Row> cityid2cityInfoRDD) {
		// join两RDD
		JavaPairRDD<Long, Tuple2<Row, Row>> joinedRDD = cityid2clickActionRDD.join(cityid2cityInfoRDD);
		
		// 为df表准备源数据:city_id、city_name、area、product_id
		JavaRDD<Row> mappedRDD = joinedRDD.map(new Function<Tuple2<Long,Tuple2<Row,Row>>, Row>() {

			private static final long serialVersionUID = 1L;

			@Override
			public Row call(Tuple2<Long, Tuple2<Row, Row>> tuple) throws Exception {
				long cityId = tuple._1;
				Row clickAction = tuple._2._1;
				Row cityInfo = tuple._2._2;
				String cityName = cityInfo.getString(1);
				String area = cityInfo.getString(2);
				long productId = clickAction.getLong(1);
				
				return new RowFactory().create(cityId, cityName, area, productId);
			}
		});
		
		// 创造schema
		List<StructField> structFields = new ArrayList<StructField>();
		structFields.add( DataTypes.createStructField("city_id", DataTypes.LongType, true));
		structFields.add( DataTypes.createStructField("city_name", DataTypes.StringType, true));
		structFields.add( DataTypes.createStructField("area", DataTypes.StringType, true));
		structFields.add( DataTypes.createStructField("product_id", DataTypes.LongType, true));
		StructType schema = DataTypes.createStructType(structFields);
		
		
		DataFrame df = sqlContext.createDataFrame(mappedRDD, schema);
		
//		System.out.println("tmp_click_product_basic" + df.count());
//		df.show();
		df.registerTempTable("tmp_click_product_basic");
	}
	
	
	
	/**查询城市信息
	 * @param sqlContext
	 * @return 城市信息
	 */
	public static JavaPairRDD<Long, Row> getcityid2CityInfoRDD(SQLContext sqlContext){
		// 分别将mysql中两张表的数据加载为DataFrame
//		Map<String, String> options = new HashMap<String, String>();
//		options.put("url", "jdbc:mysql://spark1:3306/testdb");
//		options.put("dbtable", "student_infos");
//		DataFrame studentInfosDF = sqlContext.read().format("jdbc")
//				.options(options).load();
//	
//		options.put("dbtable", "student_scores");
//		DataFrame studentScoresDF = sqlContext.read().format("jdbc")
//				.options(options).load();
		// 连接mysql并获取city_info表数据
		String url = null;
		String user = null;
		String password = null;
		Boolean local = ConfigurationManager.getBoolean(Constants.SPARK_LOCAL);
		if(local) {
			url = ConfigurationManager.getProperty(Constants.JDBC_URL);
			user = ConfigurationManager.getProperty(Constants.JDBC_USER);
			password = ConfigurationManager.getProperty(Constants.JDBC_PASSWORD);
		}else {
			url = ConfigurationManager.getProperty(Constants.JDBC_URL_PROD);
			user = ConfigurationManager.getProperty(Constants.JDBC_USER_PROD);
			password = ConfigurationManager.getProperty(Constants.JDBC_PASSWORD_PROD);
		}
		
		Map<String, String> options = new HashMap<String, String>();
		options.put("url", url);
		options.put("dbtable", "city_info");
		options.put("user", user);
		options.put("password", password);
		
		DataFrame cityInfoDF = sqlContext.read().format("jdbc").options(options).load();
		JavaRDD<Row> cityInfoRDD = cityInfoDF.javaRDD();
		
		// 将表数据(city_id, city_name, area) 转化为 <city_id, (city_id, city_name, area) >
		JavaPairRDD<Long, Row> cityid2CityInfoRDD = cityInfoRDD.mapToPair(new PairFunction<Row, Long, Row>() {

			private static final long serialVersionUID = 1L;

			@Override
			public Tuple2<Long, Row> call(Row row) throws Exception {
				Long cityId = Long.valueOf(String.valueOf(row.get(0)));
				return new Tuple2<Long, Row>(cityId, row);
			}
		});
		return cityid2CityInfoRDD;
	}

	/**查询指定日期范围内的数据
	 * @param sqlContext
	 * @param startDate 开始时间
	 * @param endDate 结束时间
	 * @return 点击行为数据
	 */
	public static JavaPairRDD<Long, Row> getcityid2ClickActionRDDByDate(SQLContext sqlContext, String startDate, String endDate) {
//		StructType schema = DataTypes.createStructType(Arrays.asList(
//				DataTypes.createStructField("date", DataTypes.StringType, true),
//				DataTypes.createStructField("user_id", DataTypes.LongType, true),
//				DataTypes.createStructField("session_id", DataTypes.StringType, true),
//				DataTypes.createStructField("page_id", DataTypes.LongType, true),
//				DataTypes.createStructField("action_time", DataTypes.StringType, true),
//				DataTypes.createStructField("search_keyword", DataTypes.StringType, true),
//				DataTypes.createStructField("click_category_id", DataTypes.LongType, true),
//				DataTypes.createStructField("click_product_id", DataTypes.LongType, true),
//				DataTypes.createStructField("order_category_ids", DataTypes.StringType, true),
//				DataTypes.createStructField("order_product_ids", DataTypes.StringType, true),
//				DataTypes.createStructField("pay_category_ids", DataTypes.StringType, true),
//				DataTypes.createStructField("pay_product_ids", DataTypes.StringType, true),
//				DataTypes.createStructField("city_id", DataTypes.LongType, true)));
		//table:user_visit_action
		String sql = "select "
				+ "city_id,"
				+ "click_product_id product_id "
				+ "from user_visit_action "
				+ "where click_product_id  IS NOT NULL "
				+ "and date >= '" + startDate + "' "
				+ "and date <= '" + endDate + "'";
		
		DataFrame df = sqlContext.sql(sql);
		JavaRDD<Row> clickActionRDD = df.javaRDD();
		//RDD: <city_id,(city_id, product_id)>
		JavaPairRDD<Long, Row> cityid2clickActionRDD = clickActionRDD.mapToPair(new PairFunction<Row, Long, Row>() {

			private static final long serialVersionUID = 1L;

			@Override
			public Tuple2<Long, Row> call(Row row) throws Exception {
				long cityId = row.getLong(0);
				
				return new Tuple2<Long, Row>(cityId, row);
				
			}
		});
		return cityid2clickActionRDD;
	}
}
