<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>계정 / 패스워드 찾기</title>
</head>
<body>
	<form method="post" name="pwdChkForm">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="hidden" name="checkAuth" value="0">
		<input type="hidden" name="hp" value="${hp}">
		<c:if test="${selectCnt == 1}">
		<div align="center" style="margin-top:10%;">
			<table>
				<tr>
					<td>　</td>
					<td>　</td>
				</tr>
				<tr align="right">
					<td>전송된 인증번호를 입력하세요</td>
				</tr>
				<tr>
					<td>　</td>
					<td>　</td>
				</tr>
				<tr>
					<td>
					<input type="text" class="form-control" placeholder="인증번호 입력" name="auth">
		        	</td>
				</tr>
				<tr>
					<td>　</td>
				</tr>
				<tr align="center">
					<td colspan="2"><input class = "btn" type = "button" value = "인증번호 확인" onclick="checkPwd();"></td>
				</tr>	
				<tr>
					<td>　</td>
					<td>　</td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input class = "btn" type="button" value = "확인" onclick = "showPwd();">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input class = "btn" type="button" value = "취소" onclick = "closeTerms();">
					</td>
				</tr>
			</table>
		</div>
		</c:if>
		<c:if test="${selectCnt != 1}">
			<script type="text/javascript">
				alert("없는 회원 정보입니다. 다시 입력해주세요.");
				window.history.go(-1);
			</script>
		</c:if>
	</form>
</body>
</html>