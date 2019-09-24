<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>
<html class="no-js" lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Chrome">
    <title>이지 펀딩</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body id="page-top">
<c:if test="${pageContext.request.userPrincipal.name != 'host'}">
	<script type="text/javascript">
		alert("해당 페이지는 관리자만 접근 가능한 페이지입니다. \n메인 페이지로 이동합니다.");
		location.href = "${path}/user/main"''
	</script>
</c:if>
	<%@ include file="../include/top-header.jsp" %>
	<!-- ========== Page Title ========== -->
	
	<header class="page-title pt-large pt-light pt-parallax pt-plax-lg-light">
	  <div class="container">
	    <div class="row">
	      <h1 class="col-sm-6">관리자페이지</h1>
	      <ol class="col-sm-6 text-right breadcrumb">
	        <li><a href="#">펀딩신청리스트</a></li>
	        <li><a href="#">상세보기</a></li>
	      </ol>
	    </div>
	  </div>
	</header>
	
	<div class="container section" style="padding-top:50px;">
		<div class="row">
			<!-- Product Info - (tabs) -->
			<div class="row" style="margin-top:60px;">
				<div class="col-md-12" style="padding-bottom:120px;">
					<!-- Nav tabs -->
					<form name = "removeFrm">  
						<div class="col-12" style="margin-left:80px">
							<div class="box">
								<table id="example1" style="width:1050px;" class="table table-bordered table-striped"  >
									<tr>
										<td align="center"> 작성번호 </td>
										<td align="center">${dto.reserve_id}</td>
										<td align="center">회사명</td>
										<td align="center">${dto.company_name}</td>
										<td align="center">작성자명</td>
										<td align="center">${dto.username}</td>
									</tr>
									<tr>
										<td align="center">이메일</td>
										<td align="center" colspan="2">${dto.client_email}</td>
										<td align="center">연락처</td>
										<td align="center" colspan="2">${dto.client_ph}</td>
									</tr>
									<tr>
										<td align="center">사이트</td>
										<td colspan="3">${dto.company_site}	</td>
										<td align="center">응답여부</td>
										<td align="center">${dto.reserve_accepted}</td>
									</tr>
									<tr>
										<td align="center"> 추가 메세지 </td>
										<td colspan="5" style="word-break:break-all; text-align:left; vertical-align:top;">
										${dto.client_message}
										</td>
									</tr>
								</table >
								<div style='display:inline;'>
									<div style="display:inline;float:right;"></div>
									<div style="width:1050px; height:40px;" align="center">
										<input class="btn" type="button" style="width:150px;" value="승인" onclick="location.href='completeConfirm?reserve_id=${dto.reserve_id}'">
										<input class="btn" type="button" style="width:150px;" value="목록"  onclick="history.go(-1);">
									</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
	
	<%@ include file="../include/footer.jsp" %>
	
	<!-- ========== Scripts ========== -->
	
	<script src="${project}assets/js/vendor/jquery-2.1.4.min.js"></script>
	<script src="${project}assets/js/vendor/google-fonts.js"></script>
	<script src="${project}assets/js/vendor/jquery.easing.js"></script>
	<script src="${project}assets/js/vendor/jquery.waypoints.min.js"></script>
	<script src="${project}assets/js/vendor/bootstrap.min.js"></script>
	<script src="${project}assets/js/vendor/bootstrap-hover-dropdown.min.js"></script>
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
	
	<!-- Definity JS -->
	<script src="${project}assets/js/main.js"></script>
</body>
</html>