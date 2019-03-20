<%@ page language="java" import="java.util.*,caffrey.jdbc.DbUtil" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>价签管理系统-商品编辑</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<link rel="stylesheet" type="text/css" href="css/update.css">
	<style>

    </style>
  </head>
  
  <body style="background:url('image/img1.png') repeat-y;">
    <div id="top">
	 	<div id="loginOut">
	 		<span>电子价签管理&nbsp;&nbsp;&nbsp;</span>
		 	<span>用户：<%=session.getAttribute("username")%>&nbsp;&nbsp;&nbsp;</span>
		 	<span><button onclick="window.location.href='loginOut.jsp'" id="loginOutButton">退出登录</button></span>
		 </div>	
	 </div>
  	<%
   		DbUtil db=new DbUtil();
   		int goodsId=0;
   		String goodsName = "";
	  	String goodsPrice = "";
	  	String goodsInfo = "";
  		int id=Integer.parseInt(request.getParameter("id"));
  		String sql="SELECT * FROM goods WHERE id= ?";
  		Object[] objs=new Object[]{id};
    	List<Map<String,Object>> list=db.query(sql,objs);
	  		for(Map<String,Object> map:list) {
	  			goodsId = Integer.parseInt(map.get("goodsId").toString());
	  			goodsName = map.get("goodsName").toString();
	  			goodsPrice = map.get("goodsPrice").toString();
	  			goodsInfo = map.get("goodsInfo").toString();
  			}
    %>
  	
   	<div id="updateTable">
	    <form action=updateJudge.jsp method="post">
	    	-当前编辑商品编号- : <font size=h7 color="red"><%= goodsId %></font> <br><br>
	    	 <input type="hidden"  name="goodsId" size="10" value="<%=goodsId%>"/>
	    	商品名称 : <input type="text" id="updateInput" name="goodsName" size="10" value="<%=goodsName%>"/> <br><br>
	    	商品价格 : <input type="text" id="updateInput"  name="goodsPrice" size="10" value="<%=goodsPrice%>"/> <br><br>
	    	商品信息 : <textarea name="goodsInfo"><%=goodsInfo%></textarea>
	    	<br><br>
	    	<input  id="button" type="submit" value="修改" />
	  	 </form>
	  	 <center><button id="button" onclick="window.location.href='index.jsp'">返回主页</button></center>
	  </div>
	  
  </body>
</html>
