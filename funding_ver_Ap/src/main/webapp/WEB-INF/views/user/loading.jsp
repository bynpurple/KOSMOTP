<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../include/header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	location.href="http://localhost/stock/user/stockLogin?username=${username}&password=${password}";
</script>
<!-- 로그인 후 메인화면 넘어가기 전 로딩 페이지 입니다. -->
</body>
</html>