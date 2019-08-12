<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정 / 패스워드 찾기</title>
</head>
<body style="background:#252525;">
	<form action="findPwdChk" method="post" name = "findPwd">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<table align="center">
			<tr>
				<td>　</td>
			</tr>
			<tr align="right">
				<td style="color:#BDBDBD;">가입시 입력한 아이디, 이름, 핸드폰번호를 입력하세요</td>
			</tr>
			
			<tr>
				<td>
				<input type="text" class="form-control" placeholder="ID" name="username" required>
	        	<span class="ion ion-email form-control-feedback"></span>
	        	</td>
			</tr>
			<tr>
				<td>
				<input type="text" class="form-control" placeholder="name" name="name" required>
	        	<span class="ion ion-email form-control-feedback"></span>
	        	</td>
			</tr>
			<tr>
				<td>
				<input type="text" class="form-control" placeholder="H.P" name="hp" required>
	        	<span class="ion ion-email form-control-feedback"></span>
	        	</td>
			</tr>
			<tr>
				<td>　</td>
			</tr>
			<tr align="center">
				<td>
					<input type="submit" class = "btn btn-danger" value="확인">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" class="btn btn-danger" value="이전" onclick="hisBack();">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>