<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/header.jsp"%>     
<html>
<body>
<div class="box-body no-padding" style="overflow : auto;">
	<div class="table-responsive">
		<table class="table table-hover">
		  <thead>
			<tr>
			  <th scope="col">거래 날짜</th>
			  <th scope="col">구분</th>
			  <th scope="col">거래수량</th>
			  <th scope="col">가격</th>
			  <th scope="col">총액</th>
			</tr>
		  </thead>
		  <tbody>
		  <c:forEach var = "list" items="${list}">
		  	<c:if test="${list.c_cnt > 0}">
		    <tr>
			  <th scope="row"><fmt:formatDate value="${list.c_date}" pattern="yy/MM/dd/HH:mm"/></th>
			  <th>
			  	<c:if test="${list.c_category == 0}"><span class="label label-danger">매도</span></c:if>
				<c:if test="${list.c_category != 0}"><span class="label label-info">매수</span></c:if>				  
			  </th>
			  <th>
			  <fmt:formatNumber type="number" maxFractionDigits="3" value="${list.c_cnt}"></fmt:formatNumber></th>
			  <th><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.c_price}"></fmt:formatNumber></th>
			  <th><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.c_total}"></fmt:formatNumber></th>
			</tr>
			</c:if>
			<c:if test="${list.c_cnt < 0}">
			<tr>
				<th>해당 주식의 거래 내역이 없습니다</th>
			</tr>
			</c:if>
		  </c:forEach>
		  </tbody>
		</table>
	</div>
</div>
</body>
</html>