<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>      
<html>
<body>
<div class="box-header with-border">
<h4 class="box-title">${vo.stockName}</h4>
</div>

	<div class="box-body no-padding">
	<div class="table-responsive">
	<table class="table table-hover">
	  <tbody>
		<tr>
		  <th scope="row">현재가</th>
		  <th>
		  	<ul style="list-style-type : none">
				<li><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.stockCurrent}"/>원</li>
				<li>전일 대비 
					<c:if test="${vo.t_step <0}"><span class="label label-danger">▼</span></c:if>
					<c:if test="${vo.t_step >0}"><span class="label label-info">▲</span></c:if>
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.t_step}" />원
				</li>
				<li>등락률 ${vo.gap}%</li>
			</ul>
		  </th>
		</tr>
		<tr>
		  <th scope="row">금일상한</th>
		  <th><fmt:formatNumber type="number" pattern="#,###" maxFractionDigits="3" value="${vo.stockOpen+(vo.stockOpen*0.3)}" />원</th>
		</tr>
		<tr>
		  <th scope="row">금일하한</th>
		  <th><fmt:formatNumber type="number" pattern="#,###" maxFractionDigits="3" value="${vo.stockOpen-(vo.stockOpen*0.3)}" />원</th>
		</tr>
		<tr>
		  <th scope="row">시가</th>
		  <th><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.stockOpen}" />원</th>
		</tr>
		<tr>
		  <th scope="row">고가</th>
		  <th><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.stockHigh}" />원</th>
		</tr>
		<tr>
		  <th scope="row">저가</th>
		  <th><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.stockLow}" />원</th>
		</tr>
		<tr>
		  <th scope="row">예약상한</th>
		  <th><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.stockOpen+(vo.stockOpen*0.15)}" />원</th>
		</tr>
		<tr>
		  <th scope="row">예약하한</th>
		  <th><fmt:formatNumber type="number"  maxFractionDigits="3" value="${vo.stockOpen-(vo.stockOpen*0.15)}" />원</th>
		</tr>
	  </tbody>
	</table>
	</div>
	</div>	
</body>
</html>