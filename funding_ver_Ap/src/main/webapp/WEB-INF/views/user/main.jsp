<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<html class="no-js" lang="ko">
    <head>
       <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=chrome">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body id="page-top">
      <%@ include file="../include/top-header.jsp" %>
      
      <!-- ========== MAIN 대문 타이틀(이미지 변경시 main.js에서 animated-hero url 바꿀것) ========== -->

      <div id="home" class="animated-hero">
        <div class="bg-overlay">
                          
          <!-- Hero Content -->
          <div class="hero-content-wrapper">
            <div class="hero-content">
              
              <h1 class="cd-headline slide hero-lead wow fadeIn" data-wow-duration="4s">
                <span class="cd-words-wrapper">
                  <b class="is-visible">EZ FUNDING</b>
                  <b>MORE EASIER</b>
                  <b>&amp; SMARTER</b>
                </span>
              </h1>
            </div>
          </div>

          <!-- Scroller -->
          <a href="#about" class="scroller">
            <span class="scroller-text">scroll down</span>
            <span class="linea-basic-magic-mouse"></span>
          </a>

        </div><!-- / .bg-overlay -->
      </div><!-- / .animated-hero -->
      
      <c:set var="now" value="<%=new java.util.Date()%>" />  
      
      <!-- 가안2 -->
      <div class="gray-bg">
        <section id="about" class="container section ft-centered">
			<!-- ========== 스타트업 ========== -->
			<h1><strong>스타트업</strong></h1>
			
			<div class="row">
			  <!-- Item 4 -->
			    <c:forEach var = "fundingList" items="${fundingSList}" end="2">
	                <c:if test="${fundingList.fund_schedule_date <= now}">
	                   <div class="col-lg-4 col-md-6 ws-s">
	                     <div class="client-item">
	                          <a href="fundingdetail?fund_id=${fundingList.fund_id}"><img class="img-responsive" src="${fundingList.fund_thumbnail}" alt="Client" style="width:360px;height:240px;"></a>
	                          <div class="item-content">
	                            <h4>${fundingList.fund_subject}</h4>
	                            <div class="progress-group">
	                               <div class="progress progress-thin">
	                                 <div class="progress-bar" role="progressbar" aria-valuenow="<%=(4800000*100/16000000) %>" aria-valuemin="0" aria-valuemax="100" style="width:<fmt:formatNumber value="${fundingList.fund_eval_value/fundingList.fund_target_money}" type="percent" />;">
	                                 </div>
	                               </div>
	                               <c:set var="percentage" value="${fundingList.fund_eval_value/fundingList.fund_target_money*100}"></c:set>
	                               <span class="progress-value"><fmt:formatNumber value="${fundingList.fund_eval_value/fundingList.fund_target_money}" type="percent" /></span>
	                             </div>
	                             <table style="width:100%">
	                                <tr>
	                                   <td colspan="2"><h4 style="margin:0px;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${fundingList.fund_eval_value}" /> 원</h4></td>
	                                </tr>
	                                <tr>
	                                   <td><h3 style="margin:0px;">/<fmt:formatNumber type="number" maxFractionDigits="3" value="${fundingList.fund_target_money}" />원</h3></td>
	                                   <td style="text-align:right;"><a href="fundingdetail?fund_id=${fundingList.fund_id}" class="btn-ghost btn-small cli-btn">펀딩하기</a></td>
	                                </tr>
	                             </table>
	                          </div>
	                        </div><!-- / .client-item -->
	                   </div><!-- / .col-lg-4 -->
	                </c:if>
	            </c:forEach>
			  </div><!-- / .row -->
			    
			  <!-- ========== 문화 콘텐츠 ========== -->
			   <h1><strong>문화 콘텐츠</strong></h1>
			
				<div class="row">
			       <!-- Item 4 -->
			      <c:forEach var = "fundingList" items="${fundingCList}"  end="2">
	                  <c:if test="${fundingList.fund_schedule_date <= now}">
	                   <div class="col-lg-4 col-md-6 ws-s">
	                     <div class="client-item">
	                          <a href="fundingdetail?fund_id=${fundingList.fund_id}"><img class="img-responsive" src="${fundingList.fund_thumbnail}" alt="Client" style="width:360px;height:240px;"></a>
	                          <div class="item-content">
	                            <h4>${fundingList.fund_subject}</h4>
	                            <div class="progress-group">
	                               <div class="progress progress-thin">
	                                 <div class="progress-bar" role="progressbar" aria-valuenow="<%=(4800000*100/16000000) %>" aria-valuemin="0" aria-valuemax="100" style="width:<fmt:formatNumber value="${fundingList.fund_eval_value/fundingList.fund_target_money}" type="percent" />;">
	                                 </div>
	                               </div>
	                               <c:set var="percentage" value="${fundingList.fund_eval_value/fundingList.fund_target_money*100}"></c:set>
	                               <span class="progress-value"><fmt:formatNumber value="${fundingList.fund_eval_value/fundingList.fund_target_money}" type="percent" /></span>
	                             </div>
	                             <table style="width:100%">
	                                <tr>
	                                   <td colspan="2"><h4 style="margin:0px;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${fundingList.fund_eval_value}" /> 원</h4></td>
	                                </tr>
	                                <tr>
	                                   <td><h3 style="margin:0px;">/<fmt:formatNumber type="number" maxFractionDigits="3" value="${fundingList.fund_target_money}" />원</h3></td>
	                                   <td style="text-align:right;"><a href="fundingdetail?fund_id=${fundingList.fund_id}" class="btn-ghost btn-small cli-btn">펀딩하기</a></td>
	                                </tr>
	                             </table>
	                          </div>
	                        </div><!-- / .client-item -->
	                   </div><!-- / .col-lg-4 -->
	                </c:if>
	            </c:forEach>
			    </div><!-- / .row -->
			   </section>
			</div><!-- / .gray-bg -->
      
      
        <!-- ========== Video Background Section ========== -->
        <div class="video-bg-section">
          
          <!-- Video Background -->
          <div id="section-video" class="player" 
               data-property="{videoURL:'https://youtu.be/U3_uxUSeZV4',containment:'.video-bg-section',autoPlay:true, mute:true, startAt:71, stopAt:300, opacity:1}">
          </div>

          <!-- Video Link -->
          <div class="video-sec-content">
            <h3 class="cta-lead h-alt wow fadeIn" data-wow-delay=".1s" data-wow-duration="1s">여러분들의 꿈을 이지펀딩이 함께 만들어갑니다.</h3>
             <!-- <a href="https://www.youtube.com/v/k5C1Bt4k-iA" class="play-btn popup-video">
             <span class="play-icon linea-music-play-button"></span>
              <h5>Play video</h5> 
            </a>-->
          </div><!-- / .video-sec-content -->
        </div><!-- / .video-bg-section -->
      
        <!-- ========== Services ========== -->
        <section id="services" class="container section ft-centered">

          <header class="sec-heading">
            <h2>이지 펀딩은 이렇습니다!</h2>
            <span class="subheading">여러분의 날개를 달아드립니다!</span>
          </header>

          <div class="row">
            
            <!-- Item 1 -->
            <div class="col-md-3 col-sm-6 mb-sm-50 ft-item ft-square-frame-dark wow zoomIn" data-wow-duration=".6s" data-wow-delay=".3s">
              <span class="et-tools"></span>
              <h5>어렵지 않은 심사 절차</h5>
              <p>Lorem ipsum dolor sit amet, ete elit consectetur adipisicing. Omnis quae, ipsam impedit eius, vero.</p>
            </div>

            <!-- Item 2 -->
            <div class="col-md-3 col-sm-6 mb-sm-50 ft-item ft-square-frame-dark wow zoomIn" data-wow-duration=".6s">
              <span class="et-desktop"></span>
              <h5>등록 후 사후 관리</h5>
              <p>Lorem ipsum dolor sit amet, ete elit consectetur adipisicing. Omnis quae, ipsam impedit eius, vero.</p>
            </div>

            <!-- Item 3 -->
            <div class="col-md-3 col-sm-6 mb-sm-50 ft-item ft-square-frame-dark wow zoomIn" data-wow-duration=".6s">
              <span class="et-anchor"></span>
              <h5>아이템의 브랜드화</h5>
              <p>Lorem ipsum dolor sit amet, ete elit consectetur adipisicing. Omnis quae, ipsam impedit eius, vero.</p>
            </div>

            <!-- Item 4 -->
            <div class="col-md-3 col-sm-6 mb-sm-50 ft-item ft-square-frame-dark wow zoomIn" data-wow-duration=".6s" data-wow-delay=".3s">
              <span class="et-strategy"></span>
              <h5>스마트 컨트랙트</h5>
              <p>Lorem ipsum dolor sit amet, ete elit consectetur adipisicing. Omnis quae, ipsam impedit eius, vero.</p>
            </div>

          </div><!-- / .row -->
        </section><!-- / .ft-frames -->



        <!-- ========== Feature - Steps Numbers ========== -->

        <div class="gray-bg">
          <section class="container ft-steps-numbers">
            <div class="row section">

              <header class="sec-heading ws-s">
                <h2>펀딩 등록은 어떻게 이루어지나요?</h2>
                <span class="subheading">How do we register for funding?</span>
              </header>
              
              <!-- Step 1 -->
              <div class="col-lg-4 col-md-6 mb-sm-100 ft-item wow fadeIn" data-wow-duration="1s">
                <span class="ft-nbr">01</span>
                <h4>펀딩 신청</h4>
                <p>사업(포르젝트)정보와 사업(프로젝트)소개서 등의 서류와 등록하려는 기업의 정보를 제출합니다.</p>
              </div>

              <!-- Step 2 -->
              <div class="col-lg-4 col-md-6 mb-sm-100 ft-item wow fadeIn" data-wow-duration="1s" data-wow-delay=".3s">
                <span class="ft-nbr">02</span>
                <h4>펀딩 심사</h4>
                <p>신청 후 신청 기업은 각종 서류를 준비하고 이지 펀딩 내 심사관들을 통해 협의 후 등록 가능 여부를 심사합니다.</p>
              </div>

              <!-- Step 3 -->
              <div class="col-lg-4 col-md-6 ft-item wow fadeIn" data-wow-duration="1s" data-wow-delay=".6s">
                <span class="ft-nbr">03</span>
                <h4>펀딩 등록</h4>
                <p>심사가 완료되면 등록 기업은 직접 준비한 자료와 심사 중 제출한 자료를 통해 이지 펀딩에 등록이 가능합니다.</p>
              </div>

            </div><!-- / .row -->
            
          </section><!-- / .container -->
        </div><!-- / .gray-bg -->

      	<%@ include file="../include/footer.jsp" %>

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