package com.spring.funding.vo;

public class FundInfVO {
	int fund_id;				//펀드아이디
	String fund_company;		//기업 소개
	String fund_point;			//핵심 포인트
	String fund_str_business;	//사업 전략
	String fund_detail_content;	//상세 내용
	String fund_invest_point;	//투자 포인트
	String fund_subject; 		//제목
	String fund_thumbnail; 		//썸네일 이미지
	String fund_img_and_video; 	//상세 페이지 이미지
	
	public String getFund_subject() {
		return fund_subject;
	}
	public void setFund_subject(String fund_subject) {
		this.fund_subject = fund_subject;
	}
	public String getFund_thumbnail() {
		return fund_thumbnail;
	}
	public void setFund_thumbnail(String fund_thumbnail) {
		this.fund_thumbnail = fund_thumbnail;
	}
	public String getFund_img_and_video() {
		return fund_img_and_video;
	}
	public void setFund_img_and_video(String fund_img_and_video) {
		this.fund_img_and_video = fund_img_and_video;
	}
	public int getFund_id() {
		return fund_id;
	}
	public void setFund_id(int fund_id) {
		this.fund_id = fund_id;
	}
	public String getfund_company() {
		return fund_company;
	}
	public void setfund_company(String fund_company) {
		this.fund_company = fund_company;
	}
	public String getfund_point() {
		return fund_point;
	}
	public void setfund_point(String fund_point) {
		this.fund_point = fund_point;
	}
	public String getfund_str_business() {
		return fund_str_business;
	}
	public void setfund_str_business(String fund_str_business) {
		this.fund_str_business = fund_str_business;
	}
	public String getfund_detail_content() {
		return fund_detail_content;
	}
	public void setfund_detail_content(String fund_detail_content) {
		this.fund_detail_content = fund_detail_content;
	}
	public String getfund_invest_point() {
		return fund_invest_point;
	}
	public void setfund_invest_point(String fund_invest_point) {
		this.fund_invest_point = fund_invest_point;
	}
	
}
