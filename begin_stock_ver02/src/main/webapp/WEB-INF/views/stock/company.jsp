<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<!-- jQuery 3 -->
	<script src="${project}assets/vendor_components/jquery/dist/jquery.min.js"></script>
	
	<!-- popper -->
	<script src="${project}assets/vendor_components/popper/dist/popper.min.js"></script>
	
	<!-- Bootstrap 4.0-->
	<script src="${project}assets/vendor_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <meta http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="${projcet }images/favicon.ico">

    <title>Crypto Admin - ICO Listing Filter</title>
  	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
  	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
	<script type="text/javascript">
	$(function autocomplete() {
	    var stock = [${stockname}];
	    $("#tags").autocomplete({
	      source: stock
	    });
	  });
	</script>
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

  <!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>Company List</h1>
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
        <li class="breadcrumb-item"><a href="#">Company List</a></li>
        <li class="breadcrumb-item active">ICO Listing Filters</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	  <div class="box bg-light">
		<div class="box-body p-0">
			<div class="row">
				<div class="col-lg-3">
					<div>
						<form action="${path }/user/stocklistsearch" method="get">
							<input name="stockname" id="tags" onkeyup="autocomplete();" class="form-control text-dark p-30 bg-yellow" type="text" data-ref="input-search" placeholder="Search Company">
						</form>
					</div>
				</div>
				<div class="col-lg-9">					
					<ul class="list-inline mb-0 text-center">
						<li data-filter="all"><a href="#" class="btn text-bold list-link hover-yellow p-15">Show all</a></li>
						<li data-filter=".finance"><a href="#" class="btn text-bold list-link hover-yellow p-15">Finance</a></li>
						<li data-filter=".realestate"><a href="#" class="btn text-bold list-link hover-yellow p-15">Real Estate</a></li>
						<li data-filter=".healthcare"><a href="#" class="btn text-bold list-link hover-yellow p-15">Healthcare</a></li>
						<li data-filter=".advertising"><a href="#" class="btn text-bold list-link hover-yellow p-15">Advertising</a></li>
						<li data-filter=".banking"><a href="#" class="btn text-bold list-link hover-yellow p-15">Banking</a></li>
					</ul>
				</div>
			</div>
		</div>
	  </div>
	  <div class="row">
		  <div class="col-lg-3 col-12">
			  <div class="box">
				<div class="box-body p-0">
				  <div class="media-list media-list-hover media-list-divided radio-group radios-filter">
					<div class="media">
						<div class="radio">
							<input name="group1" value="all" type="radio" class="with-gap radio-col-yellow" id="radio_0">
							<label for="radio_0" class="mb-0 font-weight-600">All</label>
						</div>
					</div>
					<div class="media">
						<div class="radio">
							<input name="group1" value=".sponsored" type="radio" class="with-gap radio-col-yellow" id="radio_1">
							<label for="radio_1" class="mb-0 font-weight-600">금융업</label>
						</div>
					</div>
					<div class="media">
						<div class="radio">
							<input name="group1" value=".medium" type="radio" class="with-gap radio-col-yellow" id="radio_2">
							<label for="radio_2" class="mb-0 font-weight-600">의약품</label>
						</div>
					</div>
					<div class="media">
						<div class="radio">
							<input name="group1" value=".neutral" type="radio" class="with-gap radio-col-yellow" id="radio_3">
							<label for="radio_3" class="mb-0 font-weight-600">전기전자</label>
						</div>
					</div>
					<div class="media">
						<div class="radio">
							<input name="group1" value=".notrated" type="radio" class="with-gap radio-col-yellow" id="radio_4">
							<label for="radio_4" class="mb-0 font-weight-600">기타</label>
						</div>
					</div>
				  </div>
				</div>
            </div>			  
		  </div>
		  <div class="col-lg-9 col-12">
		  <div class="row ico-filter" data-ref="ico-filter">
		  <c:forEach var="dto" items="${list }">
		  		<c:if test="${dto.stocktheme=='금융업' }">
		  		<div class="col-12 col-md-6 col-lg-4 mix realestate sponsored">
		  			<div class="box box-body bg-hexagons-white pull-up">
					  <div class="media align-items-center p-0">
						<div class="text-center">
						  <a href="#"><i class="cc ZEC mr-5" title="ZEC"></i></a>
						</div>
						<div>
						  <h3 class="no-margin text-bold"><a href="${path }/user/financialInfo?stockcode=${dto.stockcode}">${dto.stockname }</a>&nbsp;&nbsp;<a href="${path }/user/insertInterest?stockcode=${dto.stockcode}"><span class="glyphicon glyphicon-bookmark"></span></a></h3>
						  <span>${dto.stockcode }</span>
						</div>
					  </div>
					  <div class="flexbox align-items-center mt-25">
						<div>
						  <p class="no-margin font-weight-600"><span class="text-yellow">현재가 <fmt:formatNumber value="${dto.stockcurrent}" pattern="#,###"/></span> / 시가 <fmt:formatNumber value="${dto.stockopen}" pattern="#,###"/></p>
						  <p class="no-margin">${dto.stocktheme }</p>
						</div>
						<div class="text-right">
						  <p class="no-margin font-weight-600"><span class="text-yellow">거래량 ${dto.stockvolume }</span></p>
						  <p class="no-margin">상장년도 <fmt:formatDate value="${dto.stockdate }" pattern="yyyy-MM-dd"/></p>
						</div>
					  </div>
					</div>		
		  		</div>	
		  		</c:if>
		  		<c:if test="${dto.stocktheme=='의약품' }">
		  		<div class="col-12 col-md-6 col-lg-4 mix realestate medium">
		  			<div class="box box-body bg-hexagons-white pull-up">
					  <div class="media align-items-center p-0">
						<div class="text-center">
						  <a href="#"><i class="cc QTUM mr-5" title="QTUM"></i></a>
						</div>
						<div>
						  <h3 class="no-margin text-bold"><a href="${path }/user/financialInfo?stockcode=${dto.stockcode}">${dto.stockname }</a>&nbsp;&nbsp;<a href="${path }/user/insertInterest?stockcode=${dto.stockcode}"><span class="glyphicon glyphicon-bookmark"></span></a></h3>
						  <span>${dto.stockcode }</span>
						</div>
					  </div>
					  <div class="flexbox align-items-center mt-25">
						<div>
						  <p class="no-margin font-weight-600"><span class="text-yellow">현재가 <fmt:formatNumber value="${dto.stockcurrent}" pattern="#,###"/></span> / 시가 <fmt:formatNumber value="${dto.stockopen}" pattern="#,###"/></p>
						  <p class="no-margin">${dto.stocktheme }</p>
						</div>
						<div class="text-right">
						  <p class="no-margin font-weight-600"><span class="text-yellow">거래량 ${dto.stockvolume }</span></p>
						  <p class="no-margin">상장년도 <fmt:formatDate value="${dto.stockdate }" pattern="yyyy-MM-dd"/></p>
						</div>
					  </div>
					</div>		
		  		</div>	
		  		</c:if>
		  		<c:if test="${dto.stocktheme=='전기전자' }">
		  		<div class="col-12 col-md-6 col-lg-4 mix realestate neutral">
		  			<div class="box box-body bg-hexagons-white pull-up">
					  <div class="media align-items-center p-0">
						<div class="text-center">
						  <a href="#"><i class="cc STRAT mr-5" title="STRAT"></i></a>
						</div>
						<div>
						  <h3 class="no-margin text-bold"><a href="${path }/user/financialInfo?stockcode=${dto.stockcode}">${dto.stockname }</a>&nbsp;&nbsp;<a href="${path }/user/insertInterest?stockcode=${dto.stockcode}"><span class="glyphicon glyphicon-bookmark"></span></a></h3>
						  <span>${dto.stockcode}</span>
						</div>
					  </div>
					  <div class="flexbox align-items-center mt-25">
						<div>
						  <p class="no-margin font-weight-600"><span class="text-yellow">현재가 <fmt:formatNumber value="${dto.stockcurrent}" pattern="#,###"/></span> / 시가 <fmt:formatNumber value="${dto.stockopen}" pattern="#,###"/></p>
						  <p class="no-margin">${dto.stocktheme }</p>
						</div>
						<div class="text-right">
						  <p class="no-margin font-weight-600"><span class="text-yellow">거래량 ${dto.stockvolume }</span></p>
						  <p class="no-margin">상장년도 <fmt:formatDate value="${dto.stockdate }" pattern="yyyy-MM-dd"/></p>
						</div>
					  </div>
					</div>		
		  		</div>	
		  		</c:if>
		  		<c:if test="${dto.stocktheme!='의약품' and dto.stocktheme!='전기전자' and dto.stocktheme!='금융업' }">
		  		<div class="col-12 col-md-6 col-lg-4 mix realestate notrated">
		  			<div class="box box-body bg-hexagons-white pull-up">
					  <div class="media align-items-center p-0">
						<div class="text-center">
						  <a href="#"><i class="cc BAT mr-5" title="BAT"></i></a>
						</div>
						<div>
						  <h3 class="no-margin text-bold"><a href="${path }/user/financialInfo?stockcode=${dto.stockcode}">${dto.stockname }</a>&nbsp;&nbsp;<a href="${path }/user/insertInterest?stockcode=${dto.stockcode}"><span class="glyphicon glyphicon-bookmark"></span></a></h3>
						  <span>${dto.stockcode }</span>
						</div>
					  </div>
					  <div class="flexbox align-items-center mt-25">
						<div>
						  <p class="no-margin font-weight-600"><span class="text-yellow">현재가 <fmt:formatNumber value="${dto.stockcurrent}" pattern="#,###"/></span> / 시가 <fmt:formatNumber value="${dto.stockopen}" pattern="#,###"/></p>
						  <p class="no-margin">${dto.stocktheme }</p>
						</div>
						<div class="text-right">
						  <p class="no-margin font-weight-600"><span class="text-yellow">거래량 ${dto.stockvolume }</span></p>
						  <p class="no-margin">상장년도 <fmt:formatDate value="${dto.stockdate }" pattern="yyyy-MM-dd"/></p>
						</div>
					  </div>
					</div>		
		  		</div>	
		  		</c:if>
			</c:forEach>	
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


	<!-- SlimScroll -->
	<script src="${project}assets/vendor_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	
	<!-- FastClick -->
	<script src="${project}assets/vendor_components/fastclick/lib/fastclick.js"></script>
	
	<!-- mixitup -->
	<script src="${project}assets/vendor_components/mixitup-v3/dist/mixitup.js"></script>
	
	<!-- Crypto_Admin App -->
	<script src="${project}js/template.js"></script>
	
	<!-- Crypto_Admin for demo purposes -->
	<script src="${project}js/demo.js"></script>
	
	<!-- Crypto_Admin for demo purposes -->
	<script src="${project}js/pages/ico-filter.js"></script>
	
</body>
</html>
