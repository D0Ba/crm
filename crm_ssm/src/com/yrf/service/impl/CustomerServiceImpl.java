package com.yrf.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.yrf.mapper.CustomerMapper;
import com.yrf.pojo.Customer;
import com.yrf.pojo.QueryVo;
import com.yrf.service.CustomerService;
import com.yrf.utils.Page;



/*
 * 客户管理
 */
@Service

public class CustomerServiceImpl implements CustomerService {
	
	@Autowired
	private CustomerMapper customerMapper;
	//通过四个条件 查询分页对象
	public Page<Customer> selectPageByQueryVo(QueryVo vo){
		Page<Customer> page=new Page<Customer>();
		//每页显示条数
		page.setSize(5);
		vo.setSize(5);
		
		if(null!=vo) {
			//判断当前页
		if(null!=vo.getPage()){
			page.setPage(vo.getPage());	
			vo.setStartRow((vo.getPage()-1)*vo.getSize());
		}
		if(null!=vo.getCustName() &&!"".equals(vo.getCustName().trim())){
			
			vo.setCustName(vo.getCustName().trim());
		}
		
		if(null!=vo.getCustSource() &&!"".equals(vo.getCustSource().trim())){
			
			vo.setCustSource(vo.getCustSource().trim());
		}
		
		if(null!=vo.getCustIndustry() &&!"".equals(vo.getCustIndustry().trim())){
			
			vo.setCustIndustry(vo.getCustIndustry().trim());
		}
		
		if(null!=vo.getCustLevel() &&!"".equals(vo.getCustLevel().trim())){
			
			vo.setCustLevel(vo.getCustLevel().trim());
		}
		
		//总条数
		page.setTotal(customerMapper.customerCountByQueryVo(vo));
		//结果集
		page.setRows(customerMapper.selectCustomerListByQueryVo(vo));
		
	}
	
	return page;	
		
}
	//通过ID查询客户
		public Customer selectCustomerById(Integer id){
			return customerMapper.selectCustomerById(id);
		}
		
	//修改客户通过id
	public void updateCustomerById(Customer customer){
		customerMapper.updateCustomerById(customer);
	}
	
	//删除客户通过id
	public void deleteCustomerById(Integer id){
		customerMapper.deleteCustomerById(id);
	}
	//增加客户
	@Override
	public boolean addCustomer(Customer customer) {
		// TODO Auto-generated method stub
		return customerMapper.addCustomer(customer);
	}
	
	
}
