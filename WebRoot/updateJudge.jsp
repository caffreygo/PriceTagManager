<%@ page language="java" import="java.util.*,caffrey.jdbc.DbUtil" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>编辑失败！</title>
    
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
  	 <div id="top">
	 	<div id="loginOut">
	 		<span>电子价签管理&nbsp;&nbsp;&nbsp;</span>
		 	<span>用户：<%=session.getAttribute("username")%>&nbsp;&nbsp;&nbsp;</span>
		 	<span><button onclick="window.location.href='loginOut.jsp'" id="loginOutButton">退出登录</button></span>
		 </div>	
	 </div>
	 <div id="messageTable">
	    <%
	  		boolean NameEmpty=false;
	  		boolean PriceEmpty=false;
	  		int goodsId=Integer.parseInt(request.getParameter("goodsId"));
	  		String goodsName = request.getParameter("goodsName");
	  		String goodsPrice = request.getParameter("goodsPrice");
	  		String goodsInfo = request.getParameter("goodsInfo");
	  		if(goodsName.equals("")){
	  			NameEmpty=true;
	  			%> <center style="margin-top:35px;"><font size="4">商品编辑失败，商品名称为必填项!</font></center><%
	  		}
	  		if(goodsPrice.equals("")){
	  			PriceEmpty=true;
	  			%> <center style="margin-top:35px;"><font size="4" >商品编辑失败，商品价格为必填项!</font></center><%
	  		}
			if(NameEmpty==false && PriceEmpty==false){
				DbUtil db=new DbUtil();
				String sql="UPDATE goods SET goodsName= ? WHERE goodsId= ?";
				Object[] objs1=new Object[]{goodsName, goodsId};
				db.update(sql, objs1);
				
				sql="UPDATE goods SET goodsPrice= ? WHERE goodsId= ? ";
				Object[] objs2=new Object[]{goodsPrice, goodsId};
				db.update(sql, objs2);
				
				sql="UPDATE goods SET goodsInfo= ? WHERE goodsId= ? ";
				Object[] objs3=new Object[]{goodsInfo, goodsId};
				db.update(sql, objs3);
				%> <center style="margin-top:50px;"><font size="4" >商品编辑成功!</font></center><%
			}
	    %>
	    <br>
	    <center><button id="button" style="margin-top:20px;" onclick="window.location.href='index.jsp'">返回</button></center>
    </div>
  </body>
</html>
