<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/header.jsp" %>        
<html>
<body>
	<c:if test="${accountCnt ==1}">
		<script type="text/javascript">
			alert("비밀번호 확인 되었습니다");
			opener.document.transfer.accountChk.value =1;
			opener.document.transfer.possible_price.value = ${account.money};
			window.close();
		</script>
	</c:if>
	
	<c:if test="${accountCnt !=1}">
		<script type="text/javascript">
			alert("비밀번호가 맞지 않습니다");
			window.close();
		</script>
	</c:if>
</body>
</html>