package com.spring.stock.vo;

import java.sql.Timestamp;

public class Stock_buyVO {

   private String buy_num;
   private String username;
   private String stockcode;
   private int buy_cnt;
   private int buy_price;
   private int buy_total;
   private Timestamp buy_date;
   private String sort;
   private int buy_completed;
   private String stockname;
   
   public String getStockname() {
      return stockname;
   }

   public void setStockname(String stockname) {
      this.stockname = stockname;
   }

   public Stock_buyVO() {}

   public String getBuy_num() {
      return buy_num;
   }

   public void setBuy_num(String buy_num) {
      this.buy_num = buy_num;
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

   public int getBuy_cnt() {
      return buy_cnt;
   }

   public void setBuy_cnt(int buy_cnt) {
      this.buy_cnt = buy_cnt;
   }

   public int getBuy_price() {
      return buy_price;
   }

   public void setBuy_price(int buy_price) {
      this.buy_price = buy_price;
   }

   public int getBuy_total() {
      return buy_total;
   }

   public void setBuy_total(int buy_total) {
      this.buy_total = buy_total;
   }

   public Timestamp getBuy_date() {
      return buy_date;
   }

   public void setBuy_date(Timestamp buy_date) {
      this.buy_date = buy_date;
   }

   public String getSort() {
      return sort;
   }

   public void setSort(String sort) {
      this.sort = sort;
   }

   public int getBuy_completed() {
      return buy_completed;
   }

   public void setBuy_completed(int buy_completed) {
      this.buy_completed = buy_completed;
   }
   
   
}