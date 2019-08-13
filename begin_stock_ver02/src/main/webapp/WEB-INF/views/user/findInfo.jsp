<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 혹은 비밀번호 찾기</title>
</head>
<body style="background:#252525;">
	<table align="center">
		<tr>
			<td>　</td>
			<td>　</td>
		</tr>
		<tr>
			<td>　</td>
			<td>　</td>
		</tr>
		<tr>
			<td>　</td>
			<td>　</td>
		</tr>
		<tr align="center">
			<td style="color:#BDBDBD;">찾으려는 정보를 선택해주세요</td>
		</tr>
		<tr>
			<td>　</td>
			<td>　</td>
		</tr>
		<tr align="center"> 
			<td>
				<input class = "btn btn-danger" type = "button" value="아이디" onclick="findId();">&nbsp;&nbsp;&nbsp;&nbsp;
				<input class = "btn btn-danger" type = "button" value="패스워드" onclick="findPwd();">
			</td>
		</tr>
		<tr>
			<td>　</td>
			<td>　</td>
		</tr>
	</table>
</body>
</html>