<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<style>
.ing {
    font-size:12px;
    width: 70px;
    height: 30px;
    position: absolute;
    background-color: #337ab7b8; /* #2cce40ab : 그린색 */
    color: #ffffff;
    top: 10px;
    text-align: center;
    !important;        /* 기존 스타일은 무시하고  important가 붙은 style을 우선시함 */
}
</style>

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
 
        <header class="page-title pt-large pt-light pt-parallax pt-plax-lg-light" data-stellar-background-ratio="1.0" style="background:url('${project}assets/images/grey.jpg');">
          <div class="bg-overlay">
            <div class="container">
              <div class="row">
 
                <div class="col-sm-6">
                  <h1>모집중인 프로젝트</h1>
                  <span class="subheading"><span class="et-traget"> 투자를 시작하세요!</span></span>
                </div>
                <ol class="col-sm-6 text-right breadcrumb">
                  <li><a href="#">펀딩하기</a></li>
                  <li><a href="#">모집중인 프로젝트</a></li>
                </ol>
              </div>
            </div>
          </div>
        </header>
       
      <!-- ========== Sidebar ========== -->
      
      <h3 align="center" style="padding-top:50px; font-weight:bold;"> 
      "회원님은 현재 <span style="font-weight:bold; color:hotpink; font-size: 30px;"> ${startupCnt + cultureCnt} </span>개의  펀딩에 투자 할 수 있습니다. "</h3>
 
        <aside class="container section sidebar" style="padding-top:60px;">
          <div class="row">
 
 
            <!-- Categories - Widget -->
            <div class="col-md-4 mb-sm-100 categories-widget">
              <h5 class="header-widget"><span class="et-documents"> Funding Category</span></h5>
 
              <!-- Item 1 -->
              <div class="widget-item">
                <a href="#"> 스타트업  - <span>${startupCnt}</span></a>
              </div>
 
              <!-- Item 2 -->
              <div class="widget-item">
                <a href="#"> 문화콘텐츠 - <span>${cultureCnt}</span></a>
              </div>
              
            </div><!-- / .categories-widget -->
 
 
            <!-- Tags - Widget -->
            <div class="col-md-4 mb-sm-100 tags-widget">
              <h5 class="header-widget"><span class="et-pricetags"> Tags</span></h5> 
              <ul class="tag-list">
                <li><a href="#">디자인</a></li>
                <li><a href="#">공예</a></li>
                <li><a href="#">블록체인</a></li>
                <li><a href="#">PHP</a></li>
                <li><a href="#">UI/UX</a></li>
                <li><a href="#">영화 ∙ 비디오</a></li>
                <li><a href="#">패션</a></li>
                <li><a href="#">캠페인</a></li>
              </ul>
            </div><!-- / .tags-widget -->
 
 
            <!-- Text - Widget -->
            <div class="col-md-4 text-widget">
              <h5 class="header-widget"><span class="et-lightbulb"> With "EZ-Funding"</span></h5>
              <p>
                         마음 속 프로젝트 아이디어,<br>
                       텀블벅에서 현실로.<br>
                       크라우드펀딩으로 프로젝트를 위한 자금도 모으고,<br>
                       든든한 후원자 네트워크도 확보할 수 있습니다.</p>
            </div><!-- / .text-widget -->
 
          </div><!-- / .row -->
        </aside><!-- / .sidebar -->
 
 
        <!-- 펀딩 리스트 -->
        <div id="blog" class="section container blog-columns" style="padding-top:0px;">
          <div class="row ws-s">
 
 
       <c:forEach var="dto" items="${fundingTotalList}">
		  <c:set var="now" value="<%=new java.util.Date()%>" />  
          <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/> <!-- 오늘날짜 -->
          <fmt:parseDate value="${today}" pattern="yyyy-MM-dd" var="tt"/> <!--오늘은 날짜로 변환   -->
          <fmt:parseDate value="${dto.fund_date}" pattern="yyyy-MM-dd" var="close"/> <!--받아온 값 String이니깐 date로 변환  -->
          <fmt:parseDate value="${dto.fund_schedule_date}" pattern="yyyy-MM-dd" var="start"/>
          
          <!-- 숫자로 변환 -->
          <fmt:parseNumber var="strDate" value="${tt.time / (1000*60*60*24)}" integerOnly="true"/>
          <fmt:parseNumber var="endDate" value="${close.time / (1000*60*60*24)}" integerOnly="true"/>
          <fmt:parseNumber var="startDate" value="${start.time / (1000*60*60*24)}" integerOnly="true"/>
 	   
 	   <c:if test="${startDate <= strDate}">
            <!-- Blog Post 1 -->
            <div class="col-lg-4 col-md-6 mb-sm-50 ws-s">
              <div class="blog-post">
 
                <!-- Image : 상세페이지 이동해야함  // 이미지 사이즈 : 990 * 715 -->
                <div class="carousel"  style="position:relative;">
                    <div class="ing">진행 중</div>
                    <a href="fundingdetail?fund_id=${dto.fund_id}" class="post-img"><img src="${dto.fund_thumbnail}" style="width:360px; height:240px;"></a>
                </div>
                
    
                <div class="bp-content" style="width:360px; height:278px;">
                  
                  <!-- progress bar -->
                  <div class="progress-group">
                    <div class="progress progress-thin">
                      <div class="progress-bar" role="progressbar" aria-valuenow="<fmt:formatNumber value="${dto.fund_eval_value/dto.fund_target_money}" type="number" />" aria-valuemin="0" aria-valuemax="100" style="width:<fmt:formatNumber value="${dto.fund_eval_value/dto.fund_target_money}" type="percent" />;">
                        <span class="sr-only"><fmt:formatNumber value="${dto.fund_eval_value/dto.fund_target_money}" type="percent" /> Complete</span>
                      </div>
                    </div>
                    <span class="progress-title"><fmt:formatNumber value="${dto.fund_target_money}" pattern="#,###"/> 원</span>
                    <span class="progress-value"><fmt:formatNumber value="${dto.fund_eval_value/dto.fund_target_money}" type="percent" /></span>
                    
                   </div>
 
                  <!-- 달력 -->
                  <div class="post-meta">
                    <a href="#" class="post-date">
                      <i class="fa fa-calendar-o"></i>
                 
                      <span style="color:red; font-weight:bold;"><fmt:formatDate value="${dto.fund_date}" pattern="yyyy.MM.dd"/> - ${endDate - strDate}일 남음</span>
                    </a>
                  </div>
 
                  <!-- Post Title -->
                  <a href="fundingdetail?fund_id=${dto.fund_id}" class="post-title"><h4>${dto.fund_subject} <!--  눈이 편한 힐링조명 ZAMLED <br> 시력보호, 스마트 조명, 긴 수명 --></h4></a>
 
                  <!-- Link -->
                  <a href="fundingdetail?fund_id=${dto.fund_id}" class="btn btn-small">Read More</a>
 
                </div><!-- / .bp-content -->
 
              </div><!-- / .blog-post -->
            </div><!-- / .col-lg-4 -->
        </c:if>
        </c:forEach>
 
        </div><!-- / .blog-columns -->
        </div>
        
        <hr>
        
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