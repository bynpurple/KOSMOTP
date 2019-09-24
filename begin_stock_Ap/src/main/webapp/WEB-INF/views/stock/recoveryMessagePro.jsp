<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		alert("총 ${result} 건의 메세지가 복구되었습니다.");
		
		location.href="deleteMessage?username=${pageContext.request.userPrincipal.name}";
	</script>
</body>
</html>