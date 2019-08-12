<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="Chrome">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../images/favicon.ico">

    <title>Crypto Admin - Dashboard</title>
    
	<!-- Bootstrap 4.0-->
	<link rel="stylesheet" href="../assets/vendor_components/bootstrap/dist/css/bootstrap.css">
		
	<!-- Bootstrap-extend -->
	<link rel="stylesheet" href="css/bootstrap-extend.css">
	
	<!-- theme style -->
	<link rel="stylesheet" href="css/master_style.css">
	
	<!-- Crypto_Admin skins -->
	<link rel="stylesheet" href="css/skins/_all-skins.css">

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

     
  </head>

<body class="hold-transition skin-black sidebar-mini fixed">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="home.do" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
	  <b class="logo-mini">
		  <span class="light-logo"><img src="../images/logo-light.png" alt="logo"></span>
		  <span class="dark-logo"><img src="../images/logo-dark.png" alt="logo"></span>
	  </b>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg">
		  <img src="../images/logo-light-text.png" alt="logo" class="light-logo">
	  	  <img src="../images/logo-dark-text.png" alt="logo" class="dark-logo">
	  </span>
    </a>
    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
	  <span>정기주 실시간 검색어창 위치</span>	
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
		  <!-- 
		  <li class="search-box">
            <a class="nav-link hidden-sm-down" href="javascript:void(0)"><i class="mdi mdi-magnify"></i></a>
            <form class="app-search" style="display: none;">
                <input type="text" class="form-control" placeholder="Search &amp; enter"> <a class="srh-btn"><i class="ti-close"></i></a>
			</form>
          </li>			
		   -->
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
                        <img src="../images/user2-160x160.jpg" class="rounded-circle" alt="User Image">
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
                        <img src="../images/user3-128x128.jpg" class="rounded-circle" alt="User Image">
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
                        <img src="../images/user4-128x128.jpg" class="rounded-circle" alt="User Image">
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
                        <img src="../images/user3-128x128.jpg" class="rounded-circle" alt="User Image">
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
                        <img src="../images/user4-128x128.jpg" class="rounded-circle" alt="User Image">
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
              <img src="../images/user5-128x128.jpg" class="user-image rounded-circle" alt="User Image">
            </a>
            <ul class="dropdown-menu scale-up">
              <!-- User image -->
              <li class="user-header">
                <img src="../images/user5-128x128.jpg" class="float-left rounded-circle" alt="User Image">

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
  
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
		 <div class="ulogo">
			 <a href="index.html">
			  <!-- logo for regular state and mobile devices -->
			  <span><b>Crypto </b>Admin</span>
			</a>
		</div>
        <div class="image">
          <img src="../images/user2-160x160.jpg" class="rounded-circle" alt="User Image">
        </div>
        <div class="info">
          <p>Admin Template</p>
			<a href="" class="link" data-toggle="tooltip" title="" data-original-title="Settings"><i class="ion ion-gear-b"></i></a>
            <a href="" class="link" data-toggle="tooltip" title="" data-original-title="Email"><i class="ion ion-android-mail"></i></a>
            <a href="" class="link" data-toggle="tooltip" title="" data-original-title="Logout"><i class="ion ion-power"></i></a>
        </div>
      </div>
      <!-- sidebar menu -->
      <ul class="sidebar-menu" data-widget="tree">
      	<li class="header nav-small-cap">이름을 정해봅시다</li>
        <li class="treeview">
          <a href="#">
            <i class="icon-chart"></i>
            <span>My 계좌</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="">이체 한도/결과 조회</a></li>
            <li><a href="">거래 내역 조회</a></li>
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
            <li><a href="trading.html">즉시주문</a></li>
            <li><a href="">예약/기간 예약 주문</a></li>
            <li><a href="">종목 상세 정보</a></li>
            <li><a href="">관심 종목</a></li>
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
            <li><a href="">테마 분석</a></li>
            <li><a href="">기업 재무 정보</a></li>
          </ul>
        </li>
        
        <li class="treeview">
          <a href="#">
            <i class="icon-compass"></i>
            <span>Initial Coin Offering</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/ico/ico-distribution-countdown.html">Countdown</a></li>
            <li><a href="pages/ico/ico-roadmap-timeline.html">Roadmap/Timeline</a></li>
            <li><a href="pages/ico/ico-progress.html">Progress Bar</a></li>
            <li><a href="pages/ico/ico-details.html">Details</a></li>
            <li><a href="pages/ico/ico-listing.html">ICO Listing</a></li>
            <li><a href="pages/ico/ico-filter.html">ICO Listing - Filters</a></li>			  
          </ul>
        </li>
        <li>
          <a href="pages/currency-ex/exchange.html">
            <i class="icon-refresh"></i> <span>Currency Exchange</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="icon-people"></i>
            <span>Members</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/members/members.html">Members Grid</a></li>
            <li><a href="pages/members/members-list.html">Members List</a></li>
            <li><a href="pages/members/member-profile.html">Member Profile</a></li>			  
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="icon-equalizer"></i>
            <span>Tickers</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/tickers/tickers.html">Ticker</a></li>
            <li><a href="pages/tickers/crypto-live-pricing.html">Live Crypto Prices</a></li>		  
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="icon-wallet"></i>
            <span>Transactions</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/transactions/tables-transactions.html">Transactions Tables</a></li>
            <li><a href="pages/transactions/transaction-search.html">Transactions Search</a></li>	
            <li><a href="pages/transactions/transaction-details.html">Single Transaction</a></li>
            <li><a href="pages/transactions/counter-transactions.html">Transactions Counter</a></li>	  
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="icon-graph"></i>
            <span>Charts</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/charts/chartjs.html">ChartJS</a></li>
            <li><a href="pages/charts/flot.html">Flot</a></li>
            <li><a href="pages/charts/inline.html">Inline charts</a></li>
            <li><a href="pages/charts/morris.html">Morris</a></li>
            <li><a href="pages/charts/peity.html">Peity</a></li>
            <li><a href="pages/charts/chartist.html">Chartist</a></li>
            <li><a href="pages/charts/rickshaw-charts.html">Rickshaw Charts</a></li>
            <li><a href="pages/charts/nvd3-charts.html">NVD3 Charts</a></li>
			<li><a href="pages/charts/echart.html">eChart</a></li>
			<li><a href="pages/amcharts/amcharts.html">amCharts Charts</a></li>
			<li><a href="pages/amcharts/amstock-charts.html">amCharts Stock Charts</a></li>
			<li><a href="pages/amcharts/ammaps.html">amCharts Maps</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="icon-grid"></i>
            <span>App</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/app/app-chat.html">Chat app</a></li>
            <li><a href="pages/app/project-table.html">Project</a></li>
            <li><a href="pages/app/app-contact.html">Contact / Employee</a></li>
            <li><a href="pages/app/app-ticket.html">Support Ticket</a></li>
			<li><a href="pages/app/calendar.html">Calendar</a></li>
            <li><a href="pages/app/profile.html">Profile</a></li>
            <li><a href="pages/app/userlist-grid.html">Userlist Grid</a></li>
			<li><a href="pages/app/userlist.html">Userlist</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="icon-envelope"></i> <span>Mailbox</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/mailbox/mailbox.html">Inbox</a></li>
            <li><a href="pages/mailbox/compose.html">Compose</a></li>
            <li><a href="pages/mailbox/read-mail.html">Read</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="icon-drop"></i>
            <span>UI Elements</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/UI/badges.html">Badges</a></li>
            <li><a href="pages/UI/border-utilities.html">Border</a></li>
            <li><a href="pages/UI/buttons.html">Buttons</a></li>
            <li><a href="pages/UI/bootstrap-switch.html">Bootstrap Switch</a></li>
            <li><a href="pages/UI/cards.html">User Card</a></li>
            <li><a href="pages/UI/color-utilities.html">Color</a></li>
			<li><a href="pages/UI/date-paginator.html">Date Paginator</a></li>
            <li><a href="pages/UI/dropdown.html">Dropdown</a></li>
            <li><a href="pages/UI/dropdown-grid.html">Dropdown Grid</a></li>
            <li><a href="pages/UI/general.html">General</a></li>
            <li><a href="pages/UI/icons.html">Icons</a></li>
            <li><a href="pages/UI/media-advanced.html">Advanced Medias</a></li>
			<li><a href="pages/UI/modals.html">Modals</a></li>
            <li><a href="pages/UI/nestable.html">Nestable</a></li>
            <li><a href="pages/UI/notification.html">Notification</a></li>
            <li><a href="pages/UI/portlet-draggable.html">Draggable Portlets</a></li>
            <li><a href="pages/UI/ribbons.html">Ribbons</a></li>
            <li><a href="pages/UI/sliders.html">Sliders</a></li>
            <li><a href="pages/UI/sweatalert.html">Sweet Alert</a></li>
            <li><a href="pages/UI/tab.html">Tabs</a></li>
            <li><a href="pages/UI/timeline.html">Timeline</a></li>
            <li><a href="pages/UI/timeline-horizontal.html">Horizontal Timeline</a></li>			  
          </ul>
        </li>
        <li class="header nav-small-cap">FORMS, TABLE & LAYOUTS</li>
		<li class="treeview">
          <a href="#">
            <i class="icon-puzzle"></i>
            <span>Widgets</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/widgets/blog.html">Blog</a></li>
            <li><a href="pages/widgets/chart.html">Chart</a></li>
            <li><a href="pages/widgets/list.html">List</a></li>
            <li><a href="pages/widgets/social.html">Social</a></li>
            <li><a href="pages/widgets/statistic.html">Statistic</a></li>
            <li><a href="pages/widgets/tiles.html">Tiles</a></li>
            <li><a href="pages/widgets/weather.html">Weather</a></li>
            <li><a href="pages/widgets/widgets.html">Widgets</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="icon-layers"></i>
            <span>Layout Options</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/layout/boxed.html">Boxed</a></li>
            <li><a href="pages/layout/fixed.html">Fixed</a></li>
            <li><a href="pages/layout/collapsed-sidebar.html">Collapsed Sidebar</a></li>
          </ul>
        </li>		
		<li class="treeview">
          <a href="#">
            <i class="icon-loop"></i>
            <span>Box</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/box/advanced.html">Advanced</a></li>
            <li><a href="pages/box/basic.html">Boxed</a></li>
            <li><a href="pages/box/color.html">Color</a></li>
			<li><a href="pages/box/group.html">Group</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="icon-note"></i> <span>Forms</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/forms/advanced.html">Advanced Elements</a></li>
            <li><a href="pages/forms/code-editor.html">Code Editor</a></li>
            <li><a href="pages/forms/editor-markdown.html">Markdown</a></li>
            <li><a href="pages/forms/editors.html">Editors</a></li>
            <li><a href="pages/forms/form-validation.html">Form Validation</a></li>
            <li><a href="pages/forms/form-wizard.html">Form Wizard</a></li>
            <li><a href="pages/forms/general.html">General Elements</a></li>
            <li><a href="pages/forms/mask.html">Formatter</a></li>
            <li><a href="pages/forms/premade.html">Pre-made Forms</a></li>
            <li><a href="pages/forms/xeditable.html">Xeditable Editor</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="icon-menu"></i> <span>Tables</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/tables/simple.html">Simple tables</a></li>
            <li><a href="pages/tables/data.html">Data tables</a></li>
            <li><a href="pages/tables/editable-tables.html">Editable Tables</a></li>
            <li><a href="pages/tables/table-color.html">Table Color</a></li>
          </ul>
        </li>
		<li>
          <a href="pages/email/index.html">
            <i class="icon-envelope-open"></i> <span>Emails</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
        </li>
		<li class="header nav-small-cap">EXTRA COMPONENTS</li>
        <li class="treeview">
          <a href="#">
            <i class="icon-map"></i> <span>Map</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/map/map-google.html">Google Map</a></li>
            <li><a href="pages/map/map-vector.html">Vector Map</a></li>
          </ul>
        </li>
		<li class="treeview">
          <a href="#">
            <i class="icon-magnet"></i> <span>Extension</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/extension/fullscreen.html">Fullscreen</a></li>
          </ul>
        </li>        
		<li class="treeview">
          <a href="#">
            <i class="icon-folder-alt"></i> <span>Sample Pages</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/samplepage/blank.html">Blank</a></li>
            <li><a href="pages/samplepage/coming-soon.html">Coming Soon</a></li>
            <li><a href="pages/samplepage/custom-scroll.html">Custom Scrolls</a></li>
			<li><a href="pages/samplepage/faq.html">FAQ</a></li>
			<li><a href="pages/samplepage/gallery.html">Gallery</a></li>
			<li><a href="pages/samplepage/invoice.html">Invoice</a></li>
			<li><a href="pages/samplepage/lightbox.html">Lightbox Popup</a></li>
			<li><a href="pages/samplepage/pace.html">Pace</a></li>
			<li><a href="pages/samplepage/pricing.html">Pricing</a></li>
            <li class="treeview">
              <a href="#">Authentication 
                <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
              </a>
              <ul class="treeview-menu">
                <li><a href="login.do">Login</a></li>
                <li><a href="join.do">Join</a></li>
                <li><a href="pages/samplepage/lockscreen.html">Lockscreen</a></li>
                <li><a href="pages/samplepage/user-pass.html">Recover password</a></li>				  
              </ul>
            </li>            
			<li class="treeview">
              <a href="#">Error Pages 
                <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
              </a>
              <ul class="treeview-menu">
                <li><a href="pages/samplepage/404.html">404</a></li>
                <li><a href="pages/samplepage/500.html">500</a></li>
                <li><a href="pages/samplepage/maintenance.html">Maintenance</a></li>		  
              </ul>
            </li> 
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="icon-menu"></i> <span>Multilevel</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#">Level One</a></li>
            <li class="treeview">
              <a href="#">Level One
                <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
              </a>
              <ul class="treeview-menu">
                <li><a href="#">Level Two</a></li>
                <li class="treeview">
                  <a href="#">Level Two
                    <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
                  </a>
                  <ul class="treeview-menu">
                    <li><a href="#">Level Three</a></li>
                    <li><a href="#">Level Three</a></li>
                  </ul>
                </li>
              </ul>
            </li>
            <li><a href="#">Level One</a></li>
          </ul>
        </li>        
        
      </ul>
    </section>
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
	  

    <!-- Main content -->
    <section class="content">
      
		<div class="row">
			
			<div class="col-12">
				<div class="box box-inverse box-dark">
				  <div class="box-body">
					  <ul id="webticker-1">
						<li class="br-1">
							<div class="mx-20">
								<div class="d-flex justify-content-between">
									<h5 class="mr-40 text-white-50">BCH/BTC</h5>
									<p class="text-danger">-2.24%</p>
								</div>
								<div class="d-flex justify-content-between">
									<h4 class="my-0 mr-40">$0.04886</h4>
									<span class="sparklines">8,4,0,0,1,4,4,10,10,0,0,4,6,5,9,10</span>
								</div>
							</div>
						</li>
						<li class="br-1">
							<div class="mx-20">
								<div class="d-flex justify-content-between">
									<h5 class="mr-40 text-white-50">REP/USD</h5>
									<p class="text-danger">-2.57%</p>
								</div>
								<div class="d-flex justify-content-between">
									<h4 class="my-0 mr-40">$20.12</h4>
									<span class="sparklines">8,4,0,0,1,4,4,10,10,0,0,4,6,5,9,10</span>
								</div>
							</div>
						</li> 
						<li class="br-1">
							<div class="mx-20">
								<div class="d-flex justify-content-between">
									<h5 class="mr-40 text-white-50">EOS/USD</h5>
									<p class="text-success">+1.54%</p>
								</div>
								<div class="d-flex justify-content-between">
									<h4 class="my-0 mr-40">$4.755</h4>
									<span class="sparklines">8,4,0,0,1,4,4,10,10,0,0,4,6,5,9,10</span>
								</div>
							</div>
						</li> 
						<li class="br-1">
							<div class="mx-20">
								<div class="d-flex justify-content-between">
									<h5 class="mr-40 text-white-50">ZRX/USD</h5>
									<p class="text-danger">-1.33%</p>
								</div>
								<div class="d-flex justify-content-between">
									<h4 class="my-0 mr-40">$0.26877</h4>
									<span class="sparklines">8,4,0,0,1,4,4,10,10,0,0,4,6,5,9,10</span>
								</div>
							</div>
						</li> 
						<li class="br-1">
							<div class="mx-20">
								<div class="d-flex justify-content-between">
									<h5 class="mr-40 text-white-50">ETH/USD</h5>
									<p class="text-success">+0.57%</p>
								</div>
								<div class="d-flex justify-content-between">
									<h4 class="my-0 mr-40">$159.73</h4>
									<span class="sparklines">8,4,0,0,1,4,4,10,10,0,0,4,6,5,9,10</span>
								</div>
							</div>
						</li> 
						<li class="br-1">
							<div class="mx-20">
								<div class="d-flex justify-content-between">
									<h5 class="mr-40 text-white-50">LTC/USD</h5>
									<p class="text-success">+1.30%</p>
								</div>
								<div class="d-flex justify-content-between">
									<h4 class="my-0 mr-40">$73.42</h4>
									<span class="sparklines">8,4,0,0,1,4,4,10,10,0,0,4,6,5,9,10</span>
								</div>
							</div>
						</li> 
						<li class="br-1">
							<div class="mx-20">
								<div class="d-flex justify-content-between">
									<h5 class="mr-40 text-white-50">ETC/USD</h5>
									<p class="text-danger">-0.19%</p>
								</div>
								<div class="d-flex justify-content-between">
									<h4 class="my-0 mr-40">$5.719</h4>
									<span class="sparklines">8,4,0,0,1,4,4,10,10,0,0,4,6,5,9,10</span>
								</div>
							</div>
						</li> 
						<li class="br-1">
							<div class="mx-20">
								<div class="d-flex justify-content-between">
									<h5 class="mr-40 text-white-50">BCH/USD</h5>
									<p class="text-success">+0.42%</p>
								</div>
								<div class="d-flex justify-content-between">
									<h4 class="my-0 mr-40">$267.72</h4>
									<span class="sparklines">8,4,0,0,1,4,4,10,10,0,0,4,6,5,9,10</span>
								</div>
							</div>
						</li> 
						<li class="br-1">
							<div class="mx-20">
								<div class="d-flex justify-content-between">
									<h5 class="mr-40 text-white-50">XRP/USD</h5>
									<p class="text-danger">-0.50%</p>
								</div>
								<div class="d-flex justify-content-between">
									<h4 class="my-0 mr-40">$0.2974</h4>
									<span class="sparklines">8,4,0,0,1,4,4,10,10,0,0,4,6,5,9,10</span>
								</div>
							</div>
						</li> 
						<li class="br-1">
							<div class="mx-20">
								<div class="d-flex justify-content-between">
									<h5 class="mr-40 text-white-50">BTC/USD</h5>
									<p class="text-success">+3.15%</p>
								</div>
								<div class="d-flex justify-content-between">
									<h4 class="my-0 mr-40">$5,497.49</h4>
									<span class="sparklines">8,4,0,0,1,4,4,10,10,0,0,4,6,5,9,10</span>
								</div>
							</div>
						</li> 
						<li class="br-1">
							<div class="mx-20">
								<div class="d-flex justify-content-between">
									<h5 class="mr-40 text-white-50">REP/USD</h5>
									<p class="text-danger">-2.52%</p>
								</div>
								<div class="d-flex justify-content-between">
									<h4 class="my-0 mr-40">$20.13</h4>
									<span class="sparklines">8,4,0,0,1,4,4,10,10,0,0,4,6,5,9,10</span>
								</div>
							</div>
						</li> 
						<li class="br-1">
							<div class="mx-20">
								<div class="d-flex justify-content-between">
									<h5 class="mr-40 text-white-50">EOS/USD</h5>
									<p class="text-success">+1.58%</p>
								</div>
								<div class="d-flex justify-content-between">
									<h4 class="my-0 mr-40">$4.757</h4>
									<span class="sparklines">8,4,0,0,1,4,4,10,10,0,0,4,6,5,9,10</span>
								</div>
							</div>
						</li> 
						<li class="br-1">
							<div class="mx-20">
								<div class="d-flex justify-content-between">
									<h5 class="mr-40 text-white-50">ZRX/USD</h5>
									<p class="text-danger">-2.07%</p>
								</div>
								<div class="d-flex justify-content-between">
									<h4 class="my-0 mr-40">$0.268135</h4>
									<span class="sparklines">8,4,0,0,1,4,4,10,10,0,0,4,6,5,9,10</span>
								</div>
							</div>
						</li> 
						<li class="br-1">
							<div class="mx-20">
								<div class="d-flex justify-content-between">
									<h5 class="mr-40 text-white-50">ETH/USD</h5>
									<p class="text-success">+0.47%</p>
								</div>
								<div class="d-flex justify-content-between">
									<h4 class="my-0 mr-40">$159.55</h4>
									<span class="sparklines">8,4,0,0,1,4,4,10,10,0,0,4,6,5,9,10</span>
								</div>
							</div>
						</li> 
						<li class="br-1">
							<div class="mx-20">
								<div class="d-flex justify-content-between">
									<h5 class="mr-40 text-white-50">LTC/USD</h5>
									<p class="text-success">+1.28%</p>
								</div>
								<div class="d-flex justify-content-between">
									<h4 class="my-0 mr-40">$73.40</h4>
									<span class="sparklines">8,4,0,0,1,4,4,10,10,0,0,4,6,5,9,10</span>
								</div>
							</div>
						</li> 
						<li class="br-1">
							<div class="mx-20">
								<div class="d-flex justify-content-between">
									<h5 class="mr-40 text-white-50">ETC/USD</h5>
									<p class="text-danger">-0.44%</p>
								</div>
								<div class="d-flex justify-content-between">
									<h4 class="my-0 mr-40">$5.715</h4>
									<span class="sparklines">8,4,0,0,1,4,4,10,10,0,0,4,6,5,9,10</span>
								</div>
							</div>
						</li> 
						<li class="br-1">
							<div class="mx-20">
								<div class="d-flex justify-content-between">
									<h5 class="mr-40 text-white-50">BCH/USD</h5>
									<p class="text-success">+0.43%</p>
								</div>
								<div class="d-flex justify-content-between">
									<h4 class="my-0 mr-40">$268.00</h4>
									<span class="sparklines">8,4,0,0,1,4,4,10,10,0,0,4,6,5,9,10</span>
								</div>
							</div>
						</li> 
						<li class="br-1">
							<div class="mx-20">
								<div class="d-flex justify-content-between">
									<h5 class="mr-40 text-white-50">XRP/USD</h5>
									<p class="text-danger">-0.54%</p>
								</div>
								<div class="d-flex justify-content-between">
									<h4 class="my-0 mr-40">$0.2970</h4>
									<span class="sparklines">8,4,0,0,1,4,4,10,10,0,0,4,6,5,9,10</span>
								</div>
							</div>
						</li> 
						<li class="br-1">
							<div class="mx-20">
								<div class="d-flex justify-content-between">
									<h5 class="mr-40 text-white-50">BTC/USD</h5>
									<p class="text-success">+3.00%</p>
								</div>
								<div class="d-flex justify-content-between">
									<h4 class="my-0 mr-40">$5,490.01</h4>
									<span class="sparklines">8,4,0,0,1,4,4,10,10,0,0,4,6,5,9,10</span>
								</div>
							</div>
						</li> 
						<li class="br-1">
							<div class="mx-20">
								<div class="d-flex justify-content-between">
									<h5 class="mr-40 text-white-50">XLM/USD</h5>
									<p class="text-danger">-0.97%</p>
								</div>
								<div class="d-flex justify-content-between">
									<h4 class="my-0 mr-40">$0.099065</h4>
									<span class="sparklines">8,4,0,0,1,4,4,10,10,0,0,4,6,5,9,10</span>
								</div>
							</div>
						</li>  
						  
					  </ul>
				  </div>
			  </div>
			</div>
			
			<!-- 검색 창 시작 -->
			<div class="col-xl-4 col-12">
				    <!-- 검색 결과창 -->
							<div class="box">
					          <div class="col-13">
					            <div class="box">
					            <div class="box-body">
									<div class="table-responsive">
										<div class="box-header with-border">
										  <h4 class="box-title">Search</h4>
											<div class="box-controls pull-right">
										            
												<span class="search-box">
												<a class="nav-link hidden-sm-down" href="javascript:void(0)"><i class="mdi mdi-magnify"></i></a>
										            <form class="app-search" style="display: none;">
										                <input type="text" class="form-control" placeholder="Search &amp; enter"> <a class="srh-btn"><i class="ti-close"></i></a>
													</form>
												</span>
											</div>
										</div>
									  <table id="example5" class="table table-hover">
										<tbody>
											<tr>
												<td class="w-20"><i class="fa fa-square-o pt-15"></i></td>
												<td class="w-20"><i class="fa fa-star text-yellow pt-15"></i></td>
												<td class="w-60">
												  <a class="avatar avatar-lg status-success" href="#">
													<!-- <img src="../../../images/avatar/1.jpg" alt="..."> -->
												  </a>
												</td>
												<td class="w-300">
													<p class="mb-0">
													  <a href="#"><strong>Maryam Amiri</strong></a>
													  <small class="sidetitle">dummy@gmail.com</small>
													</p>
													<p class="mb-0">Designer</p>
												</td>
											</tr>
											<tr>
												<td class="w-20"><i class="fa fa-square-o pt-15"></i></td>
												<td class="w-20"><i class="fa fa-star text-yellow pt-15"></i></td>
												<td class="w-60">
												  <a class="avatar avatar-lg status-success" href="#">
													<!-- <img src="../../../images/avatar/2.jpg" alt="..."> -->
												  </a>
												</td>
												<td class="w-300">
													<p class="mb-0">
													  <a href="#"><strong>Maryam Amiri</strong></a>
													  <small class="sidetitle">dummy@gmail.com</small>
													</p>
													<p class="mb-0">Designer</p>
												</td>
											</tr>
											<tr>
												<td class="w-20"><i class="fa fa-square-o pt-15"></i></td>
												<td class="w-20"><i class="fa fa-star text-yellow pt-15"></i></td>
												<td class="w-60">
												  <a class="avatar avatar-lg status-success" href="#">
													<!-- <img src="../../../images/avatar/4.jpg" alt="..."> -->
												  </a>
												</td>
												<td class="w-300">
													<p class="mb-0">
													  <a href="#"><strong>Maryam Amiri</strong></a>
													  <small class="sidetitle">dummy@gmail.com</small>
													</p>
													<p class="mb-0">Designer</p>
												</td>
											</tr>
											<tr>
												<td class="w-20"><i class="fa fa-square-o pt-15"></i></td>
												<td class="w-20"><i class="fa fa-star text-yellow pt-15"></i></td>
												<td class="w-60">
												  <a class="avatar avatar-lg status-success" href="#">
													<!-- <img src="../../../images/avatar/5.jpg" alt="..."> -->
												  </a>
												</td>
												<td class="w-300">
													<p class="mb-0">
													  <a href="#"><strong>Maryam Amiri</strong></a>
													  <small class="sidetitle">dummy@gmail.com</small>
													</p>
													<p class="mb-0">Designer</p>
												</td>
											</tr>
											<tr>
												<td class="w-20"><i class="fa fa-square-o pt-15"></i></td>
												<td class="w-20"><i class="fa fa-star text-yellow pt-15"></i></td>
												<td class="w-60">
												  <a class="avatar avatar-lg status-success" href="#">
													<!-- <img src="../../../images/avatar/6.jpg" alt="..."> -->
												  </a>
												</td>
												<td class="w-300">
													<p class="mb-0">
													  <a href="#"><strong>Maryam Amiri</strong></a>
													  <small class="sidetitle">dummy@gmail.com</small>
													</p>
													<p class="mb-0">Designer</p>
												</td>
											</tr>
											<tr>
												<td class="w-20"><i class="fa fa-square-o pt-15"></i></td>
												<td class="w-20"><i class="fa fa-star text-yellow pt-15"></i></td>
												<td class="w-60">
												  <a class="avatar avatar-lg status-success" href="#">
													<!-- <img src="../../../images/avatar/6.jpg" alt="..."> -->
												  </a>
												</td>
												<td class="w-300">
													<p class="mb-0">
													  <a href="#"><strong>Maryam Amiri</strong></a>
													  <small class="sidetitle">dummy@gmail.com</small>
													</p>
													<p class="mb-0">Designer</p>
												</td>
											</tr>
										</tbody>
									  </table>
									</div>
					            </div>
					            <!-- /.box-body -->
					          </div>
					          <!-- /.box -->
					          </div>			
					        </div>
			</div>
			<!-- 검색창 끝 -->
			
			<!-- 상승하락창  시작 -->
			<div class="col-xl-4 col-12">
				<div class="box">
					<div class="box-header with-border">
					  <h4 class="box-title">Buy Order</h4>
						<div class="box-controls pull-right">
							Total 512 8549 ETC
						</div>
					</div>
					<div class="box-body">
						<div class="table-responsive buyorder">
							<table class="table no-margin no-border">
								<thead>
									<tr class="bg-dark">
										<th>Amount</th>
										<th>Price</th>
										<th>Total BPL</th>
									</tr>
								</thead>
								<tbody>
								  <tr>
									<td>1.845126523</td>
									<td>17800.00</td>
									<td>23000.00</td>
								  </tr>
								  <tr>
									<td>2.21548756</td>
									<td>13950.00</td>
									<td>77201.00</td>
								  </tr>
								  
								  <tr>
									<td>8.00200000</td>
									<td>19555.22</td>
									<td>35000.00</td>
								  </tr>
								  <!-- 
								  <tr>
									<td>8.00200000</td>
									<td>19555.22</td>
									<td>35000.00</td>
								  </tr>
								  <tr>
									<td>8.00200000</td>
									<td>19555.22</td>
									<td>35000.00</td>
								  </tr>
								   -->
								</tbody>
							</table>
						</div>
					</div>
				</div>
				
				<div class="box">
				<div class="box-header with-border">
				  <h4 class="box-title">Sell Order</h4>
					<div class="box-controls pull-right">
						Total 485 8549 BTL
					</div>
				</div>
				<div class="box-body">
					<div class="table-responsive sellorder">
						<table class="table no-margin no-border">
							<thead>
								<tr class="bg-dark">
									<th>Amount</th>
									<th>Price</th>
									<th>Total BPL</th>
								</tr>
							</thead>
							<tbody>		
							  <tr>
								<td>1.845126523</td>
								<td>17800.00</td>
								<td>23000.00</td>
							  </tr>
							  <tr>
								<td>2.21548756</td>
								<td>13950.00</td>
								<td>77201.00</td>
							  </tr>
							   
							  <tr>
								<td>8.00200000</td>
								<td>19555.22</td>
								<td>35000.00</td>
							  </tr>
							  <!--
							  <tr>
								<td>5.2000000</td>
								<td>18445.00</td>
								<td>44521.11</td>
							  </tr>
							  <tr>
								<td>8.00200000</td>
								<td>19555.22</td>
								<td>35000.00</td>
							  </tr>
							   -->
							</tbody>
						</table>
					</div>
				</div>
			</div>
			</div>
			
			<!-- 상승하락창 끝 -->
			<!-- 매수/매도 창 시작 -->
			<div class="col-xl-4 col-12">
				<div class="box">
					<div class="box-header with-border">
					  <h4 class="box-title">현재 보유 자산</h4>
					</div>
					<div class="box-body">
						<div class="d-flex justify-content-between bb-1 pb-5">
							<h5 class="text-fade">자산</h5>
							<h5 class="text-fade">수량</h5>
						</div>
						<div class="d-flex justify-content-between pb-5 pt-10">
							<h4 class="text-white">현금</h4>
							<h4 class="text-white">100,000원</h4>
						</div>
						<div class="d-flex justify-content-between pb-10">
							<h4 class="text-white">삼성전자</h4>
							<h4 class="text-white">10주</h4>
						</div>
						<div class="d-flex justify-content-between">
							<button type="button" class="btn btn-danger-outline btn-lg"><i class="fa fa-arrow-circle-down"></i> DEPOSIT</button>
							<button type="button" class="btn btn-success-outline btn-lg mt-0"><i class="fa fa-arrow-circle-up"></i> WITHDRAW</button>
						</div>
					</div>
				</div>
				<div class="box">
				  <ul class="nav nav-tabs nav-tabs-danger nav-justified" role="tablist">
					<li class="nav-item">
					  <a class="nav-link active font-size-18" data-toggle="tab" href="#buy" role="tab">BUY</a>
					</li>
					<li class="nav-item">
					  <a class="nav-link font-size-18" data-toggle="tab" href="#sell" role="tab">SELL</a>
					</li>
				  </ul>

				  <!-- Tab panes -->
				  <div class="box-body tab-content">
					<div class="tab-pane fade active show" id="buy">
					  <form>
						  	<p class="my-10">Amount</p>
							<div class="input-group">
								<span class="input-group-addon">MAX</span>
								<input type="text" class="form-control" placeholder="0.00">
								<span class="input-group-addon">BTC</span>
						  	</div>	
						  <p class="my-10">Limit Price</p>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="3987.55">
								<span class="input-group-addon">USDC</span>
						  	</div>
						  
						<div class="d-flex justify-content-between pt-45 pb-5">
							<h5 class="text-fade">Fee*</h5>
							<h5 class="text-fade">0.000000 USDC</h5>
						</div>
						<div class="d-flex justify-content-between pb-25">
							<h5 class="text-fade">Total*</h5>
							<h5 class="text-fade">0.000000 USDC</h5>
						</div>
						<div class="d-block">
							<button type="button" class="btn btn-block btn-success btn-lg">PLACE ORDER</button>
						</div>
					  </form>
					</div>
					<div class="tab-pane fade" id="sell">
						<form>
						  	<p class="my-10">Amount</p>
							<div class="input-group">
								<span class="input-group-addon">MAX</span>
								<input type="text" class="form-control" placeholder="0.00">
								<span class="input-group-addon">BTC</span>
						  	</div>	
						  <p class="my-10">Limit Price</p>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="3987.55">
								<span class="input-group-addon">USDC</span>
						  	</div>
						  
						<div class="d-flex justify-content-between pt-45 pb-5">
							<h5 class="text-fade">Fee*</h5>
							<h5 class="text-fade">0.000000 USDC</h5>
						</div>
						<div class="d-flex justify-content-between pb-25">
							<h5 class="text-fade">Total*</h5>
							<h5 class="text-fade">0.000000 USDC</h5>
						</div>
						<div class="d-block">
							<button type="button" class="btn btn-block btn-success btn-lg">PLACE ORDER</button>
						</div>
					  </form>
					</div>
				  </div>
				</div>
			</div>
			
			<!-- 매수/매도 창 시작 -->
			<!-- 
			<div class="col-12">
				<div class="box">
					<div class="box-header with-border">
					  <h4 class="box-title">Trading Platform</h4>
					</div>
					<div class="box-body">
						<div class="chart">
							<div id="chartdivtrading" style="height: 500px;"></div>
						</div>
					</div>
					/.box-body
				  </div>
			</div>
		   -->
		   
		   <!-- price chart 시작 -->
		   <div class="col-12">
				<div class="box">
					<div class="box-header with-border">
					  <h4 class="box-title">Price Chart</h4>  	
					</div>
					<div class="box-body">
						<div class="chart">
							<div id="chartdivnew" style="height: 630px;"></div>
						</div>
					</div>
					<!-- /.box-body -->
				  </div>
			</div>
		   <!-- price chart 끝 -->
		   
		   
		  <div class="col-12 col-lg-3">
			<div class="box box-body pull-up bg-hexagons-white">
			  <div class="media align-items-center p-0">
				<div class="text-center">
				  <a href="#"><i class="cc BTC mr-5" title="BTC"></i></a>
				</div>
				<div>
				  <h2 class="no-margin">Bitcoin BTC</h2>
				</div>
			  </div>
			  <div class="flexbox align-items-center mt-25">
				<div>
				  <p class="no-margin">2.340000434 <span class="text-gray">BTC</span> <span class="text-info">$0.04</span></p>
				</div>
				<div class="text-right">
				  <p class="no-margin"><span class="text-success">+5.35%</span></p>
				</div>
			  </div>
			</div>
           </div>
		  <div class="col-lg-3 col-12">					
			<div class="box box-body pull-up bg-hexagons-white">
			  <div class="media align-items-center p-0">
				<div class="text-center">
				  <a href="#"><i class="cc LTC mr-5" title="LTC"></i></a>
				</div>
				<div>
				  <h2 class="no-margin">Litecoin LTC</h2>
				</div>
			  </div>
			  <div class="flexbox align-items-center mt-25">
				<div>
				  <p class="no-margin">1.34000434 <span class="text-gray">LTC</span> <span class="text-info">$0.14</span></p>
				</div>
				<div class="text-right">
				  <p class="no-margin"><span class="text-danger">-2.35%</span></p>
				</div>
			  </div>
			</div>		
		  </div>
		 <div class="col-lg-3 col-12">			
			<div class="box box-body pull-up bg-hexagons-white">
			  <div class="media align-items-center p-0">
				<div class="text-center">
				  <a href="#"><i class="cc NEO mr-5" title="NEO"></i></a>
				</div>
				<div>
				  <h2 class="no-margin">Neo NEO</h2>
				</div>
			  </div>
			  <div class="flexbox align-items-center mt-25">
				<div>
				  <p class="no-margin">0.30000434 <span class="text-gray">NEO</span> <span class="text-info">$5.04</span></p>
				</div>
				<div class="text-right">
				  <p class="no-margin"><span class="text-success">+4.35%</span></p>
				</div>
			  </div>
			</div>
		 </div>		
		 <div class="col-lg-3 col-12">
			<div class="box box-body pull-up bg-hexagons-white">
			  <div class="media align-items-center p-0">
				<div class="text-center">
				  <a href="#"><i class="cc DASH mr-5" title="DASH"></i></a>
				</div>
				<div>
				  <h2 class="no-margin">Dash DASH</h2>
				</div>
			  </div>
			  <div class="flexbox align-items-center mt-20">
				<div>
				  <p class="no-margin">0.34000434 <span class="text-gray">DASH</span> <span class="text-info">$0.54</span></p>
				</div>
				<div class="text-right">
				  <p class="no-margin"><span class="text-danger">-5.35%</span></p>
				</div>
			  </div>
			</div>
		 </div>
			
		</div>	
		
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
	<script src="../assets/vendor_components/jquery/dist/jquery.js"></script>
	
	<!-- popper -->
	<script src="../assets/vendor_components/popper/dist/popper.min.js"></script>
	
	<!-- Bootstrap 4.0-->
	<script src="../assets/vendor_components/bootstrap/dist/js/bootstrap.js"></script>
		
	<!-- Slimscroll -->
	<script src="../assets/vendor_components/jquery-slimscroll/jquery.slimscroll.js"></script>
	
	<!-- FastClick -->
	<script src="../assets/vendor_components/fastclick/lib/fastclick.js"></script>
	
    <!-- Resources -->
	<script src="https://www.amcharts.com/lib/4/core.js"></script>
	<script src="https://www.amcharts.com/lib/4/charts.js"></script>
	<script src="https://www.amcharts.com/lib/4/themes/dark.js"></script>
	<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
	
	<!-- webticker -->
	<script src="../assets/vendor_components/Web-Ticker-master/jquery.webticker.min.js"></script>
		
	<!-- Sparkline -->
	<script src="../assets/vendor_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
		
	<!-- Crypto_Admin App -->
	<script src="js/template.js"></script>
	
	<!-- Crypto_Admin dashboard demo (This is only for demo purposes) -->
	<script src="js/pages/dashboard.js"></script>
	<script src="js/pages/dashboard-chart.js"></script>
	
	<!-- Crypto_Admin for demo purposes -->
	<script src="js/demo.js"></script>

	
</body>
</html>