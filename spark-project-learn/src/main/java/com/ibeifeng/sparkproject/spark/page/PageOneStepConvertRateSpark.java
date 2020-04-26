package com.ibeifeng.sparkproject.spark.page;

import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.sql.DataFrame;
import org.apache.spark.sql.SQLContext;

import com.ibeifeng.sparkproject.dao.ITaskDAO;
import com.ibeifeng.sparkproject.dao.factory.DAOFactory;
import com.ibeifeng.sparkproject.domain.Task;
import com.ibeifeng.sparkproject.test.MockData;

public class PageOneStepConvertRateSpark {
	public static void main(String[] args) {
		// init:构造spark上下文
		SparkConf conf = new SparkConf().setAppName("PageOneStepConvertRateSpark")
				.setMaster("local");
		JavaSparkContext sc = new JavaSparkContext(conf);
		SQLContext sqlContext = new SQLContext(sc);
		
		
		// init:生成数据
		MockData.mock(sc, sqlContext);
		// test
		String sql = "select * from user_visit_action";
		DataFrame df = sqlContext.sql(sql);
		df.show();
		// 根据任务id查询任务参数
		Long task_id = Long.valueOf(args[0]);
		
		ITaskDAO taskDao = DAOFactory.getTaskDAO();
		Task task = taskDao.findById(task_id);
//		task
		// 根据参数查询指定的时间范围内的用户访问行为数据
		// 将数据转换成以session粒度的数据: 用户行为数据 => <session_id, 用户行为数据>
		// 将用户行为数据按照指定的页面访问流（任务参数）进行匹配，找出相应页面的用户访问量，如：指定访问流3->5->7，从3转跳到4有多少访问量？
		// 计算转化率，如：访问流3->5->7， 3->5页面访问量为50万，5->7页面访问量为30万，则5->7页面转化率为30/50=60%
		// 将计算后的转化率保存进mysql中
	}

}
