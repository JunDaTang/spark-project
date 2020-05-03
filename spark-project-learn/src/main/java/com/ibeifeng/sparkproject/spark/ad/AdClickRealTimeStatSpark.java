package com.ibeifeng.sparkproject.spark.ad;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.calcite.avatica.util.DateTimeUtils;
import org.apache.commons.httpclient.util.DateUtil;
import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaPairRDD;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.api.java.function.Function;
import org.apache.spark.api.java.function.Function2;
import org.apache.spark.api.java.function.PairFunction;
import org.apache.spark.api.java.function.VoidFunction;
import org.apache.spark.sql.DataFrame;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.RowFactory;
import org.apache.spark.sql.hive.HiveContext;
import org.apache.spark.sql.types.DataTypes;
import org.apache.spark.sql.types.StructType;
import org.apache.spark.streaming.Durations;
import org.apache.spark.streaming.api.java.JavaDStream;
import org.apache.spark.streaming.api.java.JavaPairDStream;
import org.apache.spark.streaming.api.java.JavaPairInputDStream;
import org.apache.spark.streaming.api.java.JavaStreamingContext;
import org.apache.spark.streaming.kafka.KafkaUtils;

import com.google.common.base.Optional;
import com.ibeifeng.sparkproject.dao.IAdBlacklistDAO;
import com.ibeifeng.sparkproject.dao.IAdClickTrendDAO;
import com.ibeifeng.sparkproject.dao.IAdProvinceTop3DAO;
import com.ibeifeng.sparkproject.dao.IAdStatDAO;
import com.ibeifeng.sparkproject.dao.IAdUserClickCountDAO;
import com.ibeifeng.sparkproject.dao.factory.DAOFactory;
import com.ibeifeng.sparkproject.domain.AdBlacklist;
import com.ibeifeng.sparkproject.domain.AdClickTrend;
import com.ibeifeng.sparkproject.domain.AdProvinceTop3;
import com.ibeifeng.sparkproject.domain.AdStat;
import com.ibeifeng.sparkproject.domain.AdUserClickCount;
import com.ibeifeng.sparkproject.util.DateUtils;
import com.ibeifeng.sparkproject.util.SparkUtils;

import kafka.serializer.StringDecoder;
import scala.Tuple2;


/**
 * 
 1、实现实时的动态黑名单机制：将每天对某个广告点击超过100次的用户拉黑
2、基于黑名单的非法广告点击流量过滤机制：
3、每天各省各城市各广告的点击流量实时统计：
4、统计每天各省top3热门广告
5、统计各广告最近1小时内的点击量趋势：各广告最近1小时内各分钟的点击量
6、使用高性能方式将实时统计结果写入MySQL
7、实现实时计算程序的HA高可用性（Spark Streaming HA方案）
8、实现实时计算程序的性能调优（Spark Streaming Performence Tuning方案）
 * @author jed
 *
 */
