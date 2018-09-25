package com.yrf.service;

import java.util.List;

import com.yrf.pojo.CustomerInfo;


public interface CustomerInfoService {
	
	//查询 
	public List<CustomerInfo> selectCustomerInfoListByCode(String code);

}
