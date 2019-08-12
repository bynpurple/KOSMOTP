<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>
<html>
<title>Nespresso</title>
<body style="background:#252525;">
<form action = "confirmId" method = "post" name = "confirmForm">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<c:if test="${selectCnt == 1}">
		<div align = "center">
			<table>
				<tr>
					<td>　</td>
					<td>　</td>
				</tr>
				<tr>
					<th colspan = "2">
						<span style="color:#BDBDBD;">${username} </span>은(는) 중복된 아이디 입니다.
				</tr>
				<tr>
					<td>　</td>
					<td>　</td>
				</tr>
				<tr>
					<th style="color:#BDBDBD;">재입력 &nbsp; </th>
					<td>
						<input class = "input" type = "text" name = "username" minlength="3" maxlength="16" style ="width:150px">
					</td>
				</tr>
				<tr>
					<td>　</td>
					<td>　</td>
				</tr>
				<tr align="center">
					<th colspan="2">
					<input class = "btn btn-danger" type = "submit" value = "확인">&nbsp;&nbsp;&nbsp;&nbsp;
					<input class = "btn btn-danger" type = "reset" value="취소" onclick="self.close();">
				</tr>
			</table>
		</div>
	</c:if>
	<c:if test="${selectCnt != 1}">
		<div align = "center">
			<table>
				<tr>
					<td>　</td>
					<td>　</td>
				</tr>
				<tr>
					<td>　</td>
					<td>　</td>
				</tr>
				<tr align = "center">
					<td>
						<span style="color:#BDBDBD;">${username}</span>은(는) 사용할 수 있는 아이디입니다.
					</td>
				</tr>
				<tr>
					<td>　</td>
				</tr>
				<tr align="center">
					<th>
						<input class = "btn btn-danger pull-right" type = "button" value = "확인" onclick="setId('${username}');">
					</th>
				</tr>
			</table>
		</div>
	</c:if>
</form>
</body>
</html>