<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(session!=null) session.invalidate();
response.sendRedirect("http://localhost/funding/user/main");
%>
</body>
</html>