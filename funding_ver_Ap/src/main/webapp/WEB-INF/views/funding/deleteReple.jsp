<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/header.jsp" %>    
<html>
<body>
<c:if test="${delCnt ==1}">
<script type="text/javascript">
alert('게시글 삭제 되었습니다');
</script>
	<c:forEach var="list" items="${list}">
	<p class="tpr-name">ID : <span style="font-weight:bold;">${list.reple_id}</span>&nbsp;<span class="tpr-date">${list.reple_date}</span>
		<button type="button" class="close" onclick="deletereple('${list.reple_id}','${list.reple_date}','${qna_id}','${qna_comment}');">×</button>
		</p>
		<p class="tpr-content">${list.reple_comment}</p>
		<hr>	
	</c:forEach>
</c:if>
<c:if test="${delCnt !=1}">
<script type="text/javascript">
alert('비밀번호가 맞지 않습니다');
</script>
<c:forEach var="list" items="${list}">
	<p class="tpr-name">ID : <span style="font-weight:bold;">${list.reple_id}</span>&nbsp;<span class="tpr-date">${list.reple_date}</span>
	<button type="button" class="close" onclick="deletereple('${list.reple_id}','${list.reple_date}','${qna_id}','${qna_comment}');">×</button>
	</p>
	<p class="tpr-content">${list.reple_comment}</p>
	<hr>
</c:forEach>
</c:if>
</body>
</html>