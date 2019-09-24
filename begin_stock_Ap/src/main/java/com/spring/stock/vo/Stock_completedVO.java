package com.spring.stock.vo;

import java.sql.Timestamp;

public class Stock_completedVO {

   private String username;
   private String c_num;
   private char c_category;
   private double c_cnt;
   private String stockcode;
   private double c_price;
   private double c_total;
   private Timestamp c_date;
   private String stockname;
   
   public Stock_completedVO() {}

   // ============== 아진 추가 2019.09.11 ================
   private String account;
   private double stockcurrent;
   private double volume;
   
   public String getAccount() {
      return account;
   }

   public void setAccount(String account) {
      this.account = account;
   }

   public double getStockcurrent() {
      return stockcurrent;
   }

   public void setStockcurrent(double stockcurrent) {
      this.stockcurrent = stockcurrent;
   }

   public double getVolume() {
      return volume;
   }

   public void setVolume(double volume) {
      this.volume = volume;
   }
   
   // ============== 끝  ===============

   public String getUsername() {
      return username;
   }

   public void setUsername(String username) {
      this.username = username;
   }

   public String getC_num() {
      return c_num;
   }

   public void setC_num(String c_num) {
      this.c_num = c_num;
   }

   public char getC_category() {
      return c_category;
   }

   public void setC_category(char c_category) {
      this.c_category = c_category;
   }

   public double getC_cnt() {
      return c_cnt;
   }

   public void setC_cnt(double c_cnt) {
      this.c_cnt = c_cnt;
   }

   public String getStockcode() {
      return stockcode;
   }

   public void setStockcode(String stockcode) {
      this.stockcode = stockcode;
   }

   public double getC_price() {
      return c_price;
   }

   public void setC_price(double c_price) {
      this.c_price = c_price;
   }

   public double getC_total() {
      return c_total;
   }

   public void setC_total(double c_total) {
      this.c_total = c_total;
   }

   public Timestamp getC_date() {
      return c_date;
   }

   public void setC_date(Timestamp c_date) {
      this.c_date = c_date;
   }

   public String getStockname() {
      return stockname;
   }

   public void setStockname(String stockname) {
      this.stockname = stockname;
   }
}