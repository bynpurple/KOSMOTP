<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="${project}images/favicon.ico">

    <title>Crypto Admin - Members Profile</title>
  
	<!-- Bootstrap 4.0-->
	<link rel="stylesheet" href="${project}assets/vendor_components/bootstrap/dist/css/bootstrap.min.css">
	
	<!-- Bootstrap extend-->
	<link rel="stylesheet" href="${project}css/bootstrap-extend.css">

	<!-- Theme style -->
	<link rel="stylesheet" href="${project}css/master_style.css">

	<!-- Crypto_Admin skins -->
	<link rel="stylesheet" href="${project}css/skins/_all-skins.css">	

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

</head>
<body class="hold-transition skin-black sidebar-mini">

<%@ include file="../include/header.jsp"%>


<!-- Site wrapper -->
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="${project}index.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
	  <b class="logo-mini">
		  <span class="light-logo"><img src="${project}images/logo-light.png" alt="logo"></span>
		  <span class="dark-logo"><img src="${project}images/logo-dark.png" alt="logo"></span>
	  </b>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg">
		  <img src="${project}images/logo-light-text.png" alt="logo" class="light-logo">
	  	  <img src="${project}images/logo-dark-text.png" alt="logo" class="dark-logo">
	  </span>
    </a>
    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
		  
		  <li class="search-box">
            <a class="nav-link hidden-sm-down" href="javascript:void(0)"><i class="mdi mdi-magnify"></i></a>
            <form class="app-search" style="display: none;">
                <input type="text" class="form-control" placeholder="Search &amp; enter"> <a class="srh-btn"><i class="ti-close"></i></a>
			</form>
          </li>			
		  
          <!-- Messages -->
          <li class="dropdown messages-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="mdi mdi-email"></i>
            </a>
            <ul class="dropdown-menu scale-up">
              <li class="header">You have 5 messages</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu inner-content-div">
                  <li><!-- start message -->
                    <a href="#">
                      <div class="pull-left">
                        <img src="${project}images/user2-160x160.jpg" class="rounded-circle" alt="User Image">
                      </div>
                      <div class="mail-contnet">
                         <h4>
                          Lorem Ipsum
                          <small><i class="fa fa-clock-o"></i> 15 mins</small>
                         </h4>
                         <span>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span>
                      </div>
                    </a>
                  </li>
                  <!-- end message -->
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="${project}images/user3-128x128.jpg" class="rounded-circle" alt="User Image">
                      </div>
                      <div class="mail-contnet">
                         <h4>
                          Nullam tempor
                          <small><i class="fa fa-clock-o"></i> 4 hours</small>
                         </h4>
                         <span>Curabitur facilisis erat quis metus congue viverra.</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="../../../images/user4-128x128.jpg" class="rounded-circle" alt="User Image">
                      </div>
                      <div class="mail-contnet">
                         <h4>
                          Proin venenatis
                          <small><i class="fa fa-clock-o"></i> Today</small>
                         </h4>
                         <span>Vestibulum nec ligula nec quam sodales rutrum sed luctus.</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="${project}images/user3-128x128.jpg" class="rounded-circle" alt="User Image">
                      </div>
                      <div class="mail-contnet">
                         <h4>
                          Praesent suscipit
                        <small><i class="fa fa-clock-o"></i> Yesterday</small>
                         </h4>
                         <span>Curabitur quis risus aliquet, luctus arcu nec, venenatis neque.</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="../../../images/user4-128x128.jpg" class="rounded-circle" alt="User Image">
                      </div>
                      <div class="mail-contnet">
                         <h4>
                          Donec tempor
                          <small><i class="fa fa-clock-o"></i> 2 days</small>
                         </h4>
                         <span>Praesent vitae tellus eget nibh lacinia pretium.</span>
                      </div>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="footer"><a href="#">See all e-Mails</a></li>
            </ul>
          </li>
          <!-- Notifications -->
          <li class="dropdown notifications-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="mdi mdi-bell"></i>
            </a>
            <ul class="dropdown-menu scale-up">
              <li class="header">You have 7 notifications</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu inner-content-div">
                  <li>
                    <a href="#">
                      <i class="fa fa-users text-aqua"></i> Curabitur id eros quis nunc suscipit blandit.
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-warning text-yellow"></i> Duis malesuada justo eu sapien elementum, in semper diam posuere.
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-users text-red"></i> Donec at nisi sit amet tortor commodo porttitor pretium a erat.
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-shopping-cart text-green"></i> In gravida mauris et nisi
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-user text-red"></i> Praesent eu lacus in libero dictum fermentum.
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-user text-red"></i> Nunc fringilla lorem 
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-user text-red"></i> Nullam euismod dolor ut quam interdum, at scelerisque ipsum imperdiet.
                    </a>
                  </li>
                </ul>
              </li>
              <li class="footer"><a href="#">View all</a></li>
            </ul>
          </li>
          <!-- Tasks -->
          <li class="dropdown tasks-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="mdi mdi-message"></i>
            </a>
            <ul class="dropdown-menu scale-up">
              <li class="header">You have 6 tasks</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu inner-content-div">
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Lorem ipsum dolor sit amet
                        <small class="pull-right">30%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-aqua" style="width: 30%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">30% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Vestibulum nec ligula
                        <small class="pull-right">20%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-danger" style="width: 20%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">20% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Donec id leo ut ipsum
                        <small class="pull-right">70%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-light-blue" style="width: 70%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">70% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Praesent vitae tellus
                        <small class="pull-right">40%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-yellow" style="width: 40%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">40% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Nam varius sapien
                        <small class="pull-right">80%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-red" style="width: 80%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">80% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Nunc fringilla
                        <small class="pull-right">90%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-primary" style="width: 90%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">90% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                </ul>
              </li>
              <li class="footer">
                <a href="#">View all tasks</a>
              </li>
            </ul>
          </li>
		  <!-- User Account -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="${project}/images/user5-128x128.jpg" class="user-image rounded-circle" alt="User Image">
            </a>
            <ul class="dropdown-menu scale-up">
              <!-- User image -->
              <li class="user-header">
                <img src="../../../images/user5-128x128.jpg" class="float-left rounded-circle" alt="User Image">

                <p>
                  Romi Roy
                  <small class="mb-5">jb@gmail.com</small>
                  <a href="#" class="btn btn-danger btn-sm btn-rounded">View Profile</a>
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row no-gutters">
                  <div class="col-12 text-left">
                    <a href="#"><i class="ion ion-person"></i> My Profile</a>
                  </div>
                  <div class="col-12 text-left">
                    <a href="#"><i class="ion ion-email-unread"></i> Inbox</a>
                  </div>
                  <div class="col-12 text-left">
                    <a href="#"><i class="ion ion-settings"></i> Setting</a>
                  </div>
				<div role="separator" class="divider col-12"></div>
				  <div class="col-12 text-left">
                    <a href="#"><i class="ti-settings"></i> Account Setting</a>
                  </div>
				<div role="separator" class="divider col-12"></div>
				  <div class="col-12 text-left">
                    <a href="#"><i class="fa fa-power-off"></i> Logout</a>
                  </div>				
                </div>
                <!-- /.row -->
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-cog fa-spin"></i></a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  
  <aside class="main-sidebar">
    <%@ include file="side_menu.jsp" %>
  </aside>
  <!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        	My Page - 마이페이지
      </h1>
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="breadcrumb-item"><a href="#">Members</a></li>
        <li class="breadcrumb-item active">Members Profile</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

	<div class="box box-inverse box-dark bg-hexagons-white">
        <div class="box-body">
			<div class="row">
				<div class="col-md-3 col-12">
				 	<div class="text-center">
                        <h1 class="text-bold count">325</h1>
                        <hr class="w-50 my-5 b-3 border-yellow">
                        <h5 class="mt-10">Transactions in last 24h</h5>
                    </div>
				</div>
				<div class="col-md-3 col-12">
				 	<div class="text-center">
                        <h1 class="text-bold count">40</h1>
                        <hr class="w-50 my-5 b-3 border-yellow">
                        <h5 class="mt-10">Transactions per hour</h5>
                    </div>
				</div>
				<div class="col-md-3 col-12">
				 	<div class="text-center">
                        <h1 class="text-bold count">150</h1>
                        <hr class="w-50 my-5 b-3 border-yellow">
                        <h5 class="mt-10">Largest Transactions</h5>
                    </div>
				</div>
				<div class="col-md-3 col-12">
				 	<div class="text-center">
                        <h1 class="text-bold count">8</h1>
                        <hr class="w-50 my-5 b-3 border-yellow">
                        <h5 class="mt-10">Years of Experience</h5>
                    </div>
				</div>
			</div>
        </div>
        <!-- /.box-body -->
      </div>


	<!-- 회원정보칸 -->
      <div class="row">
        <div class="col-xl-4 col-lg-5">

          <!-- Profile Image -->
          <div class="box bg-yellow bg-deathstar-dark" style="color:black;">
            <div class="box-body box-profile" style="color:black;">

              <h2 class="profile-username text-center mb-0"> oo님 </h2>
            
              <div class="row">
				<div class="col-12">
					<div class="media-list media-list-hover media-list-divided w-p100 mt-30">
						<h4 class="media media-single p-15">
						  <span class="title">내 계좌 000-1111-22222 </span>
						</h4>
						<h4 class="media media-single p-15">
						  <i class="fa fa-arrow-circle-o-right mr-10"></i><span class="title">계좌정보확인</span>
						</h4>

						<h4 class="media media-single p-15">
						<a href="interestedItems.do" style="text-decoration:none; color:black;">
						  <i class="fa fa-arrow-circle-o-right mr-10"></i><span class="title">관심종목</span>
						</a>
						</h4>

						<h4 class="media media-single p-15">
						  <i class="fa fa-arrow-circle-o-right mr-10"></i><span class="title">회원정보 확인</span>
						</h4>
						
						
						<h4 class="media media-single p-15">
						  <i class="fa fa-arrow-circle-o-right mr-10"></i><span class="title">성과분석</span>
						</h4>
						
					</div>
				</div>
				
				<h2 class="title w-p100 mt-10 mb-0 p-20">Last Transactions</h2>
				<div class="col-12">
					<div class="media-list media-list-hover w-p100 mt-0">
						<h5 class="media media-single py-10 px-0 w-p100 justify-content-between">
							  <p>
							  <i class="fa fa-circle text-red pr-10 font-size-12"></i>Deal number 1548
							  <span class="subtitle pl-20 mt-10">by<span class="text-red">Johen Doe</span></span>						  
							  </p>
							  <p class="text-right pull-right"><span class="badge badge-sm badge-danger mb-10">sell</span><br>0.12458921 BTC</p>
						</h5>
						<h5 class="media media-single py-10 px-0 w-p100 justify-content-between">
							  <p>
							  <i class="fa fa-circle text-success pr-10 font-size-12"></i>Deal number 1548
							  <span class="subtitle pl-20 mt-10">by<span class="text-success">Johen Doe</span></span>						  
							  </p>
							  <p class="text-right pull-right"><span class="badge badge-sm badge-success mb-10">sell</span><br>0.12458921 BTC</p>
						</h5>
						<h5 class="media media-single py-10 px-0 w-p100 justify-content-between">
							  <p>
							  <i class="fa fa-circle text-success pr-10 font-size-12"></i>Deal number 1548
							  <span class="subtitle pl-20 mt-10">by<span class="text-success">Johen Doe</span></span>						  
							  </p>
							  <p class="text-right pull-right"><span class="badge badge-sm badge-success mb-10">sell</span><br>0.12458921 BTC</p>
						</h5>
						<h5 class="media media-single py-10 px-0 w-p100 justify-content-between">
							  <p>
							  <i class="fa fa-circle text-red pr-10 font-size-12"></i>Deal number 1548
							  <span class="subtitle pl-20 mt-10">by<span class="text-red">Johen Doe</span></span>						  
							  </p>
							  <p class="text-right pull-right"><span class="badge badge-sm badge-danger mb-10">sell</span><br>0.12458921 BTC</p>
						</h5>
						<h5 class="media media-single py-10 px-0 w-p100 justify-content-between">
							  <p>
							  <i class="fa fa-circle text-success pr-10 font-size-12"></i>Deal number 1548
							  <span class="subtitle pl-20 mt-10">by<span class="text-success">Johen Doe</span></span>						  
							  </p>
							  <p class="text-right pull-right"><span class="badge badge-sm badge-success mb-10">sell</span><br>0.12458921 BTC</p>
						</h5>
					</div>
				</div>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        
        
       <!--  <div class="col-xl-8 col-lg-7"> -->
       <div class="col-lg-8 col-12">
          <div class="box box-solid bg-black">
			
			
			<!-- 시작  -->
			
			<!-- <div class="col-lg-9 col-12"> -->
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              
              <li><a class="" href="#timeline" data-toggle="tab">보유주식현황(등락률 그래프 등)</a></li>
              <li><a href="#activity" data-toggle="tab" class="">거래내용 종합</a></li>
              <li><a href="#settings" data-toggle="tab" class="active show">회원정보 수정</a></li>
            </ul>
                        
            <div class="tab-content">
             
             <div class="tab-pane" id="timeline">
             
             	<!-- 거래 표  -->
             		<div class="box-body">
					<div class="table-responsive">
						<table class="table no-margin table-hover">
						  <thead>					
							<tr class="bg-dark">
							  <th class="text-yellow">Transaction Hash</th>
							  <th class="text-yellow">BTC</th>
							  <th class="text-yellow">Time</th>
							  <th class="text-yellow">Miner Preference</th>
							  <th class="text-yellow">Status</th>
							</tr>
						  </thead>
						  <tbody>
							<tr>
							  <td>
								<a href="#" class="text-yellow hover-warning">
								  7d2c7b06afa0
								</a>
								...
							  </td>
							  <td>1.0126281 BTC</td>
							  <td>
								<time class="timeago" datetime="2018-02-01T13:38:01Z" title="2018-02-01 13:38 GMT">2 minutes ago</time>
							  </td>
							  <td>medium</td>
							  <td><span class="label label-success">Confirmed</span></td>
							</tr>
							<tr>
							  <td>
								<a href="#" class="text-yellow hover-warning">
								  5de67405bfc6
								</a>
								...
							  </td>
							  <td>0.10522881 BTC</td>
							  <td>
								<time class="timeago" datetime="2018-02-01T13:38:01Z" title="2018-02-01 13:38 GMT">2 minutes ago</time>
							  </td>
							  <td>high</td>
							  <td><span class="label label-warning">Unconfirmed</span></td>
							</tr>
							<tr>
							  <td>
								<a href="#" class="text-yellow hover-warning">
								  583de1b0cec
								</a>
								...
							  </td>
							  <td>0.40622033 BTC</td>
							  <td>
								<time class="timeago" datetime="2018-02-01T13:38:01Z" title="2018-02-01 13:38 GMT">2 minutes ago</time>
							  </td>
							  <td>high</td>
							  <td><span class="label label-success">Confirmed</span></td>
							</tr>
							<tr>
							  <td>
								<a href="#" class="text-yellow hover-warning">
								  5493bcfa5f7f
								</a>
								...
							  </td>
							  <td>4.43670578 BTC</td>
							  <td>
								<time class="timeago" datetime="2018-02-01T13:38:00Z" title="2018-02-01 13:38 GMT">2 minutes ago</time>
							  </td>
							  <td>high</td>
							  <td><span class="label label-danger">Canceled</span></td>
							</tr>
							<tr>
							  <td>
								<a href="#" class="text-yellow hover-warning">
								  4d66087926b5
								</a>
								...
							  </td>
							  <td>22.01099978 BTC</td>
							  <td>
								<time class="timeago" datetime="2018-02-01T13:38:00Z" title="2018-02-01 13:38 GMT">2 minutes ago</time>
							  </td>
							  <td>high</td>
							  <td><span class="label label-danger">Canceled</span></td>
							</tr>
							<tr>
							  <td>
								<a href="#" class="text-yellow hover-warning">
								  60935e53c894
								</a>
								...
							  </td>
							  <td>0.0024534 BTC</td>
							  <td>
								<time class="timeago" datetime="2018-02-01T13:38:00Z" title="2018-02-01 13:38 GMT">2 minutes ago</time>
							  </td>
							  <td>high</td>
							  <td><span class="label label-warning">Unconfirmed</span></td>
							</tr>
							<tr>
							  <td>
								<a href="#" class="text-yellow hover-warning">
								  b1236b76cf5e
								</a>
								...
							  </td>
							  <td>0.00518486 BTC</td>
							  <td>
								<time class="timeago" datetime="2018-02-01T13:37:59Z" title="2018-02-01 13:37 GMT">2 minutes ago</time>
							  </td>
							  <td>medium</td>
							  <td><span class="label label-success">Confirmed</span></td>
							</tr>
							<tr>
							  <td>
								<a href="#" class="text-yellow hover-warning">
								  d0125cb78c078
								</a>
								...
							  </td>
							  <td>0.08039395 BTC</td>

							  <td>
								<time class="timeago" datetime="2018-02-01T13:37:59Z" title="2018-02-01 13:37 GMT">2 minutes ago</time>
							  </td>
							  <td>high</td>
							  <td><span class="label label-success">Confirmed</span></td>
							</tr>
							<tr>
							  <td>
								<a href="#" class="text-yellow hover-warning">
								  b6b591254835c
								</a>
								...
							  </td>
							  <td>55.99698306 BTC</td>
							  <td>
								<time class="timeago" datetime="2018-02-01T13:37:58Z" title="2018-02-01 13:37 GMT">2 minutes ago</time>
							  </td>
							  <td>high</td>
							  <td><span class="label label-success">Confirmed</span></td>
							</tr>
							<tr>
							  <td>
								<a href="#" class="text-yellow hover-warning">
								  d261fb1d717d
								</a>
								...
							  </td>
							  <td>0.0281818 BTC</td>
							  <td>
								<time class="timeago" datetime="2018-02-01T13:37:58Z" title="2018-02-01 13:37 GMT">2 minutes ago</time>
							  </td>
							  <td>high</td>
							  <td><span class="label label-danger">Canceled</span></td>
							</tr>
						  </tbody>
						</table>
					</div>
				</div>
             	
             	
             	<!-- 거래 표 끝  -->
             
              	<!-- 그래프  -->
              		<div class="box">
			            <div class="box-header with-border">
			              <h3 class="box-title">Daly Analysis</h3>
			
			              <div class="box-tools pull-right">
			                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
			                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
			              </div>
			            </div>
			            <div class="box-body">
			              <div class="box-body">
             				 <div class="chart">
	              			  <div id="e_chart_2" class="" style="height: 500px; -webkit-tap-highlight-color: transparent; user-select: none; position: relative;" _echarts_instance_="ec_1565341255373"><div style="position: relative; overflow: hidden; width: 767px; height: 500px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;"><canvas data-zr-dom-id="zr_0" width="767" height="500" style="position: absolute; left: 0px; top: 0px; width: 767px; height: 500px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas></div><div style="position: absolute; display: none; border-style: solid; white-space: nowrap; z-index: 9999999; transition: left 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s, top 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s; background-color: rgba(50, 50, 50, 0.7); border-width: 0px; border-color: rgb(51, 51, 51); border-radius: 4px; color: rgb(255, 255, 255); font: 14px/21px &quot;Microsoft YaHei&quot;; padding: 5px; left: 440px; top: 82px;">Thursday<br><span style="display:inline-block;margin-right:5px;border-radius:10px;width:10px;height:10px;background-color:#00c292;"></span>Maximum: 234</div></div>	
	            			  </div>
            			</div>
			            </div>
			            <!-- /.box-body -->
		          </div>
                <!-- 그래프 끝  -->
                
                
              </div>    
              <!-- /.tab-pane -->
              
              <div class="tab-pane" id="activity">
                <!-- 최근거래  -->
                
                <div class="box-body">
					<div class="table-responsive">
						<table class="table no-margin no-border b-1 border-gray bg-dark">
						  <thead>
							<tr class="bg-yellow">
							  <th>Id</th>
							  <th>Time</th>
							  <th>Transactions</th>
							  <th>Sent</th>
							  <th>Fees</th>
							  <th>Block Size</th>
							</tr>
						  </thead>
						  <tbody>
							<tr>
							  <td>
								<a href="#" class="text-yellow hover-warning">145236</a>
							  </td>
							  <td>59&nbsp;seconds ago</td>
							  <td>2,122</td>
							  <td>16,819.638 BTC</td>
							  <td>1.796 BTC</td>
							  <td>546,573</td>
							</tr>

							<tr>
							  <td>
								<a href="#" class="text-yellow hover-warning">145237</a>
							  </td>
							  <td>10&nbsp;minutes ago</td>
							  <td>1,807</td>
							  <td>6,410.154 BTC</td>
							  <td>0.982 BTC</td>
							  <td>458,027</td>
							</tr>

							<tr>
							  <td>
								<a href="#" class="text-yellow hover-warning">145238</a>
							  </td>
							  <td>13&nbsp;minutes ago</td>
							  <td>1,980</td>
							  <td>16,541.708 BTC</td>
							  <td>1.855 BTC</td>
							  <td>458,440</td>
							</tr>

							<tr>
							  <td>
								<a href="#" class="text-yellow hover-warning">145239</a>
							  </td>
							  <td>21&nbsp;minutes ago</td>
							  <td>1,781</td>
							  <td>12,009.855 BTC</td>
							  <td>1.963 BTC</td>
							  <td>515,484</td>
							</tr>

							<tr>
							  <td>
								<a href="#" class="text-yellow hover-warning">145239</a>
							  </td>
							  <td>21&nbsp;minutes ago</td>
							  <td>1,781</td>
							  <td>12,009.855 BTC</td>
							  <td>1.963 BTC</td>
							  <td>515,484</td>
							</tr>

							<tr>
							  <td>
								<a href="#" class="text-yellow hover-warning">145240</a>
							  </td>
							  <td>31&nbsp;minutes ago</td>
							  <td>1,590</td>
							  <td>8,166.284 BTC</td>
							  <td>1.923 BTC</td>
							  <td>125,979</td>
							</tr>
							 
							<tr>
							  <td>
								<a href="#" class="text-yellow hover-warning">145236</a>
							  </td>
							  <td>59&nbsp;seconds ago</td>
							  <td>2,122</td>
							  <td>16,819.638 BTC</td>
							  <td>1.796 BTC</td>
							  <td>546,573</td>
							</tr>

							<tr>
							  <td>
								<a href="#" class="text-yellow hover-warning">145237</a>
							  </td>
							  <td>10&nbsp;minutes ago</td>
							  <td>1,807</td>
							  <td>6,410.154 BTC</td>
							  <td>0.982 BTC</td>
							  <td>458,027</td>
							</tr>

							<tr>
							  <td>
								<a href="#" class="text-yellow hover-warning">145238</a>
							  </td>
							  <td>13&nbsp;minutes ago</td>
							  <td>1,980</td>
							  <td>16,541.708 BTC</td>
							  <td>1.855 BTC</td>
							  <td>458,440</td>
							</tr>

							<tr>
							  <td>
								<a href="#" class="text-yellow hover-warning">145239</a>
							  </td>
							  <td>21&nbsp;minutes ago</td>
							  <td>1,781</td>
							  <td>12,009.855 BTC</td>
							  <td>1.963 BTC</td>
							  <td>515,484</td>
							</tr>
							 
						  </tbody>
						</table>
					</div>
				</div>
                
                
                
                
                <!-- 최근거래 끝  -->
              </div>
              <!-- /.tab-pane -->
              
              <div class="tab-pane active show" id="settings">
                <form class="form-horizontal form-element col-12">
                  <div class="form-group row">
                    <label for="inputName" class="col-sm-2 control-label">Name</label>

                    <div class="col-sm-10">
                      <input type="email" class="form-control" id="inputName" placeholder="">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail" class="col-sm-2 control-label">Email</label>

                    <div class="col-sm-10">
                      <input type="email" class="form-control" id="inputEmail" placeholder="">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputPhone" class="col-sm-2 control-label">Phone</label>

                    <div class="col-sm-10">
                      <input type="tel" class="form-control" id="inputPhone" placeholder="">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputExperience" class="col-sm-2 control-label">Experience</label>

                    <div class="col-sm-10">
                      <textarea class="form-control" id="inputExperience" placeholder=""></textarea>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputSkills" class="col-sm-2 control-label">Skills</label>

                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputSkills" placeholder="">
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="ml-auto col-sm-10">
                      <div class="checkbox">
                       	<input type="checkbox" id="basic_checkbox_1" checked="">
						<label for="basic_checkbox_1"> I agree to the</label>
                          &nbsp;&nbsp;&nbsp;&nbsp;<a href="#">Terms and Conditions</a>
                      </div>
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="ml-auto col-sm-10">
                      <button type="submit" class="btn btn-success">Submit</button>
                    </div>
                  </div>
                </form>
              </div>
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
			
			
</div>
        <!-- /.row -->
			
			<!-- 끝  -->

        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
 
   
  <footer class="main-footer">
    <div class="pull-right d-none d-sm-inline-block">
        <ul class="nav nav-primary nav-dotted nav-dot-separated justify-content-center justify-content-md-end">
		  <li class="nav-item">
			<a class="nav-link" href="javascript:void(0)">FAQ</a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link" href="#">Purchase Now</a>
		  </li>
		</ul>
    </div>
	  &copy; 2019 <a href="https://www.multipurposethemes.com/">Multi-Purpose Themes</a>. All Rights Reserved.
  </footer>
  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li class="nav-item"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li class="nav-item"><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-cog fa-spin"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Recent Activity</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Admin Birthday</h4>

                <p>Will be July 24th</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-user bg-yellow"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Jhone Updated His Profile</h4>

                <p>New Email : jhone_doe@demo.com</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Disha Joined Mailing List</h4>

                <p>disha@demo.com</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-file-code-o bg-green"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Code Change</h4>

                <p>Execution time 15 Days</p>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">Tasks Progress</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Web Design
                <span class="label label-danger pull-right">40%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 40%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Update Data
                <span class="label label-success pull-right">75%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-success" style="width: 75%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Order Process
                <span class="label label-warning pull-right">89%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-warning" style="width: 89%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Development 
                <span class="label label-primary pull-right">72%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-primary" style="width: 72%"></div>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>

          <div class="form-group">
            <input type="checkbox" id="report_panel" class="chk-col-grey" >
			<label for="report_panel" class="control-sidebar-subheading ">Report panel usage</label>

            <p>
              general settings information
            </p>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <input type="checkbox" id="allow_mail" class="chk-col-grey" >
			<label for="allow_mail" class="control-sidebar-subheading ">Mail redirect</label>

            <p>
              Other sets of options are available
            </p>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <input type="checkbox" id="expose_author" class="chk-col-grey" >
			<label for="expose_author" class="control-sidebar-subheading ">Expose author name</label>

            <p>
              Allow the user to show his name in blog posts
            </p>
          </div>
          <!-- /.form-group -->

          <h3 class="control-sidebar-heading">Chat Settings</h3>

          <div class="form-group">
            <input type="checkbox" id="show_me_online" class="chk-col-grey" >
			<label for="show_me_online" class="control-sidebar-subheading ">Show me as online</label>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <input type="checkbox" id="off_notifications" class="chk-col-grey" >
			<label for="off_notifications" class="control-sidebar-subheading ">Turn off notifications</label>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">              
              <a href="javascript:void(0)" class="text-red margin-r-5"><i class="fa fa-trash-o"></i></a>
              Delete chat history
            </label>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
  
  <!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->


	<!-- jQuery 3 -->
	<script src="${project}assets/vendor_components/jquery/dist/jquery.min.js"></script>
	
	<!-- popper -->
	<script src="${project}assets/vendor_components/popper/dist/popper.min.js"></script>
	
	<!-- Bootstrap 4.0-->
	<script src="${project}assets/vendor_components/bootstrap/dist/js/bootstrap.min.js"></script>
	
	<!-- SlimScroll -->
	<script src="${project}assets/vendor_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	
	<!-- FastClick -->
	<script src="${project}assets/vendor_components/fastclick/lib/fastclick.js"></script>
	
	<!-- EChartJS JavaScript -->
	<script src="${project}assets/vendor_components/echarts-master/dist/echarts-en.min.js"></script>
	
	<!-- Crypto_Admin for Chart purposes -->
	<script src="${project}js/pages/echarts.js"></script>
	
	<!-- Crypto_Admin App -->
	<script src="${project}js/template.js"></script>
	
	<!-- Crypto_Admin for demo purposes -->
	<script src="${project}js/demo.js"></script>
	

</body>
</html>
