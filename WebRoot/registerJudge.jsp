<%@ page language="java" import="java.util.*,caffrey.jdbc.DbUtil" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>价签管理系统-注册结果</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/loginJudge.css">

  </head>
  
  <body style="background:url('image/img4.png') repeat-y;">
  	<div id="main">
  		<% 
   		DbUtil db=new DbUtil();	
  		String username = request.getParameter("username");
  		String password = request.getParameter("password");
  		String email = request.getParameter("email");
  		if(username.equals("")||password.equals("")){
  			%><center style="margin-top:15%;">
  	    		<font>注册失败，请填写完整的用户名和密码！</font><br><br><br>
  	    		<button id="button" onclick="window.location.href='register.jsp'">返回注册页</button>
  	    	</center><%
  		}
  		// 当前注册用户名查询
  		String sql1="SELECT id FROM user WHERE username= ?";
  		Object[] objs1=new Object[]{ username };
	  	List<Map<String,Object>> list=db.query(sql1,objs1);
	  	// 用户名已注册过滤
	  	if(list.size()==0){
	  	  	String sql="INSERT INTO user (username,password,email) VALUES (?,?,?)";
			Object[] objs=new Object[]{ username, password, email };
			db.update(sql, objs);
			%><center style="margin-top:15%;">
  	    		<font>注册成功！</font><br><br><br>
  	    		<button id="button" onclick="window.location.href='login.jsp'">返回登录页</button>
  	    	</center><%
	  	}else{
	  		%><center style="margin-top:15%;">
  	    		<font>注册失败，该用户名已存在，请更换！</font><br><br><br>
  	    		<button id="button" onclick="window.location.href='login.jsp'">返回登录页</button>
  	    	</center><%
	  	}%>
  	</div>
  </body>
</html>
