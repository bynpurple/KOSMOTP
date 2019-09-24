package com.spring.stock.vo;

import java.sql.Timestamp;

public class Stock_allVO {
	
	// 매수 
	private String bs_num;
	private String username;
	private String stockcode;
	private String stockname;
	private int cnt;
	private int price;
	private int total;
	private Timestamp bs_date;
	private char bs_sort;
	public String getBs_num() {
		return bs_num;
	}
	public void setBs_num(String bs_num) {
		this.bs_num = bs_num;
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
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public Timestamp getBs_date() {
		return bs_date;
	}
	public void setBs_date(Timestamp bs_date) {
		this.bs_date = bs_date;
	}
	public char getBs_sort() {
		return bs_sort;
	}
	public void setBs_sort(char bs_sort) {
		this.bs_sort = bs_sort;
	}
	
	public String getStockname() {
		return stockname;
	}
	public void setStockname(String stockname) {
		this.stockname = stockname;
	}
	
	

}
