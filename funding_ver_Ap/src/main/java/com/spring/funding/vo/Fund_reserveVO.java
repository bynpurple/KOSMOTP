package com.spring.funding.vo;

public class Fund_reserveVO {
	private int reserve_id;				// 신청자 아이디
	private String company_name;	// 신청 회사명
	private String username;				// 신청자명
	private String client_email;			// 신청자 이메일
	private String client_ph;				// 신청자 연락처
	private String company_site;		// 신청 회사 사이트
	private int target_invest;				// 목표 투자액
	private int htk_number;				// 설문 응답 아이디
	private String htk_content;				// 성문 응답 기타 내용
	private String file_name;				// 사업제안서 파일
	private String client_message;		// 추가 메세지
	private String reserve_accepted;	// 수락 여부
	private String reserve_account;	// 담당자
	
	public Fund_reserveVO() {}

	public int getReserve_id() {
		return reserve_id;
	}

	public void setReserve_id(int reserve_id) {
		this.reserve_id = reserve_id;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getClient_email() {
		return client_email;
	}

	public void setClient_email(String client_email) {
		this.client_email = client_email;
	}


	public String getClient_ph() {
		return client_ph;
	}

	public void setClient_ph(String client_ph) {
		this.client_ph = client_ph;
	}

	public String getCompany_site() {
		return company_site;
	}

	public void setCompany_site(String company_site) {
		this.company_site = company_site;
	}

	public int getTarget_invest() {
		return target_invest;
	}

	public void setTarget_invest(int target_invest) {
		this.target_invest = target_invest;
	}

	public int getHtk_number() {
		return htk_number;
	}

	public void setHtk_number(int htk_number) {
		this.htk_number = htk_number;
	}

	public String getHtk_content() {
		return htk_content;
	}

	public void setHtk_content(String htk_content) {
		this.htk_content = htk_content;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getClient_message() {
		return client_message;
	}

	public void setClient_message(String client_message) {
		this.client_message = client_message;
	}

	public String getReserve_accepted() {
		return reserve_accepted;
	}

	public void setReserve_accepted(String reserve_accepted) {
		this.reserve_accepted = reserve_accepted;
	}

	public String getReserve_account() {
		return reserve_account;
	}

	public void setReserve_account(String reserve_account) {
		this.reserve_account = reserve_account;
	}
	
}
