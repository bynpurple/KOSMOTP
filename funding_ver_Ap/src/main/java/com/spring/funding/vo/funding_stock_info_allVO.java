package com.spring.funding.vo;

import java.sql.Timestamp;

public class funding_stock_info_allVO {
   int fund_id;            //펀드아이디
   Timestamp fund_date;      //펀딩기간
   int fund_target_money;      //목표금액
   int fund_par_value;         //액면가액
   int fund_publish_value;      //발행가액
   int fund_min_invest;      //최소투자단위
   Timestamp fund_schedule_date;   //발행예정일
   Timestamp fund_delivery_date;   //교부예정일
   int fund_eval_value;      //기업가치평가
   String fund_company;      //기업 소개
   String fund_point;         //핵심 포인트
   String fund_str_business;   //사업 전략
   String fund_detail_content;   //상세 내용
   String fund_invest_point;   //투자 포인트
   String fund_subject;       //제목
   String fund_thumbnail;       //썸네일 이미지
   String fund_img_and_video;    //상세 페이지 이미지
   String fund_content_div;   // 펀드 컨텐츠 정보 
   
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
   public String getFund_content_div() {
      return fund_content_div;
   }
   public void setFund_content_div(String fund_content_div) {
      this.fund_content_div = fund_content_div;
   }

}