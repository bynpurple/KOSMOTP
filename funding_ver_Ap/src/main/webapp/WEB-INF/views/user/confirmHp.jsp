<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>
<html>
<body>
<form action = "confirmHp" method = "post" name = "confirmForm">
	<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
	<c:if test="${selectCnt == 1}">
		<div align = "center">
			<table>
				<tr>
					<td>　</td>
					<td>　</td>
				</tr>
				<tr>
					<th colspan = "2">
						<span>${hp}</span>은(는) 중복된 번호입니다.
					</th>
				</tr>
				<tr>
					<td>　</td>
				</tr>
				<tr>
					<th>재입력&nbsp;</th>
					<td>
						<input type = "text" class="form-control"  maxlength="11" name = "hp">
					</td>
				</tr>
				<tr>
					<td>　</td>
				</tr>
				<tr>
					<td align = "center" colspan = "2">
						<input class = "btn" type = "submit" value = "확인">&nbsp;&nbsp;&nbsp;&nbsp;
						<input class = "btn" type = "reset" value = "재입력" onclick="self.close();">
					</td>
				</tr>
			</table>
		</div>
	</c:if>
	<c:if test="${selectCnt != 1}">
		<input type = "hidden" name = "checkAuth" value = "0">
		<input type = "hidden" name = "hp" value="${hp}">
		<div align = "center">
			<table>
				<tr>
					<td align = "center">
						<span>${hp}</span>은(는) 사용할 수 있는 번호입니다.
						인증번호를 입력하세요
					</td>
				</tr>
				<tr align = "center">
					<th> 인증번호
						<input class = "form-control" type="text" name="auth" maxlength="6">
					</th>
				</tr>
				<tr align = "center">
					<th>
						<input class = "btn" type = "button" value = "인증번호 확인" onclick="check();">
						<input class = "btn" type = "button" value = "확인" onclick = "setHp('${hp}');">
					</th>
				</tr>
			</table>
		</div>
	</c:if>
</form>
</body>
</html>