package caffrey.servlets;

import java.io.IOException;
import java.io.Writer;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import caffrey.dao.TitleDao;
import caffrey.entity.Title;

public class getList extends HttpServlet {


	private static final long serialVersionUID = 1L;


	public getList() {
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

        TitleDao dao=new TitleDao();
        List<Title> list =dao.readFirstTitle();   
        JSONArray json = new JSONArray();
        for(Title tl:list){
        	
			 JSONObject jo = new JSONObject();
			 
		     jo.put("goodsId", tl.getGoodsId());
		     jo.put("goodsName", tl.getGoodsName());
		     jo.put("goodsPrice", tl.getGoodsPrice());
		     jo.put("goodsInfo", tl.getGoodsInfo());
		      
		     json.put(jo);
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
