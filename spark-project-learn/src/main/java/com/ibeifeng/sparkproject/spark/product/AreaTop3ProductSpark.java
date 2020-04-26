package com.ibeifeng.sparkproject.spark.product;

import java.util.Arrays;

import org.apache.commons.httpclient.util.DateUtil;
import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaPairRDD;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.api.java.function.PairFunction;
import org.apache.spark.api.java.function.VoidFunction;
import org.apache.spark.sql.DataFrame;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SQLContext;
import org.apache.spark.sql.types.DataTypes;
import org.apache.spark.sql.types.StructType;

import com.alibaba.fastjson.JSONObject;
import com.ibeifeng.sparkproject.constant.Constants;
import com.ibeifeng.sparkproject.dao.ITaskDAO;
import com.ibeifeng.sparkproject.dao.factory.DAOFactory;
import com.ibeifeng.sparkproject.domain.Task;
import com.ibeifeng.sparkproject.util.ParamUtils;
import com.ibeifeng.sparkproject.util.SparkUtils;

import scala.Tuple2;

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
		SparkConf conf = new SparkConf().setAppName("AreaTop3ProductSpark").setMaster("local");
		JavaSparkContext sc = new JavaSparkContext(conf);
		SQLContext sqlContext = new SQLContext(sc);
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
		JavaPairRDD<Long, Row> cityid2ClickActionRDD = getcityid2ClickActionRDDByDate(sqlContext, startDate,endDate);
		cityid2ClickActionRDD.foreach(new VoidFunction<Tuple2<Long,Row>>() {
			
			@Override
			public void call(Tuple2<Long, Row> t) throws Exception {
				System.out.println("cityid:"+ t._1 + " row:" + t._2);
				
			}
		});
	}

	/**查询user_visit_action表中的指定日期范围内的数据
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
