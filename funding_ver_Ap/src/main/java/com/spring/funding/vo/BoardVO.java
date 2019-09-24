package com.spring.funding.vo;

public class BoardVO {
	private String username;
	private String name;
	private int board_cnt;
	private int board_rp_cnt;
	
	public BoardVO() {}

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

	public int getBoard_cnt() {
		return board_cnt;
	}

	public void setBoard_cnt(int board_cnt) {
		this.board_cnt = board_cnt;
	}

	public int getBoard_rp_cnt() {
		return board_rp_cnt;
	}

	public void setBoard_rp_cnt(int board_rp_cnt) {
		this.board_rp_cnt = board_rp_cnt;
	}
	
	
}
