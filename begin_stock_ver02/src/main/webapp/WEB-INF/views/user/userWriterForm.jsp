<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html lang="ko">
<head>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
	<%@ include file="../include/header.jsp" %>
	<link rel="icon" href="${project}images/favicon.ico">
	<script src="/stock/resources/js/jquery-3.4.1.min.js"></script>
	<c:set var ="project" value="/stock/resources/"/>
<body class="hold-transition skin-black sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">
	<header class="main-header">
    <%@ include file="../include/main_header.jsp" %>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <%@ include file="../stock/side_menu.jsp" %>
  </aside>
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
       	 1대1 문의
      </h1>
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>홈</a></li>
        <li class="breadcrumb-item"><a href="#">고객센터</a></li>
        <li class="breadcrumb-item active">1대1문의</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	  <h1 class="page-header text-center mt-30 mb-30">
		  <span class="text-bold text-yellow">EZ-STOCK 1대1 문의</span><br>
		  <p class="font-size-18 mb-0">1대1 문의 사항 입니다.</p>
	  </h1>
	  </section>
	  <form action="writePro" method="post" name="writeform">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		
		<input type="hidden" name="num" value="${num}">
		<input type="hidden" name="ref" value="${ref}">
		<input type="hidden" name="ref_step" value="${ref_step}">
		<input type="hidden" name="ref_level" value="${ref_level}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="writer" value="${pageContext.request.userPrincipal.name}">		
		<table align="center">
			<tr>
				<th> 제목 </th>
				<td><input class="input" type="text" name="subject" maclength="50" 
						style="width:270px" placeholder="제목을 입력하세요!!">
				</td>
			</tr>
			<tr>
				<th> 내용 </th>
				<td>
				<textarea class="input" row="10" cols="40" name="content"
					style="width:270px" placeholder="글내용을 입력하세요!!" word-break:break-all>
				</textarea>
			</tr>
			<tr>
				<th colspan="2">
					<input class="inputButton" type="submit" value="작성">
					<input class="inputButton" type="reset" value="취소">
					<input class="inputButton" type="button" value="목록"
						onclick="window.history.go(-1);">
			</tr>
		</table>
	</form>
	</div>
</div>
</body>
</html>