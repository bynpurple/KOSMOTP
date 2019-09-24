<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result == 1}">
		<script type="text/javascript">
			alert("인증 완료되었습니다.");
			opener.document.confirmForm.checkAuth.value = 1;
			self.close();
		</script>
	</c:if>
	<c:if test="${result != 1}">
		<script type="text/javascript">
			alert("잘못된 인증번호이거나 입력 시간이 초과되었습니다.");
			self.close();
		</script>
	</c:if>
</body>
</html>