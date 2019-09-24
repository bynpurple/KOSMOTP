package com.spring.stock.vo;

public class StockThemeVO {
	private String stockTheme;
	private float avg_gap;
	private int total_gap_count;
	private int upper_gap_count;
	private int lower_gap_count;
	
	public String getStockTheme() {
		return stockTheme;
	}
	public void setStockTheme(String stockTheme) {
		this.stockTheme = stockTheme;
	}
	public float getAvg_gap() {
		return avg_gap;
	}
	public void setAvg_gap(float avg_gap) {
		this.avg_gap = avg_gap;
	}
	public int getTotal_gap_count() {
		return total_gap_count;
	}
	public void setTotal_gap_count(int total_gap_count) {
		this.total_gap_count = total_gap_count;
	}
	public int getUpper_gap_count() {
		return upper_gap_count;
	}
	public void setUpper_gap_count(int upper_gap_count) {
		this.upper_gap_count = upper_gap_count;
	}
	public int getLower_gap_count() {
		return lower_gap_count;
	}
	public void setLower_gap_count(int lower_gap_count) {
		this.lower_gap_count = lower_gap_count;
	}
}