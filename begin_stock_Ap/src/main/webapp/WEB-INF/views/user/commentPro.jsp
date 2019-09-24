<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

   <!-- 글쓰기 실패  -->
   <c:if test="${insertCnt == 0 }">
      <script type="text/javascript">
         errorAlert(insertError);
      </script>
   </c:if>
   <!-- 글쓰기 성공  -->
   <c:if test="${insertCnt != 0 }">
      <script type="text/javascript">
         window.history.go(-2);
      </script>
   </c:if>
</body>
</html>