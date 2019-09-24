package com.spring.funding.vo;

import java.sql.Timestamp;

public class commentReplyVO {
	String qna_id;
	String qna_comment;
	String reple_id;
	String reple_pwd;
	String reple_comment;
	Timestamp reple_date;
	
	public String getQna_id() {
		return qna_id;
	}
	public void setQna_id(String qna_id) {
		this.qna_id = qna_id;
	}
	public String getQna_comment() {
		return qna_comment;
	}
	public void setQna_comment(String qna_comment) {
		this.qna_comment = qna_comment;
	}
	public String getReple_id() {
		return reple_id;
	}
	public void setReple_id(String reple_id) {
		this.reple_id = reple_id;
	}
	public String getReple_pwd() {
		return reple_pwd;
	}
	public void setReple_pwd(String reple_pwd) {
		this.reple_pwd = reple_pwd;
	}
	public String getReple_comment() {
		return reple_comment;
	}
	public void setReple_comment(String reple_comment) {
		this.reple_comment = reple_comment;
	}
	public Timestamp getReple_date() {
		return reple_date;
	}
	public void setReple_date(Timestamp reple_date) {
		this.reple_date = reple_date;
	}
}
