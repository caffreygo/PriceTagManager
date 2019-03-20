<%@ page language="java" import="java.util.*,caffrey.jdbc.DbUtil" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>删除成功！</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<link rel="stylesheet" type="text/css" href="css/message.css">

  </head>
  
  <body style="background:url('image/img1.png') repeat-y;">
   <%
   		 DbUtil db=new DbUtil();
  		 int id=Integer.parseInt(request.getParameter("id"));
  		 String sql="DELETE FROM goods WHERE id="+id;
    	 Object[] objs=new Object[]{};
		 db.update(sql, objs);
    %>
    <div id="top">
	 	<div id="loginOut">
	 		<span>电子价签管理&nbsp;&nbsp;&nbsp;</span>
		 	<span>用户：<%=session.getAttribute("username")%>&nbsp;&nbsp;&nbsp;</span>
		 	<span><button onclick="window.location.href='loginOut.jsp'" id="loginOutButton">退出登录</button></span>
		 </div>	
	 </div>
	 
	<div id="messageTable">
		<center style="margin-top:15%;"><font size="5">删除成功!</font></center>
    	<center style="margin-top:40px;"><button id="button" onclick="window.location.href='index.jsp'">返回主页</button></center>	
	</div>	 

  </body>
</html>
