<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Excel导入</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<link rel="stylesheet" type="text/css" href="css/upload.css">

  </head>
   <body style="background:url('image/img1.png') repeat-y;">
	 <div id="top">
	 	<div id="loginOut">
	 		<span>电子价签管理&nbsp;&nbsp;&nbsp;</span>
		 	<span>用户：<%=session.getAttribute("username")%>&nbsp;&nbsp;&nbsp;</span>
		 	<span><button onclick="window.location.href='loginOut.jsp'" id="loginOutButton">退出登录</button></span>
		 </div>	
	 </div>

  <div id="uploadTable">
	<form id="uploadForm" action="smartupload.jsp" method="post"  enctype="multipart/form-data">
      <input id="fileForm" type="file" name="name1" size="20" maxlength="80"> 
      <input id="button" type="submit" value="上传">
	</form>
	<button onclick="window.location.href='index.jsp'" id="button">返回</button>
  </div>
    
  </body>
</html>
