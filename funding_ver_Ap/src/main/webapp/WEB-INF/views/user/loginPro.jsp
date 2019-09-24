<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${cnt == 1}">
		<script type="text/javascript">
			location.href="main";
		</script>
	</c:if>
	<c:if test="${cnt != 1}">
		<script type="text/javascript">
			alert("로그인에 실패했습니다. 확인 후 다시 시도해주세요.");
			location.href="login";
		</script>
	</c:if>
</body>
</html>