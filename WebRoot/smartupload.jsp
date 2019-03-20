<%@ page language="java" import="java.util.*,java.io.*" pageEncoding="UTF-8"%>
<%@page import="com.jspsmart.upload.SmartUpload,com.jspsmart.upload.SmartUploadException"%>
<%@page import="com.jspsmart.upload.File,com.jspsmart.upload.Files"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet,org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="com.b510.excel.vo.Student,com.b510.common.Common,com.b510.excel.util.DbUtil"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>导入结果</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<link rel="stylesheet" type="text/css" href="css/smartupload.css">
	

  </head>

  <body style="background:url('image/img1.png') repeat-y;">
	 <div id="top">
	 	<div id="loginOut">
	 		<span>电子价签管理&nbsp;&nbsp;&nbsp;</span>
		 	<span>用户：<%=session.getAttribute("username")%>&nbsp;&nbsp;&nbsp;</span>
		 	<span><button onclick="window.location.href='loginOut.jsp'" id="loginOutButton">退出登录</button></span>
		 </div>	
	 </div>

    <div id="table">
		  <%
		  		SmartUpload upload = new SmartUpload();//创建组件对象
		        upload.initialize(this.getServletConfig(), request, response);// 初始化
		        upload.setMaxFileSize(1 * 1024 * 1024);// 每个文件最大1M
		        upload.setTotalMaxFileSize(10 * 1024 * 1024);// 总共最大10M
		        upload.setAllowedFilesList("xls");// 允许上传xls
		        try {
		            upload.upload();
		            Files uploadFiles = upload.getFiles();
		            String fileName = uploadFiles.getFile(0).getFileName();
		         	// System.out.println("上传数量: " + uploadFiles.getCount());
		            uploadFiles.getFile(0).saveAs("/upload/"+fileName);  //将文件保存在磁盘根目录下的upload文件夹apache
		            String filePath = application.getRealPath("/") + "\\upload\\" + fileName;        	
		           	FileInputStream fis = new FileInputStream(filePath);
		           	HSSFWorkbook hssfWorkbook = new HSSFWorkbook(fis);
		           	Student student = null;
					List<Student> list = new ArrayList<Student>();
					for (int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {
						HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);
						if (hssfSheet == null) {
							continue;
						}
						for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
							HSSFRow hssfRow = hssfSheet.getRow(rowNum);
							if (hssfRow != null) {
								student = new Student();
								HSSFCell goodsId = hssfRow.getCell(0);
								HSSFCell goodsName = hssfRow.getCell(1);
								HSSFCell goodsPrice = hssfRow.getCell(2);
								HSSFCell goodsInfo = hssfRow.getCell(3);
						
								student.setGoodsId((int)goodsId.getNumericCellValue());
								student.setGoodsName(String.valueOf(goodsName.getStringCellValue()));
								student.setGoodsPrice(String.valueOf(goodsPrice.getNumericCellValue()));
								student.setGoodsInfo(String.valueOf(goodsInfo.getStringCellValue()));
								list.add(student);
							}
						}
					}
					for (int i = 0; i < list.size(); i++) {
						student = list.get(i);
						@SuppressWarnings("rawtypes")
						List l = DbUtil.selectOne(Common.SELECT_STUDENT_SQL +student.getGoodsId(), student);
						System.out.println(student.getGoodsId());
						System.out.println(l);
						if (!l.contains(1)) {
							DbUtil.insert(Common.INSERT_STUDENT_SQL, student);
							%> <center style="margin-top:35px;"><font size="4" >商品<%=student.getGoodsName() %>导入成功!</font></center><%
						} else {
							System.out.println("The Record was Exist : No. = " + student.getGoodsId() + " , Name = " + student.getGoodsName() + ", and has been throw away!");
							%> <center style="margin-top:35px;"><font size="4" >商品编号为<%=student.getGoodsId() %>已存在，导入失败！(<%=student.getGoodsName() %>)</font></center><%
						}
					}
		        } catch (SmartUploadException e) {
		            e.printStackTrace();
		        }     
		   %>
		   		<button style="margin-top:30px" onclick="window.location.href='index.jsp'" id="button">返回主页</button>
		   		<button style="margin-left:30px" onclick="window.location.href='upload.jsp'" id="button">再次导入</button>

		   
   </div>
  </body>
</html>
