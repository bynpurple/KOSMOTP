package com.spring.funding.vo;

public class FundingTransactionVO {
	private String fund_id;
	private String username;
	private int fund_contract_index;
	private String fund_contract_address;
	private String fund_subject;
	private int fund_min_invest;
	private int investvolume;
	public String getFund_id() {
		return fund_id;
	}
	public void setFund_id(String fund_id) {
		this.fund_id = fund_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getFund_contract_index() {
		return fund_contract_index;
	}
	public void setFund_contract_index(int fund_contract_index) {
		this.fund_contract_index = fund_contract_index;
	}
	public String getFund_contract_address() {
		return fund_contract_address;
	}
	public void setFund_contract_address(String fund_contract_address) {
		this.fund_contract_address = fund_contract_address;
	}
	public String getFund_subject() {
		return fund_subject;
	}
	public void setFund_subject(String fund_subject) {
		this.fund_subject = fund_subject;
	}
	public int getFund_min_invest() {
		return fund_min_invest;
	}
	public void setFund_min_invest(int fund_min_invest) {
		this.fund_min_invest = fund_min_invest;
	}
	public int getInvestvolume() {
		return investvolume;
	}
	public void setInvestvolume(int investvolume) {
		this.investvolume = investvolume;
	}
}
