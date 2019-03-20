<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>价签管理系统-注册页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/register.css">

  </head>
  
  <body style="background:url('image/img4.png') repeat-y;">
  	<div id="registerTable">
  	  	<p><a id="backReset" href="login.jsp">&lt;&lt;返回</a></p>
		<form action="registerJudge.jsp" method="post">
			<table align="center" style="border-collapse:separate; border-spacing:0px 10px;">
				<tr>
					<td>用户名 : </td>
					<td><input id="registerInput" type="text" name="username"></td>
				</tr>
				<tr>
					<td> &nbsp;&nbsp;密 码 : </td>
					<td><input id="registerInput" type="password" name="password"></td>
				</tr>
				<tr>
					
					<td> &nbsp;&nbsp;邮 箱 : </td>
					<td><input id="registerInput" type="text" name="email"></td>
				</tr>
				<tr>
					<td><input id="button" type="reset" value="重置" name="reset"></td>
					<td><input id="button" type="submit" value="注册" name="login" style="margin-left:18px;"></td>
				</tr>
			</table>
		</form>
	</div>
	
	
</body>

</html>