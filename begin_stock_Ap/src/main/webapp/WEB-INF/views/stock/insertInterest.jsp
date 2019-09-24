<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<!-- 관심종목 추가 실패 -->
<c:if test="${selectCnt==1}">
	<script type="text/javascript">
		errorAlert("관심종목 리스트에 이미 담겨있습니다");
	</script>
</c:if>

<!-- 추가 성공 -->
<c:if test="${insertCnt==1}">
	<script type="text/javascript">
		alert("관심종목에 추가되었습니다");
		window.location='${path}/user/company';
	</script>
</c:if>
</body>
</html>