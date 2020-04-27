package com.ibeifeng.sparkproject.spark.product;

import org.apache.spark.sql.api.java.UDF2;

import com.alibaba.fastjson.JSONObject;

public class GetJsonObjectUDF implements UDF2<String, String, String>{

	@Override
	public String call(String json, String filed) throws Exception {
		try {
			JSONObject object = JSONObject.parseObject(json);
			return object.getString(filed);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
