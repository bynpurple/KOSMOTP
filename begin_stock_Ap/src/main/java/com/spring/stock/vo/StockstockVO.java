package com.spring.stock.vo;

import java.sql.Timestamp;

public class StockstockVO {
   private String stockcode;
   private String stocktheme;
   private String stockname;
   private int stockcurrent;
   private int stockopen;
   private int stockhigh;
   private int stocklow;
   private double p_step;
   private double t_step;
   private float gap;
   private int stockvolume;
   private char orderable;
   private double ratio;
   private double totalstock;
   private long mkt_cap;
   private Timestamp stockdate;
   
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
   public int getStockcurrent() {
      return stockcurrent;
   }
   public void setStockcurrent(int stockcurrent) {
      this.stockcurrent = stockcurrent;
   }
   public int getStockopen() {
      return stockopen;
   }
   public void setStockopen(int stockopen) {
      this.stockopen = stockopen;
   }
   public int getStockhigh() {
      return stockhigh;
   }
   public void setStockhigh(int stockhigh) {
      this.stockhigh = stockhigh;
   }
   public int getStocklow() {
      return stocklow;
   }
   public void setStocklow(int stocklow) {
      this.stocklow = stocklow;
   }
   public double getP_step() {
      return p_step;
   }
   public void setP_step(double p_step) {
      this.p_step = p_step;
   }
   public double getT_step() {
      return t_step;
   }
   public void setT_step(double t_step) {
      this.t_step = t_step;
   }
   public float getGap() {
      return gap;
   }
   public void setGap(float gap) {
      this.gap = gap;
   }
   public int getStockvolume() {
      return stockvolume;
   }
   public void setStockvolume(int stockvolume) {
      this.stockvolume = stockvolume;
   }
   public char getOrderable() {
      return orderable;
   }
   public void setOrderable(char orderable) {
      this.orderable = orderable;
   }
   public double getRatio() {
      return ratio;
   }
   public void setRatio(double ratio) {
      this.ratio = ratio;
   }
   public double getTotalstock() {
      return totalstock;
   }
   public void setTotalstock(double totalstock) {
      this.totalstock = totalstock;
   }
   public long getMkt_cap() {
      return mkt_cap;
   }
   public void setMkt_cap(long mkt_cap) {
      this.mkt_cap = mkt_cap;
   }
   public Timestamp getStockdate() {
      return stockdate;
   }
   public void setStockdate(Timestamp stockdate) {
      this.stockdate = stockdate;
   }
}