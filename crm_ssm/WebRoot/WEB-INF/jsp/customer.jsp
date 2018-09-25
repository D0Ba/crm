<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 分页标签  commons.tld   common.utils下的分页类-->
<%@ taglib prefix="yrf" uri="http://com.yrf/utils/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>CRM-客户列表</title>


<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet">
<!-- DataTables CSS -->
<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet"
	type="text/css">

</head>

<body>

	<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="javascript:void(0);">客户管理系统V1.0</a>
		</div>
		<!-- /.navbar-header -->

		<ul class="nav navbar-top-links navbar-right">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-envelope fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-messages">
					<li><a href="#"> </a></li>
					<li class="divider"></li>
					<li><a class="text-center" href="#"> <strong>查看全部消息</strong>
							<i class="fa fa-angle-right"></i>
					</a></li>
				</ul> <!-- /.dropdown-messages --></li>
			<!-- /.dropdown -->

			<!-- /.dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-user">
					<li><a href="#"><i class="fa fa-user fa-fw"></i> 用户设置</a></li>
					<li><a href="#"><i class="fa fa-gear fa-fw"></i> 系统设置</a></li>
					<li class="divider"></li>
					<li><a href="${pageContext.request.contextPath }/404"><i
							class="fa fa-sign-out fa-fw"></i> 退出登录</a></li>
				</ul> <!-- /.dropdown-user --></li>
			<!-- /.dropdown -->
		</ul>
		<!-- /.navbar-top-links -->

		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					<li class="sidebar-search">
						<div class="input-group custom-search-form">
							<input type="text" class="form-control" placeholder="输入查询内容...">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button">
									<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
								</button>
							</span>
						</div> <!-- /input-group -->
					</li>
					<li><a href="${pageContext.request.contextPath}/customer/list"
						class="active"><i class="fa fa-edit fa-fw"></i> 客户管理</a></li>
					<li><a href="${pageContext.request.contextPath}/404"><i
							class="fa fa-dashboard fa-fw"></i> 客户拜访</a></li>
				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side --> </nav>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header">客户管理</h3>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="panel panel-default">
				<div class="panel-body">
					<form class="form-inline"
						action="${pageContext.request.contextPath }/customer/list"
						method="post">
						<div class="form-group">
							<label for="customerName">客户名称</label> <input type="text"
								class="form-control" id="customerName" value="${custName }"
								name="custName" placeholder="客户名称">
						</div>
						<div class="form-group">
							<label for="customerFrom">客户来源</label> <select
								class="form-control" id="customerFrom" placeholder="客户来源"
								name="custSource">
								<option value="">--请选择--</option>
								<!-- sourceType:01 所有01的信息-->
								<c:forEach items="${sourceType}" var="item">
									<option value="${item.customer_info_codename}"
										<c:if test="${item.customer_info_codename == custSource}"> selected</c:if>>${item.customer_info_codename }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="custIndustry">所属行业</label> <select
								class="form-control" id="custIndustry" name="custIndustry">
								<option value="">--请选择--</option>
								<!--  industryType:02 所有02的信息-->
								<c:forEach items="${industryType}" var="item">
									<option value="${item.customer_info_codename}"
										<c:if test="${item.customer_info_codename == custIndustry}"> selected</c:if>>${item.customer_info_codename }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="custLevel">客户级别</label> <select class="form-control"
								id="custLevel" name="custLevel">
								<option value="">--请选择--</option>
								<!--  levelType:03 所有03的信息-->
								<c:forEach items="${levelType}" var="item">
									<option value="${item.customer_info_codename}"
										<c:if test="${item.customer_info_codename == custLevel}"> selected</c:if>>${item.customer_info_codename }</option>
								</c:forEach>
							</select>
						</div>
						<button type="submit" class="btn btn-primary">查询</button>
					</form>
				</div>
			</div>
			
			<div class="panel-body">
				<a href="#" class="btn  btn-info " data-toggle="modal"
					data-target="#customerAddDialog" onclick="">增加客户</a>
			</div>
			
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">客户信息列表</div>
						<!-- /.panel-heading -->
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>ID</th>
									<th>客户名称</th>
									<th>客户来源</th>
									<th>客户所属行业</th>
									<th>客户级别</th>
									<th>联系人</th>
									<th>手机</th>
									<th>邮政编码</th>
									<th>客户地址</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.rows}" var="row">
									<tr>
										<td class="text-center">${row.cust_id}</td>
										<td class="text-center">${row.cust_name}</td>
										<td class="text-center">${row.cust_source}</td>
										<td class="text-center">${row.cust_industry}</td>
										<td class="text-center">${row.cust_level}</td>
										<td class="text-center">${row.cust_linkman}</td>
										<td class="text-center">${row.cust_mobile}</td>
										<td class="text-center">${row.cust_zipcode}</td>
										<td class="text-center">${row.cust_address}</td>
										<td class="text-center"><a href="#"
											class="btn btn-primary btn-xs" data-toggle="modal"
											data-target="#customerEditDialog"
											onclick="editCustomer(${row.cust_id})">修改</a> <a href="#"
											class="btn btn-danger btn-xs"
											onclick="deleteCustomer(${row.cust_id})">删除</a> <a href="#"
											class="btn btn-info btn-xs" data-toggle="modal"
											data-target="#customerDetailDialog"
											onclick="detailCustomer(${row.cust_id})">详细信息</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="col-md-12 text-right">
							<%-- <yrf:page url="${pageContext.request.contextPath }/customer/list" /> --%>
							<yrf:page url="${pageContext.request.contextPath }/customer/list"></yrf:page>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
		<!-- /#page-wrapper -->
	</div>

	<!-- 客户增加对话框 -->
	<div class="modal fade" id="customerAddDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">增加客户信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="add_customer_form">
						<input type="hidden" id="add_cust_id" name="cust_id" />
						<div class="form-group">
							<label for="add_customerName" class="col-sm-2 control-label">客户名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_customerName"
									placeholder="客户名称" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="add_customerFrom"
								style="float:left;padding:7px 15px 0 27px;">客户来源</label>
							<div class="col-sm-10">
								<select class="form-control" id="add_customerFrom"
									placeholder="客户来源" name="cust_source">
									<option value="">--请选择--</option>
									<c:forEach items="${sourceType}" var="item">
										<option value="${item.customer_info_codename}"
											<c:if test="${item.customer_info_codename == custSource}"> selected</c:if>>${item.customer_info_codename }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="add_custIndustry"
								style="float:left;padding:7px 15px 0 27px;">所属行业</label>
							<div class="col-sm-10">
								<select class="form-control" id="add_custIndustry"
									name="cust_industry">
									<option value="">--请选择--</option>
									<c:forEach items="${industryType}" var="item">
										<option value="${item.customer_info_codename}"
											<c:if test="${item.customer_info_codename == custIndustry}"> selected</c:if>>${item.customer_info_codename }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="add_custLevel"
								style="float:left;padding:7px 15px 0 27px;">客户级别</label>
							<div class="col-sm-10">
								<select class="form-control" id="add_custLevel"
									name="cust_level">
									<option value="">--请选择--</option>
									<c:forEach items="${levelType}" var="item">
										<option value="${item.customer_info_codename}"
											<c:if test="${item.customer_info_codename == custLevel}"> selected</c:if>>${item.customer_info_codename }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="add_linkMan" class="col-sm-2 control-label">联系人</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_linkMan"
									placeholder="联系人" name="cust_linkman">
							</div>
						</div>
						<div class="form-group">
							<label for="add_phone" class="col-sm-2 control-label">固定电话</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_phone"
									placeholder="固定电话" name="cust_phone">
							</div>
						</div>
						<div class="form-group">
							<label for="add_mobile" class="col-sm-2 control-label">移动电话</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_mobile"
									placeholder="移动电话" name="cust_mobile">
							</div>
						</div>
						<div class="form-group">
							<label for="add_zipcode" class="col-sm-2 control-label">邮政编码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_zipcode"
									placeholder="邮政编码" name="cust_zipcode">
							</div>
						</div>
						<div class="form-group">
							<label for="add_address" class="col-sm-2 control-label">联系地址</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_address"
									placeholder="联系地址" name="cust_address">
							</div>
						</div>
						<div class="form-group">
							<label for="add_createtime" class="col-sm-2 control-label">创建时间</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_createtime"
									placeholder="创建时间格式 yyyy-MM-dd HH:mm:ss" name="cust_createtime">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="addCustomer()">保存增加</button>
				</div>
			</div>
		</div>
	</div>


	<!-- 客户信息修改对话框 -->
	<div class="modal fade" id="customerEditDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改客户信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_customer_form">
						<input type="hidden" id="edit_cust_id" name="cust_id" />
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">客户名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_customerName"
									placeholder="客户名称" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_customerFrom"
								style="float:left;padding:7px 15px 0 27px;">客户来源</label>
							<div class="col-sm-10">
								<select class="form-control" id="edit_customerFrom"
									placeholder="客户来源" name="cust_source">
									<option value="">--请选择--</option>
									<c:forEach items="${sourceType}" var="item">
										<option value="${item.customer_info_codename}"
											<c:if test="${item.customer_info_codename == custSource}"> selected</c:if>>${item.customer_info_codename }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_custIndustry"
								style="float:left;padding:7px 15px 0 27px;">所属行业</label>
							<div class="col-sm-10">
								<select class="form-control" id="edit_custIndustry"
									name="cust_industry">
									<option value="">--请选择--</option>
									<c:forEach items="${industryType}" var="item">
										<option value="${item.customer_info_codename}"
											<c:if test="${item.customer_info_codename == custIndustry}"> selected</c:if>>${item.customer_info_codename }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_custLevel"
								style="float:left;padding:7px 15px 0 27px;">客户级别</label>
							<div class="col-sm-10">
								<select class="form-control" id="edit_custLevel"
									name="cust_level">
									<option value="">--请选择--</option>
									<c:forEach items="${levelType}" var="item">
										<option value="${item.customer_info_codename}"
											<c:if test="${item.customer_info_codename == custLevel}"> selected</c:if>>${item.customer_info_codename }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_linkMan" class="col-sm-2 control-label">联系人</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_linkMan"
									placeholder="联系人" name="cust_linkman">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_phone" class="col-sm-2 control-label">固定电话</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_phone"
									placeholder="固定电话" name="cust_phone">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_mobile" class="col-sm-2 control-label">移动电话</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_mobile"
									placeholder="移动电话" name="cust_mobile">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_zipcode" class="col-sm-2 control-label">邮政编码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_zipcode"
									placeholder="邮政编码" name="cust_zipcode">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_address" class="col-sm-2 control-label">联系地址</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_address"
									placeholder="联系地址" name="cust_address">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateCustomer()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 客户详情对话框 -->
	<div class="modal fade" id="customerDetailDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">详细客户信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="detail_customer_form">
						<!-- <input type="hidden" id="detail_cust_id" name="cust_id" /> -->
						<div class="form-group">
							<label for="detail_customerId" class="col-sm-2 control-label">客户ID</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="detail_cust_id"
									placeholder="客户ID" name="cust_id" disabled="true">
							</div>
						</div>
						<div class="form-group">
							<label for="detail_customerName" class="col-sm-2 control-label">客户名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="detail_customerName"
									placeholder="客户名称" name="cust_name" readonly="true">
							</div>
						</div>
						<div class="form-group">
							<label for="detail_customerFrom"
								style="float:left;padding:7px 15px 0 27px;">客户来源</label>
							<div class="col-sm-10">
								<select class="form-control" id="detail_customerFrom"
									placeholder="客户来源" name="cust_source">
									<option value="">--请选择--</option>
									<c:forEach items="${sourceType}" var="item">
										<option value="${item.customer_info_codename}"
											<c:if test="${item.customer_info_codename == custSource}"> selected</c:if>>${item.customer_info_codename }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="detail_custIndustry"
								style="float:left;padding:7px 15px 0 27px;">所属行业</label>
							<div class="col-sm-10">
								<select class="form-control" id="detail_custIndustry"
									name="cust_industry">
									<option value="">--请选择--</option>
									<c:forEach items="${industryType}" var="item">
										<option value="${item.customer_info_codename}"
											<c:if test="${item.customer_info_codename == custIndustry}"> selected</c:if>>${item.customer_info_codename }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="detail_custLevel"
								style="float:left;padding:7px 15px 0 27px;">客户级别</label>
							<div class="col-sm-10">
								<select class="form-control" id="detail_custLevel"
									name="cust_level">
									<option value="">--请选择--</option>
									<c:forEach items="${levelType}" var="item">
										<option value="${item.customer_info_codename}"
											<c:if test="${item.customer_info_codename == custLevel}"> selected</c:if>>${item.customer_info_codename }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="detail_linkMan" class="col-sm-2 control-label">联系人</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="detail_linkMan"
									placeholder="联系人" name="cust_linkman" readonly="true">
							</div>
						</div>
						<div class="form-group">
							<label for="detail_phone" class="col-sm-2 control-label">固定电话</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="detail_phone"
									placeholder="固定电话" name="cust_phone" readonly="true">
							</div>
						</div>
						<div class="form-group">
							<label for="detail_mobile" class="col-sm-2 control-label">移动电话</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="detail_mobile"
									placeholder="移动电话" name="cust_mobile" readonly="true">
							</div>
						</div>
						<div class="form-group">
							<label for="detail_zipcode" class="col-sm-2 control-label">邮政编码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="detail_zipcode"
									placeholder="邮政编码" name="cust_zipcode" readonly="true">
							</div>
						</div>
						<div class="form-group">
							<label for="detail_address" class="col-sm-2 control-label">联系地址</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="detail_address"
									placeholder="联系地址" name="cust_address" readonly="true">
							</div>
						</div>
						<div class="form-group">
							<label for="detail_createtime" class="col-sm-2 control-label">创建时间</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="detail_createtime"
									placeholder="创建时间" name="cust_createtime" readonly="true">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
					<!-- <button type="button" class="btn btn-primary"
						onclick="updateCustomer()">保存修改</button> -->
				</div>
			</div>
		</div>
	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="<%=basePath%>js/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="<%=basePath%>js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="<%=basePath%>js/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
	<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="<%=basePath%>js/sb-admin-2.js"></script>

	<script type="text/javascript">
		function editCustomer(id) {
			$.ajax({
				type:"get",
				url:"<%=basePath%>customer/edit",
				data:{"id":id},
				success:function(data) {  
					$("#edit_cust_id").val(data.cust_id);
					$("#edit_customerName").val(data.cust_name);
					$("#edit_customerFrom").val(data.cust_source);
					$("#edit_custIndustry").val(data.cust_industry);
					$("#edit_custLevel").val(data.cust_level);
					$("#edit_linkMan").val(data.cust_linkman);
					$("#edit_phone").val(data.cust_phone);
					$("#edit_mobile").val(data.cust_mobile);
					$("#edit_zipcode").val(data.cust_zipcode);
					$("#edit_address").val(data.cust_address);
					
				}
			});
		}
		
		function updateCustomer() {
			$.post("<%=basePath%>customer/update",$("#edit_customer_form").serialize(),function(data){
				alert("客户信息更新成功！");
				window.location.reload();
			});
		}
		
		function deleteCustomer(id) {
			if(confirm('确实要删除该客户吗?')) {
				$.post("<%=basePath%>customer/delete", {
					"id" : id
				}, function(data) {
					alert("客户删除更新成功！");
					window.location.reload();
				});
			}
		}
		
		/* private Long cust_id;
		private String cust_name; // 客户姓名
		private String cust_source; // 客户来源
		private String cust_industry; // 客户所属行业
		private String cust_level;// 客户级别
		private String cust_linkman;// 联系人
		private String cust_phone;// 客户电话
		private String cust_mobile;// 客户手机
		private String cust_zipcode;// 客户邮编
		private String cust_address;// 客户地址
		private Date cust_createtime;// 创建时间 */
		
		
        function addCustomer() {
        	var cust_name = $("#add_customerName").val();
        	var cust_source = $("#add_customerFrom").val();
        	var cust_industry = $("#add_custIndustry").val();
        	var cust_level = $("#add_custLevel").val();
        	var cust_linkman = $("#add_linkMan").val();
        	var cust_phone = $("#add_phone").val();
        	var cust_mobile = $("#add_mobile").val();
        	var cust_zipcode = $("#add_zipcode").val();
        	var cust_address = $("#add_address").val();
        	var cust_createtime = $("#add_createtime").val();
        	
        	var customerJson = {"cust_name":cust_name,"cust_source":cust_source,"cust_industry":cust_industry,"cust_level":cust_level,"cust_linkman":cust_linkman,"cust_phone":cust_phone,"cust_mobile":cust_mobile,"cust_zipcode":cust_zipcode,"cust_address":cust_address,"cust_createtime":cust_createtime};
    		$.post("<%=basePath%>customer/add",customerJson,function(data){
				if(data=="success"){
						alert("添加客户成功");
					}else{
						alert("添加客户失败");
						}
				window.location.reload();
			});
		}
		
        function detailCustomer(id) {
			$.ajax({
				type:"get",
				url:"<%=basePath%>customer/edit",
				data:{"id":id},
				success:function(data) {  
					$("#detail_cust_id").val(data.cust_id);
					$("#detail_customerName").val(data.cust_name);
					$("#detail_customerFrom").val(data.cust_source);
					$("#detail_custIndustry").val(data.cust_industry);
					$("#detail_custLevel").val(data.cust_level);
					$("#detail_linkMan").val(data.cust_linkman);
					$("#detail_phone").val(data.cust_phone);
					$("#detail_mobile").val(data.cust_mobile);
					$("#detail_zipcode").val(data.cust_zipcode);
					$("#detail_address").val(data.cust_address);
					$("#detail_createtime").val(data.cust_createtime);/* 此时的内容是时间戳 1524961000这样的数据 */
					
					$("#detail_createtime").val(getFormatDate($("#detail_createtime").val()));
				}
			});
		}
        
 
        function getFormatDate(time){
        	var newtime=time*1;
        	//这里需要注意js时间戳精确到毫秒,所以要乘以1000后转换
    		//方法一(格式受限于用户系统,不推荐):
    		/* var timestr=new Date(newtime);
    		alert(timestr);//输出格式2018/7/8 上午10:56:15 **/
    		//方法二(推荐):
    		    var   _time=new Date(newtime);
    		    var   year=_time.getFullYear();//2018
    		    var   month=_time.getMonth()+1;//7
    		    var   date=_time.getDate();//8
    		    var   hour=_time.getHours();//16
    		    var   minute=_time.getMinutes();//32
    		    var   second=_time.getSeconds();//1
    		    
    		    if(month<10){
    		    	month="0"+(_time.getMonth()+1);
    		    }
    		    if(date<10){
    		    	date="0"+_time.getDate();
    		    }
    		    if(hour<10){
    		    	hour="0"+_time.getHours();
    		    }
    		    if(minute<10){
    		    	minute="0"+_time.getMinutes();
    		    }
    		    if(second<10){
    		    	second="0"+_time.getSeconds();
    		    }
    		    return   year+"年"+month+"月"+date+"日   "+hour+":"+minute+":"+second;//这里自己按自己需要的格式拼接
        }
        
        
  
		
	</script>
	<!--  
		
	 function getFormatDate(time){
        	var newtime=time*1;//这里需要注意js时间戳精确到毫秒,所以要乘以1000后转换
    		//方法一(格式受限于用户系统,不推荐):
    		/* var timestr=new Date(newtime);
    		alert(timestr);//输出格式2018/7/8 上午10:56:15 **/
    		//方法二(推荐):
    		function gettime(t){
    		    var   _time=new Date(t);
    		    var   year=_time.getFullYear();//2018
    		    var   month=_time.getMonth()+1;//7
    		    var   date=_time.getDate();//8
    		    var   hour=_time.getHours();//16
    		    var   minute=_time.getMinutes();//32
    		    var   second=_time.getSeconds();//1
    		    return   year+"年"+month+"月"+date+"日   "+hour+":"+minute+":"+second;//这里自己按自己需要的格式拼接
    		}
    		alert(gettime(newtime));
        }
	-->

</body>

</html>
