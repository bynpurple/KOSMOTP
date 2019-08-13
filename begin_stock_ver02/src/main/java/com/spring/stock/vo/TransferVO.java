package com.spring.stock.vo;

import java.sql.Timestamp;

public class TransferVO {
	private String account;
	private String deposit;
	private int pay_price;
	private Timestamp pay_date;
	private String withdrawmessage;
	private String transfermessage;
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
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
	public Timestamp getpay_date() {
		return pay_date;
	}
	public void setpay_date(Timestamp pay_date) {
		this.pay_date = pay_date;
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
