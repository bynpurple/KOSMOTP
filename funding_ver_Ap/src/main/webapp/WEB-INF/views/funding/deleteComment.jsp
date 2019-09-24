<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/header.jsp" %>    
<html>
<body>
<c:if test="${delCnt ==1}">
<script type="text/javascript">
alert('댓글이 삭제 되었습니다');
</script>
	<div style="overflow:auto;">
	<c:forEach var="list" items="${list}">
	<p class="tpr-name">ID : <span style="font-weight:bold;font-size:15px;">${list.qna_id}</span><span class="tpr-date">${list.qna_date}<button type="button" class="close" onclick="deletecomment('${list.qna_id}','${list.qna_date}');">×</button></span>
	</p>
	<p class="tpr-content"><a href="javascript:comment('${list.qna_id}','${list.qna_comment}')">${list.qna_comment}</a></p>
	<hr>
	</c:forEach>
	</div>
</c:if>
<c:if test="${delCnt !=1}">
<script type="text/javascript">
alert('비밀번호가 맞지 않습니다');
</script>
	<div style="overflow:auto;">
	<c:forEach var="list" items="${list}">
	<p class="tpr-name">ID : <span style="font-weight:bold;font-size:15px;">${list.qna_id}</span><span class="tpr-date">${list.qna_date}<button type="button" class="close" onclick="deletecomment('${list.qna_id}','${list.qna_date}');">×</button></span>
	</p>
	<p class="tpr-content"><a href="javascript:comment('${list.qna_id}','${list.qna_comment}')">${list.qna_comment}</a></p>
	<hr>
	</c:forEach>
	</div>
</c:if>
</body>
</html>