public class AdClickRealTimeStatSpark {
	public static void main(String[] args) {
		// init spark streaming
		SparkConf conf = new SparkConf().setAppName("AdClickRealTimeStatSpark").setMaster("local[2]");
//		SparkUtils.setMaster(conf);
		// 配置5秒
		JavaStreamingContext jsc = new JavaStreamingContext(conf, Durations.seconds(5));
		
		// config kafka direct api
		Map<String, String> kafkaParams = new HashMap<String, String>();
		kafkaParams.put("metadata.broker.list", "sparkproject1:9092, sparkproject2:9092, sparkproject3:9092");
		
		Set<String> topics = new HashSet<String>();
		topics.add("AdRealTimeLog");
		JavaPairInputDStream<String, String> adRealTimeLogDStream = KafkaUtils.createDirectStream(
				jsc, 
				String.class, 
				String.class,
				StringDecoder.class, 
				StringDecoder.class, 
				kafkaParams, topics);
		
		// 日志数据格式
//		timestamp	1450702800
//		province 	Jiangsu	
//		city 	Nanjing
//		userid 	100001
//		adid 	100001
		
		// 1、实现实时的动态黑名单机制：将每天对某个广告点击超过100次的用户拉黑
		addBlackList(adRealTimeLogDStream);
		
		// 2、基于黑名单的非法广告点击流量过滤机制：
		JavaPairDStream<String,String> filteredAdRealTimeLogDStream = filterByBlacklist(adRealTimeLogDStream);
		
		//3、每天各省各城市各广告的点击流量实时统计：返回结果<yyyyMMdd_province_city_userid_adid, clickCount>
		JavaPairDStream<String, Long> adRealTimeStatDStream = calculateRealTimeStat(filteredAdRealTimeLogDStream);
		
		// 4、统计每天各省top3热门广告
		calculateProvinceTop3Ad(adRealTimeStatDStream);  
		
		//5、统计各广告最近1小时内的点击量趋势：各广告最近1小时内各分钟的点击量
		calculateAdClickCountByWindow(adRealTimeLogDStream);  
		
		// 构建完spark streaming上下文之后，记得要进行上下文的启动、等待执行结束、关闭
		jsc.start();
		jsc.awaitTermination();
		jsc.close();
	}
	
	/**5、统计各广告最近1小时内的点击量趋势：各广告最近1小时内各分钟的点击量
	 * @param adRealTimeLogDStream
	 */
	public static void calculateAdClickCountByWindow(JavaPairInputDStream<String, String> adRealTimeLogDStream) {
		// 先把5分钟流内的所有rdd处理成<yyyyMMddHHmm_adid, 1>
		// 用移动窗口以10s间隔，聚合出近1小时内<yyyyMMddHHmm_adid, clickCount>, 其实这就是各分钟各广告的点击量
		// 保存进mysql
		
		JavaPairDStream<String, Long> mapToPairDStream = adRealTimeLogDStream.mapToPair(new PairFunction<Tuple2<String,String>, String, Long>() {
			// 先把5分钟流内的所有rdd处理成<yyyyMMddHHmm_adid, 1>

			@Override
			public Tuple2<String, Long> call(Tuple2<String, String> tuple) throws Exception {
				// 从tuple中获取log
				String log = tuple._2;
				// 从log中提取出信息，并把时间转换处理下(yyyyMMddHHmm)
				String[] logSplitted = log.split(" ");
				String timestamp = logSplitted[0];
				Date date = new Date(Long.valueOf(timestamp));
				String datekey = DateUtils.formatTimeMinute(date);
				Long adid = Long.valueOf(logSplitted[4]);
				
				// 拼接key:yyyyMMddHHmm_adid
				String key = datekey + "_" + adid;
				return new Tuple2<String, Long>(key,  1L);
			}
			
			
		});
		
		JavaPairDStream<String, Long> reduceByKeyAndWindowDStream = mapToPairDStream.reduceByKeyAndWindow(new Function2<Long, Long, Long>() {
			
			/**
			 * // 用移动窗口以10s间隔，聚合出近1小时内<yyyyMMddHHmm_adid, clickCount>, 其实这就是各分钟各广告的点击量
			 */
			private static final long serialVersionUID = 1L;

			@Override
			public Long call(Long v1, Long v2) throws Exception {
				// TODO Auto-generated method stub
				return v1+v2;
			}
		}, Durations.minutes(60), Durations.milliseconds(10));
		
		// 保存进mysql
		reduceByKeyAndWindowDStream.foreachRDD(new Function<JavaPairRDD<String,Long>, Void>() {
			
			@Override
			public Void call(JavaPairRDD<String, Long> rdd) throws Exception {
				rdd.foreachPartition(new VoidFunction<Iterator<Tuple2<String,Long>>>() {
					
					@Override
					public void call(Iterator<Tuple2<String, Long>> iterator) throws Exception {
						
						ArrayList<AdClickTrend> adClickTrends = new ArrayList<AdClickTrend>();
						while (iterator.hasNext()) {
							Tuple2<String, Long> tuple = iterator.next();
							// 解析数据
							String[] splitted = tuple._1.split("_");
							//yyyyMMddHHmm
							String dateMinute = splitted[0];
							
							String date = String.valueOf(DateUtils.parseDateKey(dateMinute.substring(0,8)));
							String hour = dateMinute.substring(8,10);
							String minute = dateMinute.substring(10);
							Long adid = Long.valueOf(String.valueOf(splitted[1]));
							Long clickCount = Long.valueOf(String.valueOf(tuple._2));
							
							// 加载进javabean
							AdClickTrend adClickTrend = new AdClickTrend();
							adClickTrend.setDate(date);
							adClickTrend.setHour(hour);
							adClickTrend.setMinute(minute);
							adClickTrend.setAdid(adid);
							adClickTrend.setClickCount(clickCount);
							
							
							
							adClickTrends.add(adClickTrend);
						}
						
						IAdClickTrendDAO adClickTrendDAO = DAOFactory.getAdClickTrendDAO();
						// 更新到mysql中
						adClickTrendDAO.updateBatch(adClickTrends);
						
					}
				});
				return null;
			}
		});
	}

