<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>계정 / 패스워드 찾기</title>
</head>
<body>
	<div align = "center" style="margin-top:20%">
		<table>
			<tr>
				<td>	</td>
				<td>	</td>
			</tr>
			<tr>
				<td> 회원님의 아이디는 "${dto.username}" 입니다.</td>
			</tr>
			<tr>
				<td>　</td>
				<td>　</td>
			</tr>
			<tr align="center" style="margin-top:30px;">
				<td colspan = "2">
					<input class = "btn" type="button" value = "닫기" onclick="closeTerms();">
				</td>
			</tr>
		</table>
	</div>
</body>
</html>