package com.yrf.pojo;

import java.util.Date;


public class Customer {

	private Long cust_id;
	private String cust_name; // 客户姓名
	private String cust_source; // 客户来源
	private String cust_industry; // 客户所属行业
	private String cust_level;// 客户级别
	private String cust_linkman;// 联系人
	private String cust_phone;// 客户电话
	private String cust_mobile;// 客户手机
	private String cust_zipcode;// 客户邮编
	private String cust_address;// 客户地址
	private Date cust_createtime;// 创建时间

	public Long getCust_id() {
		return cust_id;
	}

	public void setCust_id(Long cust_id) {
		this.cust_id = cust_id;
	}

	public String getCust_name() {
		return cust_name;
	}

	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}

	public String getCust_source() {
		return cust_source;
	}

	public void setCust_source(String cust_source) {
		this.cust_source = cust_source;
	}

	public String getCust_industry() {
		return cust_industry;
	}

	public void setCust_industry(String cust_industry) {
		this.cust_industry = cust_industry;
	}

	public String getCust_level() {
		return cust_level;
	}

	public void setCust_level(String cust_level) {
		this.cust_level = cust_level;
	}

	public String getCust_linkman() {
		return cust_linkman;
	}

	public void setCust_linkman(String cust_linkman) {
		this.cust_linkman = cust_linkman;
	}

	public String getCust_phone() {
		return cust_phone;
	}

	public void setCust_phone(String cust_phone) {
		this.cust_phone = cust_phone;
	}

	public String getCust_mobile() {
		return cust_mobile;
	}

	public void setCust_mobile(String cust_mobile) {
		this.cust_mobile = cust_mobile;
	}

	public String getCust_zipcode() {
		return cust_zipcode;
	}

	public void setCust_zipcode(String cust_zipcode) {
		this.cust_zipcode = cust_zipcode;
	}

	public String getCust_address() {
		return cust_address;
	}

	public void setCust_address(String cust_address) {
		this.cust_address = cust_address;
	}

	public Date getCust_createtime() {
		return cust_createtime;
	}

	public void setCust_createtime(Date cust_createtime) {
		this.cust_createtime = cust_createtime;
	}

}
