<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!-- ========== Preloader ========== -->
<div class="preloader">
  <img src="${project }assets/images/loader.svg" alt="Loading...">
</div>

<!-- ========== 비로그인 상태 Navigation ========== -->
<c:if test="${pageContext.request.userPrincipal.name == null}">
<nav class="navbar navbar-default navbar-static-top mega navbar-trans">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>

      <!-- Logo -->
     <a class="navbar-brand" href="${path}/user/main"><img class="navbar-logo" src="${project }assets/images/logo.png" alt="Definity - Logo"></a>
   </div><!-- / .navbar-header -->

   <!-- Navbar Links -->
   <div id="navbar" class="navbar-collapse collapse">
     <ul class="nav navbar-nav">

       <!-- 홈 -->
       <li class="dropdown" style="font-size:24px;">
         <a href="${path }/user/main">홈</a>
       </li><!-- / 홈 -->
       
		<!-- 펀딩하기 -->
       <li class="dropdown" style="font-size:24px;">
         <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350" role="button" aria-haspopup="true" aria-expanded="false">펀딩하기 <span class="caret"></span></a>
         <ul class="dropdown-menu">
           <li><a href="${path }/user/bescheduled">오픈 예정</a></li>
           <li><a href="${path }/user/fundinglist">모집중인 프로젝트</a></li>
         </ul>
       </li><!-- / 펀딩하기 -->
       
       <!-- 펀딩받기 -->
       <li class="dropdown" style="font-size:24px;">
         <a href="${path }/user/login">펀딩신청</a>
       </li><!-- / 펀딩받기 -->
       
        <!-- 정보 라운지  -->
       <li class="dropdown" style="font-size:24px;">
         <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350" role="button" aria-haspopup="true" aria-expanded="false">정보 라운지<span class="caret"></span></a>
         <ul class="dropdown-menu">
           <li><a href="${path }/user/crowdfunding">크라우드 펀딩?</a></li>
           
         </ul>
       </li><!-- / 정보 라운지 -->
       
      <!-- 더보기 -->
       <li class="dropdown" style="font-size:24px;">
         <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350" role="button" aria-haspopup="true" aria-expanded="false">더보기 <span class="caret"></span></a>
         <ul class="dropdown-menu">
           <div class="row">
             
             <!-- 소개 -->
             <div class="col-lg-6 mb-sm-30">
               <li class="dropdown-header">소개</li>
               <li role="separator" class="divider"></li>
               <li><a href="${path }/user/about-us">회사 소개</a></li>
             </div>

             <!-- 공지사항 -->
             <div class="col-lg-6 mb-sm-30">
               <li class="dropdown-header">공지사항</li>
               <li role="separator" class="divider"></li>
               <li><a href="${path }/user/notice">공지사항</a></li>
               <li><a href="${path }/user/faq">FAQ</a></li>
               <li><a href="${path}/user/login">1:1문의</a></li>
             </div>

           </div><!-- / .row -->
         </ul><!-- / .dropdown-menu -->
       </li><!-- / 더보기 -->
       <li class="dropdown" style="font-size:24px;">
 		<a href="http://localhost/stock/user/stock_board">EZ STOCK</a>
  		</li>
	 </ul>
     <!-- Navbar Links Right -->
     <ul class="nav navbar-nav navbar-right">
       <!-- Languages -->
       <li class="dropdown">
         <a href="${path }/user/login">로그인/회원가입</a>
       </li><!-- / Languages -->

     </ul><!-- / .nav .navbar-nav .navbar-right -->

   </div><!--/.navbar-collapse -->
 </div><!-- / .container -->
</nav><!-- / .navbar -->
</c:if>


