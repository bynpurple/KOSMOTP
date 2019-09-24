package com.spring.stock.vo;

import java.sql.Timestamp;

public class Stock_StockVO {
	private String stockCode;	//(종목) 코드
	private String stockTheme;	//구분 (업종, 테마)
	private String stockName;	//회사 명
	private int	stockCurrent;	//현재 주가
	private int stockOpen;		//장 시작가
	private int stockHigh;		//당일 최대가
	private int stockLow;		//당일 최저가
	private int p_step;			//전날 대비증가율
	private int t_step;			//금일 증가율
	private float gap;			//등락율
	private int stockVolume;	//당일 거래량
	private int orderable;		//주문가능여부
	private float ratio;		//상한선 
	private int totalStock;		//총 주식량
	private int mkt_cap;		//시가 총액
	private Timestamp stockDate;//상장 날짜
	
	public String getStockCode() {
		return stockCode;
	}
	public void setStockCode(String stockCode) {
		this.stockCode = stockCode;
	}
	public String getStockTheme() {
		return stockTheme;
	}
	public void setStockTheme(String stockTheme) {
		this.stockTheme = stockTheme;
	}
	public String getStockName() {
		return stockName;
	}
	public void setStockName(String stockName) {
		this.stockName = stockName;
	}
	public int getStockCurrent() {
		return stockCurrent;
	}
	public void setStockCurrent(int stockCurrent) {
		this.stockCurrent = stockCurrent;
	}
	public int getStockOpen() {
		return stockOpen;
	}
	public void setStockOpen(int stockOpen) {
		this.stockOpen = stockOpen;
	}
	public int getStockHigh() {
		return stockHigh;
	}
	public void setStockHigh(int stockHigh) {
		this.stockHigh = stockHigh;
	}
	public int getStockLow() {
		return stockLow;
	}
	public void setStockLow(int stockLow) {
		this.stockLow = stockLow;
	}
	public int getP_step() {
		return p_step;
	}
	public void setP_step(int p_step) {
		this.p_step = p_step;
	}
	public int getT_step() {
		return t_step;
	}
	public void setT_step(int t_step) {
		this.t_step = t_step;
	}
	public float getGap() {
		return gap;
	}
	public void setGap(float gap) {
		this.gap = gap;
	}
	public int getStockVolume() {
		return stockVolume;
	}
	public void setStockVolume(int stockVolume) {
		this.stockVolume = stockVolume;
	}
	public int getOrderable() {
		return orderable;
	}
	public void setOrderable(int orderable) {
		this.orderable = orderable;
	}
	public float getRatio() {
		return ratio;
	}
	public void setRatio(float ratio) {
		this.ratio = ratio;
	}
	public int getTotalStock() {
		return totalStock;
	}
	public void setTotalStock(int totalStock) {
		this.totalStock = totalStock;
	}
	public int getMkt_cap() {
		return mkt_cap;
	}
	public void setMkt_cap(int mkt_cap) {
		this.mkt_cap = mkt_cap;
	}
	public Timestamp getStockDate() {
		return stockDate;
	}
	public void setStockDate(Timestamp stockDate) {
		this.stockDate = stockDate;
	}
}
