package com.spring.stock.vo;

import java.sql.Timestamp;

public class userInquiryVO {
	private int num;							// 1 대 1 문의 글번호
	private String writer;						// 1 대 1 문의 작성자(로그인 한 ID)
	private String subject;						// 1 대 1 문의 제목
	private String content;					// 1 대 1 문의 내용
	private int readCnt;						// 조회수
	private Timestamp reg_date;			// 1 대 1 문의 작성일
	private int co_num;						// 1 대 1 문의 답변댓글 번호
	private String comments;				// 1 대 1 문의 답글내용
	private Timestamp comment_date; 	// 1 대 1 문의 답글 작성일
	private String reply_cnt;			// 댓글갯수 	
	private String username;			// 고객 아이디 
	private String co_writer;
	private int board_rp_cnt;
	

	public userInquiryVO() {}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReadCnt() {
		return readCnt;
	}

	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

	public int getCo_num() {
		return co_num;
	}

	public void setCo_num(int co_num) {
		this.co_num = co_num;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Timestamp getComment_date() {
		return comment_date;
	}

	public void setComment_date(Timestamp comment_date) {
		this.comment_date = comment_date;
	}
	
	public String getReply_cnt() {
		return reply_cnt;
	}

	public void setReply_cnt(String reply_cnt) {
		this.reply_cnt = reply_cnt;
	}

	public String getCo_writer() {
		return co_writer;
	}

	public void setCo_writer(String co_writer) {
		this.co_writer = co_writer;
	}

	public int getBoard_rp_cnt() {
		return board_rp_cnt;
	}

	public void setBoard_rp_cnt(int board_rp_cnt) {
		this.board_rp_cnt = board_rp_cnt;
	}
	
	

	
}
