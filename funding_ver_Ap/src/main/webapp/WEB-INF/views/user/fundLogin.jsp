<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../include/header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${path}/fund/login_check" method ="post" name = "loginForm">
	<input type = "hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<input type = "hidden" name="username" value = "${username}">
	<input type = "hidden" name="password" value = "${password}">
</form>
<script>
	document.loginForm.submit();
</script>
</body>
</html>