	/**统计每天各省top3热门广告
	 * @param adRealTimeStatDStream 每天各省各城市各广告的点击流量实时数据<yyyyMMdd_province_city_userid_adid, clickCount>
	 */
	public static void calculateProvinceTop3Ad(JavaPairDStream<String, Long> adRealTimeStatDStream) {
		JavaDStream<Row> provinceTop3AdDStream = adRealTimeStatDStream.transform(new Function<JavaPairRDD<String,Long>, JavaRDD<Row>>() {

			/**
			 * 将<yyyyMMdd_province_city_userid_adid, clickCount> 处理转化 成<yyyyMMdd_province_adid, clickCount>，
			 * 并聚合转化 row，后转成sparksql表，进行开窗top3 sql计算，最后返回结果top3 的row，方便保存到mysql中
			 */
			private static final long serialVersionUID = 1L;

			@Override
			public JavaRDD<Row> call(JavaPairRDD<String, Long> rdd) throws Exception {
				
				JavaPairRDD<String, Long> mapToPairRDD = rdd.mapToPair(new PairFunction<Tuple2<String,Long>, String, Long>() {

					/**
					 *  <yyyyMMdd_province_city_userid_adid, clickCount> 转化 <yyyyMMdd_province_adid, clickCount>
					 */
					private static final long serialVersionUID = 1L;

					@Override
					public Tuple2<String, Long> call(Tuple2<String, Long> tuple) throws Exception {
						String[] splitted = tuple._1.split("_");
						
						String date = splitted[0];
						String province = splitted[1];
						Long adid = Long.valueOf(String.valueOf(splitted[4]));
						Long clickCount = Long.valueOf(String.valueOf(tuple._2));
						
						String key = date + "_" + province + "_"+ adid;
						return new Tuple2<String, Long>(key, clickCount);
					}
				});
				
				JavaPairRDD<String, Long> reduceByKeyRDD = mapToPairRDD.reduceByKey(new Function2<Long, Long, Long>() {
					
					/**
					 * 聚合零散<yyyyMMdd_province_adid, clickCount>
					 */
					private static final long serialVersionUID = 1L;

					@Override
					public Long call(Long v1, Long v2) throws Exception {
						// TODO Auto-generated method stub
						return v1 + v2;
					}
				});
				
				JavaRDD<Row> rowsRDD = reduceByKeyRDD.map(new Function<Tuple2<String,Long>, Row>() {

					/**
					 * 聚合后的<yyyyMMdd_province_adid, clickCount>转化为Row(date, province, adid, clickCount)
					 */
					private static final long serialVersionUID = 1L;

					@Override
					public Row call(Tuple2<String, Long> tuple) throws Exception {
						// tuple:<yyyyMMdd_province_adid, clickCount>
						String[] splitted = tuple._1.split("_");
						
						String date = String.valueOf(DateUtil.parseDate(splitted[0]));
						String province = splitted[1];
						Long adid = Long.valueOf(String.valueOf(splitted[4]));
						Long clickCount = Long.valueOf(String.valueOf(tuple._2));
						//date, province, adid, clickCount
						return RowFactory.create(date, province, adid, clickCount);
					}
				});
				// 创建sqlspark表
				StructType schema = DataTypes.createStructType(Arrays.asList(
						DataTypes.createStructField("date", DataTypes.StringType, true),
						DataTypes.createStructField("province", DataTypes.StringType, true),
						DataTypes.createStructField("adid", DataTypes.LongType, true),
						DataTypes.createStructField("clickCount", DataTypes.LongType, true)
				));
				
				HiveContext sqlContext = new HiveContext(rdd.context());
				DataFrame dailyAdClickCountByProvinceDF = sqlContext.createDataFrame(rowsRDD, schema);
				
				dailyAdClickCountByProvinceDF.registerTempTable("tmp_daily_ad_click_count_by_prov");
				//用sparksql开窗函数统计top3
				String sql = 
						"select  "
							+ "date, "
							+ "province, "
							+ "adid, "
							+ "clickCount "
						+ "from "
							+ "("
								+ "select "
									+ "date, "
									+ "province, "
									+ "adid, "
									+ "clickCount, "
									+ "row_number() over (partition by date,province order by clickCount desc) rank "
								+ "from tmp_daily_ad_click_count_by_prov"
							+ ") t "
						+ "where t.rank <=3 ";
				DataFrame provinceTop3AdDF = sqlContext.sql(sql);
				provinceTop3AdDF.show();
				return provinceTop3AdDF.javaRDD();
			}
		});
		
		// 同步一份数据到mysql
		provinceTop3AdDStream.foreachRDD(new Function<JavaRDD<Row>, Void>() {
			
			@Override
			public Void call(JavaRDD<Row> rdd) throws Exception {
				rdd.foreachPartition(new VoidFunction<Iterator<Row>>() {
					
					@Override
					public void call(Iterator<Row> iterator) throws Exception {
						
						ArrayList<AdProvinceTop3> adProvinceTop3s = new ArrayList<AdProvinceTop3>();
						while(iterator.hasNext()) {
							// 解析数据
							Row row = iterator.next();
							String date = row.getString(0);
							String province = row.getString(1);
							Long adid = row.getLong(2);
							Long clickCount = row.getLong(3);
							
							//加载进实体类
							AdProvinceTop3 adProvinceTop3 = new AdProvinceTop3();
							adProvinceTop3.setDate(date);
							adProvinceTop3.setProvince(province);
							adProvinceTop3.setAdid(adid);
							adProvinceTop3.setClickCount(clickCount);
							
							adProvinceTop3s.add(adProvinceTop3);
						}
						
						IAdProvinceTop3DAO adProvinceTop3DAO = DAOFactory.getAdProvinceTop3DAO();
						// 更新进mysql
						adProvinceTop3DAO.updateBatch(adProvinceTop3s);
						
					}
				});
				return null;
			}
		});
	}

