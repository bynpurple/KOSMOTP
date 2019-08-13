<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>EZ Stock - 공지사항</title>
</head>
<body>
<c:if test="${insertCnt == 1}">
	<script type="text/javascript">
        errorAlert("공지사항 작성에 성공했습니다.");    
        window.href="${path}/user/notice";
    </script>
</c:if>
<c:if test="${insertCnt != 1}">
	<script type="text/javascript">
        errorAlert("공지사항 작성에 실패했습니다.");    
        location.href="${path}/user/notice";
    </script>
</c:if>
</body>
</html>