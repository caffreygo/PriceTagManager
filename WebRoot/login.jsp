<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>毕业设计-价签管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/login.css">

	<style>
	
	</style>
  </head>
  
  <body style="background:url('image/img4.png') repeat-y;">
  	<div id="loginTable">
		<form action="loginJudge.jsp" method="post">
				<table align="center" style="border-collapse:separate; border-spacing:0px 10px;">
					<tr>
						<td>用户名:</td>
						<td><input id="loginInput" type="text" name="username"></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;密码:</td>
						<td><input id="loginInput" type="password" name="password"></td>
					</tr>
					<tr>
						<td><input id="button" style="margin-right:18px;" type="reset" value="重置" name="reset"></td>
						<td><input id="button" type="submit" value="登录" name="login"></td>
					</tr>
				</table>
		<p align="center"><a id="register" href="register.jsp">&nbsp;&nbsp;注册用户&gt;&gt;</a></p>
		</form>
	</div>
</body>

</html>
