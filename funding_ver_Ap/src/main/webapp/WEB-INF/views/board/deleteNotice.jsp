<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>EZ FUND - 공지사항삭제</title>
</head>
<body>
<c:if test="${cnt == 1}">
	<script type="text/javascript">
        alert("공지사항/이벤트이(가) 삭제 되었습니다.");    
        location.href="${path}/user/notice";
    </script>
</c:if>
<c:if test="${cnt != 1}">
	<script type="text/javascript">
        alert("공지사항/이벤트 삭제 실패되었습니다."");    
        location.href="${path}/user/notice";
    </script>
</c:if>
</body>
</html>