package xmtx.servlets;

import java.io.IOException;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import xmtx.jdbc.DbUtil;

public class PostTake extends HttpServlet {


	private static final long serialVersionUID = 1L;


	public PostTake() {
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
        /* 星号表示所有的异域请求都可以接受， */
        response.setCharacterEncoding("UTF-8");
        /* 解决中文乱码 */
        request.setCharacterEncoding("UTF-8");
        
        response.setHeader("Access-Control-Allow-Methods", "GET,POST");
        int id=Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status");
        String taker = request.getParameter("taker");
        DbUtil db = new DbUtil();
        
		if(status.equals("")||taker.equals("")){
			String json ="{\"success\":false,\"content\":\"接单失败！\"}";
  	        Writer out = response.getWriter();
  	        out.write(json);
  	        out.flush();
  	        out.close();
		}else{
			String sql="UPDATE maintable SET status= ? WHERE id= ?";
			Object[] objs=new Object[]{status, id};
			db.update(sql, objs);
			
			sql="UPDATE maintable SET taker= ? WHERE id= ? ";
			Object[] objs1=new Object[]{taker, id};
			db.update(sql, objs1);
			
			String json ="{\"success\":true,\"content\":\"接单成功！\"}";
  	        Writer out = response.getWriter();
  	        out.write(json);
  	        out.flush();
  	        out.close();
		}

	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);

	}


	public void init() throws ServletException {
		// Put your code here
	}

}
