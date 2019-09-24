package com.spring.funding.vo;

public class ContractVO {
	private String fund_id;
	private String fund_contract_address;
	private int fund_contract_totalindex;
	
	public String getFund_id() {
		return fund_id;
	}
	public void setFund_id(String fund_id) {
		this.fund_id = fund_id;
	}
	public String getFund_contract_address() {
		return fund_contract_address;
	}
	public void setFund_contract_address(String fund_contract_address) {
		this.fund_contract_address = fund_contract_address;
	}
	public int getFund_contract_totalindex() {
		return fund_contract_totalindex;
	}
	public void setFund_contract_totalindex(int fund_contract_totalindex) {
		this.fund_contract_totalindex = fund_contract_totalindex;
	}
	
	
}
