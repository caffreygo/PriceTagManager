package xmtx.servlets;

import java.io.IOException;
import java.io.Writer;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import xmtx.jdbc.DbUtil;

public class GetSendList extends HttpServlet {


	private static final long serialVersionUID = 1L;


	public GetSendList() {
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
        
	 	
	 	DbUtil db=new DbUtil();
     	String type = "寄件";
     	String sql="SELECT * FROM maintable WHERE type = ?";
  		Object[] objs=new Object[]{ type };
  		List<Map<String,Object>> list=db.query(sql,objs);
            
  		JSONArray json = new JSONArray();
  		for(Map<String,Object> map:list) {
  			
  			JSONObject jsonObject = new JSONObject();
  			
  			jsonObject.put("content",map.get("content").toString());
  			jsonObject.put("id",map.get("id").toString());
  			jsonObject.put("fromAddr",map.get("fromAddr").toString());
  			jsonObject.put("reward",map.get("reward").toString());
  			jsonObject.put("embracer",map.get("embracer").toString());
  			jsonObject.put("status",map.get("status").toString());
  			jsonObject.put("toAddr",map.get("toAddr").toString());
  			jsonObject.put("type",map.get("type").toString());
  			jsonObject.put("taker",map.get("taker").toString());
  			jsonObject.put("date",map.get("date").toString());
  			jsonObject.put("user",map.get("user").toString());
  			jsonObject.put("publisher",map.get("publisher").toString());

  			json.put(jsonObject);
  		}
  		
  		 Writer out = response.getWriter();
         out.write(json.toString());
         out.flush();
         out.close();


	}


	public void init() throws ServletException {
		// Put your code here
	}

}
