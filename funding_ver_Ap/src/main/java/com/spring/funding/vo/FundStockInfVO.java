package com.spring.funding.vo;

import java.sql.Timestamp;

public class FundStockInfVO {
	int fund_id;				//펀드아이디
	Timestamp fund_date;			//펀딩기간
	int fund_target_money;		//목표금액
	int fund_par_value;			//액면가액
	int fund_publish_value;		//발행가액
	int fund_min_invest;		//최소투자단위
	Timestamp fund_schedule_date;	//발행예정일
	Timestamp fund_delivery_date;	//교부예정일
	int fund_eval_value;		//기업가치평가
	
	public int getFund_id() {
		return fund_id;
	}
	public void setFund_id(int fund_id) {
		this.fund_id = fund_id;
	}
	public Timestamp getfund_date() {
		return fund_date;
	}
	public void setfund_date(Timestamp fund_date) {
		this.fund_date = fund_date;
	}
	public int getfund_target_money() {
		return fund_target_money;
	}
	public void setfund_target_money(int fund_target_money) {
		this.fund_target_money = fund_target_money;
	}
	public int getfund_par_value() {
		return fund_par_value;
	}
	public void setfund_par_value(int fund_par_value) {
		this.fund_par_value = fund_par_value;
	}
	public int getfund_publish_value() {
		return fund_publish_value;
	}
	public void setfund_publish_value(int fund_publish_value) {
		this.fund_publish_value = fund_publish_value;
	}
	public int getfund_min_invest() {
		return fund_min_invest;
	}
	public void setfund_min_invest(int fund_min_invest) {
		this.fund_min_invest = fund_min_invest;
	}
	public Timestamp getfund_schedule_date() {
		return fund_schedule_date;
	}
	public void setfund_schedule_date(Timestamp fund_schedule_date) {
		this.fund_schedule_date = fund_schedule_date;
	}
	public Timestamp getfund_delivery_date() {
		return fund_delivery_date;
	}
	public void setfund_delivery_date(Timestamp fund_delivery_date) {
		this.fund_delivery_date = fund_delivery_date;
	}
	public int getfund_eval_value() {
		return fund_eval_value;
	}
	public void setfund_eval_value(int fund_eval_value) {
		this.fund_eval_value = fund_eval_value;
	}
}
