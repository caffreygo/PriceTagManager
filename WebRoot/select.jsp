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
    
    <title>查询结果</title>
    
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
	 	</div>
	 </div>
  	 <div id="middleTable">
	    <table border="2" align="center" width="70%" id="table-4">
	   	<caption style="font-size:40px;">查询结果</caption>
			<tr>
				<th>商品编号</th>
				<th>商品名称</th>
				<th>商品价格</th>
				<th>商品信息</th>
			</tr>
	  		 <%
	  		 DbUtil db=new DbUtil();
	  		 String goodsId = request.getParameter("goodsId");
	  	     String goodsName = request.getParameter("goodsName");
	  	     if(!goodsId.equals("")||!goodsName.equals("")){
	  	     	if(goodsId.equals("")){
	  	     		goodsId="%";
	  	     	};
	  	     	if(goodsName.equals("")){
	  	     		goodsName="%";
	  	     	};
	  	     	
	  	     	String sql="SELECT * FROM goods WHERE goodsId like ? and goodsName like ?";
		  		Object[] objs=new Object[]{goodsId,goodsName};
		  		List<Map<String,Object>> list=db.query(sql,objs);
		  		for(Map<String,Object> map:list) {
	  				/* int id=Integer.parseInt(String.valueOf(map.get("id"))); */
	  				%>
			  		<tr>
						<td style="text-align: center;"><%=map.get("goodsId").toString() %></td> 
						<td style="text-align: center;"><%=map.get("goodsName").toString() %></td> 
						<td style="text-align: center;"><%=map.get("goodsPrice").toString() %></td> 
						<td style="text-align: center;"><%=map.get("goodsInfo").toString()  %></td> 
						<td>
		              		<form id="formFloat" action="deleteResult.jsp">
		              				<input type="hidden" name="id" value="<%=map.get("id").toString() %>" />
		              				<input id="operatorButton" type="submit" value="删除" />
		              		</form>
		              		<form id="formFloat" action="update.jsp">
		              				<input type="hidden" name="id" value="<%=map.get("id").toString() %>" />
		              				<input id="operatorButton" type="submit" value="编辑" />
		              		</form>
	             		</td>
					</tr>	
					<%
	  			}
	  	     }else{
	  	     	String sql="SELECT * FROM goods";
				List<Map<String,Object>> list=db.query(sql,new Object[]{});
				for(Map<String,Object> map:list) {
					/* int id=Integer.parseInt(String.valueOf(map.get("id"))); */
				%>
					<tr id="tr">
						<td style="text-align: center;"><%=map.get("goodsId").toString() %></td> 
						<td style="text-align: center;"><%=map.get("goodsName").toString() %></td> 
						<td style="text-align: center;"><%=map.get("goodsPrice").toString() %></td> 
						<td style="text-align: center;"><%=map.get("goodsInfo").toString() %></td>
						<td>
		              		<form id="formFloat" action="deleteResult.jsp">
		              				<input type="hidden" name="id" value="<%=map.get("id").toString() %>" />
		              				<input id="operatorButton" type="submit" value="删除" />
		              		</form>
		              		<form id="formFloat" action="update.jsp">
		              				<input type="hidden" name="id" value="<%=map.get("id").toString() %>" />
		              				<input id="operatorButton" type="submit" value="编辑" />
		              		</form>
	             		</td>  
					</tr>
				<%
			}%>
		<%}%>
		</table>
		<br>
		<!-- <center><form action="index.jsp"><input type="submit" value="返回" /></form></center> -->
		<center><button id="operatorButton" onclick="window.location.href='index.jsp'">返回主页</button></center>
	</div>
  </body>
</html>
