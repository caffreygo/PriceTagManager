package xmtx.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DbUtil {
	private Connection conn = null;
	private Statement stmt = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private String url = "jdbc:mysql://localhost:3306/courier?useUnicode=true&amp;characterEncoding=UTF8";
	private String user = "root";
	private String psw = "caffreygo6";
	
	//加载驱动（只需要执行一次-->静态代码块
	static {
		try  {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("加载驱动失败！！");
			e.printStackTrace();                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
		}
		
	}
	//获取连接
	public Connection getConn() {
		try {
			conn = DriverManager.getConnection(url,user,psw);
		} catch (SQLException e){
			System.out.println("获取连接失败！！");
			e.printStackTrace();
		}
		return conn;
	}
	//提供更新方法
	public int update (String sql, Object[] objs) {
		conn = getConn();  //通过getConn()获得连接对象
		try {
			ps = conn.prepareStatement(sql);  //通过连接对象获得预处理语句对象
			for(int i =0; i<objs.length;i++) {
				ps.setObject(i+1, objs[i]);
			}
			return ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("执行更新语句失败");
			e.printStackTrace();
			return -1;
		} finally {
			release();
		}
	}
	/*查询方法*/
	public List<Map<String, Object>> query(String sql,Object[] objs) {
		/*存储所有行的数据*/
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		try {
			/*获得预处理语句对象*/
			ps = getConn().prepareStatement(sql);
			/*对ps对象进行参数赋值*/
			for(int i=0; i<objs.length; i++) {
				ps.setObject(i+1, objs[i]);
			}
			/*执行查询语句，获得rs结果集对象*/
			rs = ps.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			/*遍历行*/
			while(rs.next()) {
				/*每一行*/
				Map<String, Object> map= new HashMap<String, Object>();
				for (int i=0; i<rsmd.getColumnCount(); i++) {
					String key = rsmd.getColumnName(i+1); //得到字段名称
					Object value = rs.getObject(key); //得到字段名称在对应行上的数据
					map.put(key,value);
				}
				list.add(map); //将改行数据存储在list中
			}
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			release();
		}
		return list;
		
	}
	/*批量更新*/
	public void batch(String[] sqls){
		try {
			conn = getConn();
			conn.setAutoCommit(false); //TRUE为执行完更新后自动更新到数据库 false手动提交
			stmt = conn.createStatement();
			for(String sql: sqls) {
			stmt.addBatch(sql); //将sql语句添加到批处理语句中
			}
			stmt.executeBatch(); // 执行批处理操作
		} catch (SQLException e) {
			try {
				conn.rollback();  //出现异常时回滚事物，提交集操作全不更新
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try {
				conn.commit();   //手动提交事物
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	/*释放资源*/
	public void release() {
		if (rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				System.out.println("关闭结果集出现了异常！！");
				e.printStackTrace();
			}
		}
		if (ps!=null) {
			try {
				ps.close();
			} catch (SQLException e) {
				System.out.println("关闭预处理语句对象出现了异常！！");
				e.printStackTrace();
			}
		}
		if (stmt!=null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				System.out.println("关闭语句对象出现了异常！！");
				e.printStackTrace();
			}
		}
		if (conn!=null) {
			try {
				conn.close();
			} catch (SQLException e) {
				System.out.println("关闭连接对象出现了异常！！");
				e.printStackTrace();
			}
		}
	}
}
