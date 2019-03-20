<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% if(session.getAttribute("username")==null) response.sendRedirect("/PriceTagManager/login.jsp"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>价签管理系统-商品添加</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<link rel="stylesheet" type="text/css" href="css/add.css">
  </head>
  
  <body style="background:url('image/img1.png') repeat-y;">
	 <div id="top">
	 	<div id="loginOut">
	 		<span>电子价签管理&nbsp;&nbsp;&nbsp;</span>
		 	<span>用户：<%=session.getAttribute("username")%>&nbsp;&nbsp;&nbsp;</span>
		 	<span><button onclick="window.location.href='loginOut.jsp'" id="loginOutButton">退出登录</button></span>
		 </div>	
	 </div>
	 
	  <div id="addTable">
	    <form action=addJudge.jsp method="post">
	    	商品编号<span style="color:red;"> * </span> : <input id="addInput" type="text"  name="goodsId" size="10" /><br><br>
	    	商品名称<span style="color:red;"> * </span> : <input id="addInput" type="text"  name="goodsName" size="10" /><br><br>
	    	商品价格<span style="color:red;"> * </span> : <input id="addInput" type="text"  name="goodsPrice" size="10" /><br><br>
	    	商品信息&nbsp; : <textarea name="goodsInfo"></textarea>
	    	<br><br>
	    	<input id="button" type="submit" value="添加" />
	  	  </form> 
	  	  <center><button id="button" onclick="window.location.href='index.jsp'">返回主页</button></center> 
	    </div>
	    
  </body>
</html>
