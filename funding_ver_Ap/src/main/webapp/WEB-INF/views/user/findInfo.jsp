<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 / 비밀번호 찾기</title>
</head>
<body>
	<div align="center" style="margin-top:20%;">
		<table>
			<tr align="center">
				<td>찾으려는 정보를 선택해주세요</td>
			</tr>
			<tr>
				<td>　</td>
				<td>　</td>
			</tr>
			<tr align="center"> 
				<td>
					<input class = "btn" type = "button" value="아이디" onclick="findId();">&nbsp;&nbsp;&nbsp;&nbsp;
					<input class = "btn" type = "button" value="패스워드" onclick="findPwd();">
				</td>
			</tr>
			<tr>
				<td>　</td>
				<td>　</td>
			</tr>
		</table>
	</div>
</body>
</html>