	/**每天各省各城市各广告的点击流量实时统计
	 * @param filteredAdRealTimeLogDStream
	 * @return
	 */
	public static JavaPairDStream<String, Long> calculateRealTimeStat(
			JavaPairDStream<String, String> filteredAdRealTimeLogDStream) {
		
		//将原数据处理成每天各省各城市各广告格式：<yyyyMMdd_province_city_userid_adid, 1>
		JavaPairDStream<String, Long> dailyUserAdClickDStream = filteredAdRealTimeLogDStream.mapToPair(new PairFunction<Tuple2<String,String>, String, Long>() {

			@Override
			public Tuple2<String, Long> call(Tuple2<String, String> tuple) throws Exception {
				// 一条一条的实时日志
				// timestamp province city userid adid
				// 某个时间点 某个省份 某个城市 某个用户 某个广告

				// 从tuple中获取log
				String log = tuple._2;
				// 从log中提取出信息，并把时间转换处理下(yyyyMMDD)
				String[] logSplitted = log.split(" ");
				String timestamp = logSplitted[0];
				Date date = new Date(Long.valueOf(timestamp));
				
				
				String datekey = DateUtils.formatDateKey(date);
				String province = logSplitted[1];
				String city = logSplitted[2];
				Long userid = Long.valueOf(logSplitted[3]);
				Long adid = Long.valueOf(logSplitted[4]);
				
				// 拼接key
				String key = datekey + "_" + province + "_" + city + "_" + userid + "_" + adid;
				return new Tuple2<String, Long>(key,  1L);
			}
			
			
		});
		// 计算全局的<yyyyMMdd_province_city_userid_adid, clickCount>
		// 在这个dstream中，就相当于，有每个batch rdd累加的各个key（各天各省份各城市各广告的点击次数）
		// 每次计算出最新的值，就在aggregatedDStream中的每个batch rdd中反应出来
		// jed:此处不能直接用reduceByKey 如果用只是在每5秒的stream中每个rdd里进行reduce而已，没有全局累加保存
		JavaPairDStream<String,Long> aggregatedDStream = dailyUserAdClickDStream.updateStateByKey(new Function2<List<Long>, Optional<Long>, Optional<Long>>() {

			@Override
			public Optional<Long> call(List<Long> values , Optional<Long> optional) throws Exception {
				Long clickCount = 0L;
				if(optional.isPresent()) {
					clickCount = optional.get();
				}
				for(Long v : values) {
					clickCount += v;
				}
				return Optional.of(clickCount);
			}
		});
		
		// 同步一份到mysql
		aggregatedDStream.foreachRDD(new Function<JavaPairRDD<String,Long>, Void>() {

			private static final long serialVersionUID = 1L;

			@Override
			public Void call(JavaPairRDD<String, Long> rdd) throws Exception {
				rdd.foreachPartition(new VoidFunction<Iterator<Tuple2<String,Long>>>() {
					
					@Override
					public void call(Iterator<Tuple2<String, Long>> iterator) throws Exception {
						ArrayList<AdStat> adStats = new ArrayList<AdStat>();
						while(iterator.hasNext()) {
							Tuple2<String,Long> tuple = iterator.next();
							// 解析数据
							// tuple:<yyyyMMdd_province_city_userid_adid, clickCount>
							String[] splitted = tuple._1.split("_");
							
							String date = String.valueOf(DateUtil.parseDate(splitted[0]));
							String province = splitted[1];
							String city = splitted[2];
							Long userid  = Long.valueOf(String.valueOf(splitted[3]));
							Long adid = Long.valueOf(String.valueOf(splitted[4]));
							Long clickCount = Long.valueOf(String.valueOf(tuple._2));
							
							// 加载进实体类
							AdStat adStat = new AdStat();
							adStat.setDate(date);
							adStat.setProvince(province);
							adStat.setCity(city);
							adStat.setAdid(userid);
							adStat.setAdid(adid);
							adStat.setClickCount(clickCount);
							adStats.add(adStat);
						}
						
						//写入mysql
						IAdStatDAO adStatDAO = DAOFactory.getAdStatDAO();
						adStatDAO.updateBatch(adStats);
					}
				});
				return null;
			}
		});
		return aggregatedDStream;
	}

