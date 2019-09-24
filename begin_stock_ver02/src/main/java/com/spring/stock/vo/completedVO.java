package com.spring.stock.vo;

import java.sql.Timestamp;

public class completedVO {
	private String stocktheme;
	private String stockname;
	private String c_num;
	private int c_category;
	private int c_cnt;
	private String stockcode;
	private int c_price;
	private int c_total;
	private Timestamp c_date;
	
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
	public String getC_num() {
		return c_num;
	}
	public void setC_num(String c_num) {
		this.c_num = c_num;
	}
	public int getC_category() {
		return c_category;
	}
	public void setC_category(int c_category) {
		this.c_category = c_category;
	}
	public int getC_cnt() {
		return c_cnt;
	}
	public void setC_cnt(int c_cnt) {
		this.c_cnt = c_cnt;
	}
	public String getStockcode() {
		return stockcode;
	}
	public void setStockcode(String stockcode) {
		this.stockcode = stockcode;
	}
	public int getC_price() {
		return c_price;
	}
	public void setC_price(int c_price) {
		this.c_price = c_price;
	}
	public int getC_total() {
		return c_total;
	}
	public void setC_total(int c_total) {
		this.c_total = c_total;
	}
	public Timestamp getC_date() {
		return c_date;
	}
	public void setC_date(Timestamp c_date) {
		this.c_date = c_date;
	}
}
