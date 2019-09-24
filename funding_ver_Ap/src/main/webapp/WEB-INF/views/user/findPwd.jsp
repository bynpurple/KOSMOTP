<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>계정 / 패스워드 찾기</title>
</head>
<body>
	<form action="findPwdCon" method="post" name = "findPwd">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<div align="center" style = "margin-top:5%">
			<table>
				<tr>
					<td>　</td>
				</tr>
				<tr align="right">
					<td>가입시 입력한 아이디, 이름, 핸드폰번호를 입력하세요</td>
				</tr>
				<tr>
						<td>　</td>
						<td>　</td>
					</tr>
				<tr>
					<td>
					<input type="text" class="form-control" placeholder="ID" name="username" required>
		        	</td>
				</tr>
				<tr>
						<td>　</td>
						<td>　</td>
					</tr>
				<tr>
					<td>
					<input type="text" class="form-control" placeholder="NAME" name="name" required>
		        	</td>
				</tr>
				<tr>
						<td>　</td>
						<td>　</td>
					</tr>
				<tr>
					<td>
					<input type="text" class="form-control" placeholder="H.P" name="hp" required>
		        	</td>
				</tr>
				<tr>
					<td>　</td>
				</tr>
				<tr align="center">
					<td>
						<input type="submit" class = "btn" value="확인">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" class="btn" value="이전" onclick="hisBack();">
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>