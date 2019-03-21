package caffrey.servlets;

import java.io.IOException;
import java.io.Writer;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import caffrey.jdbc.DbUtil;

public class add extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public add() {
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
	        /*由前台做空校验*/
	        String goodsId = request.getParameter("goodsId");
	        String goodsName = request.getParameter("goodsName");
	        String goodsPrice = request.getParameter("goodsPrice");
	        String goodsInfo = request.getParameter("goodsInfo");
	        
	        if(!goodsId.equals("") && !goodsName.equals("") && !goodsPrice.equals("")){
	        	/*商品编号重复查询*/
	        	DbUtil db=new DbUtil();
	        	String sql="SELECT goodsId FROM goods WHERE goodsId= ?";
	        	Object[] objs=new Object[]{ goodsId };
	    		List<Map<String,Object>> list=db.query(sql,objs);
	    		if(list.size()!=0){
	    			String json ="{\"success\":false,\"content\":\"商品编号重复！\"}";
	      	        Writer out = response.getWriter();
	      	        out.write(json);
	      	        out.flush();
	      	        out.close();
	    		}else{
	    			String sql1="INSERT INTO goods (goodsId,goodsName,goodsPrice,goodsInfo) VALUES (?,?,?,?)";
	    			Object[] objs1=new Object[]{goodsId,goodsName,goodsPrice,goodsInfo};
	    			db.update(sql1, objs1);
	    			
	    			String json ="{\"success\":true,\"content\":\"商品添加成功！\"}";
	      	        Writer out = response.getWriter();
	      	        out.write(json);
	      	        out.flush();
	      	        out.close();
	    		}
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
