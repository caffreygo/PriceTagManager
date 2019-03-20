package caffrey.servlets;

import java.io.BufferedReader;
import java.io.IOException;
//import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import caffrey.jdbc.DbUtil;

public class edit extends HttpServlet {


	private static final long serialVersionUID = 1L;


	public edit() {
		super();
	}


	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
        /*设置响应头允许ajax跨域访问*/
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setCharacterEncoding("UTF-8");
        /* 星号表示所有的异域请求都可以接受， */
        response.setHeader("Access-Control-Allow-Methods", "GET,POST");
        
        String goodsId = request.getParameter("goodsId");
//        String goodsPrice = request.getParameter("goodsPrice");
//        String goodsInfo = request.getParameter("goodsInfo");
//        String goodsInfo =new String(request.getParameter("goodsInfo").getBytes("ISO8859-1"),"UTF-8");
        System.out.println(goodsId);
//        if( !goodsName.equals("") && !goodsPrice.equals("")){
//        	DbUtil db=new DbUtil();
//    		String sql="UPDATE goods SET goodsName= ? WHERE goodsId= ?";
//    		Object[] objs1=new Object[]{goodsName, goodsId};
//    		db.update(sql, objs1);
//    		
//    		sql="UPDATE goods SET goodsPrice= ? WHERE goodsId= ? ";
//    		Object[] objs2=new Object[]{goodsPrice, goodsId};
//    		db.update(sql, objs2);
//    		
//    		sql="UPDATE goods SET goodsInfo= ? WHERE goodsId= ? ";
//    		Object[] objs3=new Object[]{goodsInfo, goodsId};
//    		db.update(sql, objs3);
//    		
//    		String json ="{\"success\":true,\"content\":\"编辑成功！\"}";
//  	        Writer out = response.getWriter();
//  	        out.write(json);
//  	        out.flush();
//  	        out.close();
//    
//        }else{
//        	String json ="{\"success\":false,\"content\":\"编辑失败！\"}";
//  	        Writer out = response.getWriter();
//  	        out.write(json);
//  	        out.flush();
//  	        out.close();
//        }
		
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        
		this.doGet(request, response);
        
	}


	public void init() throws ServletException {
		// Put your code here
	}

}
