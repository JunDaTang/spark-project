package com.ibeifeng.sparkproject.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.ibeifeng.sparkproject.dao.IAreaTop3ProductDAO1;
import com.ibeifeng.sparkproject.domain.AreaTop3Product1;
import com.ibeifeng.sparkproject.jdbc.JDBCHelper;

public class AreaTop3ProductDAOImpl1 implements IAreaTop3ProductDAO1 {

	@Override
	public void insertBatch(List<AreaTop3Product1> areaTop3Products) {
//		String sql = "insert into session_aggr_stat "
//				+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"; 
//		
//		Object[] params = new Object[]{sessionAggrStat.getTaskid(),
//				sessionAggrStat.getSession_count(),
//				sessionAggrStat.getVisit_length_1s_3s_ratio(),
//				sessionAggrStat.getVisit_length_4s_6s_ratio(),
//				sessionAggrStat.getVisit_length_7s_9s_ratio(),
//				sessionAggrStat.getVisit_length_10s_30s_ratio(),
//				sessionAggrStat.getVisit_length_30s_60s_ratio(),
//				sessionAggrStat.getVisit_length_1m_3m_ratio(),
//				sessionAggrStat.getVisit_length_3m_10m_ratio(),
//				sessionAggrStat.getVisit_length_10m_30m_ratio(),
//				sessionAggrStat.getVisit_length_30m_ratio(),
//				sessionAggrStat.getStep_length_1_3_ratio(),
//				sessionAggrStat.getStep_length_4_6_ratio(),
//				sessionAggrStat.getStep_length_7_9_ratio(),
//				sessionAggrStat.getStep_length_10_30_ratio(),
//				sessionAggrStat.getStep_length_30_60_ratio(),
//				sessionAggrStat.getStep_length_60_ratio()};
//		
//		JDBCHelper jdbcHelper = JDBCHelper.getInstance();
//		jdbcHelper.executeUpdate(sql, params);
		
		String sql = "insert into area_top3_product values(?, ?, ?, ?, ?, ?, ?, ?)";
		ArrayList<Object[]> paramsList = new ArrayList<Object[]>();
		for(AreaTop3Product1 p : areaTop3Products) {
			Object[] params = new Object[8];
			params[0] = p.getTaskId();
			params[1] = p.getArea();
			params[2] = p.getAreaLevel();
			params[3] = p.getProductId();
			params[4] = p.getCityInfos();
			params[5] = p.getClickCount();
			params[6] = p.getProductName();
			params[7] = p.getProductStatus();
			
			paramsList.add(params);
			
		}
		
		JDBCHelper instance = JDBCHelper.getInstance();
		instance.executeBatch(sql, paramsList);
	}



	

}
