package com.b510.excel.vo;

public class Student
{
  private Integer id;
  private Integer goodsId;
  private String goodsName;
  private String goodsPrice;
  private String goodsInfo;
  
  public Integer getId()
  {
    return this.id;
  }
  
  public void setId(Integer id)
  {
    this.id = id;
  }
  
  public Integer getGoodsId()
  {
    return this.goodsId;
  }
  
  public void setGoodsId(Integer goodsId)
  {
    this.goodsId = goodsId;
  }
  
  public String getGoodsName()
  {
    return this.goodsName;
  }
  
  public void setGoodsName(String name)
  {
    this.goodsName = name;
  }
  
  public String getGoodsPrice()
  {
    return this.goodsPrice;
  }
  
  public void setGoodsPrice(String goodsPrice)
  {
    this.goodsPrice = goodsPrice;
  }
  
  public String getGoodsInfo()
  {
    return this.goodsInfo;
  }
  
  public void setGoodsInfo(String goodsInfo)
  {
    this.goodsInfo = goodsInfo;
  }
}