	/**实现实时的动态黑名单机制：将每天对某个广告点击超过100次的用户拉黑
	 * @param adRealTimeLogDStream
	 * @return 
	 */
	public static void addBlackList(JavaPairInputDStream<String, String> adRealTimeLogDStream){
		
		JavaPairDStream<String, Long> dailyUserAdClickDStream = adRealTimeLogDStream.mapToPair(new PairFunction<Tuple2<String,String>, String, Long>() {
//			实时计算各batch上每天各用户各广告的点击次数<(date_userid_adid, click_count)>

			@Override
			public Tuple2<String, Long> call(Tuple2<String, String> tuple) throws Exception {
				// 从tuple中获取log
				String log = tuple._2;
				// 从log中提取出信息，并把时间转换处理下(yyyyMMDD)
				String[] logSplitted = log.split(" ");
				String timestamp = logSplitted[0];
				Date date = new Date(Long.valueOf(timestamp));
				String datekey = DateUtils.formatDateKey(date);

				Long userid = Long.valueOf(logSplitted[3]);
				Long adid = Long.valueOf(logSplitted[4]);
				
				// 拼接key
				String key = datekey + "_" + userid + "_" + adid;
				return new Tuple2<String, Long>(key,  1L);
			}
			
			
		});
		JavaPairDStream<String,Long> dailyUserAdClickCountDStream = dailyUserAdClickDStream.reduceByKey(new Function2<Long, Long, Long>() {
			
			@Override
			public Long call(Long v1, Long v2) throws Exception {
				// TODO Auto-generated method stub
				return v1 + v2;
			}
		});
		
//		将结果插入到mysql 中表 ad_user_click_count
//		ad_user_click_count表结构
//			date
//			user_id
//			ad_id
//			click_count
		dailyUserAdClickCountDStream.foreachRDD(new Function<JavaPairRDD<String,Long>, Void>() {
			
			/**
			 * 在stream中遍历每个rdd
			 */
			private static final long serialVersionUID = 1L;

			@Override
			public Void call(JavaPairRDD<String, Long> rdd) throws Exception {
				rdd.foreachPartition(new VoidFunction<Iterator<Tuple2<String,Long>>>() {
					
					/**
					 * rdd上的各个partition都执行解析数据并批量插入mysql
					 */
					private static final long serialVersionUID = 1L;

					@Override
					public void call(Iterator<Tuple2<String, Long>> iterator) throws Exception {
						ArrayList<AdUserClickCount> adUserClickCounts = new ArrayList<AdUserClickCount>();
						while(iterator.hasNext()) {
							// 解析出数据
							Tuple2<String, Long> tuple = iterator.next();
							String[] split = tuple._1.split("_");
							// 转化为yyyy-MM-dd
							String date = String.valueOf(DateUtils.parseDateKey(split[0]));
							Long userId = Long.valueOf(String.valueOf(split[1]));
							Long adId = Long.valueOf(String.valueOf(split[2]));
							Long clickCount = tuple._2;
							
							
							//添加入实体类
							AdUserClickCount adUserClickCount = new AdUserClickCount();
							adUserClickCount.setDate(date);
							adUserClickCount.setUserid(userId);
							adUserClickCount.setAdid(adId);
							adUserClickCount.setClickCount(clickCount);
							
							//将实体类添加实体类List
							adUserClickCounts.add(adUserClickCount);
						}
						// 将实体类List插入mysql中
						IAdUserClickCountDAO adUserClickCountDAO = DAOFactory.getAdUserClickCountDAO();
						adUserClickCountDAO.updateBatch(adUserClickCounts);
						
					}
				});
				return null;
			}
		});
		
//	获取表 ad_user_click_count 的累加点击次数click_counts
//		select date, user_id, ad_id, click_counts click_counts from ad_user_click_count group by date,user_id,ad_id
//	计算click_counts大于100的user_id 插入ad_blacklist
		
		// 先用一个batch( dailyUserAdClickCountDStream) 的数据来查表，找出click_count大于100的, 为何要选dailyUserAdClickCountDStream，因为它是聚合过的数据
		//可能dailyUserAdClickDStream 10万条，但dailyUserAdClickCountDStream可能只有5000
		
		
		JavaPairDStream<String,Long> blacklistDStream = dailyUserAdClickCountDStream.filter(new Function<Tuple2<String,Long>, Boolean>() {
			
			/**
			 *  先用一个batch( dailyUserAdClickCountDStream) 的数据来查表，找出click_count大于100的, 为何要选dailyUserAdClickCountDStream，因为它是聚合过的数据
			 *  可能dailyUserAdClickDStream 10万条，但dailyUserAdClickCountDStream可能只有5000
			 */
			private static final long serialVersionUID = 1L;

			@Override
			public Boolean call(Tuple2<String, Long> tuple) throws Exception {
				// 解析出数据
				String[] split = tuple._1.split("_");
				// 转化为yyyy-MM-dd
				String date = String.valueOf(DateUtils.parseDateKey(split[0]));
				Long userId = Long.valueOf(String.valueOf(split[1]));
				Long adId = Long.valueOf(String.valueOf(split[2]));
				
				IAdUserClickCountDAO adUserClickCountDAO = DAOFactory.getAdUserClickCountDAO();
				int findedClickCount = adUserClickCountDAO.findClickCountByMultiKey(date, userId, adId);
				
				if(findedClickCount > 100) {
					return true;
				}
				return false;
			}
		});
		
		JavaDStream<Long> userIdDStream = blacklistDStream.map(new Function<Tuple2<String,Long>, Long>() {

			/**
			 * 将<yyyyMMdd_userid_adid, clickcount> 转化为<userid>
			 */
			private static final long serialVersionUID = 1L;

			@Override
			public Long call(Tuple2<String, Long> tuple) throws Exception {
				// 解析出数据
				String[] split = tuple._1.split("_");
				return Long.valueOf(String.valueOf(split[1]));
			}
		});
		
		JavaDStream<Long> distinctedUserIdDStream = userIdDStream.transform(new Function<JavaRDD<Long>, JavaRDD<Long>>() {

			/**
			 * 对DStream里的每个rdd进行去重，ps：由于一个key只分到一个rdd里的一个parition，也就是说去重后rdd中，每个userid在rdd只有一条记录
			 */
			private static final long serialVersionUID = 1L;

			@Override
			public JavaRDD<Long> call(JavaRDD<Long> rdd) throws Exception {
				return rdd.distinct();
			}
		});
		
		distinctedUserIdDStream.foreachRDD(new Function<JavaRDD<Long>, Void>() {
			
			/**
			 * 轮询DStream中每个rdd
			 */
			private static final long serialVersionUID = 1L;

			@Override
			public Void call(JavaRDD<Long> rdd) throws Exception {
				rdd.foreachPartition(new VoidFunction<Iterator<Long>>() {
					
					/**
					 * 将rdd中的每个partition userid insert到mysql
					 */
					private static final long serialVersionUID = 1L;

					@Override
					public void call(Iterator<Long> iterator) throws Exception {
						
						ArrayList<AdBlacklist> adBlacklists = new ArrayList<AdBlacklist>();
						while(iterator.hasNext()) {
							AdBlacklist adBlacklist = new AdBlacklist();
							adBlacklist.setUserid(iterator.next());
							
							adBlacklists.add(adBlacklist);
						}
						IAdBlacklistDAO adBlacklistDAO = DAOFactory.getAdBlacklistDAO();
						adBlacklistDAO.insertBatch(adBlacklists);
					}
				});
				return null;
			}
		});
	}

	
	
	
	
	
	
