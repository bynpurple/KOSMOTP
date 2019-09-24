<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/header.jsp" %>    
<html>
<body>
<c:if test="${fundCnt ==1}">
<script type="text/javascript">
alert('게시글 작성 완료');
</script>
	<c:forEach var="list" items="${list}">
		<p class="tpr-name">ID : <span style="font-weight:bold;font-size:15px;">${list.qna_id}</span><span class="tpr-date">${list.qna_date}<button type="button" class="close" onclick="deletecomment('${list.qna_id}','${list.qna_date}');">×</button></span></p>
		<p class="tpr-content"><a href="javascript:comment('${list.qna_id}','${list.qna_comment}','${list.qna_date}')">${list.qna_comment}</a></p>
		<hr>
	</c:forEach>
</c:if>
</body>
</html>