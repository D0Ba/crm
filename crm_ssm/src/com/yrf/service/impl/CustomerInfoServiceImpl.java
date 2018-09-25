package com.yrf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yrf.mapper.CustomerInfoMapper;
import com.yrf.pojo.CustomerInfo;
import com.yrf.service.CustomerInfoService;

@Service
//@Transactional

public class CustomerInfoServiceImpl implements CustomerInfoService {
	@Autowired     //值注入
	private CustomerInfoMapper customerInfoMapper;
	
	//查询 
	public List<CustomerInfo> selectCustomerInfoListByCode(String code){
		
		return customerInfoMapper.selectCustomerInfoListByCode(code);
	}
}
