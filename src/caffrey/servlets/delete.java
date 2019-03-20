package caffrey.servlets;

import java.io.IOException;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import caffrey.jdbc.DbUtil;

public class delete extends HttpServlet {


	private static final long serialVersionUID = 1L;


	public delete() {
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
        int goodsId=Integer.parseInt(request.getParameter("goodsId"));
        DbUtil db=new DbUtil();
 		String sql="DELETE FROM goods WHERE goodsId="+goodsId;
 		Object[] objs=new Object[]{};
		db.update(sql, objs);
		
		String json ="{\"success\":true,\"content\":\"删除成功！\"}";
	    Writer out = response.getWriter();
	    out.write(json);
	    out.flush();
	    out.close();

	}


	public void init() throws ServletException {
		// Put your code here
	}

}
