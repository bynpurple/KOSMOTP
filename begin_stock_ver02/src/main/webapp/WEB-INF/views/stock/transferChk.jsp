<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>        
<html>
<body style="background:#252525;">
<div class="box-body">
	<h1 class="text-center no-border font-weight-600 font-size-20">이체하려는 정보가 맞습니까?</h1>
	<div class="table-responsive">
		<table class="table table-striped">
			<tr class="bg-warning">
			  <th>입금 계좌</th>
			  <th>출금 계좌</th>
			  <th>금액</th>
			</tr>
			<tr>
			  <th scope="row">${withdrawMessage}</th>
			  <th>${transferMessage}</th>
			  <th rowspan="2"><fmt:formatNumber value="${transfer_price}" maxFractionDigits="3"></fmt:formatNumber>원</th>
			</tr>
			<tr>
			  <th scope="col">${withdraw}</th>
			  <th scope="col">${deposit_account}</th>
			</tr>
		</table>
		<table align="center">
		<tr>
			<th>
			<input type = "button" style="width:100px;" class="btn btn-block btn-success btn-lg" value = "이체 실행" onclick="window.location='transferMoney?transfer_price=${transfer_price}&deposit_account=${deposit_account}&withdraw=${withdraw}&transferMessage=${transferMessage}&withdrawMessage=${withdrawMessage}&sum=${sum}'">		
			</th>
			<th>
			<input type = "button" style="width:100px;" class="btn btn-block btn-success btn-lg" value = "취소" onclick="window.close();">			
			</th>
		</tr>
		</table>
	</div>
</div>

</body>
</html>