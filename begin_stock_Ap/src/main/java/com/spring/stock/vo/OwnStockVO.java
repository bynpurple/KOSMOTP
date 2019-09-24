package com.spring.stock.vo;

public class OwnStockVO {
   private String stockcode;
   private String stocktheme; 
   private String stockname; 
   private int   volume; 
   private String username;
   
   public String getStockcode() {
      return stockcode;
   }
   public void setStockcode(String stockcode) {
      this.stockcode = stockcode;
   }
   public String getStocktheme() {
      return stocktheme;
   }
   public void setStocktheme(String stocktheme) {
      this.stocktheme = stocktheme;
   }
   public String getStockname() {
      return stockname;
   }
   public void setStockname(String stockname) {
      this.stockname = stockname;
   }
   public int getVolume() {
      return volume;
   }
   public void setVolume(int volume) {
      this.volume = volume;
   }
   public String getUsername() {
      return username;
   }
   public void setUsername(String username) {
      this.username = username;
   }
   
}