package com.yrf.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yrf.pojo.Customer;
import com.yrf.pojo.CustomerInfo;
import com.yrf.pojo.QueryVo;
import com.yrf.service.CustomerInfoService;
import com.yrf.service.CustomerService;
import com.yrf.utils.Page;

/*
 * 客户管理
 */
@Controller
public class CustomerController {
	@Autowired
	private CustomerInfoService customerInfoService;
	@Autowired
	private CustomerService customerService;

	// 注解在成员变量上 解决硬编码问题
	@Value("${sourceType.code}")
	// 客户来源
	private String sourceTypeCode;
	@Value("${industryType.code}")
	// 所属行业
	private String industryTypeCode;

	// 入口
	@RequestMapping(value = "/customer/list")
	public String list(QueryVo vo, Model model) {

		List<CustomerInfo> sourceType = customerInfoService.selectCustomerInfoListByCode(sourceTypeCode);
		List<CustomerInfo> industryType = customerInfoService.selectCustomerInfoListByCode(industryTypeCode);
		List<CustomerInfo> levelType = customerInfoService.selectCustomerInfoListByCode("03");//这里写硬编码方式 方便对照

		model.addAttribute("sourceType", sourceType); //通过cust_info_beforecode 获得查询的客户来源 行业 级别
		model.addAttribute("industryType", industryType);
		model.addAttribute("levelType", levelType);

		// 通过四个条件 查询分页对象
		Page<Customer> page = customerService.selectPageByQueryVo(vo);
		// System.out.println(page);
		model.addAttribute("page", page);
		model.addAttribute("custName", vo.getCustName());
		model.addAttribute("custSource", vo.getCustSource());
		model.addAttribute("custIndustry", vo.getCustIndustry());
		model.addAttribute("custLevel", vo.getCustLevel());
		return "customer";
	}

	// 去修改页面
	@RequestMapping(value = "/customer/edit")
	public @ResponseBody
	Customer edit(Integer id) {
		return customerService.selectCustomerById(id);
	}

	// 修改保存
	@RequestMapping(value = "/customer/update")
	public @ResponseBody
	String update(Customer customer) {
		customerService.updateCustomerById(customer);
		// 返回ajax页面function()方法获得data数据
		return "OK";
	}

	// 删除用户
	@RequestMapping(value = "/customer/delete")
	public @ResponseBody
	String delete(Integer id) {
		customerService.deleteCustomerById(id);
		// 返回ajax页面function()方法获得data数据
		return "OK";
	}

	
		
		
	
	/*
	 * 解决cust_createtime的格式转换问题
	 * */
    @InitBinder
	public void initBinder(WebDataBinder binder) {
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        dateFormat.setLenient(false);
	        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	 }
		
    //增加客户
	@RequestMapping("/customer/add")
	public void addCustomer(HttpServletRequest request,HttpServletResponse response,Customer customer){
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=null;
			try {
				out = response.getWriter();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(customerService.addCustomer(customer)){
				out.write("success");
			}else{
				out.write("error");
			}
			out.flush();
			out.close();	
		}
	
		
	//未写的功能
	@RequestMapping("/404")
	public String notFind() {
//		System.out.println("11");
		return "404";
	}
	
	

}
