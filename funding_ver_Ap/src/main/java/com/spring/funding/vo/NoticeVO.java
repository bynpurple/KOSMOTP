package com.spring.funding.vo;

import java.sql.Timestamp;

public class NoticeVO {

	public int notice_id;					// 공지사항 번호
	public String notice_subject;		// 공지사항 제목
	public String notice_kind;			// 공지사항 종류
	public Timestamp notice_date;		// 공지사항 등록일(default : sysdate)
	public String notice_content;		// 공지사항 내용
	
	public NoticeVO() {}

	public int getNotice_id() {
		return notice_id;
	}

	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}

	public String getNotice_subject() {
		return notice_subject;
	}

	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}

	public String getNotice_kind() {
		return notice_kind;
	}

	public void setNotice_kind(String notice_kind) {
		this.notice_kind = notice_kind;
	}

	public Timestamp getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(Timestamp notice_date) {
		this.notice_date = notice_date;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
}
