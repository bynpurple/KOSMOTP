package com.spring.stock.vo;

public class ChartVO {
	
	private String stockname;
	private String stockcode;
	
	private int mon_r_open;
	private int tue_r_open;
	private int wed_r_open;
	private int thu_r_open;
	private int fri_r_open;
	private int average;
	
	private String year;
	private int volume;
	
	
	public String getStockname() {
		return stockname;
	}
	public void setStockname(String stockname) {
		this.stockname = stockname;
	}
	public String getStockcode() {
		return stockcode;
	}
	public void setStockcode(String stockcode) {
		this.stockcode = stockcode;
	}
	public int getMon_r_open() {
		return mon_r_open;
	}
	public void setMon_r_open(int mon_r_open) {
		this.mon_r_open = mon_r_open;
	}
	public int getTue_r_open() {
		return tue_r_open;
	}
	public void setTue_r_open(int tue_r_open) {
		this.tue_r_open = tue_r_open;
	}
	public int getWed_r_open() {
		return wed_r_open;
	}
	public void setWed_r_open(int wed_r_open) {
		this.wed_r_open = wed_r_open;
	}
	public int getThu_r_open() {
		return thu_r_open;
	}
	public void setThu_r_open(int thu_r_open) {
		this.thu_r_open = thu_r_open;
	}
	public int getFri_r_open() {
		return fri_r_open;
	}
	public void setFri_r_open(int fri_r_open) {
		this.fri_r_open = fri_r_open;
	}
	public int getAverage() {
		return average;
	}
	public void setAverage(int average) {
		this.average = average;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public int getVolume() {
		return volume;
	}
	public void setVolume(int volume) {
		this.volume = volume;
	}
	

}
