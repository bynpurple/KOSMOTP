<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>
<html>
<meta charset="UTF-8">
</head>
<body>
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
							<span>${username}</span>은 중복된 아이디 입니다.
						</th>
					</tr>
					<tr>
						<td>　</td>
						<td>　</td>
					</tr>
					<tr align="center">
						<th colspan="2">
							<input type="text" class="form-control" name="username">
						</th>
					</tr>
					<tr>
						<td>　</td>
						<td>　</td>
					</tr>
					<tr align="center">
						<th colspan = "2">
							<input class = "btn" type = "submit" value="확인">&nbsp;&nbsp;&nbsp;&nbsp;
							<input class = "btn" type = "reset" value ="취소" onclick="self.close();">
						</th>
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
							<span>${username}</span>은 사용할 수 있는 아이디입니다.
						</td>
					</tr>
					<tr>
						<td>　</td>
					</tr>
					<tr align = "center">
						<th>
							<input class = "btn" type = "button" value = "확인" onclick="setId('${username}');">
						</th>	
					</tr>
				</table>
			</div>
		</c:if>
</form>
</body>
</html>