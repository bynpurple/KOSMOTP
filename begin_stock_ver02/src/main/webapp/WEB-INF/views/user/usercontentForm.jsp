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
	<form name = "removeFrm">  
	  <table align = "center">
		<tr>
			<th style="width:150px"> 번호 </th>
			<td style="width:150px" align="center">${num}</td>
			
			<th style="width:150px"> 조회수 </th>
			<td style="width:150px" align="center">${dto.readCnt}</td>
		</tr>
		
		<tr>
			<th style="width:150px"> 작성자 </th>
			<td style="width:150px" align="center"> ${dto.writer}</td>
			
			<th style="widht:150px"> 작성일 </th>
			<td style="width:150px">
				<fmt:formatDate  type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.reg_date}"/>
			</td>
		</tr>
		
		<tr>
			<th style="width:150px"> 글제목 </th>
			<td colspan="3" align="center">${dto.subject}</td>
		</tr>
		<tr>
			<th> 글내용 </th>
			<td colspan="3" word-break:break-all>${dto.content}</td>
			<!--  word-break:break-all = 자동으로 줄바꿔라  -->
			<!-- word-break:break-all 글자단위 자동 줄바꿈 - 권장
									:keep-all 단어기준 자동 줄바꿈  -->
		</tr>
		<tr>
			<th>
				<input class="inputButton" type="button" value="글 수정"
					onclick="window.location='usermodifyForm?num=${dto.num}'">
			</th>		
			<th id=""> <input class="inputButton" type="button" value="글 삭제"
					onclick="window.location='userdeletePro?num=${dto.num}'">
			</th>
			<th>		
				<input class="inputButton" type="button" value="목록보기"
					onclick="window.location='userInquiry'">
	 		</th>
		</tr>
		</table>
	</form>
</div>
</div>


</body>
</html>