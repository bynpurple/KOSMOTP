<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=chrome">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">
<%@ include file="../include/header.jsp"%>
<link rel="icon" href="${project}images/favicon.ico">

<script src="${project}js/jquery-3.4.1.min.js"></script>
<!-- 검색 ajax -->
<script type="text/javascript">
	$(function() {
		$('#result').html("회사 및 코드를 검색하세요!");
		$('#keyword').keyup(function() { // keyup : 데이터입력이 끝났을 때
			var keyword = $('#keyword').val(); // 입력한 키워드
			if (keyword.length == 0) { // 글자수가 0인경우
				//$('#result').css("visibility", "hidden");	// 결과 없으면 숨김
				$('#result').html("회사 및 코드를 검색하세요!");
			} else {
				$('#result').css("visibility", "visible"); // 결과 있으면 보여줌
				$.ajax({
					type : "GET",
					data : "keyword=" + keyword,
					url : '${pageContext.request.contextPath}/user/search_sub', // {컨트롤러}/이동 url
					success : function(data) {
						$('#result').html(data); // 결과 출력
					},
					error : function() {
						alert('오류');
					}
				});
			}
		});
	});

	window.onload = function() {
		$('#asking').css("visibility", "visible");
		$.ajax({
			type : "GET",
			data : "CompanyCode=" + '000020',
			url : '${pageContext.request.contextPath}/user/asking_stock',
			success : function(data) {
				$('#asking').html(data);
			},
			error : function() {
				alert('오류');
			}
		});
	}
</script>
</head>

