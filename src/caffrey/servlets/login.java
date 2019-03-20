package caffrey.servlets;

import java.io.IOException;
import java.io.Writer;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import caffrey.jdbc.DbUtil;

public class login extends HttpServlet {


	private static final long serialVersionUID = 1L;


	public login() {
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
        
        //获取微信小程序get的参数值并打印
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        //    System.out.println("username:" + username + "password:" + password);
        DbUtil db = new DbUtil();
        String sql="SELECT password FROM user WHERE username= ?";
	    Object[] objs=new Object[]{ username };
  		List<Map<String,Object>> list=db.query(sql,objs);
  		String result = "";	
  		if(list.size()!=0){
  			result = list.get(0).get("password").toString();
  		}
  		if(result.equals(password)){
  	        //返回值给微信小程序
  			String json ="{\"success\":true,\"content\":\"登录成功！\"}";
  	        Writer out = response.getWriter();
  	        out.write(json);
  	        out.flush();
  	        out.close();
  		}else{
  			String json ="{\"success\":false,\"content\":\"登录失败！\"}";
  	        Writer out = response.getWriter();
  	        out.write(json);
  	        out.flush();
  	        out.close();
  		}
	}


	public void init() throws ServletException {

	}

}
