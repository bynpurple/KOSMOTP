package com.spring.stock.vo;

import java.sql.Timestamp;

public class Stock_sellVO {
   private String sell_num;
   private String username;
   private String stockcode;
   private int sell_cnt;
   private int sell_price;
   private int sell_total;
   private Timestamp sell_date;
   private String sort;
   private int sell_completed;
   private String stockname;
   
   public Stock_sellVO() {}
   
   public String getStockname() {
      return stockname;
   }

   public void setStockname(String stockname) {
      this.stockname = stockname;
   }

   public String getSell_num() {
      return sell_num;
   }

   public void setSell_num(String sell_num) {
      this.sell_num = sell_num;
   }

   public String getUsername() {
      return username;
   }

   public void setUsername(String username) {
      this.username = username;
   }

   public String getStockcode() {
      return stockcode;
   }

   public void setStockcode(String stockcode) {
      this.stockcode = stockcode;
   }

   public int getSell_cnt() {
      return sell_cnt;
   }

   public void setSell_cnt(int sell_cnt) {
      this.sell_cnt = sell_cnt;
   }

   public int getSell_price() {
      return sell_price;
   }

   public void setSell_price(int sell_price) {
      this.sell_price = sell_price;
   }

   public int getSell_total() {
      return sell_total;
   }

   public void setSell_total(int sell_total) {
      this.sell_total = sell_total;
   }

   public Timestamp getSell_date() {
      return sell_date;
   }

   public void setSell_date(Timestamp sell_date) {
      this.sell_date = sell_date;
   }

   public String getSort() {
      return sort;
   }

   public void setSort(String sort) {
      this.sort = sort;
   }

   public int getSell_completed() {
      return sell_completed;
   }

   public void setSell_completed(int sell_completed) {
      this.sell_completed = sell_completed;
   }
   
   
}