<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <title>404</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_693759_ly2l5vm2fxn.css">
    <style>
        .box {
            text-align: center;
            font-size: 14px;
        }

        .box .iconfont {
            font-size: 300px;
        }
    </style>

  </head>
  
  <body>
    <div class="box">
	    <i class="iconfont icon-404cuowu"></i>
	    <p>小哥哥小姐姐，作者(yrf)很懒,下次再补充！</p>
	</div>
  </body>
</html>
