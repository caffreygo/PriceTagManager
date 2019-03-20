package com.b510.common;

public class Common
{
  public static final String DRIVER = "com.mysql.jdbc.Driver";
  public static final String DB_NAME = "price_tag";
  public static final String USERNAME = "root";
  public static final String PASSWORD = "caffreygo6";
  public static final String IP = "localhost";
  public static final String PORT = "3306";
  public static final String URL = "jdbc:mysql://localhost:3306/price_tag";
  public static final String EXCEL_PATH = "lib/student_info.xls";
  public static final String INSERT_STUDENT_SQL = "insert into goods(goodsId, goodsName, goodsPrice, goodsInfo) values(?, ?, ?, ?)";
  public static final String UPDATE_STUDENT_SQL = "update goods set goodsId = ?, goodsName = ?, goodsPrice= ?, goodsInfo = ? where id = ? ";
  public static final String SELECT_STUDENT_ALL_SQL = "select id,goodsId,goodsName,goodsPrice,goodsInfo from goods";
  public static final String SELECT_STUDENT_SQL = "select * from goods where goodsId=";
}
