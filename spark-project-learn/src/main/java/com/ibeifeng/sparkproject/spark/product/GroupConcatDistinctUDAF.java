package com.ibeifeng.sparkproject.spark.product;

import java.util.ArrayList;
import java.util.Arrays;

import org.apache.spark.sql.Row;
import org.apache.spark.sql.expressions.MutableAggregationBuffer;
import org.apache.spark.sql.expressions.UserDefinedAggregateFunction;
import org.apache.spark.sql.types.DataType;
import org.apache.spark.sql.types.DataTypes;
import org.apache.spark.sql.types.StructType;

/**
 * 
 * 根据group by area,product_id得到有两组数据如下：
		// 组1
		// 1:北京
		// 1:北京
		// 2:上海
		// 组2
		// 3:深圳
		// 1:北京
		// 2:上海
		// 结果聚合一行:  1:北京,2:上海,3:深圳
 * @author jed
 *
 */
public class GroupConcatDistinctUDAF extends UserDefinedAggregateFunction{
	// 定义输入类型
	private StructType inputSchema = DataTypes.createStructType(
			Arrays.asList(DataTypes.createStructField("cityInfo", DataTypes.StringType, true)));
	
	// 定义处理缓冲类型
	private StructType bufferSchema = DataTypes.createStructType(
			Arrays.asList(DataTypes.createStructField("cityInfoBuffer", DataTypes.StringType, true)));
	
	// 定义返回类型
	private DataType dataType = DataTypes.StringType;
	
	// 指定是否是确定性的
	private boolean deterministic = true;
	
	@Override
	public StructType inputSchema() {
		
		return inputSchema;
	}
	
	@Override
	public StructType bufferSchema() {
		return bufferSchema;
	}

	@Override
	public DataType dataType() {
		return dataType;
	}

	@Override
	public boolean deterministic() {
		return deterministic;
	}

	/**
	 * 初始化
	 * 可以认为是，你自己在内部指定一个初始的值
	 */
	@Override
	public void initialize(MutableAggregationBuffer buffer) {
		buffer.update(0, "");
		
	}

	/**
	 * 更新
	 * 可以认为是，一个一个地将组内的字段值传递进来
	 * 实现拼接的逻辑
	 */
	@Override
	public void update(MutableAggregationBuffer buffer, Row input) {
		String cityInfoBuffer = buffer.getString(0); 
		String cityInfo = input.getString(0); 
		
		//去重
		// 比如：cityInfoBuffer有“1:北京,2:上海”， 现在新数据进来cityInfo:“1:北京”
		// 结果cityInfoBuffer有“1:北京,2:上海”
	
		if(! cityInfoBuffer.contains(cityInfo)) {
			if("".equals(cityInfoBuffer)) {
				cityInfoBuffer += cityInfo;
			}else {
				cityInfoBuffer += "," + cityInfo;
			}
			
		}
		
		buffer.update(0, cityInfoBuffer);
	}

	/**
	 * 合并
	 * update操作，可能是针对一个分组内的部分数据，在某个节点上发生的
	 * 但是可能一个分组内的数据，会分布在多个节点上处理
	 * 此时就要用merge操作，将各个节点上分布式拼接好的串，合并起来
	 */
	@Override
	public void merge(MutableAggregationBuffer buffer1, Row buffer2) {
		

		// 组1合并后:"1:北京,2:上海"
		String cityInfoBuffer1 = buffer1.getString(0);
		// 组2合并后:"1:北京,2:上海,3:深圳"
		String cityInfoBuffer2 = buffer2.getString(0);
		
		//去重字符串合并操作
		String[] splited = cityInfoBuffer2.split(",");
		for(String cityInfo : splited) {
			if(!cityInfoBuffer1.contains(cityInfo)) {
				if("".equals(cityInfoBuffer1)) {
					cityInfoBuffer1 += cityInfo;
				}else {
					cityInfoBuffer1 += "," + cityInfo;
				}
				
			}
		}
		//结果聚合一行:  1:北京,2:上海,3:深圳
		buffer1.update(0, cityInfoBuffer1);
		
	}

	
	
	/* (non-Javadoc)
	 * @see org.apache.spark.sql.expressions.UserDefinedAggregateFunction#evaluate(org.apache.spark.sql.Row)
	  *  返回结果
	 */
	@Override
	public Object evaluate(Row row) {
		return row.getString(0);
	}

}
