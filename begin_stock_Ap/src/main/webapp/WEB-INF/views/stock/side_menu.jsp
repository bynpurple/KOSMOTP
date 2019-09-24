<%@ include file="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- sidebar -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
		 <div class="ulogo">
			 <a href="${path}/user/stock_board">
			  <!-- logo for regular state and mobile devices -->
			  <span><b>EZ </b>STOCK</span>
			</a>
		</div>
        <div class="image">
          <img src="${project}images/user2-160x160.jpg" class="rounded-circle" alt="User Image">
        </div>
        <div class="info">
        	<c:if test="${pageContext.request.userPrincipal.name != null}">
	        	<p>${pageContext.request.userPrincipal.name}님 환영합니다!</p>
	         </c:if>
	         <c:if test="${pageContext.request.userPrincipal.name == null}">
	        	<p>EZ STOCK에 오신걸 환영합니다!</p>
	         </c:if>
	         <c:if test="${pageContext.request.userPrincipal.name != null}">
	        	<a href="${path}/user/logout" class="link" data-toggle="tooltip" title="" data-original-title="로그아웃"><i class="ion ion-power"></i></a>
	         </c:if>
			<c:if test="${pageContext.request.userPrincipal.name == null}">
	        	<a href="${path}/user/login" class="link" data-toggle="tooltip" title="" data-original-title="로그인"><i class="ion ion-power"></i></a>
	         </c:if>
	         <c:if test="${pageContext.request.userPrincipal.name != null}">
             	<a href="${path}/user/message?username=${pageContext.request.userPrincipal.name}" class="link" data-toggle="tooltip" title="" data-original-title="메시지"><i class="ion ion-android-mail"></i></a>
             </c:if>
        </div>
      </div>
      <!-- sidebar menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="treeview">
          <a href="#">
            <i class="icon-chart"></i>
            <span>My STOCK</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
         	<li><a href="${path}/user/mypage">마이페이지</a></li>
            <li><a href="${path}/user/searchTrading?username=${pageContext.request.userPrincipal.name}">거래 내역 조회</a></li>
          </ul>
        </li>
        
        <li class="treeview">
          <a href="#">
            <i class="icon-compass"></i>
            <span>트레이딩</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="${path}/user/trading?username=${pageContext.request.userPrincipal.name}">즉시주문</a></li>
            <li><a href="${path}/user/stockBooking?username=${pageContext.request.userPrincipal.name}">예약/기간 예약 주문</a></li>
            <li><a href="${path}/user/company">종목 상세 정보</a></li>
            <li><a href="${path}/user/interestedItems">관심 종목</a></li>
          </ul>
        </li>
        
        <li class="treeview">
          <a href="#">
            <i class="icon-compass"></i>
            <span>테마 분석 및 뉴스</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="${path}/user/choicetheme">테마 정보</a></li>
            <li><a href="${path}/user/chooseTheme">테마 분석</a></li>
            <li><a href="${path}/user/news">최신 경제 뉴스</a></li>
            <li><a href="${path}/user/news222">테마별 경제 뉴스</a></li>
          </ul>
        </li>
        
        <li class="treeview">
          <a href="#">
            <i class="icon-compass"></i>
            <span>이체</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="${path}/user/transfer_limit?username=${pageContext.request.userPrincipal.name}">이체 /결과 조회</a></li>
          </ul>
        </li>
        
        <li class="treeview">
          <a href="#">
            <i class="icon-compass"></i>
            <span>고객센터</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="${path}/user/notice">공지사항</a></li>
            <li><a href="${path}/user/userInquiry?writer=${pageContext.request.userPrincipal.name}">1대1 문의</a></li>
            <li><a href="${path}/user/faq">FAQ</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href ="#">
            <i class="icon-compass"></i>
            <span onclick="location.href='http://localhost/funding/user/main'">EZ FUND</span>
          </a>
        </li>
        
        <!-- 관리자 전용 추가 메뉴  -->
        <c:if test="${pageContext.request.userPrincipal.name == 'host'}">
        <li class="treeview">
          <a href="#">
            <i class="icon-compass"></i>
            <span>관리자 페이지</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="${path}/user/hostPage?username=${pageContext.request.userPrincipal.name}">관리자페이지</a></li>
            <li><a href="${path}/user/notice">공지사항</a></li>
            <li><a href="${path}/user/entireSendMessage">단체 메시지 전송</a></li>
          </ul>
        </li>
        </c:if>
        
      </ul>
    </section>
