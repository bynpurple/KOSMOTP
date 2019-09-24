<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../include/header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${insertCnt == 1}">
	<script type="text/javascript">
		alert("신청에 성공했습니다.");
		location.href="${path}/user/main";
	</script>
</c:if>
<c:if test="${insertCnt != 1}">
	<script type="text/javascript">
		alert("신청에 실패했습니다.");
		window.history.go(-1);
	</script>
</c:if>
</body>
</html>