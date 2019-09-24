<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/header.jsp"%>     
<html>
<body>
<form name="sell">
<div class="box-body no-padding" style="overflow : auto;">
   <div class="table-responsive">
      <table class="table table-hover">
        <thead>
         <tr>
           <th scope="col">주식코드</th>
           <th scope="col">테마</th>
           <th scope="col">주식명</th>
           <th scope="col">수량</th>
         </tr>
        </thead>
        <tbody>
        <c:forEach var = "list" items="${list}">
           <c:if test="${list.volume > 0}">
          <tr>
           <th scope="row">${list.stockcode}</th>
           <th>${list.stocktheme}</th>
           <th>${list.stockname}</th>
           <th id ="cnt">${list.volume}<input type="hidden" name="cnt" value="${list.volume}"></th>
         </tr>
         </c:if>
         <c:if test="${list.volume < 0}">
         <tr>
            <th>해당 주식의 거래 내역이 없습니다</th>
         </tr>
         </c:if>
        </c:forEach>
        </tbody>
      </table>
   </div>
</div>
</form>
</body>
</html>