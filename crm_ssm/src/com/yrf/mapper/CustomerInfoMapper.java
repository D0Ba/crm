package com.yrf.mapper;


import java.util.List;

import com.yrf.pojo.CustomerInfo;

public interface CustomerInfoMapper {
	
	//查询 
	public List<CustomerInfo> selectCustomerInfoListByCode(String code);

}