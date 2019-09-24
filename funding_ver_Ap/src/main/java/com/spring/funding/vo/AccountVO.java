package com.spring.funding.vo;

import java.sql.Timestamp;

public class AccountVO {
	private String account;
	private String username;
	private String money;
	private String available;
	private Timestamp reg_date;
	private int password;
	private int stock_limit;
	private int transfer_limit; 
	
	public int getStock_limit() {
		return stock_limit;
	}
	public void setStock_limit(int stock_limit) {
		this.stock_limit = stock_limit;
	}
	public int getTransfer_limit() {
		return transfer_limit;
	}
	public void setTransfer_limit(int transfer_limit) {
		this.transfer_limit = transfer_limit;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getAvailable() {
		return available;
	}
	public void setAvailable(String available) {
		this.available = available;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getPassword() {
		return password;
	}
	public void setPassword(int password) {
		this.password = password;
	}
}
