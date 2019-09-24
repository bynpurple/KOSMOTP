<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=chrome">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="refresh" content="5; url=${path}/user/stock_board">
<link rel="stylesheet"
	href="/stock/resources/assets/vendor_components/FlipClock-master/compiled/flipclock.css">
		<!-- Bootstrap 4.0-->
	<link rel="stylesheet" href="${project}assets/vendor_components/bootstrap/dist/css/bootstrap.min.css">
	
	<!-- Bootstrap extend-->
	<link rel="stylesheet" href="${project}css/bootstrap-extend.css">

	<!-- Theme style -->
	<link rel="stylesheet" href="${project}css/master_style.css">

	<!-- Crypto_Admin skins -->
	<link rel="stylesheet" href="${project}css/skins/_all-skins.css">	
</head>
<body class="hold-transition">
	<div class="container h-p100 error-body">
		<div class="row h-p100 align-items-center">
			<div class="col">	
			  <div class="error-page bg-inverse bg-transparent">
				<div class="error-content">
					<div class="container">
					  <h2 class="headline text-white"> 404</h2>
					  <h3 class="margin-top-0"><i class="fa fa-warning text-yellow"></i> 해당 페이지는 찾을 수 없습니다 ! </h3>
					  <p>관리자에게 문의해주세요. </p>
				  </div>
				</div>
				<footer class="mt-35">
					Copyright &copy; 2019 <a class="text-white">Multi-Purpose Themes</a>. All Rights Reserved.
				</footer>
			  </div>
			</div>
		</div>
	</div>
	<script src = "${project}assets/vendor_components/jquery/dist/jquery.min.js"></script>
	
	<!-- popper -->
	<script src="${project}assets/vendor_components/popper/dist/popper.min.js"></script>
	
	<!-- Bootstrap 4.0-->
	<script src="${project}assets/vendor_components/bootstrap/dist/js/bootstrap.min.js"></script>

</body>
</html>