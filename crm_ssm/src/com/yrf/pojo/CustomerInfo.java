package com.yrf.pojo;

import java.io.Serializable;


public class CustomerInfo implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long customer_info_id;
	private String customer_info_beforecode;
	private String customer_info_beforecodename;
	private String customer_info_code;
	private String customer_info_codename;

	public Long getCustomer_info_id() {
		return customer_info_id;
	}

	public void setCustomer_info_id(Long customer_info_id) {
		this.customer_info_id = customer_info_id;
	}

	public String getCustomer_info_beforecode() {
		return customer_info_beforecode;
	}

	public void setCustomer_info_beforecode(String customer_info_beforecode) {
		this.customer_info_beforecode = customer_info_beforecode;
	}

	public String getCustomer_info_beforecodename() {
		return customer_info_beforecodename;
	}

	public void setCustomer_info_beforecodename(
			String customer_info_beforecodename) {
		this.customer_info_beforecodename = customer_info_beforecodename;
	}

	public String getCustomer_info_code() {
		return customer_info_code;
	}

	public void setCustomer_info_code(String customer_info_code) {
		this.customer_info_code = customer_info_code;
	}

	public String getCustomer_info_codename() {
		return customer_info_codename;
	}

	public void setCustomer_info_codename(String customer_info_codename) {
		this.customer_info_codename = customer_info_codename;
	}

	@Override
	public String toString() {
		return "CustomerInfo [customer_info_id=" + customer_info_id
				+ ", customer_info_beforecode=" + customer_info_beforecode
				+ ", customer_info_beforecodename="
				+ customer_info_beforecodename + ", customer_info_code="
				+ customer_info_code + ", customer_info_codename="
				+ customer_info_codename + "]";
	}

}