<!-- ========== 로그인 상태 Navigation ========== -->
<c:if test="${pageContext.request.userPrincipal.name != null}">
<nav class="navbar navbar-default navbar-static-top mega navbar-trans">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>

      <!-- Logo -->
     <a class="navbar-brand" href="${path}/user/main"><img class="navbar-logo" src="${project }assets/images/logo.png" alt="Definity - Logo"></a>
   </div><!-- / .navbar-header -->

   <!-- Navbar Links -->
   <div id="navbar" class="navbar-collapse collapse">
     <ul class="nav navbar-nav">

       <!-- 홈 -->
       <li class="dropdown" style="font-size:24px;">
         <a href="${path }/user/main">홈</a>
       </li><!-- / 홈 -->
       
		<!-- 펀딩하기 -->
       <li class="dropdown" style="font-size:24px;">
         <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350" role="button" aria-haspopup="true" aria-expanded="false">펀딩하기 <span class="caret"></span></a>
         <ul class="dropdown-menu">
           <li><a href="${path }/user/bescheduled">오픈 예정</a></li>
           <li><a href="${path }/user/fundinglist">모집중인 프로젝트</a></li>
         </ul>
       </li><!-- / 펀딩하기 -->
       
       <!-- 펀딩받기 -->
       <li class="dropdown" style="font-size:24px;">
         <a href="${path }/user/gotfund">펀딩신청</a>
       </li><!-- / 펀딩받기 -->
       
        <!-- 정보 라운지  -->
       <li class="dropdown" style="font-size:24px;">
         <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350" role="button" aria-haspopup="true" aria-expanded="false">정보 라운지<span class="caret"></span></a>
         <ul class="dropdown-menu">
           <li><a href="${path }/user/crowdfunding">크라우드 펀딩?</a></li>
           <li><a href="pages/blog/blog-right-sidebar.html">투자 정보</a></li>
         </ul>
       </li><!-- / 정보 라운지 -->
       
      <!-- 더보기 -->
       <li class="dropdown" style="font-size:24px;">
         <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350" role="button" aria-haspopup="true" aria-expanded="false">더보기 <span class="caret"></span></a>
         <ul class="dropdown-menu">
           <div class="row">
             
             <!-- 소개 -->
             <div class="col-lg-6 mb-sm-30">
               <li class="dropdown-header">소개</li>
               <li role="separator" class="divider"></li>
               <li><a href="${path }/user/about-us">회사 소개</a></li>
             </div>

             <!-- 공지사항 -->
             <div class="col-lg-6 mb-sm-30">
               <li class="dropdown-header">공지사항</li>
               <li role="separator" class="divider"></li>
               <li><a href="${path }/user/notice">공지사항</a></li>
               <li><a href="${path }/user/faq">FAQ</a></li>
               <c:if test="${pageContext.request.userPrincipal.name != null}">
               <li><a href="${path }/user/mypage">MY FUND</a></li>
               </c:if>
               <li><a href="${path}/user/userInquiry?writer=${pageContext.request.userPrincipal.name}">1:1문의</a></li>
              <c:if test="${pageContext.request.userPrincipal.name == 'host'}">
				<li class="dropdown">
         		<a href="${path}/user/hostPage">hostpage</a>
       			</li><!-- / 관리자페이지 -->
			   </c:if>
             </div>
           </div><!-- / .row -->
         </ul><!-- / .dropdown-menu -->
       </li><!-- / 더보기 -->
       <li class="dropdown" style="font-size:24px;">
 		<a href="http://localhost/stock/user/stock_board">EZ STOCK</a>
  		</li>
	 </ul>
     <!-- Navbar Links Right -->
     <ul class="nav navbar-nav navbar-right">

		<%-- <c:if test="${pageContext.request.userPrincipal.name == 'host'}">
			<li class="dropdown">
         		<a href="${path}/admin/hostPage">hostpage</a>
       		</li><!-- / 관리자페이지 -->
		</c:if> --%>
		
       <!-- Languages -->
       <li class="dropdown">
         <a href="${path}/user/logout">로그아웃</a>
       </li><!-- / Languages -->

     </ul><!-- / .nav .navbar-nav .navbar-right -->

   </div><!--/.navbar-collapse -->
 </div><!-- / .container -->
</nav><!-- / .navbar -->
</c:if>
