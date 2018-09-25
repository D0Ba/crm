package com.yrf.mapper;

import java.util.List;


import com.yrf.pojo.Customer;
import com.yrf.pojo.QueryVo;

public interface CustomerMapper {

	// 条件查询记录数
	public Integer customerCountByQueryVo(QueryVo vo);

	// 查询所有客户结果集
	public List<Customer> selectCustomerListByQueryVo(QueryVo vo);

	// 通过ID查询客户
	public Customer selectCustomerById(Integer id);

	// 修改客户通过id
	public void updateCustomerById(Customer customer);

	// 删除客户通过id
	public void deleteCustomerById(Integer id);

	//增加客户
	public boolean addCustomer(Customer customer);
}
