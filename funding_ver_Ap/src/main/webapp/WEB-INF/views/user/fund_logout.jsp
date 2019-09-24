<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- stock에서 로그아웃 시 fund도 로그아웃을 위한 페이지 -->
<%
if(session!=null) session.invalidate();
response.sendRedirect("http://localhost/stock/user/stock_board");
%>
</body>
</html>