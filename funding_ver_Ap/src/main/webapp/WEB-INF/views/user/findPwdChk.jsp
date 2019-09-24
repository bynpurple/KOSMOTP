<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>계정 및 패스워드 찾기</title>
</head>
<body>
	<form method="post" name="findPwdChkForm" action="modifyPwd">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="hidden" name="hp" value="${hp}">
		<table align="center" style="margin-top : 15%;">
			<tr>
				<td>변경할 비밀번호를 입력해주세요!</td>
			</tr>
			<tr>
				<td>　</td>
				<td>　</td>
			</tr>
			<tr>
				<td>
					<input type="password" class="form-control" placeholder="변경할 비밀번호를 입력해주세요" name="password">
	        	</td>
			</tr>
			<tr>
				<td>　</td>
				<td>　</td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<input type="submit" class="btn" value="확인">
					&nbsp;&nbsp;&nbsp;
					<input type="reset" class="btn" value="재입력">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>