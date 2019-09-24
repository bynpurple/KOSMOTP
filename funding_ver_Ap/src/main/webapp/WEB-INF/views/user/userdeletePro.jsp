<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<html>
<body>
	<!-- 글삭제 실패  -->
	<c:if test="${deleteCnt == 0 }">
		<script type="text/javascript">
			errorAlert(deleteError);
		</script>
	</c:if>
	<!-- 글삭제 성공  -->
	<c:if test="${deleteCnt != 0 }">
		<script type="text/javascript">
			alert("글삭제되었습니다.");
			window.location = "userInquiry?writer=${pageContext.request.userPrincipal.name}";
		</script>
	</c:if>
		
</body>
</html>