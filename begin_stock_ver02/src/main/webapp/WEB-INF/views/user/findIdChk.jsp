<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>
<%@ include file = "../include/cssExpansion.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>계정 / 패스워드 찾기</title>
</head>
<body style = "background:#252525;">
	<table align = "center" style="margin-top:20%">
		<tr>
			<td>	</td>
			<td>	</td>
		</tr>
		<tr style="color:#bdbdbd;">
			<td> 회원님의 아이디는 ${dto.username} 입니다.</td>
		</tr>
		<tr>
			<td>	</td>
			<td>	</td>
		</tr>
		<tr>
			<td>	</td>
			<td>	</td>
		</tr>
		<tr align="center">
			<td colspan = "2">
				<input class = "btn btn-danger" type="button" value = "닫기" onclick="closeTerms();">
			</td>
		</tr>
	</table>
</body>
</html>