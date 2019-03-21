package caffrey.servlets;

import java.io.IOException;
import java.io.Writer;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import caffrey.jdbc.DbUtil;

public class search extends HttpServlet {


	private static final long serialVersionUID = 1L;


	public search() {
		super();
	}


	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			this.doPost(request, response);

	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			response.setContentType("text/html;charset=utf-8");
	        /*设置响应头允许ajax跨域访问*/
	        response.setHeader("Access-Control-Allow-Origin", "*");
	        /* 星号表示所有的异域请求都可以接受， */
	        response.setHeader("Access-Control-Allow-Methods", "GET,POST");
	        
	        request.setCharacterEncoding("UTF-8");
	        response.setCharacterEncoding("UTF-8");
	        /* 解决中文乱码 */
	        
	        
	        String goodsId = request.getParameter("goodsId");
//		 	String goodsName = request.getParameter("goodsName"); 中文显示？
		 	String goodsName =new  String(request.getParameter("goodsName").getBytes("ISO-8859-1"),"utf-8");
		 	DbUtil db=new DbUtil();
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
			  		JSONArray json = new JSONArray();
			  		for(Map<String,Object> map:list) {
			  			JSONObject jo = new JSONObject();

			  			jo.put("goodsId",map.get("goodsId").toString());
			  			jo.put("goodsName",map.get("goodsName").toString());
			  			jo.put("goodsPrice",map.get("goodsPrice").toString());
			  			jo.put("goodsInfo",map.get("goodsInfo").toString());
			  			
			  			json.put(jo);
			  		}
			  		
			  		 Writer out = response.getWriter();
			         out.write(json.toString());
			         out.flush();
			         out.close();
			 }
		 	
	}


	public void init() throws ServletException {
		// Put your code here
	}

}
