<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test = "${result == 1}">
		<script type="text/javascript">
			alert("인증이 완료되었습니다.");
			opener.document.confirmForm.checkAuth.value = 1;
			self.colse();
		</script>
	</c:if>
	<c:if test="${result != 1}">
		<script type="text/javascript">
			alert("인증번호를 잘못 입력 또는 입력 시간이 만료되었습니다.");
			self.close();
		</script>
	</c:if>
</body>
</html>