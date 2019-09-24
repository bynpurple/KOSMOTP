<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<title>EZ-FUNDING 이지펀딩</title>
	<c:set var="path" value="${pageContext.request.contextPath}" />
	<c:set var ="project" value="/funding/resources/"/>
	<meta charset="UTF-8">
	
	<script src = "${project}js/Fscript.js"></script>
	
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
	
	<!-- JS -->
	<script src="${project}assets/js/vendor/modernizr-2.8.3.min.js"></script>
