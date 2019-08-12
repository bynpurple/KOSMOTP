<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html lang="ko">
<head>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
	<%@ include file="../include/header.jsp" %>
	<link rel="icon" href="${project}images/favicon.ico">
	<script src="/stock/resources/js/jquery-3.4.1.min.js"></script>
	<c:set var ="project" value="/stock/resources/"/>

	<script src="${project}assets/vendor_components/jquery/dist/jquery.min.js"></script>
	
	<!-- popper -->
	<script src="${project}assets/vendor_components/popper/dist/popper.min.js"></script>
	
	<!-- Bootstrap 4.0-->
	<script src="${project}assets/vendor_components/bootstrap/dist/js/bootstrap.min.js"></script>
	
	<!-- SlimScroll -->
	<script src="${project}assets/vendor_components/jquery-slimscroll/jquery.slimscroll.js"></script>
	
	<!-- FastClick -->
	<script src="${project}assets/vendor_components/fastclick/lib/fastclick.js"></script>
	
	<!-- EChartJS JavaScript -->
	<script src="${project}assets/vendor_components/echarts-master/dist/echarts-en.min.js"></script>
	<script src="${project}assets/vendor_components/echarts-liquidfill-master/dist/echarts-liquidfill.min.js"></script>
	
	<!-- Crypto_Admin App -->
	<script src="${project}js/template.js"></script>
	
	<!-- Crypto_Admin for demo purposes -->
	<script src="${project}js/demo.js"></script>
	
	<!-- Crypto_Admin for demo purposes -->
	<script src="${project}js/pages/market-capitalizations.js"></script>
	
