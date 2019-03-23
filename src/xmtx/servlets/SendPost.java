package xmtx.servlets;

import java.io.IOException;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import xmtx.jdbc.DbUtil;


public class SendPost extends HttpServlet {


	private static final long serialVersionUID = 1L;


	public SendPost() {
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
        String user = request.getParameter("username");
        String publisher = request.getParameter("publisher");
        String embracer = request.getParameter("embracer");
        String fromAddr = request.getParameter("fromAddr");
        String toAddr = request.getParameter("toAddr");
        String type = request.getParameter("type");
        String date = request.getParameter("date");
        String taker = request.getParameter("taker");
        String content = request.getParameter("content");
        String status = request.getParameter("status");
        String reward = request.getParameter("reward");
         
        if(publisher.equals("")||embracer.equals("")||fromAddr.equals("")||toAddr.equals("")||reward.equals("")){
        	String json ="{\"success\":true,\"content\":\"寄件任务发布失败！\"}";
  	        Writer out = response.getWriter();
  	        out.write(json);
  	        out.flush();
  	        out.close();	
        }else{
        	DbUtil db=new DbUtil();
        	String sql="INSERT INTO maintable (publisher,embracer,fromAddr,toAddr,date,status,content,type,user,reward,taker) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
    		Object[] objs=new Object[]{publisher,embracer,fromAddr,toAddr,date,status,content,type,user,reward,taker};
    		db.update(sql, objs);
    		
    		String json ="{\"success\":true,\"content\":\"寄件任务发布成功！\"}";
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
