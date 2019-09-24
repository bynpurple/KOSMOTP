package com.spring.stock.vo;

import java.sql.Timestamp;

public class Stock_transferVO {
	
	private String account;
	private int money;
	private String deposit;
	private int pay_price;
	private Timestamp pay_date;
	private String username;
	private String name;
	private String withdrawmessage;
	private String transfermessage;
	private String you;
	
	public String getYou() {
		return you;
	}

	public void setYou(String you) {
		this.you = you;
	}

	public Stock_transferVO() {}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public String getDeposit() {
		return deposit;
	}

	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}

	public int getPay_price() {
		return pay_price;
	}

	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}

	public Timestamp getPay_date() {
		return pay_date;
	}

	public void setPay_date(Timestamp pay_date) {
		this.pay_date = pay_date;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getWithdrawmessage() {
		return withdrawmessage;
	}

	public void setWithdrawmessage(String withdrawmessage) {
		this.withdrawmessage = withdrawmessage;
	}

	public String getTransfermessage() {
		return transfermessage;
	}

	public void setTransfermessage(String transfermessage) {
		this.transfermessage = transfermessage;
	}

}