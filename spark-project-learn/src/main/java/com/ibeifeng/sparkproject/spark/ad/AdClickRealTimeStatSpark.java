package com.ibeifeng.sparkproject.spark.ad;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.apache.calcite.avatica.util.DateTimeUtils;
import org.apache.commons.httpclient.util.DateUtil;
import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaPairRDD;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.function.Function;
import org.apache.spark.api.java.function.Function2;
import org.apache.spark.api.java.function.PairFunction;
import org.apache.spark.api.java.function.VoidFunction;
import org.apache.spark.streaming.Durations;
import org.apache.spark.streaming.api.java.JavaDStream;
import org.apache.spark.streaming.api.java.JavaPairDStream;
import org.apache.spark.streaming.api.java.JavaPairInputDStream;
import org.apache.spark.streaming.api.java.JavaStreamingContext;
import org.apache.spark.streaming.kafka.KafkaUtils;

import com.ibeifeng.sparkproject.dao.IAdBlacklistDAO;
import com.ibeifeng.sparkproject.dao.IAdUserClickCountDAO;
import com.ibeifeng.sparkproject.dao.factory.DAOFactory;
import com.ibeifeng.sparkproject.domain.AdBlacklist;
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
		
		
		JavaPairRDD<String, Long> filteredRDD = filterByBlacklist(adRealTimeLogDStream);
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

	
	
	
	
	
	
	public static JavaPairRDD<String, Long> filterByBlacklist(JavaPairInputDStream<String, String> adRealTimeLogDStream){

		
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
