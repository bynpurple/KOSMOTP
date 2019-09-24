<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="ko">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=chrome">
        <title>Definity - Contact Page</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body id="page-top">
        <%@ include file="../include/top-header.jsp" %>

        <!-- ========== Page Title ========== -->

        <header class="page-title pt-large pt-light pt-parallax pt-plax-lg-light" data-stellar-background-ratio="0.4">
          <div class="container">
              <div class="row">

                <div class="col-sm-6">
                  <h1>크라우드 펀딩 신청</h1>
                  <span class="subheading">
                		  펀딩 이렇게 성공했어요!
						  중소벤처기업 이외에 영화나 전시회 등 다양한 프로젝트성 사업에도 크라우드펀딩이 자금유치에 도움을 드리고 있습니다.
				  </span>
                </div>
              </div>
            </div>
        </header>
        
        <!-- ========== Features ========== -->
        <div id="features" class="container-fluid ft-layout-50">
          <div class="row">
            
            <!-- Feature 1 -->
            <div class="ft-item">
              <div class="col-lg-6 ft-img-wrapper">
                <img src="${project }assets/images/crowdfunding/gotfund1.png" alt="Features Image">
              </div>
              <div class="col-lg-6 ft-content-wrapper">
                <h5>Feature One</h5>
                <h6 class="h-alt">Lorem ipsum dolor sit amet</h6>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                <button class="btn-ghost">Call to Action</button>
              </div>
            </div>

            <!-- Feature 2 -->
            <div class="ft-item">
              <div class="col-lg-6 ft-content-wrapper">
                <h5>Feature Two</h5>
                <h6 class="h-alt">Lorem ipsum dolor sit amet</h6>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                <button class="btn-ghost">Call to Action</button>
              </div>
              <div class="col-lg-6 ft-img-wrapper">
                <img src="${project }assets/images/crowdfunding/gotfund2.png" alt="Features Image">
              </div>
            </div>
          </div>
        </div>
        
        <!-- ========== Contact ========== -->
        <section id="contact" class="contact-3">
          <div class="container">
            <div class="row">
              <div class="col-md-12 col-lg-offset-2 col-lg-8">
                <div class="form-wrapper">
                  <div class="from-header">
                    <h2>Get in touch</h2>
                    <p>크라우드펀딩, 지금 오픈트레이드와 함께 준비하고 진행하세요!<br>이래의 신청서를 작성해 주시면, 검토 후 담당자가 연락을 드리겠습니다.</p>
                  </div>

                  <form action="${path}/user/applicationFund" method="post" class="form-minimal form-ajax" enctype="multipart/form-data">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<!-- Company -->
                    <div class="form-group">
                      <input type="text" name="company" id="name-contact-3" class="form-control validate-locally">
                      <label for="name-contact-3">기업명 *</label>
                    </div>
					
                    <!-- Name -->
                    <div class="form-group">
                      <input type="text" name="name" id="name-contact-3" placeholder="로그인한 아이디를 입력하세요" class="form-control validate-locally">
                      <label for="name-contact-3">담당자 이름</label>
                    </div>

                    <!-- Email -->
                    <div class="form-group">
                      <input type="email" name="email" id="email-contact-3" class="form-control validate-locally">
                      <label for="email-contact-3">담당자 이메일 *</label>
                    </div>

                    <!-- Phone -->
                    <div class="form-group ws-s">
                      <input type="tel" name="phone" id="phone-contact-3" class="form-control">
                      <label for="email-contact-3">담당자 연락처</label>
                    </div>
                    
                    <!-- Phone -->
                    <div class="form-group ws-s">
                      <input type="tel" name="sns" id="phone-contact-3" class="form-control">
                      <label for="email-contact-3">회사 홈페이지 또는 SNS 채널</label>
                    </div>
                    
                    <!-- Phone -->
                    <div class="form-group ws-s">
                      <input type="tel" name="price" id="phone-contact-3" class="form-control">
                      <label for="email-contact-3">희망하시는 모집금액은 얼마인가요?</label>
                    </div>
					
					<div class="form-group">
						<label>크라우드 펀딩을 어떻게 알게 되었나요?</label><br>
						<label><input type="radio" name="fund_path" value="1">1. 크라우드펀딩 검색을 통해</label><br>
						<label><input type="radio" name="fund_path" value="2">2. 오픈트레이드 SNS채널(페이스북, 블로그, 인스타그림 등)을 통해</label><br>
						<label><input type="radio" name="fund_path" value="3">3. 지인의 소개를 통해</label><br>
						<label><input type="radio" name="fund_path" value="0">기타 : <input type="text" id="fund_path_etc" name="fund_path_etc" value="" placeholder="직접입력" onfocus="$('input[name=fund_path]').eq(3).click()" style="width:calc(100% - 59.9px); display:inline-block;"></label>
					</div>
					
					<!-- Message -->
                    <div class="form-group">
                      <p>Just say hello, or tell me about your project</p>
                      <textarea class="form-control" name="message" id="message-contact-1" rows="5"></textarea>
                      <label for="message-contact-1">Message *</label>
                    </div>
					
					<div class="form-group">
						<label>개인정보 수집 및 이용 동의<i class="icon-required"></i></label>
						<div class="form-control" style="height:auto;">
							오픈트레이드(주)는 크라우드펀딩 정보제공을 목적으로 개인정보(성명, 이메일, 연락처)를 수집하고자 하며, 수집된 개인정보는 수집 및 이용목적이 달성된 후에는 지체 없이 파기합니다.<br><br>
							개인정보 수집 및 이용에 대하여 동의를 거부할 수 있으나, 거부할 시 오픈트레이드 정보제공 신청이 완료되지 않음에 유의하시기 바랍니다.
						</div>
						<label><input type="checkbox" id="agree" name="agree" value="1">개인정보 수집 및 이용에 동의합니다.</label>
					</div>
					
					<div class="row btn-example">
			            <div class="col-md-4 mb-sm-30"></div>
			            <input type = "submit" class = "btn-ghost btn-round" value = "신청서 제출">
			            <div class="col-md-4"></div>
          			</div>

                    <!-- Ajax Message -->
                    <div class="ajax-message"></div>
                  </form>
                </div>
              </div>

            </div>
          </div><!-- / .container -->
        </section><!-- / .contact-3 -->


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

        <!-- Definity JS -->
        <script src="${project }assets/js/main.js"></script>
    </body>
</html>
