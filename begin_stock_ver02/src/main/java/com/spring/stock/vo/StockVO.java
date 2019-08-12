package com.spring.stock.vo;

import java.sql.Timestamp;

public class StockVO {

	private String username;	// 아이디
	private String password;	// 비밀번호
	private String name;		// 이름
	private String hp;			// 전화번호
	private String hold;		// 회원가입 인증 여부
	private String enabled;		// 사용가능 여부
	private String authority;	// 일반 사용자(ROLE_USER), 관리자(ROLE_ADMIN)
	private Timestamp join_date;	// 사용자 회원가입일
	
	// 기본생성자
	public StockVO() {}
	
	// getter, setter
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getHold() {
		return hold;
	}

	public void setHold(String hold) {
		this.hold = hold;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public Timestamp getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Timestamp join_date) {
		this.join_date = join_date;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}
}