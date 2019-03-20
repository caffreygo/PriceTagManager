package caffrey.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import caffrey.entity.Title;

public class TitleDao {
    public List<Title> readFirstTitle(){
        List<Title> list =new ArrayList<Title>();
        Connection con=null;
        PreparedStatement psmt=null;
        ResultSet rs=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        try {
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/price_tag","root","caffreygo6");
            String sql="select * from goods";
            psmt=con.prepareStatement(sql);
            rs=psmt.executeQuery();
            
            while(rs.next())
            {
            	int id=rs.getInt("id");
            	int goodsId=rs.getInt("goodsId");
                String goodsName=rs.getString("goodsName");
                String goodsPrice=rs.getString("goodsPrice");
                String goodsInfo=rs.getString("goodsInfo");
                Title tl=new Title(id, goodsId, goodsName, goodsPrice, goodsInfo);
                list.add(tl);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally
        {
            try {
                if(rs!=null)
                {
                    rs.close();
                }
                if(psmt!=null)
                {
                    psmt.close();
                }
                if(con!=null)
                {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }
    
}