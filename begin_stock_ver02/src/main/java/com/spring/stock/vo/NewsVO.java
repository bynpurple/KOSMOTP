package com.spring.stock.vo;

public class NewsVO {

   private String title;      // 제목
   private String link;      // 링크
   private String photo;
   private String lede;      // 요약
   private String writer;      // 글쓴이
   private String date;      // 일자
   
   // 기본생성자
   public NewsVO() {}

   public String getTitle() {
      return title;
   }

   public void setTitle(String title) {
      this.title = title;
   }

   public String getLink() {
      return link;
   }

   public void setLink(String link) {
      this.link = link;
   }

   public String getLede() {
      return lede;
   }

   public void setLede(String lede) {
      this.lede = lede;
   }

   public String getWriter() {
      return writer;
   }

   public void setWriter(String writer) {
      this.writer = writer;
   }

   public String getDate() {
      return date;
   }

   public void setDate(String date) {
      this.date = date;
   }
   
   
   public String getPhoto() {
      return photo;
   }

   public void setPhoto(String photo) {
      this.photo = photo;
   }
}
