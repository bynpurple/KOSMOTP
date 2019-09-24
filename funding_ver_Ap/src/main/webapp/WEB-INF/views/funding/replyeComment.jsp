<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>     
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${ctCnt==1}">
	<div style="overflow:auto;">
	<c:forEach var="list" items="${list}">
	<p class="tpr-name">ID : <span style="font-weight:bold;font-size:15px;">${list.reple_id}</span>&nbsp;<span class="tpr-date">${list.reple_date}</span>
	<button type="button" class="close" onclick="deletereple('${list.reple_id}','${list.reple_date}','${qna_id}','${qna_comment}');">×</button>
	</p>
	<p class="tpr-content">${list.reple_comment}</p>
	<hr>
	</c:forEach>
	</div>
	</c:if>
</body>
</html>