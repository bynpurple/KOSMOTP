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
    <body id="page-top">
        <%@ include file="../include/top-header.jsp" %>  
 		
 		<!-- ========== Page Title ========== -->
 
        <header class="page-title pt-large pt-light pt-parallax pt-plax-lg-light" data-stellar-background-ratio="0.4">
          <div class="bg-overlay">
            <div class="container">
              <div class="row">
 
                <div class="col-sm-6">
                  <h1>오픈 예정</h1>
                  <span class="subheading"><span class="et-traget">앞으로 예정된 펀드 목록입니다.</span></span>
                </div>
                <ol class="col-sm-6 text-right breadcrumb">
                  <li><a href="#">펀딩하기</a></li>
                  <li><a href="#">오픈 예정</a></li>
                </ol>
              </div>
            </div>
          </div>
        </header>
 		
      <!-- ========== Sidebar ========== -->
        <aside class="container section sidebar" style="padding-top:0px;">
          <div class="row">
            <section class="container portfolio-layout portfolio-columns-boxed">
	          <div class="row">
	            <header class="sec-heading">
	              <h2>오픈 예정 프로젝트</h2>
	              <span class="subheading">오픈 예정 프로젝트를 미리 확인하고 투자 계획을 세워보세요</span>
	            </header>
	          </div><!-- / .row -->
	          <div class="row">
	           <ul id="pfolio-filters" class="portfolio-filters">
	             <li class="active"><a href="#" data-filter="*">All</a></li>
	             <li><a href="#" data-filter=".hot">스타트업</a>(${openstartupCnt})</li>
	             <li><a href="#" data-filter=".recommend">문화 콘텐츠</a>(${opencultureCnt})</li>
	           </ul>
	         </div>
	         <div class="row">
	            <div id="pfolio">
	
				  <c:forEach var="dto" items="${fundingList}">
				
				  <c:set var="now" value="<%=new java.util.Date()%>" />  
		          <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/> <!-- 오늘날짜 -->
		          <fmt:parseDate value="${today}" pattern="yyyy-MM-dd" var="tt"/> <!--오늘은 날짜로 변환   -->
		          <fmt:parseDate value="${dto.fund_schedule_date}" pattern="yyyy-MM-dd" var="start"/>
		          
		          <!-- 숫자로 변환 -->
		          <fmt:parseNumber var="strDate" value="${tt.time / (1000*60*60*24)}" integerOnly="true"/>
		          <fmt:parseNumber var="startDate" value="${start.time / (1000*60*60*24)}" integerOnly="true"/>
	              
	              <c:if test="${startDate > strDate}"> <!-- 미오픈인거  -->
		             
		              <!-- 스타트업 -->
		              <c:if test="${dto.fund_content_div eq 's'}">
			              <div class="col-md-4 portfolio-item hot">
			                   <div class="p-wrapper hover-light">
			                   <img src="${dto.fund_thumbnail}" alt="Project Example" style="width:390px; height:216px;">
			                   <div class="p-hover">
			                    <div class="p-content">
			                      <h4>${dto.fund_subject}</h4>
			                      <h6 class="subheading"><fmt:formatDate value="${dto.fund_schedule_date}" pattern="yyyy-MM" /> 중 오픈 예정</h6>
			                    </div>
			                  </div>
			                </div>
			              </div><!-- / .portfolio-item -->
		              </c:if>
		              
		              <!-- 문화인경우 -->
		               <c:if test="${dto.fund_content_div  eq 'c'}">
			              <div class="col-md-4 portfolio-item recommend">
			                <div class="p-wrapper hover-light">
			                  <img src="${dto.fund_thumbnail}" alt="Project Example" style="width:390px; height:216px;">
			                  <div class="p-hover">
			                    <div class="p-content">
			                      <h4>${dto.fund_subject}</h4>
			                      <h6 class="subheading"><fmt:formatDate value="${dto.fund_schedule_date}" pattern="yyyy-MM" /> 중 오픈 예정</h6> 	
			                    </div>
			                  </div>
			                </div>
			              </div><!-- / .portfolio-item -->
		              </c:if>
		              
	              </c:if>
	      		</c:forEach>
	          
	              
	              
	            </div><!-- / #pfolio -->
	          </div><!-- / .row -->
	        </section>
 
          </div><!-- / .row -->
        </aside><!-- / .sidebar -->
        
 		<%@ include file="../include/footer.jsp" %>  
    
 
        <!-- ========== Scripts ========== -->
 
        <script src="${project}assets/js/vendor/jquery-2.1.4.min.js"></script>
        <script src="${project}assets/js/vendor/google-fonts.js"></script>
        <script src="${project}assets/js/vendor/jquery.easing.js"></script>
        <script src="${project}assets/js/vendor/jquery.waypoints.min.js"></script>
        <script src="${project}assets/js/vendor/bootstrap.min.js"></script>
        <script src="${project}assets/js/vendor/bootstrap-hover-dropdown.min.js"></script>
        <script src="${project}assets/js/vendor/smoothscroll.js"></script>
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