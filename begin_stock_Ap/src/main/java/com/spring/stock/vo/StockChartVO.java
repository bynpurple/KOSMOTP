package com.spring.stock.vo;

import java.sql.Timestamp;

public class StockChartVO {
	private Timestamp r_date;	// 거래 날짜
	private int r_open;			// 거래 시작 가
	private int r_volume;		// 당일 거래량
	
	public Timestamp getR_date() {
		return r_date;
	}
	public void setR_date(Timestamp r_date) {
		this.r_date = r_date;
	}
	public int getR_open() {
		return r_open;
	}
	public void setR_open(int r_open) {
		this.r_open = r_open;
	}
	public int getR_volume() {
		return r_volume;
	}
	public void setR_volume(int r_volume) {
		this.r_volume = r_volume;
	}
}
