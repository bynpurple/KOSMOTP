<%@ include file="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<c:if test="${result != 0 }">
		<script type="text/javascript">
			alert("메시지를 전송했습니다. 메시지 메인 페이지로 이동합니다.");
			location.href='sendEntireMessagePro';
		</script>
	</c:if>
</body>
</html>
	