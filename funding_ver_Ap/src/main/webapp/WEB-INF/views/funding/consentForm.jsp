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

        <!-- ========== Maintenance Page ========== -->
	<section class="container section">
       <div class="row ws-m">
         
         <header class="sec-heading">
         	<h1>EZ FUNDING</h1>
			<h2>계약 동의서</h2>
			<h3>가입 펀드명 : ${Fundvo.fund_subject}</h3>
			<span class="subheading">꼭 확인하세요! 증권형 크라우드펀딩은 아래와 같은 투자 위험이 있습니다<br>아래의 투자 위험을 확인하였음에 각각 동의한 후 투자를 시작하세요</span>
         </header>

       </div><!-- / .row -->
		<form action="contractForm" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<input type="hidden" name="username" value="${pageContext.request.userPrincipal.name}">
			<input type="hidden" name="fund_id" value="${Fundvo.fund_id}">
			<div class="row ws-m">
	         <div class="col-md-6">
	         	<h3>원금손실의 위험이 있습니다</h3>
	           	<p>모든 투자는 원금손실의 위험을 가지고 있습니다. 특히 채권 투자의 경우 기본 금리가 있어 원금이 보장되는 것 처럼 보이는 경우가 있으나 회수와는 무관한 내용으로 무조건적인 회수는 보장될 수 없습니다. 그렇기 때문에 다양한 상품에 분산 투자하실 것을 권유드립니다. 이지펀딩는 온라인소액투자중개업자로 증권 모집을 중개하는 업을 영위하고 있으며, 원금손실에 대한 책임을 지지 않습니다. 모든 투자는 투자자 본인의 의사에 따라 결정되어야 합니다.</p>
	           	<label class="checkbox-inline">
					<input type="checkbox" id="inlineCheckbox1" value="option1" required="required"> 동의합니다(필수)
	           	</label>
	         </div>
	         <div class="col-md-6">
	            <h3>환금성이 낮습니다</h3>
	           	<p>비상장기업에 대한 투자는 환금성이 낮습니다. 이지펀딩의 중개를 통한 증권은 6개월 이내 전매가 제한되며, 매매가 가능한 시점이 되더라도 현금으로의 전환이 보장되지는 않습니다. 투자금을 회수하기 위하여 주식의 경우 스타트업 주식거래시장(KSM)에서 거래하거나, 기업의 M&A 또는 주식시장 상장 등이 있을 때까지 기다려야 할 수 있습니다. 채무증권이나 주식 관련 채권의 경우에도 특별한 사정이나 조건이 없는 한 만기까지 기다려야 합니다.</p>
	           <label class="checkbox-inline">
					<input type="checkbox" id="inlineCheckbox2" value="option1" required="required"> 동의합니다(필수)
			   </label>
	         </div>
	       </div>
	       <div class="row ws-m">
	         <div class="col-md-6">
	            <h3>배당가능성이 낮습니다</h3>
	           	<p>이지펀딩를 통해 증권을 발행하는 비상장기업은 성장 초기 단계에 있는 경우가 많기 때문에 정기 배당을 실시하는 경우가 매우 드뭅니다. 따라서 배당수익을 기대하고 투자를 할 경우 기대한 만큼의 수익을 얻지 못할 수 있습니다.</p>
	           <label class="checkbox-inline">
					<input type="checkbox" id="inlineCheckbox3" value="option1" required="required"> 동의합니다(필수)
			   </label>
	         </div>
	         <div class="col-md-6">
	            <h3>지분 희석이 발생할 수 있습니다</h3>
	           	<p>이지펀딩를 통해 증권을 발행하는 비상장기업은 지속적인 성장이 필요한 단계임으로 해당 기업의 정관에 근거하여 유상증자를 실시할 가능성이 일반 기업보다 높습니다. 유상증자로 인하여 투자자가 보유한 지분율은 감소될 수 있습니다.</p>
	           <label class="checkbox-inline">
					<input type="checkbox" id="inlineCheckbox4" value="option1" required="required"> 동의합니다(필수)
			   </label>
	         </div>
	      	</div>
	      	
			<div class="row ws-m">
			   <div class="col-md-4 mb-sm-30"><input type="submit" class="btn-ghost btn-large btn-round" value="계속해서 진행"></div>
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