package com.ibeifeng.sparkproject.dao;

import java.util.List;

import com.ibeifeng.sparkproject.domain.AreaTop3Product1;

/**各区域top3热门商品DAO接口
 * @author jed
 *
 */
public interface IAreaTop3ProductDAO1 {
	
	void insertBatch(List<AreaTop3Product1> areaTop3Products);

}