</head>
<body class="hold-transition skin-black sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">
	<header class="main-header">
    <%@ include file="../include/main_header.jsp" %>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <%@ include file="side_menu.jsp" %>
  </aside>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
       	 종목 분석
      </h1>
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>홈</a></li>
        <li class="breadcrumb-item"><a href="#">차트 및 종목 분석</a></li>
        <li class="breadcrumb-item active">테마 분석</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	  <h1 class="page-header text-center mt-30 mb-30">
		  <span class="text-bold text-yellow">EZ-STOCK</span> 종목 <span class="text-bold text-yellow">분석</span><br>
		  <p class="font-size-18 mb-0">거래 변동량 상위 5개의 종목페이지와 각 테마의 개요를 보여줍니다. 해당 종목의 블럭을 클릭하면 해당 페이지로 이동합니다.</p>
	  </h1>
	  <div class="row">
		<div class="col-12">
			<div class="box">
				<div class="box-body">
					<div class="table-responsive">
						<table class="table no-margin">
						  <thead>
							<tr>
							  <th>테마명</th>
							  <th>종목명</th>
							  <th>현재가</th>
							  <th>전일가</th>
							  <th>거래량</th>
							  <th>변동률</th>
							</tr>
						  </thead>
						  <tbody>
				
						  	<c:forEach var="toplist" items="${topList}">
						  		<tr>
						  		<c:if test="${toplist.getGap() < 0}">
			  			 		  <td>${toplist.getStockTheme()}</td>
								  <td>${toplist.getStockName()}</td>
								  <td style="color:pink;">${toplist.getStockCurrent()}</td>
								  <td style="color:pink;">${toplist.getStockOpen()}</td>
								  <td>${toplist.getStockVolume()}</td>
								  <td style="color:pink;">${toplist.getGap()}</td>
						
						  		</c:if>
						  		
						  		<c:if test="${toplist.getGap() > 0}">
			  			 		  <td>${toplist.getStockTheme()}</td>
								  <td>${toplist.getStockName()}</td>
								  <td style="color:#6699cc;">${toplist.getStockCurrent()}</td>
								  <td style="color:#6699cc;">${toplist.getStockOpen()}</td>
								  <td>${toplist.getStockVolume()}</td>
								  <td style="color:#6699cc;">${toplist.getGap()}</td>
						  		
						  		</c:if>
						  		</tr>
							</c:forEach>
						  </tbody>
						</table>
					  </div>
				</div>
			</div>		  
		</div>
		<div class="col-md-6 col-lg-3 col-12">
		  <div class="box box-inverse bg-dark bg-hexagons-white pull-up">
			  <div class="box-body text-center">
				  <h2 class="mb-0 text-bold">XRP</h2>
				  <h4>Ripple</h4>
				  <ul class="flexbox flex-justified text-center mt-30 bb-1 border-gray pb-20">
					  <li class="br-1 border-gray">
						<div>USD</div>
						<small class="font-size-18">11.153</small>
					  </li>

					  <li class="br-1 border-gray">
						<div>EUR</div>
						<small class="font-size-18">1.9232</small>
					  </li>

					  <li>
						<div>GBP</div>
						<small class="font-size-18">1.8202</small>
					  </li>
                  </ul>
				  <ul class="flexbox flex-justified text-center mt-20">
					  <li class="br-1 border-gray">
						<div>% 1h</div>
						<small class="font-size-18"><i class="fa fa-arrow-up text-success pr-5"></i>1.4</small>
					  </li>

					  <li class="br-1 border-gray">
						<div>% 24h</div>
						<small class="font-size-18"><i class="fa fa-arrow-up text-success pr-5"></i>3.29</small>
					  </li>

					  <li>
						<div>% 7d</div>
						<small class="font-size-18"><i class="fa fa-arrow-up text-success pr-5"></i>54.77</small>
					  </li>
                  </ul>
			  </div>
		  </div>
		</div>
		<div class="col-md-6 col-lg-3 col-12">
		  <div class="box box-inverse bg-yellow text-black bg-hexagons-dark pull-up">
			  <div class="box-body text-center">
				  <h2 class="mb-0 text-bold"><span class="text-black">ETH</span></h2>
				  <h4><span class="text-black">Ethereum</span></h4>
				  <ul class="flexbox flex-justified text-center mt-30 bb-1 border-dark pb-20">
					  <li class="br-1 border-dark">
						<div class="text-black">USD</div>
						<small class="font-size-18"><span class="text-black">2.153</span></small>
					  </li>

					  <li class="br-1 border-dark">
						<div class="text-black">EUR</div>
						<small class="font-size-18"><span class="text-black">3.9232</span></small>
					  </li>

					  <li>
						<div class="text-black">GBP</div>
						<small class="font-size-18"><span class="text-black">3.8202</span></small>
					  </li>
                  </ul>
				  <ul class="flexbox flex-justified text-center mt-20">
					  <li class="br-1 border-dark">
						<div class="text-black">% 1h</div>
						<small class="font-size-18"><span class="text-black"><i class="fa fa-arrow-up pr-5"></i>0.4</span></small>
					  </li>

					  <li class="br-1 border-dark">
						<div class="text-black">% 24h</div>
						<small class="font-size-18"><span class="text-black"><i class="fa fa-arrow-up pr-5"></i>9.29</span></small>
					  </li>

					  <li>
						<div class="text-black">% 7d</div>
						<small class="font-size-18"><span class="text-black"><i class="fa fa-arrow-up pr-5"></i>50.77</span></small>
					  </li>
                  </ul>
			  </div>
		  </div>
		</div>
		<div class="col-md-6 col-lg-3 col-12">
		  <div class="box box-inverse bg-dark bg-hexagons-white pull-up">
			  <div class="box-body text-center">
				  <h2 class="mb-0 text-bold">LTC</h2>
				  <h4>Litecoin</h4>
				  <ul class="flexbox flex-justified text-center mt-30 bb-1 border-gray pb-20">
					  <li class="br-1 border-gray">
						<div>USD</div>
						<small class="font-size-18">1.153</small>
					  </li>

					  <li class="br-1 border-gray">
						<div>EUR</div>
						<small class="font-size-18">0.9232</small>
					  </li>

					  <li>
						<div>GBP</div>
						<small class="font-size-18">0.8202</small>
					  </li>
                  </ul>
				  <ul class="flexbox flex-justified text-center mt-20">
					  <li class="br-1 border-gray">
						<div>% 1h</div>
						<small class="font-size-18"><i class="fa fa-arrow-up text-success pr-5"></i>0.4</small>
					  </li>

					  <li class="br-1 border-gray">
						<div>% 24h</div>
						<small class="font-size-18"><i class="fa fa-arrow-up text-success pr-5"></i>9.29</small>
					  </li>

					  <li>
						<div>% 7d</div>
						<small class="font-size-18"><i class="fa fa-arrow-up text-success pr-5"></i>50.77</small>
					  </li>
                  </ul>
			  </div>
		  </div>
		</div>
		<div class="col-md-6 col-lg-3 col-12">
		  <div class="box box-inverse bg-yellow text-black bg-hexagons-dark pull-up">
			  <div class="box-body text-center">
				  <h2 class="mb-0 text-bold"><span class="text-black">BTC</span></h2>
				  <h4><span class="text-black">Bitcoin</span></h4>
				  <ul class="flexbox flex-justified text-center mt-30 bb-1 border-dark pb-20">
					  <li class="br-1 border-dark">
						<div class="text-black">USD</div>
						<small class="font-size-18"><span class="text-black">1.153</span></small>
					  </li>

					  <li class="br-1 border-dark">
						<div class="text-black">EUR</div>
						<small class="font-size-18"><span class="text-black">0.9232</span></small>
					  </li>

					  <li>
						<div class="text-black">GBP</div>
						<small class="font-size-18"><span class="text-black">0.8202</span></small>
					  </li>
                  </ul>
				  <ul class="flexbox flex-justified text-center mt-20">
					  <li class="br-1 border-dark">
						<div class="text-black">% 1h</div>
						<small class="font-size-18"><span class="text-black"><i class="fa fa-arrow-up pr-5"></i>0.4</span></small>
					  </li>

					  <li class="br-1 border-dark">
						<div class="text-black">% 24h</div>
						<small class="font-size-18"><span class="text-black"><i class="fa fa-arrow-up pr-5"></i>9.29</span></small>
					  </li>

					  <li>
						<div class="text-black">% 7d</div>
						<small class="font-size-18"><span class="text-black"><i class="fa fa-arrow-up pr-5"></i>50.77</span></small>
					  </li>
                  </ul>
			  </div>
		  </div>
		 </div> 
		<div class="col-md-6 col-lg-3 col-12">
		  <div class="box box-inverse bg-yellow text-black bg-hexagons-dark pull-up">
			  <div class="box-body text-center">
				  <h2 class="mb-0 text-bold"><span class="text-black">ETH</span></h2>
				  <h4><span class="text-black">Ethereum</span></h4>
				  <ul class="flexbox flex-justified text-center mt-30 bb-1 border-dark pb-20">
					  <li class="br-1 border-dark">
						<div class="text-black">USD</div>
						<small class="font-size-18"><span class="text-black">2.153</span></small>
					  </li>

					  <li class="br-1 border-dark">
						<div class="text-black">EUR</div>
						<small class="font-size-18"><span class="text-black">3.9232</span></small>
					  </li>

					  <li>
						<div class="text-black">GBP</div>
						<small class="font-size-18"><span class="text-black">3.8202</span></small>
					  </li>
                  </ul>
				  <ul class="flexbox flex-justified text-center mt-20">
					  <li class="br-1 border-dark">
						<div class="text-black">% 1h</div>
						<small class="font-size-18"><span class="text-black"><i class="fa fa-arrow-up pr-5"></i>0.4</span></small>
					  </li>

					  <li class="br-1 border-dark">
						<div class="text-black">% 24h</div>
						<small class="font-size-18"><span class="text-black"><i class="fa fa-arrow-up pr-5"></i>9.29</span></small>
					  </li>

					  <li>
						<div class="text-black">% 7d</div>
						<small class="font-size-18"><span class="text-black"><i class="fa fa-arrow-up pr-5"></i>50.77</span></small>
					  </li>
                  </ul>
			  </div>
		  </div>
		</div>
		<div class="col-md-6 col-lg-3 col-12">
		  <div class="box box-inverse bg-dark bg-hexagons-white pull-up">
			  <div class="box-body text-center">
				  <h2 class="mb-0 text-bold">XRP</h2>
				  <h4>Ripple</h4>
				  <ul class="flexbox flex-justified text-center mt-30 bb-1 border-gray pb-20">
					  <li class="br-1 border-gray">
						<div>USD</div>
						<small class="font-size-18">11.153</small>
					  </li>

					  <li class="br-1 border-gray">
						<div>EUR</div>
						<small class="font-size-18">1.9232</small>
					  </li>

					  <li>
						<div>GBP</div>
						<small class="font-size-18">1.8202</small>
					  </li>
                  </ul>
				  <ul class="flexbox flex-justified text-center mt-20">
					  <li class="br-1 border-gray">
						<div>% 1h</div>
						<small class="font-size-18"><i class="fa fa-arrow-up text-success pr-5"></i>1.4</small>
					  </li>

					  <li class="br-1 border-gray">
						<div>% 24h</div>
						<small class="font-size-18"><i class="fa fa-arrow-up text-success pr-5"></i>3.29</small>
					  </li>

					  <li>
						<div>% 7d</div>
						<small class="font-size-18"><i class="fa fa-arrow-up text-success pr-5"></i>54.77</small>
					  </li>
                  </ul>
			  </div>
		  </div>
		</div>
		<div class="col-md-6 col-lg-3 col-12">
		  <div class="box box-inverse bg-yellow text-black bg-hexagons-dark pull-up">
			  <div class="box-body text-center">
				  <h2 class="mb-0 text-bold"><span class="text-black">BTC</span></h2>
				  <h4><span class="text-black">Bitcoin</span></h4>
				  <ul class="flexbox flex-justified text-center mt-30 bb-1 border-dark pb-20">
					  <li class="br-1 border-dark">
						<div class="text-black">USD</div>
						<small class="font-size-18"><span class="text-black">1.153</span></small>
					  </li>

					  <li class="br-1 border-dark">
						<div class="text-black">EUR</div>
						<small class="font-size-18"><span class="text-black">0.9232</span></small>
					  </li>

					  <li>
						<div class="text-black">GBP</div>
						<small class="font-size-18"><span class="text-black">0.8202</span></small>
					  </li>
                  </ul>
				  <ul class="flexbox flex-justified text-center mt-20">
					  <li class="br-1 border-dark">
						<div class="text-black">% 1h</div>
						<small class="font-size-18"><span class="text-black"><i class="fa fa-arrow-up pr-5"></i>0.4</span></small>
					  </li>

					  <li class="br-1 border-dark">
						<div class="text-black">% 24h</div>
						<small class="font-size-18"><span class="text-black"><i class="fa fa-arrow-up pr-5"></i>9.29</span></small>
					  </li>

					  <li>
						<div class="text-black">% 7d</div>
						<small class="font-size-18"><span class="text-black"><i class="fa fa-arrow-up pr-5"></i>50.77</span></small>
					  </li>
                  </ul>
			  </div>
		  </div>
		 </div>
		<div class="col-md-6 col-lg-3 col-12">
		  <div class="box box-inverse bg-dark bg-hexagons-white pull-up">
			  <div class="box-body text-center">
				  <h2 class="mb-0 text-bold">LTC</h2>
				  <h4>Litecoin</h4>
				  <ul class="flexbox flex-justified text-center mt-30 bb-1 border-gray pb-20">
					  <li class="br-1 border-gray">
						<div>USD</div>
						<small class="font-size-18">1.153</small>
					  </li>

					  <li class="br-1 border-gray">
						<div>EUR</div>
						<small class="font-size-18">0.9232</small>
					  </li>

					  <li>
						<div>GBP</div>
						<small class="font-size-18">0.8202</small>
					  </li>
                  </ul>
				  <ul class="flexbox flex-justified text-center mt-20">
					  <li class="br-1 border-gray">
						<div>% 1h</div>
						<small class="font-size-18"><i class="fa fa-arrow-up text-success pr-5"></i>0.4</small>
					  </li>

					  <li class="br-1 border-gray">
						<div>% 24h</div>
						<small class="font-size-18"><i class="fa fa-arrow-up text-success pr-5"></i>9.29</small>
					  </li>

					  <li>
						<div>% 7d</div>
						<small class="font-size-18"><i class="fa fa-arrow-up text-success pr-5"></i>50.77</small>
					  </li>
                  </ul>
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
<script type="text/javascript">
$(function () {
    "use strict";
     
	$('#dataTable_crypto').DataTable({
      'paging'      : false,
      'lengthChange': true,
      'searching'   : true,
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false
    });
	
	if ($('.table-responsive').length) {
        setRandomClass();
        setInterval(function () {
            setRandomClass();
        },1000);
        function setRandomClass() {
            var tbody = $(".table-responsive table tbody");
            var items = tbody.find("tr");
            var number = items.length;
            var random1 = Math.floor((Math.random() * number));
            var random2 = Math.floor((Math.random() * number));
            items.removeClass("bg-pale-warning");
            items.eq(random1).addClass("bg-pale-warning");
            items.eq(random2).addClass("bg-pale-warning");
        }
    }
	
	/*--- Sparkline charts - mini charts ---*/ 
	function sparkline_charts() {
		$('.sparklines').sparkline('html');
	}
	if ($('.sparklines').length) {
		sparkline_charts();
	} 
	
  }); // End of use strict</script>

</body>
</html>
