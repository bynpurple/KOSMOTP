<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<html class="no-js" lang="ko">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Chrome">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <script src="/stock/resources/js/jquery-3.4.1.min.js"></script>
<body id="page-top" data-spy="scroll" data-target=".navbar">
	<fmt:parseNumber var="test" integerOnly="true" value="${vo.money/Stockvo.fund_min_invest}" />
        <!-- ========== Maintenance Page ========== -->
	<section class="container section">
       <div class="row ws-m">
         
         <header class="sec-heading">
         	<h1>EZ FUNDING</h1>
			<h2>구입 구좌 설정</h2>
			<h3>가입 펀드명 : ${Fundvo.fund_subject}</h3>
			<span class="subheading">본인의 보유 금액보다 더 많은 금액을 투자하실 수 없습니다.</span>
         </header>

       </div><!-- / .row -->
		<form action="loadingContract" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<input type="hidden" name="username" value="${pageContext.request.userPrincipal.name}">
			<input type="hidden" name="fund_id" value="${Fundvo.fund_id}">
			<div class="row ws-m">
	         <div class="col-md-3">
	         </div>
	         <div class="col-md-6">
	           <div class="form-group">
                  <input class="form-control" type="number" id="nbr-form" placeholder="0" min="0" step="1" max="${test}" name="investvolume">
                  <label for="nbr-form">구입 구좌 수(해당 펀드 구좌 당 가격 : ${Stockvo.fund_min_invest})</label>
               </div>
			   <div class="form-group">
				   	<div>
					   	<input type="submit" class="btn-ghost btn-large btn-round" value="구입 완료">
				   	</div>
				   	<div>
				   		<h6>펀드 구입 소요 시간은 1~2분 정도 소요됩니다. 사이트 이동을 하지 마십시오.<br>사이트 이동으로 인해 처리 과정에서 발생한 피해에 대한 부분은 책임지지 않습니다.</h6>
				   	</div>
			   </div>
	         </div>
	       </div>
			
		</form>
       
       
       
     </section><!-- / .container -->
	
	<!-- ========== Scripts ========== -->
	      
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
	<script src="${project }assets/js/vendor/jquery.mb.YTPlayer.min.js"></script>
	<script src="${project }assets/js/vendor/jquery.ajaxchimp.js"></script>
	<script src="${project }assets/js/vendor/animated-heading.js"></script>
	
	<!-- Definity JS -->
	<script src="${project }assets/js/main.js"></script>    

</body>
</html>