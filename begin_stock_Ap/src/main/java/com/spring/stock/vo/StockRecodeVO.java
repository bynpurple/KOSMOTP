package com.spring.stock.vo;

import java.sql.Timestamp;

public class StockRecodeVO {
	private String stockCode;	// 회사 코드
	private Timestamp r_date;	// 거래 날짜
	private int r_open;			// 거래 시작 가
	private int r_high;			// 당일 최고가
	private int r_low;			// 당일 최저가
	private int r_close;		// 당일 종가
	private int r_adj_close;	// 수정 종가(미래와 현재 비교를 위한 가격?이라고함)
	private int r_volume;		// 당일 거래량
	private int r_empty;		// 전일 종가
	
	public int getR_empty() {
		return r_empty;
	}
	public void setR_empty(int r_empty) {
		this.r_empty = r_empty;
	}
	public String getStockCode() {
		return stockCode;
	}
	public void setStockCode(String stockCode) {
		this.stockCode = stockCode;
	}
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
	public int getR_high() {
		return r_high;
	}
	public void setR_high(int r_high) {
		this.r_high = r_high;
	}
	public int getR_low() {
		return r_low;
	}
	public void setR_low(int r_low) {
		this.r_low = r_low;
	}
	public int getR_close() {
		return r_close;
	}
	public void setR_close(int r_close) {
		this.r_close = r_close;
	}
	public int getR_adj_close() {
		return r_adj_close;
	}
	public void setR_adj_close(int r_adj_close) {
		this.r_adj_close = r_adj_close;
	}
	public int getR_volume() {
		return r_volume;
	}
	public void setR_volume(int r_volume) {
		this.r_volume = r_volume;
	}
	
}
