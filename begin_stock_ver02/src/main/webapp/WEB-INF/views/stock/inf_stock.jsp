<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>      
<html>
<body>
<div class="box-header with-border">
<h4 class="box-title">${vo.stockName}</h4>
</div>
	<div class ="box-body">
	<div class="table-responsive">
	<table class="table table-bordered">
	  <tbody>
		<tr>
		  <th scope="row">현재가</th>
		  <td>
		  	<ul>
				<li><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.stockCurrent}" /></li>
				<li>전일 대비 <c:if test="${vo.t_step <0}">▼</c:if>
					<c:if test="${vo.t_step >0}">▲</c:if>
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.t_step}" />
				</li>
				<li>등락률 ${vo.gap}</li>
			</ul>
		  </td>
		</tr>
		<tr>
		  <th scope="row">금일상한</th>
		  <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.stockOpen+(vo.stockOpen*0.3)}" /></td>
		</tr>
		<tr>
		  <th scope="row">금일하한</th>
		  <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.stockOpen-(vo.stockOpen*0.3)}" /></td>
		</tr>
		<tr>
		  <th scope="row">시가</th>
		  <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.stockOpen}" /></td>
		</tr>
		<tr>
		  <th scope="row">고가</th>
		  <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.stockHigh}" /></td>
		</tr>
		<tr>
		  <th scope="row">저가</th>
		  <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.stockLow}" /></td>
		</tr>
		<tr>
		  <th scope="row">예약상한</th>
		  <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.stockOpen+(vo.stockOpen*0.15)}" /></td>
		</tr>
		<tr>
		  <th scope="row">예약하한</th>
		  <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.stockOpen-(vo.stockOpen*0.15)}" /></td>
		</tr>
	  </tbody>
	</table>
	</div>
	</div>	
</body>
</html>