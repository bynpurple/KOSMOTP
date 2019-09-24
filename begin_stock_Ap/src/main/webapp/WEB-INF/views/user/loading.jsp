<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 로그인 후 메인 화면 넘어가기 전 로딩 페이지 입니다. -->

<!-- Favicon -->
	<link rel="shortcut icon" href="${project}favicon.ico">
	<!-- Bootstrap -->
	<link rel="stylesheet" href="${project}assets/styles/vendor/bootstrap.min.css">
	<!-- Fonts -->
	<link rel="stylesheet" href="${project}assets/fonts/et-lineicons/css/style.css">
	<link rel="stylesheet" href="${project}assets/fonts/linea-font/css/linea-font.css">
	<link rel="stylesheet" href="${project}assets/fonts/fontawesome/css/font-awesome.min.css">
	<!-- Slider -->
	<link rel="stylesheet" href="${project}assets/styles/vendor/slick.css">
	<!-- Lightbox -->
	<link rel="stylesheet" href="${project}assets/styles/vendor/magnific-popup.css">
	<!-- Animate.css -->
	<link rel="stylesheet" href="${project}assets/styles/vendor/animate.css">
	<!-- Animated Headings -->
	<link rel="stylesheet" href="${project}assets/styles/vendor/animated-heading.css">
	<!-- Definity CSS -->
	<link rel="stylesheet" href="${project}assets/styles/main.css">
	<link rel="stylesheet" href="${project}assets/styles/responsive.css">
</head>
<body>

<div class="preloader">
  <img src="${project }images/loader.svg" alt="Loading...">
</div>
<script type="text/javascript">
location.href = "http://localhost/funding/user/fundLogin?username=${username}&password=${password}";
</script>
        <!-- ========== Scripts ========== -->
	<!-- JS -->
	<script src="${project}assets/js/vendor/modernizr-2.8.3.min.js"></script>
        <script src="${project }assets/js/vendor/jquery-2.1.4.min.js"></script>
        <script src="${project }assets/js/vendor/google-fonts.js"></script>
        <script src="${project }assets/js/vendor/jquery.easing.js"></script>
        <script src="${project }assets/js/vendor/jquery.waypoints.min.js"></script>
        <script src="${project }assets/js/vendor/bootstrap.min.js"></script>
        <script src="${project }assets/js/vendor/bootstrap-hover-dropdown.min.js"></script>
        <script src="${project }assets/js/vendor/smoothscroll.js"></script>
        <script src="${project }assets/js/vendor/jquery.localScroll.min.js"></script>
        <script src="${project }assets/js/vendor/jquery.scrollTo.min.js"></script>
        <script src="${project }assets/js/vendor/jquery.stellar.min.js"></script>
        <script src="${project }assets/js/vendor/jquery.parallax.js"></script>
        <script src="${project }assets/js/vendor/slick.min.js"></script>
        <script src="${project }assets/js/vendor/jquery.easypiechart.min.js"></script>
        <script src="${project }assets/js/vendor/countup.min.js"></script>
        <script src="${project }assets/js/vendor/isotope.min.js"></script>
        <script src="${project }assets/js/vendor/jquery.magnific-popup.min.js"></script>
        <script src="${project }assets/js/vendor/wow.min.js"></script>

        <!-- Definity JS -->
        <script src="${project }assets/js/main.js"></script>
</body>
</html>