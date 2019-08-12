<%@ include file="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- sidebar -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
		 <div class="ulogo">
			 <a href="trading">
			  <!-- logo for regular state and mobile devices -->
			  <span><b>EZ </b>STOCK</span>
			</a>
		</div>
        <div class="image">
          <img src="${project}images/user2-160x160.jpg" class="rounded-circle" alt="User Image">
        </div>
        <div class="info">
          <p>사용자님 환영합니다!</p>
			<a href="" class="link" data-toggle="tooltip" title="" data-original-title="Settings"><i class="ion ion-gear-b"></i></a>
            <a href="" class="link" data-toggle="tooltip" title="" data-original-title="Email"><i class="ion ion-android-mail"></i></a>
            <a href="" class="link" data-toggle="tooltip" title="" data-original-title="Logout"><i class="ion ion-power"></i></a>
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
            <li><a href="${path}/user/trading">이체 한도/결과 조회</a></li>
            <li><a href="${path}/user/trading">거래 내역 조회</a></li>
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
            <li><a href="${path}/user/trading">즉시주문</a></li>
            <li><a href="${path}/user/stockBooking">예약/기간 예약 주문</a></li>
            <li><a href="${path}/user/company">종목 상세 정보</a></li>
            <li><a href="${path}/user/interestedItems">관심 종목</a></li>
          </ul>
        </li>
        
        <li class="treeview">
          <a href="#">
            <i class="icon-compass"></i>
            <span>차트 및 종목 분석</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="${path}/user/choicetheme">종목 분석</a></li>
            <li><a href="${path}/user/detailStock">기업 재무 정보</a></li>
            <li><a href="${path}/user/news">최신 경제 뉴스</a></li>
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
            <li><a href="${path}/user/trading">이체</a></li>
            <li><a href="${path}/user/trading">계좌 설정</a></li>
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
            <li><a href="${path}/user/trading">공지사항</a></li>
            <li><a href="${path}/user/trading">이용가이드</a></li>
            <li><a href="${path}/user/trading">1대1 문의</a></li>
          </ul>
        </li>
      </ul>
    </section>