	/**2、基于黑名单的非法广告点击流量过滤机制：
	 * 实现：
	 * // 获取黑名单userid，将转化为<userid, true>
		// 将adRealTimeLogDStream从<原始数据>转化为<userid, 原始数据>
		// 将<userid, 原始数据> left join <userid, true>得到<userid, (原始数据, true)>与<userid, (原始数据, null)>
		// 将<userid, (原始数据, true)> filter 过滤掉黑名单userid， 得到<userid, (原始数据, null)> 
		// 将<userid, (原始数据, null)> 转化为过滤后的<原始数据>
	 * @param adRealTimeLogDStream 原始数据
	 * @return 过滤后的数据
	 */
	public static JavaPairDStream<String, String> filterByBlacklist(JavaPairInputDStream<String, String> adRealTimeLogDStream){
		
		JavaPairDStream<String, String> filteredAdRealTimeLogDStream = adRealTimeLogDStream.transformToPair(new Function<JavaPairRDD<String,String>, JavaPairRDD<String,String>>() {

			private static final long serialVersionUID = 1L;

			@Override
			public JavaPairRDD<String, String> call(JavaPairRDD<String, String> rdd) throws Exception {
				// 获取黑名单userid，将转化为<userid, true>
				IAdBlacklistDAO adBlacklistDAO = DAOFactory.getAdBlacklistDAO();
				List<AdBlacklist> adBlacklists = adBlacklistDAO.findAll();
				List<Tuple2<Long, Boolean>> tuples = new ArrayList<Tuple2<Long, Boolean>>();
				
				for(AdBlacklist adBlacklist : adBlacklists) {
					tuples.add(new Tuple2<Long, Boolean>(adBlacklist.getUserid(), true));
				}
				
				JavaSparkContext jsc = new JavaSparkContext(rdd.context());
				JavaPairRDD<Long, Boolean> adBlacklistRDD = jsc.parallelizePairs(tuples);
				
				// 将adRealTimeLogDStream从<原始数据>转化为<userid, 原始数据>
				JavaPairRDD<Long, Tuple2<String, String>> mapedRDD = rdd.mapToPair(new PairFunction<Tuple2<String,String>, Long, Tuple2<String,String>>() {

					private static final long serialVersionUID = 1L;

					@Override
					public Tuple2<Long, Tuple2<String, String>> call(Tuple2<String, String> tuple) throws Exception {
						// 从tuple中获取log
						String log = tuple._2;
						String[] logSplitted = log.split(" ");
						Long userid = Long.valueOf(logSplitted[3]);
						return new Tuple2<Long, Tuple2<String,String>>(userid, tuple);
					}
				});
				// 将<userid, 原始数据> left join <userid, true>得到<userid, (原始数据, true)>与<userid, (原始数据, null)>
				JavaPairRDD<Long, Tuple2<Tuple2<String, String>, Optional<Boolean>>> joinedRDD = mapedRDD.leftOuterJoin(adBlacklistRDD);
				
				// 将<userid, (原始数据, true)> filter 过滤掉黑名单userid， 得到<userid, (原始数据, null)> 
				JavaPairRDD<Long, Tuple2<Tuple2<String, String>, Optional<Boolean>>> filteredRDD = joinedRDD.filter(new Function<Tuple2<Long,Tuple2<Tuple2<String,String>,Optional<Boolean>>>, Boolean>() {

					private static final long serialVersionUID = 1L;
					
					@Override
					public Boolean call(Tuple2<Long, Tuple2<Tuple2<String, String>, Optional<Boolean>>> tuple) throws Exception {
						Optional<Boolean> optional = tuple._2._2;
						if(optional.isPresent() && optional.get()){
							return false;
						}
						return true;
					}
				});
				// 将<userid, (原始数据, null)> 转化为过滤后的<原始数据>
				JavaPairRDD<String, String> resultRDD = filteredRDD.mapToPair(new PairFunction<Tuple2<Long,Tuple2<Tuple2<String,String>,Optional<Boolean>>>, String, String>() {

					private static final long serialVersionUID = 1L;

					@Override
					public Tuple2<String, String> call(
							Tuple2<Long, Tuple2<Tuple2<String, String>, Optional<Boolean>>> tuple) throws Exception {
						
						return tuple._2._1;
					}
				});
				return resultRDD;
			}
		});
		
		return filteredAdRealTimeLogDStream;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
