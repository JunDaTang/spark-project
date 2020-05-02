package com.ibeifeng.sparkproject.spark.ad;

import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.apache.commons.httpclient.util.DateUtil;
import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaPairRDD;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.function.Function2;
import org.apache.spark.api.java.function.PairFunction;
import org.apache.spark.streaming.Durations;
import org.apache.spark.streaming.api.java.JavaPairDStream;
import org.apache.spark.streaming.api.java.JavaPairInputDStream;
import org.apache.spark.streaming.api.java.JavaStreamingContext;
import org.apache.spark.streaming.kafka.KafkaUtils;

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
		JavaPairRDD<String,Long> addBlackListed = addBlackList(adRealTimeLogDStream);
		
		
		JavaPairRDD<String, Long> filteredRDD = filterByBlacklist(adRealTimeLogDStream);
	}
	
	/**实现实时的动态黑名单机制：将每天对某个广告点击超过100次的用户拉黑
	 * @param adRealTimeLogDStream
	 * @return 
	 */
	public static JavaPairRDD<String, Long> addBlackList(JavaPairInputDStream<String, String> adRealTimeLogDStream){
		
		JavaPairDStream<String, Long> dailyUserAdClickDStream = adRealTimeLogDStream.mapToPair(new PairFunction<Tuple2<String,String>, String, Long>() {
//			实时计算各batch上每天各用户各广告的点击次数<(date_userid_adid, click_count)>
//			将结果插入到mysql 中表 ad_user_click_count
//				ad_user_click_count表结构
//					date
//					user_id
//					ad_id
//					click_count
//			获取表 ad_user_click_count 的累加点击次数click_counts
//				select date, user_id, ad_id, sum(click_count) click_counts from ad_user_click_count group by date,user_id,ad_id
//			计算click_counts大于100的user_id 插入ad_blacklist
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
		JavaPairDStream<String,Long> reduceByKeyed = dailyUserAdClickDStream.reduceByKey(new Function2<Long, Long, Long>() {
			
			@Override
			public Long call(Long v1, Long v2) throws Exception {
				// TODO Auto-generated method stub
				return v1 + v2;
			}
		});
		
		
		return null;
	}

	public static JavaPairRDD<String, Long> filterByBlacklist(JavaPairInputDStream<String, String> adRealTimeLogDStream){

		
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
