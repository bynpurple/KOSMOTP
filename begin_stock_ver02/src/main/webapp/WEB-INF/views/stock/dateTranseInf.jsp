<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "../include/header.jsp" %>    
<!DOCTYPE html>
<html>
<body>
<table class="table table-hover">
	<tr class="font-size-18">
	  <td align="center">일시</td>
	  <th>입금 계좌</th>
	  <th>이체 금액</th>
	</tr>
	<c:forEach var = "list" items="${list}">
		<tr class="font-size-18">
		  <td align="center"><fmt:formatDate value="${list.pay_date}" pattern="yy/mm/dd"/>
		  </td>
		  <td><span class="label label-info">${list.withdrawmessage}</span>&nbsp;&nbsp; ${list.deposit}</td>
		  <td><span class="label label-danger">${list.transfermessage}</span>&nbsp;&nbsp; ${list.pay_price}원</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>