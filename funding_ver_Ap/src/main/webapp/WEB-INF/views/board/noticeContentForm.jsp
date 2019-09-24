<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../include/header.jsp" %>
<!doctype html>
<html class="no-js" lang="ko">
<head>
   <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=chrome">
    <meta name="author" content="https://github.com/JiHong88" />
    <meta name="keywords" content="wysiwyg,editor,javascript,suneditor,wysiwyg eidtor,rich text editor,html editor,contenteditable,위지위그 에디터 웹에디터">
    <meta name="description" content="Pure javascript wysiwyg web editor" />
    <title>이지 펀딩</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="${project}dist/css/suneditor.min.css" rel="stylesheet" type="text/css">
    <!-- sample css -->
    <link rel="stylesheet" href="${project}css/bootstrap.css" media="all">
    <link rel="stylesheet" href="${project}css/sample.css" media="all">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/3.0.1/github-markdown.min.css">
</head>
<body id="page-top">
<%@ include file="../include/top-header.jsp" %>
	<header class="page-title pt-light pt-plax-md-light" data-stellar-background-ratio="0.4">
	    <div class="container">
        	<div class="row">
	          <div class="col-sm-6">
	            <h1>공지사항</h1>
	            <span class="subheading">정보를 확인하세요</span>
	          </div>
	          <ol class="col-sm-6 text-right breadcrumb">
	            <li><a href="#">더보기</a></li>
	            <li><a href="#">공지</a></li>
	            <li class="active">공지사항</li>
	          </ol>
	        </div>
	      </div>
	</header>
	
	<!-- 제목 -->
	<div align="center" style="margin-top:3%; margin-bottom:3%;">
		<div class="highlight highlight-source-js" style="width:1265px;">
		<pre style="text-align:left;"><span class="pl-k" style="font-size:24px;">${dto.notice_subject}</span></pre></div>
	</div>
	
	<!-- 내용 -->
	<div align="center" style=margin-bottom:3%;">
		<div class="highlight highlight-source-js" style="width:1265px; text-align:left; font-size:16px;">
			<p style="text-align:left; word-break:break-all;">${dto.notice_content}</p>
		</div>
	</div>	
	
	<div style = "margin-bottom:5%;" align="center">
		<input type="button" class="btn" style="font-size:24px;" value="목록으로" onclick="history.go(-1);">
		<c:if test="${pageContext.request.userPrincipal.name == 'host'}">
			<input type="button" class="btn" style="font-size:24px;" value = "삭제하기" onclick="window.location='${path}/user/deleteNotice?notice_id=${dto.notice_id}'">
			<input type="button" class="btn" style="font-size:24px;" value = "수정하기" onclick="window.location='${path}/user/modifyNotice?notice_id=${dto.notice_id}'">
		</c:if>
	</div>
<%@ include file="../include/footer.jsp" %>

<!-- ========== Scripts ========== -->
      
<script src="${project}assets/js/vendor/jquery-2.1.4.min.js"></script>
<script src="${project}assets/js/vendor/google-fonts.js"></script>
<script src="${project}assets/js/vendor/jquery.easing.js"></script>
<script src="${project}assets/js/vendor/jquery.waypoints.min.js"></script>
<script src="${project}assets/js/vendor/bootstrap.min.js"></script>
<script src="${project}assets/js/vendor/bootstrap-hover-dropdown.min.js"></script>
<script src="${project}assets/js/vendor/smoothscroll.js"></script>
<script src="${project}assets/js/vendor/jquery.localScroll.min.js"></script>
<script src="${project}assets/js/vendor/jquery.scrollTo.min.js"></script>
<script src="${project}assets/js/vendor/jquery.stellar.min.js"></script>
<script src="${project}assets/js/vendor/jquery.parallax.js"></script>
<script src="${project}assets/js/vendor/slick.min.js"></script>
<script src="${project}assets/js/vendor/jquery.easypiechart.min.js"></script>
<script src="${project}assets/js/vendor/countup.min.js"></script>
<script src="${project}assets/js/vendor/isotope.min.js"></script>
<script src="${project}assets/js/vendor/jquery.magnific-popup.min.js"></script>
<script src="${project}assets/js/vendor/wow.min.js"></script>
<script src="${project}assets/js/vendor/jquery.mb.YTPlayer.min.js"></script>
<script src="${project}assets/js/vendor/jquery.ajaxchimp.js"></script>
<script src="${project}assets/js/vendor/animated-heading.js"></script>
<script src="${project}js/common.js"></script>
<script src="${project}dist/suneditor.min.js"></script>
<!-- Definity JS -->
<script src="${project}assets/js/main.js"></script>
</body>
</html>