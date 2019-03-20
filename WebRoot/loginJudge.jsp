<%@ page language="java" import="java.util.*,caffrey.jdbc.DbUtil" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>价签管理系统-登陆失败</title>
    
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
  		DbUtil db = new DbUtil();
  		String username = request.getParameter("username");
  	    String password = request.getParameter("password");
  	    if(username.equals("") || password.equals("")){
  	    	%> <center style="margin-top:15%;">
  	    		<font>登录失败，请填写完整的用户名和密码！</font><br><br><br>
  	    	</center><% 	
  	    }else{
  	        /* 帐号密码不为空  */
  	        String sql="SELECT password FROM user WHERE username= ?";
  	        Object[] objs=new Object[]{ username };
	  		List<Map<String,Object>> list=db.query(sql,objs);
	  		// 未注册用户名过滤
	  		String result = "";	
	  		if(list.size()!=0){
	  			result = list.get(0).get("password").toString();
	  		}	  		
	  		if(result.equals(password)){
	  			/* 登陆成功 */
				session.setAttribute("username",username);
				/* request.getRequestDispatcher("index.jsp").forward(request, response); */
				response.sendRedirect("index.jsp"); 
	  		}else{
	  			%> <center style="margin-top:15%;">
  	        		<font>登录失败，请输入正确的用户名和密码！</font><br><br><br>
  	        	</center><%	
	  		}
  	    }%>	
		<br>
		<center><button id="button" onclick="window.location.href='index.jsp'">重新登录</button></center>
	</div>
	
  </body>
</html>
