package com.yrf.service;


import com.yrf.pojo.Customer;
import com.yrf.pojo.QueryVo;
import com.yrf.utils.Page;



public interface CustomerService {
	//通过四个条件 查询分页对象
	public Page<Customer> selectPageByQueryVo(QueryVo vo);
	
	//通过ID查询客户
	public Customer selectCustomerById(Integer id); 
	
	//修改客户通过id
	public void updateCustomerById(Customer customer);
	
	//删除客户通过id
	public void deleteCustomerById(Integer id);
	
	//增加用户
	public boolean addCustomer(Customer customer);
		
	
	
}
