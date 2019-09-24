<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

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
               <li><a href="${path}/user/userInquiry?writer=${pageContext.request.userPrincipal.name}">1:1문의</a></li>
             </div>

           </div><!-- / .row -->
         </ul><!-- / .dropdown-menu -->
       </li><!-- / 더보기 -->
	 </ul>
     <!-- Navbar Links Right -->
     <ul class="nav navbar-nav navbar-right">

       <!-- Cart -->
       <li class="dropdown cart-nav">
         <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-shopping-cart"></i> Cart</a>
         <ul class="dropdown-menu cart-dropdown">
           <li class="dropdown-header">Cart</li>
           <li role="separator" class="divider cart-sep-top"></li>
           <li>
             <div class="cart-item">
               <a href="pages/shop/shop-single.html"><img src="${project }assets/images/shop/p-thumb-1.jpg" alt="Product Name" class="p-thumb"></a>
               <a href="#" class="cart-remove-btn"><span class="linea-arrows-square-remove"></span></a>
               <a href="pages/shop/shop-single.html" class="cp-name">Light Blue Suit</a>
               <p class="cp-price">1 x $359.99</p>
             </div>

             <div class="cart-item">
               <a href="pages/shop/shop-single.html"><img src="${project }assets/images/shop/p-thumb-2.jpg" alt="Product Name" class="p-thumb"></a>
               <a href="#" class="cart-remove-btn"><span class="linea-arrows-square-remove"></span></a>
               <a href="pages/shop/shop-single.html" class="cp-name">Dark Blue Suit</a>
               <p class="cp-price">1 x $459.99</p>
             </div>
           </li>
           <li role="separator" class="divider cart-sep-bot"></li>
           <li>
             <h6 class="item-totals">Items Total: <span>$718.98</span></h6>
           </li>
           <li class="cart-btns">
             <a href="${project }pages/shop/shop-checkout.html" class="btn-ghost btn-block">View Cart</a>
             <a href="${project }pages/shop/shop-checkout.html" class="btn btn-block">Checkout</a>
           </li>

         </ul>
       </li><!-- / Cart -->

       <!-- Search -->
       <li class="dropdown">
         <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-search"></i> Search</a>
         <ul class="dropdown-menu search-dropdown">
           <li><form action="post"><input type="search" class="form-control" placeholder="Search..."></form></li>
         </ul>
       </li><!-- / Search -->

       <!-- Languages -->
       <li class="dropdown">
         <a href="${path }/user/login">Login</a>
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
       <li class="dropdown">
         <a href="${path}/user/main">홈</a>
       </li><!-- / 홈 -->
       
		<!-- 펀딩하기 -->
       <li class="dropdown">
         <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350" role="button" aria-haspopup="true" aria-expanded="false">펀딩하기 <span class="caret"></span></a>
         <ul class="dropdown-menu">
           <li><a href="pages/blog/blog-left-sidebar.html">오픈 예정</a></li>
           <li><a href="${path}/user/fundinglist">모집중인 프로젝트</a></li>
         </ul>
       </li><!-- / 펀딩하기 -->
       
       <!-- 펀딩받기 -->
       <li class="dropdown">
         <a href="http://localhost/stock/user/trading?username=${pageContext.request.userPrincipal.name}">펀딩신청</a>
       </li><!-- / 펀딩받기 -->
       
        <!-- 정보 라운지  -->
       <li class="dropdown">
         <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350" role="button" aria-haspopup="true" aria-expanded="false">정보 라운지<span class="caret"></span></a>
         <ul class="dropdown-menu">
           <li><a href="${path}/user/crowdfunding">크라우드 펀딩?</a></li>
           <li><a href="pages/blog/blog-right-sidebar.html">투자 정보</a></li>
         </ul>
       </li><!-- / 정보 라운지 -->
       
       <!-- 더보기 -->
       <li class="dropdown">
         <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350" role="button" aria-haspopup="true" aria-expanded="false">더보기 <span class="caret"></span></a>
         <ul class="dropdown-menu">
           <div class="row">
             
             <!-- 소개 -->
             <div class="col-lg-6 mb-sm-30">
               <li class="dropdown-header">소개</li>
               <li role="separator" class="divider"></li>
               <li><a href="${path}/user/about-us">회사 소개</a></li>
             </div>

             <!-- 공지사항 -->
             <div class="col-lg-6 mb-sm-30">
               <li class="dropdown-header">공지사항</li>
               <li role="separator" class="divider"></li>
               <li><a href="${path}/user/notice">공지사항</a></li>
               <li><a href="${path}/user/faq">FAQ</a></li>
               <li><a href="${path}/user/userInquiry?writer=${pageContext.request.userPrincipal.name}">1:1문의</a></li>
             </div>

           </div><!-- / .row -->
         </ul><!-- / .dropdown-menu -->
       </li><!-- / 더보기 -->
	 </ul>
     <!-- Navbar Links Right -->
     <ul class="nav navbar-nav navbar-right">

       <!-- Cart -->
           <!-- Cart -->
       <c:if test="${pageContext.request.userPrincipal.name != 'host'}">
	       <li class="dropdown cart-nav">
	         <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-shopping-cart"></i> Cart</a>
	         <ul class="dropdown-menu cart-dropdown">
	           <li class="dropdown-header">Cart</li>
	           <li role="separator" class="divider cart-sep-top"></li>
	           <li>
	             <div class="cart-item">
	               <a href="pages/shop/shop-single.html"><img src="${project }assets/images/shop/p-thumb-1.jpg" alt="Product Name" class="p-thumb"></a>
	               <a href="#" class="cart-remove-btn"><span class="linea-arrows-square-remove"></span></a>
	               <a href="pages/shop/shop-single.html" class="cp-name">Light Blue Suit</a>
	               <p class="cp-price">1 x $359.99</p>
	             </div>
	
	             <div class="cart-item">
	               <a href="pages/shop/shop-single.html"><img src="${project }assets/images/shop/p-thumb-2.jpg" alt="Product Name" class="p-thumb"></a>
	               <a href="#" class="cart-remove-btn"><span class="linea-arrows-square-remove"></span></a>
	               <a href="pages/shop/shop-single.html" class="cp-name">Dark Blue Suit</a>
	               <p class="cp-price">1 x $459.99</p>
	             </div>
	           </li>
	           <li role="separator" class="divider cart-sep-bot"></li>
	           <li>
	             <h6 class="item-totals">Items Total: <span>$718.98</span></h6>
	           </li>
	           <li class="cart-btns">
	             <a href="${project }pages/shop/shop-checkout.html" class="btn-ghost btn-block">View Cart</a>
	             <a href="${project }pages/shop/shop-checkout.html" class="btn btn-block">Checkout</a>
	           </li>
	
	         </ul>
	       </li><!-- / Cart -->
		</c:if>
		<c:if test="${pageContext.request.userPrincipal.name == 'host'}">
			<li class="dropdown">
         		<a href="${path}/admin/hostPage">hostpage</a>
       		</li><!-- / 관리자페이지 -->
		</c:if>
		

       <!-- Search -->
       <li class="dropdown">
         <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-search"></i> Search</a>
         <ul class="dropdown-menu search-dropdown">
           <li><form action="post"><input type="search" class="form-control" placeholder="Search..."></form></li>
         </ul>
       </li><!-- / Search -->

       <!-- Languages -->
       <li class="dropdown">
         <a href="${path}/user/logout">Logout</a>
       </li><!-- / Languages -->

     </ul><!-- / .nav .navbar-nav .navbar-right -->

   </div><!--/.navbar-collapse -->
 </div><!-- / .container -->
</nav><!-- / .navbar -->
</c:if>
