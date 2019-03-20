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
    
    <title>添加状态!</title>
    
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
  		DbUtil db=new DbUtil();
  		boolean idEmpty = false;
  		boolean idDuplicate = false;
  		boolean nameEmpty = false;
  		boolean priceEmpty = false;
  		String goodsId = request.getParameter("goodsId");
  		String goodsName = request.getParameter("goodsName");
  		String goodsPrice = request.getParameter("goodsPrice");
  		String goodsInfo = request.getParameter("goodsInfo");
  		if (goodsId.equals("")){
  			idEmpty = true;
  			%><center style="margin-top:15px;"><font size="4">商品添加失败，请输入商品编号！</font></center><br><%
  		}
 		if(goodsName.equals("")){
 			nameEmpty = true;
			%><center style="margin-top:15px;"><font size="4">商品添加失败，请输入商品名称！</font></center><br><%
		}
		if(goodsPrice.equals("")){
			priceEmpty = true;
			%><center style="margin-top:15px;"><font size="4">商品添加失败，请输入商品价格！</font></center><br><%
		}		
		String sql="SELECT goodsId FROM goods WHERE goodsId= ?";
		Object[] objs=new Object[]{ goodsId };
		List<Map<String,Object>> list=db.query(sql,objs);
		if(list.size()!=0){
			idDuplicate = true;
			%><center style="margin-top:15px;"><font size="4">商品添加失败，商品编号已存在！</font></center><br><%
		}
		if(idEmpty==false && nameEmpty==false && priceEmpty==false && idDuplicate==false ){
			DbUtil db1=new DbUtil();
			String sql1="INSERT INTO goods (goodsId,goodsName,goodsPrice,goodsInfo) VALUES (?,?,?,?)";
			Object[] objs1=new Object[]{goodsId,goodsName,goodsPrice,goodsInfo};
			db.update(sql1, objs1);
			%><center style="margin-top:60px;"><font size="5">商品添加成功！</font></center><br><%
		}

    %>
    <center><button id="button" onclick="window.location.href='add.jsp'">返回</button></center>
    </div>
  </body>
</html>
