<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=chrome">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<%@ include file="../include/header.jsp" %>
</head>
<body>
<script type="text/javascript">
	var firstDate = new Date();
	firstDate.setDate(firstDate.getDate());
	firstDate.setHours(0, 0, 0, 0);
	
	alert(firstDate);
	
	dateString = "2002-01-02 00:00:00:0";
	var date = new Date(dateString);
	
	alert(date);
</script>
</body>
</html>