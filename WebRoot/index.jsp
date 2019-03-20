<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="caffrey.entity.Title,caffrey.dao.TitleDao,org.json.JSONArray,org.json.JSONObject"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% if(session.getAttribute("username")==null) response.sendRedirect("/PriceTagManager/login.jsp"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>商品列表</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">   
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/index.css">
  </head>
  
  <body style="background:url('image/img1.png') repeat-y;">
	 <div id="top">
	 	<div id="loginOut">
	 		<span>电子价签管理&nbsp;&nbsp;&nbsp;</span>
		 	<span>用户：<%=session.getAttribute("username")%>&nbsp;&nbsp;&nbsp;</span>
		 	<span><button onclick="window.location.href='loginOut.jsp'" id="loginOutButton">退出登录</button></span>
		 </div>	
	 </div>
	 	 
	 <div id="operation">
	 	<div id="select">
		   <form action=select.jsp method="post">
			   	<br /><br />
			   	商品编号&nbsp;&nbsp;:&nbsp;&nbsp;<input id="searchInput" type="text" name="goodsId" /> &nbsp;
			   	商品名称&nbsp;&nbsp;:&nbsp;&nbsp;<input id="searchInput" type="text" name="goodsName" />  &nbsp;
			   	<input id="button" type="submit" value="查询" />
		   </form>
		   <button onclick="window.location.href='add.jsp'" id="button">商品新增</button>
		   <button onclick="window.location.href='upload.jsp'" id="button">Excel导入</button>
	 	</div>
	 </div>
  
	 <div id="middleTable">
		  <table border="2" align="center" width="70%" id="table-4">
		      <tr>
		          <th>商品编号</th>
		          <th>商品名称</th>
		          <th>商品价格</th>
		          <th>商品信息</th>
		          <th> 操 作 </th>
		      </tr>
		        <%
		           TitleDao dao=new TitleDao();
		           List<Title> list =dao.readFirstTitle(); 
		           for(Title tl:list)
		           {%>
		       <tr>
	              <td><%=tl.getGoodsId() %></td>
	              <td><%=tl.getGoodsName() %></td>
	              <td><%=tl.getGoodsPrice()+"元" %></td>
	              <td><%=tl.getGoodsInfo() %></td>
	              <td>
	              		<form id="formFloat" action="deleteResult.jsp">
	              				<input type="hidden" name="id" value="<%=tl.getId() %>" />
	              				<input id="operatorButton" type="submit" value="删除" />
	              		</form>
	              		<form id="formFloat" action="update.jsp">
	              				<input type="hidden" name="id" value="<%=tl.getId() %>" />
	              				<input id="operatorButton" type="submit" value="编辑" />
	              		</form>
	              </td>
		        </tr>
		        <%}%>
		  	</table>
	  </div>
  
  </body>
</html>