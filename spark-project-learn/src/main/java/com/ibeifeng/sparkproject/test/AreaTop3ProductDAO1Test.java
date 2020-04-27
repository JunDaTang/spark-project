package com.ibeifeng.sparkproject.test;

import java.util.ArrayList;
import java.util.List;

import org.apache.spark.sql.Row;
import org.junit.Test;

import com.ibeifeng.sparkproject.dao.IAreaTop3ProductDAO;
import com.ibeifeng.sparkproject.dao.factory.DAOFactory;
import com.ibeifeng.sparkproject.domain.AreaTop3Product;

public class AreaTop3ProductDAO1Test {
	@Test
	public void testInsertBatch() {
List<AreaTop3Product> areaTop3Products = new ArrayList<AreaTop3Product>();
		
		AreaTop3Product areaTop3Product = new AreaTop3Product();
		areaTop3Product.setTaskid(10002); 
		areaTop3Product.setArea("华南");  
		areaTop3Product.setAreaLevel("A级");  
		areaTop3Product.setProductid(10000); 
		areaTop3Product.setClickCount(10000);    
		areaTop3Product.setCityInfos("CityInfos");  
		areaTop3Product.setProductName("ProductName");  
		areaTop3Product.setProductStatus("0");  
		areaTop3Products.add(areaTop3Product);
		
		AreaTop3Product areaTop3Product1 = new AreaTop3Product();
		areaTop3Product1.setTaskid(10003); 
		areaTop3Product1.setArea("华南");  
		areaTop3Product1.setAreaLevel("A级");  
		areaTop3Product1.setProductid(10000); 
		areaTop3Product1.setClickCount(10000);    
		areaTop3Product1.setCityInfos("CityInfos");  
		areaTop3Product1.setProductName("ProductName");  
		areaTop3Product1.setProductStatus("0");  
		areaTop3Products.add(areaTop3Product1);
		IAreaTop3ProductDAO areTop3ProductDAO = DAOFactory.getAreaTop3ProductDAO();
		areTop3ProductDAO.insertBatch(areaTop3Products);
	}

}