<body class="hold-transition skin-black sidebar-mini fixed">
	<div class="wrapper">

		<header class="main-header">
			<!-- Logo -->
			<a href="index.html" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<b class="logo-mini"> <span class="light-logo"><img
						src="${project}images/logo-light.png" alt="logo"></span> <span
					class="dark-logo"><img src="${project}images/logo-dark.png"
						alt="logo"></span>
			</b> <!-- logo for regular state and mobile devices --> <span
				class="logo-lg"> <img
					src="${project}images/logo-light-text.png" alt="logo"
					class="light-logo"> <img
					src="${project}images/logo-dark-text.png" alt="logo"
					class="dark-logo">
			</span>
			</a>
			<!-- Header Navbar -->
			<nav class="navbar navbar-static-top">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="push-menu"
					role="button"> <span class="sr-only">Toggle navigation</span>
				</a>
				<div id="marquee" style="width: 80%;">
					<marquee behavior="scroll" scrollamount="7" direction="left"
						onmouseover='stop();' onmouseout='start();'>
						<b style="color: white;"><strong>검색 상위 종목 TOP5</strong>&nbsp;&nbsp;&nbsp;</b>
						<c:forEach var="vo" items="${best}">
							<b style="color: white;">${vo.number }위</b>
							<a href="${vo.url }" target="_blank" style="color: grey;">${vo.title }
							</a>
						</c:forEach>

						<b style="color: white;">&nbsp;&nbsp;&nbsp;<strong>급상승
								종목 TOP10</strong>&nbsp;&nbsp;&nbsp;
						</b>
						<c:forEach var="vo" items="${up}">
							<b style="color: white;">${vo.num }위</b>
							<a href="${vo.url }" target="_blank" style="color: grey;">${vo.title}
							</a>
						</c:forEach>

						<b style="color: white;">&nbsp;&nbsp;<strong>네이버 실시간
								검색어 TOP10</strong>&nbsp;&nbsp;&nbsp;
						</b>
						<c:forEach var="vo" items="${naver}">
							<b style="color: white;">${vo.num }위</b>
							<a href="${vo.url }" target="_blank" style="color: grey;">${vo.title }
							</a>
						</c:forEach>
					</marquee>
				</div>
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- 
		  <li class="search-box">
            <a class="nav-link hidden-sm-down" href="javascript:void(0)"><i class="mdi mdi-magnify"></i></a>
            <form class="app-search" style="display: none;">
                <input type="text" class="form-control" placeholder="Search &amp; enter"> <a class="srh-btn"><i class="ti-close"></i></a>
			</form>
          </li>			
		   -->
						<!-- Messages -->
						<li class="dropdown messages-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="mdi mdi-email"></i>
						</a>
							<ul class="dropdown-menu scale-up">
								<li class="header">You have 5 messages</li>
								<li>
									<!-- inner menu: contains the actual data -->
									<ul class="menu inner-content-div">
										<li>
											<!-- start message --> <a href="#">
												<div class="pull-left">
													<img src="${project}images/user2-160x160.jpg"
														class="rounded-circle" alt="User Image">
												</div>
												<div class="mail-contnet">
													<h4>
														Lorem Ipsum <small><i class="fa fa-clock-o"></i>
															15 mins</small>
													</h4>
													<span>Lorem ipsum dolor sit amet, consectetur
														adipiscing elit.</span>
												</div>
										</a>
										</li>
										<!-- end message -->
										<li><a href="#">
												<div class="pull-left">
													<img src="${project}images/user3-128x128.jpg"
														class="rounded-circle" alt="User Image">
												</div>
												<div class="mail-contnet">
													<h4>
														Nullam tempor <small><i class="fa fa-clock-o"></i>
															4 hours</small>
													</h4>
													<span>Curabitur facilisis erat quis metus congue
														viverra.</span>
												</div>
										</a></li>
										<li><a href="#">
												<div class="pull-left">
													<img src="${project}images/user4-128x128.jpg"
														class="rounded-circle" alt="User Image">
												</div>
												<div class="mail-contnet">
													<h4>
														Proin venenatis <small><i class="fa fa-clock-o"></i>
															Today</small>
													</h4>
													<span>Vestibulum nec ligula nec quam sodales rutrum
														sed luctus.</span>
												</div>
										</a></li>
										<li><a href="#">
												<div class="pull-left">
													<img src="${project}images/user3-128x128.jpg"
														class="rounded-circle" alt="User Image">
												</div>
												<div class="mail-contnet">
													<h4>
														Praesent suscipit <small><i class="fa fa-clock-o"></i>
															Yesterday</small>
													</h4>
													<span>Curabitur quis risus aliquet, luctus arcu nec,
														venenatis neque.</span>
												</div>
										</a></li>
										<li><a href="#">
												<div class="pull-left">
													<img src="${project}images/user4-128x128.jpg"
														class="rounded-circle" alt="User Image">
												</div>
												<div class="mail-contnet">
													<h4>
														Donec tempor <small><i class="fa fa-clock-o"></i>
															2 days</small>
													</h4>
													<span>Praesent vitae tellus eget nibh lacinia
														pretium.</span>
												</div>
										</a></li>
									</ul>
								</li>
								<li class="footer"><a href="#">See all e-Mails</a></li>
							</ul></li>
						<!-- Notifications -->
						<li class="dropdown notifications-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="mdi mdi-bell"></i>
						</a>
							<ul class="dropdown-menu scale-up">
								<li class="header">You have 7 notifications</li>
								<li>
									<!-- inner menu: contains the actual data -->
									<ul class="menu inner-content-div">
										<li><a href="#"> <i class="fa fa-users text-aqua"></i>
												Curabitur id eros quis nunc suscipit blandit.
										</a></li>
										<li><a href="#"> <i class="fa fa-warning text-yellow"></i>
												Duis malesuada justo eu sapien elementum, in semper diam
												posuere.
										</a></li>
										<li><a href="#"> <i class="fa fa-users text-red"></i>
												Donec at nisi sit amet tortor commodo porttitor pretium a
												erat.
										</a></li>
										<li><a href="#"> <i
												class="fa fa-shopping-cart text-green"></i> In gravida
												mauris et nisi
										</a></li>
										<li><a href="#"> <i class="fa fa-user text-red"></i>
												Praesent eu lacus in libero dictum fermentum.
										</a></li>
										<li><a href="#"> <i class="fa fa-user text-red"></i>
												Nunc fringilla lorem
										</a></li>
										<li><a href="#"> <i class="fa fa-user text-red"></i>
												Nullam euismod dolor ut quam interdum, at scelerisque ipsum
												imperdiet.
										</a></li>
									</ul>
								</li>
								<li class="footer"><a href="#">View all</a></li>
							</ul></li>
						<!-- Tasks -->
						<li class="dropdown tasks-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="mdi mdi-message"></i>
						</a>
							<ul class="dropdown-menu scale-up">
								<li class="header">You have 6 tasks</li>
								<li>
									<!-- inner menu: contains the actual data -->
									<ul class="menu inner-content-div">
										<li>
											<!-- Task item --> <a href="#">
												<h3>
													Lorem ipsum dolor sit amet <small class="pull-right">30%</small>
												</h3>
												<div class="progress xs">
													<div class="progress-bar progress-bar-aqua"
														style="width: 30%" role="progressbar" aria-valuenow="20"
														aria-valuemin="0" aria-valuemax="100">
														<span class="sr-only">30% Complete</span>
													</div>
												</div>
										</a>
										</li>
										<!-- end task item -->
										<li>
											<!-- Task item --> <a href="#">
												<h3>
													Vestibulum nec ligula <small class="pull-right">20%</small>
												</h3>
												<div class="progress xs">
													<div class="progress-bar progress-bar-danger"
														style="width: 20%" role="progressbar" aria-valuenow="20"
														aria-valuemin="0" aria-valuemax="100">
														<span class="sr-only">20% Complete</span>
													</div>
												</div>
										</a>
										</li>
										<!-- end task item -->
										<li>
											<!-- Task item --> <a href="#">
												<h3>
													Donec id leo ut ipsum <small class="pull-right">70%</small>
												</h3>
												<div class="progress xs">
													<div class="progress-bar progress-bar-light-blue"
														style="width: 70%" role="progressbar" aria-valuenow="20"
														aria-valuemin="0" aria-valuemax="100">
														<span class="sr-only">70% Complete</span>
													</div>
												</div>
										</a>
										</li>
										<!-- end task item -->
										<li>
											<!-- Task item --> <a href="#">
												<h3>
													Praesent vitae tellus <small class="pull-right">40%</small>
												</h3>
												<div class="progress xs">
													<div class="progress-bar progress-bar-yellow"
														style="width: 40%" role="progressbar" aria-valuenow="20"
														aria-valuemin="0" aria-valuemax="100">
														<span class="sr-only">40% Complete</span>
													</div>
												</div>
										</a>
										</li>
										<!-- end task item -->
										<li>
											<!-- Task item --> <a href="#">
												<h3>
													Nam varius sapien <small class="pull-right">80%</small>
												</h3>
												<div class="progress xs">
													<div class="progress-bar progress-bar-red"
														style="width: 80%" role="progressbar" aria-valuenow="20"
														aria-valuemin="0" aria-valuemax="100">
														<span class="sr-only">80% Complete</span>
													</div>
												</div>
										</a>
										</li>
										<!-- end task item -->
										<li>
											<!-- Task item --> <a href="#">
												<h3>
													Nunc fringilla <small class="pull-right">90%</small>
												</h3>
												<div class="progress xs">
													<div class="progress-bar progress-bar-primary"
														style="width: 90%" role="progressbar" aria-valuenow="20"
														aria-valuemin="0" aria-valuemax="100">
														<span class="sr-only">90% Complete</span>
													</div>
												</div>
										</a>
										</li>
										<!-- end task item -->
									</ul>
								</li>
								<li class="footer"><a href="#">View all tasks</a></li>
							</ul></li>
						<!-- User Account -->
						<li class="dropdown user user-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <img
								src="${project}images/user5-128x128.jpg"
								class="user-image rounded-circle" alt="User Image">
						</a>
							<ul class="dropdown-menu scale-up">
								<!-- User image -->
								<li class="user-header"><img
									src="${project}images/user5-128x128.jpg"
									class="float-left rounded-circle" alt="User Image">

									<p>
										Romi Roy <small class="mb-5">jb@gmail.com</small> <a href="#"
											class="btn btn-danger btn-sm btn-rounded">View Profile</a>
									</p></li>
								<!-- Menu Body -->
								<li class="user-body">
									<div class="row no-gutters">
										<div class="col-12 text-left">
											<a href="#"><i class="ion ion-person"></i> My Profile</a>
										</div>
										<div class="col-12 text-left">
											<a href="#"><i class="ion ion-email-unread"></i> Inbox</a>
										</div>
										<div class="col-12 text-left">
											<a href="#"><i class="ion ion-settings"></i> Setting</a>
										</div>
										<div role="separator" class="divider col-12"></div>
										<div class="col-12 text-left">
											<a href="#"><i class="ti-settings"></i> Account Setting</a>
										</div>
										<div role="separator" class="divider col-12"></div>
										<div class="col-12 text-left">
											<a href="#"><i class="fa fa-power-off"></i> Logout</a>
										</div>
									</div> <!-- /.row -->
								</li>
							</ul></li>
						<!-- Control Sidebar Toggle Button -->
						<li><a href="#" data-toggle="control-sidebar"><i
								class="fa fa-cog fa-spin"></i></a></li>
					</ul>
				</div>
			</nav>
		</header>

		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">
			<%@ include file="side_menu.jsp"%>
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">


			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-12">
						<div class="box box-inverse box-dark">
							<div class="box-body">

								<ul id="webticker-1">
									<c:forEach var="yesDate" items="${yesDate}">
										<li class="br-1">
											<div class="mx-20">
												<div class="d-flex justify-content-between">
													<h5 class="mr-40 text-white-50">${yesDate.stockCode}+
														회사명</h5>
													<c:if
														test="${(yesDate.r_close - yesDate.r_empty) / yesDate.r_empty * 100 <= 0}">
														<p class="text-danger">
															<fmt:formatNumber type="number" pattern="0.00"
																value="${(yesDate.r_close - yesDate.r_empty) / yesDate.r_empty * 100}" />
														</p>
													</c:if>
													<c:if
														test="${(yesDate.r_close - yesDate.r_empty) / yesDate.r_empty * 100 > 0}">
														<p class="text-success">
															<fmt:formatNumber type="number" pattern="+0.00"
																value="${(yesDate.r_close - yesDate.r_empty) / yesDate.r_empty * 100}" />
														</p>
													</c:if>
												</div>
												<div class="d-flex justify-content-between">
													<h4 class="my-0 mr-40">
														금일 종가
														<fmt:formatNumber type="number" pattern=",000,000"
															value="${yesDate.r_empty}" />
														원
													</h4>
													<span class="sparklines">${yesDate.stockCode}</span>
												</div>
											</div>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
					<!-- 주식 거래내역  -->
					<div class="col-12">
						<h4>주식 거래 내역</h4>
						<hr style="color: white;">
					</div>
					<div class="col-xl-6">
						<div class="box">
							<div class="box-header">
								<h4 class="box-title">매수내역</h4>
							</div>
							<div clss="box-body">
								<div class="table-responsive">
									<table class="table table-hover">
										<thead>
											<tr>
												<th scope ="col" colspan="6">매수 내역(총 매수 갯수 : ${cnt})</th>
											</tr>
											<tr>
												<th scope="col">종목명</th>
												<th scope="col">종목코드</th>
												<th scope="col">거래주식수</th>
												<th scope="col">거래가</th>
												<th scope="col">총액</th>
												<th scope="col">거래완료시간</th>
											</tr>
										</thead>
										<tbody>
											<!-- 게시글이 있으면 -->
											<c:if test="${cnt>0}">
												<c:forEach var="list" items="${list}">
													<tr>
														<td>${list.stockname}</td>
														<td>${list.stockcode}</td>
														<td>${list.c_cnt}</td>
														<td>${list.c_price}</td>
														<td>${list.c_total}</td>
														<td><fmt:formatDate type="both"
																pattern="yyyy-MM-dd HH:mm:ss" 
																value="${list.c_date}" /></td>
													</tr>
												</c:forEach>
											</c:if>
											<!-- 게시글이 없으면 -->
											<c:if test="${cnt<=0}">
												<tr>
													<td colspan="6" align="center">매수내역이 없습니다.</td>
												</tr>
											</c:if>
										</tbody>
									</table>

									<!-- 페이지 컨트롤 -->
									<table class="table">
										<tr>
											<th colspan="6">
												<!-- 게시글이 있으면  --> <c:if test="${cnt>0}">
													<!-- 처음[◀◀] / 이전[◀]   -->
													<c:if test="${startPage > pageBlock}">
														<a href="searchTrading?username=${pageContext.request.userPrincipal.name}">[◀◀] </a>
														<a href="searchTrading?pageNum=${startPage - pageBlock}&username=${pageContext.request.userPrincipal.name}">[◀]</a>
													</c:if>

													<!-- 블록내의 페이지 번호 -->
													<c:forEach var="i" begin="${startPage}" end="${endPage}">
														<c:if test="${i == currentPage}">
															<span><b>[${i}]</b></span>
														</c:if>
														<c:if test="${i != currentPage}">
															<span><b><a href="searchTrading?pageNum=${i}&username=${pageContext.request.userPrincipal.name}">[${i}]</a></b></span>
														</c:if>
													</c:forEach>


													<!-- 다음[▶]/마지막[▶▶]  -->
													<c:if test="${pageCount > endPage}">
														<a href="searchTrading?pageNum=${startPage + pageBlock}&username=${pageContext.request.userPrincipal.name}">[▶]</a>
														<a href="searchTrading?pageNum=${pageCount}&username=${pageContext.request.userPrincipal.name}">[▶▶]</a>
													</c:if>
												</c:if>
											</th>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-6">
						<div class="box">
							<div class="box-header">
								<h4 class="box-title">매도내역</h4>
							</div>
							<div clss="box-body">
								<div class="table-responsive">
									<table class="table table-hover">
										<thead>
											<tr>
												<th scope ="col" colspan="6">매도 내역(총 매수 갯수 : ${cnt1})</th>
											</tr>
											<tr>
												<th scope="col">종목명</th>
												<th scope="col">종목코드</th>
												<th scope="col">거래주식수</th>
												<th scope="col">거래가</th>
												<th scope="col">총액</th>
												<th scope="col">거래완료시간</th>
											</tr>
										</thead>
										<tbody>
											<!-- 게시글이 있으면 -->
											<c:if test="${cnt1>0}">
												<c:forEach var="list1" items="${list1}">
													<tr>
														<td>${list1.stockname}</td>
														<td>${list1.stockcode}</td>
														<td>${list1.c_cnt}</td>
														<td>${list1.c_price}</td>
														<td>${list1.c_total}</td>
														<td><fmt:formatDate type="both"
																pattern="yyyy-MM-dd HH:mm:ss" 
																value="${list1.c_date}" /></td>
													</tr>
												</c:forEach>
											</c:if>
											<!-- 게시글이 없으면 -->
											<c:if test="${cnt1<=0}">
												<tr>
													<td colspan="6" align="center">매도내역이 없습니다.</td>
												</tr>
											</c:if>
										</tbody>
									</table>

									<!-- 페이지 컨트롤 -->
									<table class="table">
										<tr>
											<th>
												<!-- 게시글이 있으면  --> <c:if test="${cnt1>0}">
													<!-- 처음[◀◀] / 이전[◀]   -->
													<c:if test="${startPage1 > pageBlock1}">
														<a href="searchTrading?username=${pageContext.request.userPrincipal.name}">[◀◀] </a>
														<a href="searchTrading?pageNum1=${startPage1 - pageBlock1}&username=${pageContext.request.userPrincipal.name}">[◀]</a>
													</c:if>

													<!-- 블록내의 페이지 번호 -->
													<c:forEach var="i" begin="${startPage1}" end="${endPage1}">
														<c:if test="${i == currentPage1}">
															<span><b>[${i}]</b></span>
														</c:if>
														<c:if test="${i != currentPage1}">
															<span><b><a href="searchTrading?pageNum1=${i}&username=${pageContext.request.userPrincipal.name}">[${i}]</a></b></span>
														</c:if>
													</c:forEach>


													<!-- 다음[▶]/마지막[▶▶]  -->
													<c:if test="${pageCount1 > endPage1}">
														<a href="searchTrading?pageNum1=${startPage1 + pageBlock1}&username=${pageContext.request.userPrincipal.name}">[▶]</a>
														<a href="searchTrading?pageNum1=${pageCount1}&username=${pageContext.request.userPrincipal.name}">[▶▶]</a>
													</c:if>
												</c:if>
											</th>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
					
					<br><br><br>
					<!-- 계좌 이체 거래내역  -->
					<div class="col-12">
						<h4>계좌 이체 내역</h4>
						<hr style="color: white;">
					</div>
					
					<div class="col-xl-6">
						<div class="box">
							<div class="box-header">
								<h4 class="box-title">입금내역</h4>
							</div>
							<div clss="box-body">
								<div class="table-responsive">
									<table class="table">
										<tbody>
										 <!-- 게시글이 있으면 -->
											<c:if test="${cnt2>=0}">
												<c:forEach items="${list2}" var="list2">
													<tr>
														<td text-align="left">
															<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${list2.pay_date}"/>
														</td>
													</tr>
													<tr>
														<td>${list2.you}</td>
														<td>${list2.pay_price}원</td>
														<td>${list2.money}원</td>
													</tr>
												</c:forEach>
											</c:if>
											<!-- 게시글이 없으면 -->
											<c:if test="${cnt2<=0}">
												<tr>
													<td colspan="6" align="center">이체-입금내역이 없습니다.</td>
												</tr>
											</c:if>
										</tbody>
									</table>

									<!-- 페이지 컨트롤 -->
									<table class="table">
										<tr>
											<th>
												<!-- 게시글이 있으면  --> <c:if test="${cnt2>0}">
													<!-- 처음[◀◀] / 이전[◀]   -->
													<c:if test="${startPage2 > pageBlock2}">
														<a href="searchTrading?username=${pageContext.request.userPrincipal.name}">[◀◀] </a>
														<a href="searchTrading?pageNum2=${startPage2 - pageBlock2}$username=${pageContext.request.userPrincipal.name}">[◀]</a>
													</c:if>

													<!-- 블록내의 페이지 번호 -->
													<c:forEach var="i" begin="${startPage2}" end="${endPage2}">
														<c:if test="${i == currentPage2}">
															<span><b>[${i}]</b></span>
														</c:if>
														<c:if test="${i != currentPage2}">
															<span><b><a href="searchTrading?pageNum2=${i}&username=${pageContext.request.userPrincipal.name}">[${i}]</a></b></span>
														</c:if>
													</c:forEach>


													<!-- 다음[▶]/마지막[▶▶]  -->
													<c:if test="${pageCount2 > endPage2}">
														<a href="searchTrading?pageNum2=${startPage2 + pageBlock2}&username=${pageContext.request.userPrincipal.name}">[▶]</a>
														<a href="searchTrading?pageNum2=${pageCount2}&username=${pageContext.request.userPrincipal.name}">[▶▶]</a>
													</c:if>
												</c:if>
											</th>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-6">
						<div class="box">
							<div class="box-header">
								<h4 class="box-title">출금내역</h4>
							</div>
							<div clss="box-body">
								<div class="table-responsive">
									<table class="table">
										<tbody>
											<!-- 게시글이 있으면 -->
											<c:if test="${cnt3>0}">
												<c:forEach var="list3" items="${list3}">
													<tr>
														<td text-align="left">
															<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${list3.pay_date}" />
														</td>
													</tr>
													<tr>
														<td>${list3.you}</td>
														<td>${list3.pay_price}원</td>
														<td>${list3.money}원</td>
													</tr>
												</c:forEach>
											</c:if>
											<!-- 게시글이 없으면 -->
											<c:if test="${cnt3<=0}">
												<tr>
													<td colspan="6" align="center">이체-출금내역이 없습니다.</td>
												</tr>
											</c:if>
										</tbody>
									</table>

									<!-- 페이지 컨트롤 -->
									<table class="table">
										<tr>
											<th>
												<!-- 게시글이 있으면  --> <c:if test="${cnt3>0}">
													<!-- 처음[◀◀] / 이전[◀]   -->
													<c:if test="${startPage3 > pageBlock3}">
														<a href="searchTrading?username=${pageContext.request.userPrincipal.name}">[◀◀] </a>
														<a href="searchTrading?pageNum3=${startPage3 - pageBlock3}&username=${pageContext.request.userPrincipal.name}">[◀]</a>
													</c:if>

													<!-- 블록내의 페이지 번호 -->
													<c:forEach var="i" begin="${startPage3}" end="${endPage3}">
														<c:if test="${i == currentPage3}">
															<span><b>[${i}]</b></span>
														</c:if>
														<c:if test="${i != currentPage3}">
															<span><b><a href="searchTrading?pageNum3=${i}&username=${pageContext.request.userPrincipal.name}">[${i}]</a></b></span>
														</c:if>
													</c:forEach>


													<!-- 다음[▶]/마지막[▶▶]  -->
													<c:if test="${pageCount3 > endPage3}">
														<a href="searchTrading?pageNum3=${startPage3 + pageBlock3}&username=${pageContext.request.userPrincipal.name}">[▶]</a>
														<a href="searchTrading?pageNum3=${pageCount3}&username=${pageContext.request.userPrincipal.name}">[▶▶]</a>
													</c:if>
												</c:if>
											</th>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>


			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<footer class="main-footer">
			<div class="pull-right d-none d-sm-inline-block">
				<ul
					class="nav nav-primary nav-dotted nav-dot-separated justify-content-center justify-content-md-end">
					<li class="nav-item"><a class="nav-link"
						href="javascript:void(0)">FAQ</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Purchase
							Now</a></li>
				</ul>
			</div>
			&copy; 2019 <a href="https://www.multipurposethemes.com/">Multi-Purpose
				Themes</a>. All Rights Reserved.
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Create the tabs -->
			<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
				<li class="nav-item"><a href="#control-sidebar-home-tab"
					data-toggle="tab"><i class="fa fa-home"></i></a></li>
				<li class="nav-item"><a href="#control-sidebar-settings-tab"
					data-toggle="tab"><i class="fa fa-cog fa-spin"></i></a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- Home tab content -->
				<div class="tab-pane" id="control-sidebar-home-tab">
					<h3 class="control-sidebar-heading">Recent Activity</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript:void(0)"> <i
								class="menu-icon fa fa-birthday-cake bg-red"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Admin Birthday</h4>

									<p>Will be July 24th</p>
								</div>
						</a></li>
						<li><a href="javascript:void(0)"> <i
								class="menu-icon fa fa-user bg-yellow"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Jhone Updated His
										Profile</h4>

									<p>New Email : jhone_doe@demo.com</p>
								</div>
						</a></li>
						<li><a href="javascript:void(0)"> <i
								class="menu-icon fa fa-envelope-o bg-light-blue"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Disha Joined
										Mailing List</h4>

									<p>disha@demo.com</p>
								</div>
						</a></li>
						<li><a href="javascript:void(0)"> <i
								class="menu-icon fa fa-file-code-o bg-green"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Code Change</h4>

									<p>Execution time 15 Days</p>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

					<h3 class="control-sidebar-heading">Tasks Progress</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Web Design <span class="label label-danger pull-right">40%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-danger"
										style="width: 40%"></div>
								</div>
						</a></li>
						<li><a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Update Data <span class="label label-success pull-right">75%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-success"
										style="width: 75%"></div>
								</div>
						</a></li>
						<li><a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Order Process <span class="label label-warning pull-right">89%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-warning"
										style="width: 89%"></div>
								</div>
						</a></li>
						<li><a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Development <span class="label label-primary pull-right">72%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-primary"
										style="width: 72%"></div>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

				</div>
				<!-- /.tab-pane -->
				<!-- Stats tab content -->
				<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab
					Content</div>
				<!-- /.tab-pane -->
				<!-- Settings tab content -->
				<div class="tab-pane" id="control-sidebar-settings-tab">
					<form method="post">
						<h3 class="control-sidebar-heading">General Settings</h3>

						<div class="form-group">
							<input type="checkbox" id="report_panel" class="chk-col-grey">
							<label for="report_panel" class="control-sidebar-subheading ">Report
								panel usage</label>

							<p>general settings information</p>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<input type="checkbox" id="allow_mail" class="chk-col-grey">
							<label for="allow_mail" class="control-sidebar-subheading ">Mail
								redirect</label>

							<p>Other sets of options are available</p>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<input type="checkbox" id="expose_author" class="chk-col-grey">
							<label for="expose_author" class="control-sidebar-subheading ">Expose
								author name</label>

							<p>Allow the user to show his name in blog posts</p>
						</div>
						<!-- /.form-group -->

						<h3 class="control-sidebar-heading">Chat Settings</h3>

						<div class="form-group">
							<input type="checkbox" id="show_me_online" class="chk-col-grey">
							<label for="show_me_online" class="control-sidebar-subheading ">Show
								me as online</label>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<input type="checkbox" id="off_notifications"
								class="chk-col-grey"> <label for="off_notifications"
								class="control-sidebar-subheading ">Turn off
								notifications</label>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> <a
								href="javascript:void(0)" class="text-red margin-r-5"><i
									class="fa fa-trash-o"></i></a> Delete chat history
							</label>
						</div>
						<!-- /.form-group -->
					</form>
				</div>
				<!-- /.tab-pane -->
			</div>
		</aside>
		<!-- /.control-sidebar -->

		<!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>

	</div>
	<!-- ./wrapper -->



	<!-- jQuery 3 -->
	<script src="${project}assets/vendor_components/jquery/dist/jquery.js"></script>

	<!-- popper -->
	<script
		src="${project}assets/vendor_components/popper/dist/popper.min.js"></script>

	<!-- Bootstrap 4.0-->
	<script
		src="${project}assets/vendor_components/bootstrap/dist/js/bootstrap.js"></script>

	<!-- Slimscroll -->
	<script
		src="${project}assets/vendor_components/jquery-slimscroll/jquery.slimscroll.js"></script>

	<!-- FastClick -->
	<script
		src="${project}assets/vendor_components/fastclick/lib/fastclick.js"></script>

	<!-- 추가 맵핑 적용 -->
	<script
		src="${project}assets/vendor_components/Ionicons/css/ionicons.css"></script>
	<script
		src="${project}assets/vendor_components/font-awesome/css/font-awesome.css"></script>
	<script
		src="${project}assets/vendor_components/themify-icons/themify-icons.css"></script>
	<script src="${project}assets/vendor_components/linea-icons/linea.css"></script>
	<script
		src="${project}assets/vendor_components/flag-icon/css/flag-icon.css"></script>
	<script
		src="${project}assets/vendor_components/glyphicons/glyphicon.css"></script>
	<script
		src="${project}assets/vendor_components/material-design-iconic-font/css/materialdesignicons.css"></script>
	<script
		src="${project}assets/vendor_components/simple-line-icons-master/css/simple-line-icons.css"></script>
	<script
		src="${project}assets/vendor_components/cryptocoins-master/webfont/cryptocoins.css"></script>

	<!-- Resources -->
	<script src="https://www.amcharts.com/lib/4/core.js"></script>
	<script src="https://www.amcharts.com/lib/4/charts.js"></script>
	<script src="https://www.amcharts.com/lib/4/themes/dark.js"></script>
	<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

	<!-- webticker -->
	<script
		src="${project}assets/vendor_components/Web-Ticker-master/jquery.webticker.min.js"></script>

	<!-- Sparkline -->
	<script
		src="${project}assets/vendor_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>

	<!-- Crypto_Admin App -->
	<script src="${project}js/template.js"></script>

	<!-- Crypto_Admin dashboard demo (This is only for demo purposes) -->
	<script src="${project}js/pages/dashboard.js"></script>
	<script src="${project}js/pages/dashboard-chart.js"></script>

	<!-- Crypto_Admin for demo purposes -->
	<script src="${project}js/demo.js"></script>


</body>
</html>