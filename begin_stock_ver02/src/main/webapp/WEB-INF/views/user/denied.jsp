<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/header.jsp" %>
<meta charset="UTF-8">

<!-- 3초가 지나면 해당 url로 가라 즉 home으로 이동 -->
<meta http-equiv="refresh" content="3 , ${path}">
<title>Insert title here</title>
</head>
<body>
	<p>${errMsg}</p>
</body>
</html>