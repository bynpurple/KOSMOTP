package com.spring.funding.vo;

import java.sql.Timestamp;

public class FundInquiryVO {
   private int num;                     // 1 대 1 문의 글번호
   private String writer;                  // 1 대 1 문의 작성자(로그인 한 ID)
   private String subject;                  // 1 대 1 문의 제목
   private String content;               // 1 대 1 문의 내용
   private int readCnt;                  // 조회수
   private Timestamp reg_date;         // 1 대 1 문의 작성일
   private Timestamp co_reg_date;    // 1 대 1 문의 답글 작성일
   private String reply_cnt;         // 댓글갯수
   private String name;			// 이름
   private String username;		// 아이디
   

   public FundInquiryVO() {}

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

   
   public String getReply_cnt() {
      return reply_cnt;
   }

   public void setReply_cnt(String reply_cnt) {
      this.reply_cnt = reply_cnt;
   }

	public Timestamp getCo_reg_date() {
		return co_reg_date;
	}
	
	public void setCo_reg_date(Timestamp co_reg_date) {
		this.co_reg_date = co_reg_date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	

}