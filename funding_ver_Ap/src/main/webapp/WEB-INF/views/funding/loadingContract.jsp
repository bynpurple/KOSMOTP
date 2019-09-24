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
    <style>
		.gooey {
		  position: absolute;
		  top: 50%;
		  left: 50%;
		  width: 142px;
		  height: 40px;
		  margin: -20px 0 0 -71px;
		  background: #fff;
		  filter: contrast(20);
		}
		.gooey .dot {
		  position: absolute;
		  width: 16px;
		  height: 16px;
		  top: 12px;
		  left: 15px;
		  filter: blur(4px);
		  background: #000;
		  border-radius: 50%;
		  transform: translateX(0);
		  animation: dot 2.8s infinite;
		}
		.gooey .dots {
		  transform: translateX(0);
		  margin-top: 12px;
		  margin-left: 31px;
		  animation: dots 2.8s infinite;
		}
		.gooey .dots span {
		  display: block;
		  float: left;
		  width: 16px;
		  height: 16px;
		  margin-left: 16px;
		  filter: blur(4px);
		  background: #000;
		  border-radius: 50%;
		}
		@-moz-keyframes dot {
		  50% {
		    transform: translateX(96px);
		  }
		}
		@-webkit-keyframes dot {
		  50% {
		    transform: translateX(96px);
		  }
		}
		@-o-keyframes dot {
		  50% {
		    transform: translateX(96px);
		  }
		}
		@keyframes dot {
		  50% {
		    transform: translateX(96px);
		  }
		}
		@-moz-keyframes dots {
		  50% {
		    transform: translateX(-31px);
		  }
		}
		@-webkit-keyframes dots {
		  50% {
		    transform: translateX(-31px);
		  }
		}
		@-o-keyframes dots {
		  50% {
		    transform: translateX(-31px);
		  }
		}
		@keyframes dots {
		  50% {
		    transform: translateX(-31px);
		  }
		}
	</style>
<body id="page-top" data-spy="scroll" data-target=".navbar">
	<fmt:parseNumber var="test" integerOnly="true" value="${vo.money/Stockvo.fund_min_invest}" />
        <!-- ========== Maintenance Page ========== -->
	<section class="container section">
       <div class="row ws-m">
         
         <header class="sec-heading">
         	<h1>EZ FUNDING</h1>
			<h2>구입 구좌 설정</h2>
			<h3>가입 펀드명 : ${Fundvo.fund_subject}</h3>
			<h3>가입 구좌 수 : ${param.investvolume}</h3>
         </header>

       </div><!-- / .row -->
		<form action="callContract" method="post" id="sample_form">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<input type="hidden" name="username" value="${pageContext.request.userPrincipal.name}">
			<input type="hidden" name="fundcode" value="${Fundvo.fund_id}">
			<input type="hidden" name="investvolume" value="${param.investvolume}">
			<div class="row">
	         <div class="col-md-3">
	         </div>
	         <div class="col-md-6" align="center">
	         	<div class="gooey">
				  <span class="dot"></span>
				  <div class="dots">
				    <span></span>
				    <span></span>
				    <span></span>
				  </div>
				</div>
			   <div class="form-group">
				   	<div>
					   	<input type="submit" id="call" class="btn-ghost btn-large btn-round" value="" style="visibility:hidden;">
				   	</div>
			   </div>
			   <div class="row"  style="margin-top:200px;">
			   		<p>예상 소요 시간은 약 2 ~ 4분 입니다.<br>로딩중에 페이지를 이동하지 마십시오.<br>상품 가입 상의 오류가 발생할 수 있으며 오류로 인해 생긴 손해는 책임지지 않습니다.</p>
			   </div>
			   
	         </div>
	       </div>
			
		</form>
	    <script type="text/javascript">
			this.document.getElementById("sample_form").submit();
		</script>
       
       
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