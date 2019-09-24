<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="${project }images/favicon.ico">
    
    
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
      <h1>
        Financial Information
      </h1>
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="breadcrumb-item"><a href="#">Transactions</a></li>
        <li class="breadcrumb-item active">Transactions Table</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	  <div class="row">
	  		<div class="col-lg-6 col-12">
          <div class="box box-solid bg-dark">
            <div class="box-header with-border">
              <h3 class="box-title">Latest Data</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
				<div class="table-responsive">
				  <table class="table table-hover">
					<tr>
					  <th>DATE</th>
					  <th>OPEN</th>
					  <th>HIGH</th>
					  <th>LOW</th>
					  <th>CLOSE</th>
					  <th>VOLUME</th>
					</tr>
					<c:forEach var="dto" items="${list }">
					<tr>
					  <td><a href="javascript:void(0)"><fmt:formatDate value="${dto.r_date}" pattern="yyyy-MM-dd"/></a></td>
					  <td><fmt:formatNumber value="${dto.r_open}" pattern="#,###"/></td>
					  <td><span class="label label-success"><fmt:formatNumber value="${dto.r_high}" pattern="#,###"/></span> </td>
					  <td><span class="label label-danger"><fmt:formatNumber value="${dto.r_low}" pattern="#,###"/></span></td>
					  <td><fmt:formatNumber value="${dto.r_close}" pattern="#,###"/></td>
					  <td><fmt:formatNumber value="${dto.r_volume}" pattern="#,###"/></td>
					</tr>
					</c:forEach>
				  </table>
				</div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
		  </div>
		  <div class="col-lg-6 col-12">
			  <!-- Default box -->
			  <div class="box box-solid bg-dark">
				<div class="box-header with-border">
				  <h3 class="box-title"><a href="https://finance.naver.com/item/main.nhn?code=${vo.stockcode }" style="color:lightgray;" target="_blank">${vo.stockname }<small>(${vo.stockcode })</small></a></h3>

				  <div class="box-tools pull-right">
					<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
							title="Collapse">
					  <i class="fa fa-minus"></i></button>
					<button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
					  <i class="fa fa-times"></i></button>
				  </div>
				</div>
				<div class="box-body">
					<div class="table-responsive">
						<table class="table no-margin table-hover" style="text-align:center;">
						  <thead>					
							<tr class="bg-dark">
							  <th class="text-yellow">Current</th>
							  <th class="text-yellow">Open</th>
							  <th class="text-yellow">High</th>
							  <th class="text-yellow">Low</th>
							  <th class="text-yellow">Volume</th>
							  <th class="text-yellow">Date</th>
							</tr>
						  </thead>
						  <tbody>
							<tr>
							  <td>
								<span class="text-yellow hover-warning"><fmt:formatNumber value="${vo.stockcurrent}" pattern="#,###"/></span>
							  </td>
							  <td>
							  	<span class="text-yellow hover-warning"><fmt:formatNumber value="${vo.stockopen }" pattern="#,###"/></span>
							  </td>
							  <td><span class="label label-success"><fmt:formatNumber value="${vo.stockhigh}" pattern="#,###"/></span></td>
							  <td><span class="label label-danger"><fmt:formatNumber value="${vo.stocklow}" pattern="#,###"/></span></td>
							  <td><fmt:formatNumber value="${vo.stockvolume }" pattern="#,###"/></td>
							  <td><fmt:formatDate value="${vo.stockdate }" pattern="yyyy-MM-dd"/></td>
							</tr>
						</table>
					</div>
					
				</div>
				<!-- /.box-body -->
			  </div>
			  <!-- /.box -->
			  
			  <!-- Column and Line mix -->
	          <div class="box box-solid bg-dark">
	            <div class="box-header with-border">
	              <h3 class="box-title">Average closing price and Trading volume per Year</h3>
	
	              <div class="box-tools pull-right">
	                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
	              </div>
	            </div>
	            <div class="box-body">
	              <div class="chart">
	                <div id="lion_amcharts_2" style="height: 467px;"></div>
	              </div>
	            </div>
	            <!-- /.box-body -->
	          </div>
	          <!-- /.box -->
		  </div>
	  </div>
		<div class="row">
			<div class="col-lg-12 col-12">
	          <div class="box box-solid bg-dark">
	            <div class="box-header with-border">
	              <h3 class="box-title">Financial Statement per Year and Quarter</h3>
	              <div class="box-tools pull-right">
	                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
	              </div>
	            </div>
	            <div class="box-body">
					<div class="table-responsive">
						<table class="table no-margin table-hover" style="text-align:center;">
							${data }
						</table>
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
	<script src="${project}assets/vendor_components/jquery/dist/jquery.min.js"></script>
	
	<!-- popper -->
	<script src="${project}assets/vendor_components/popper/dist/popper.min.js"></script>
	
	<!-- Bootstrap 4.0-->
	<script src="${project}assets/vendor_components/bootstrap/dist/js/bootstrap.min.js"></script>
	
	<!-- SlimScroll -->
	<script src="${project}assets/vendor_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	
	<!-- FastClick -->
	<script src="${project}assets/vendor_components/fastclick/lib/fastclick.js"></script>
	
	<!-- Crypto_Admin App -->
	<script src="${project}js/template.js"></script>
	
	<!-- Crypto_Admin for demo purposes -->
	<script src="${project}js/demo.js"></script>
	
	<!--amcharts charts -->	
	<script src="http://www.amcharts.com/lib/3/amcharts.js" type="text/javascript"></script>
	<script src="http://www.amcharts.com/lib/3/serial.js" type="text/javascript"></script>
	<script src="http://www.amcharts.com/lib/3/radar.js" type="text/javascript"></script>
	<script src="http://www.amcharts.com/lib/3/pie.js" type="text/javascript"></script>
	<script src="http://www.amcharts.com/lib/3/plugins/animate/animate.min.js" type="text/javascript"></script>
	<script src="http://www.amcharts.com/lib/3/plugins/export/export.min.js" type="text/javascript"></script>
	<script src="http://www.amcharts.com/lib/3/themes/dark.js" type="text/javascript"></script>
	
	<script>
	//== Class definition
	var amChartsChartsDemo = function() {
		
	    //== Private functions
	    var demo1 = function() {
	        var chart = AmCharts.makeChart("lion_amcharts_1", {
	            "type": "serial",
	            "theme": "dark",
	            "dataProvider": [{
	                "country": "USA",
	                "visits": 2025
	            }, {
	                "country": "China",
	                "visits": 1882
	            }, {
	                "country": "Japan",
	                "visits": 1809
	            }, {
	                "country": "Germany",
	                "visits": 1322
	            }, {
	                "country": "UK",
	                "visits": 1122
	            }, {
	                "country": "France",
	                "visits": 1114
	            }, {
	                "country": "India",
	                "visits": 984
	            }, {
	                "country": "Spain",
	                "visits": 711
	            }, {
	                "country": "Netherlands",
	                "visits": 665
	            }, {
	                "country": "Russia",
	                "visits": 580
	            }, {
	                "country": "South Korea",
	                "visits": 443
	            }, {
	                "country": "Canada",
	                "visits": 441
	            }, {
	                "country": "Brazil",
	                "visits": 395
	            }],
	            "valueAxes": [{
	                "gridColor": "#FFFFFF",
	                "gridAlpha": 0.2,
	                "dashLength": 0
	            }],
	            "gridAboveGraphs": true,
	            "startDuration": 1,
	            "graphs": [{
	                "balloonText": "[[category]]: <b>[[value]]</b>",
	                "fillAlphas": 0.8,
	                "lineAlpha": 0.2,
	                "type": "column",
	                "valueField": "visits"
	            }],
	            "chartCursor": {
	                "categoryBalloonEnabled": false,
	                "cursorAlpha": 0,
	                "zoomable": false
	            },
	            "categoryField": "country",
	            "categoryAxis": {
	                "gridPosition": "start",
	                "gridAlpha": 0,
	                "tickPosition": "start",
	                "tickLength": 20
	            },
	            "export": {
	                "enabled": true
	            }

	        });
	    }

	    var demo2 = function() {
	        var chart = AmCharts.makeChart("lion_amcharts_2", {
	            "type": "serial",
	            "addClassNames": true,
	            "theme": "dark",
	            "autoMargins": false,
	            "marginLeft": 30,
	            "marginRight": 8,
	            "marginTop": 10,
	            "marginBottom": 26,
	            "balloon": {
	                "adjustBorderColor": false,
	                "horizontalPadding": 10,
	                "verticalPadding": 8,
	                "color": "#ffffff"
	            },

	            "dataProvider": [${result2}],
	            "valueAxes": [{
	                "axisAlpha": 0,
	                "position": "left"
	            }],
	            "startDuration": 1,
	            "graphs": [{
	                "alphaField": "alpha",
	                "balloonText": "<span style='font-size:12px;'>[[title]] in [[category]]:<br><span style='font-size:20px;'>[[value]]</span> [[additional]]</span>",
	                "fillAlphas": 1,
	                "title": "Trading Volume",
	                "type": "column",
	                "valueField": "income",
	                "dashLengthField": "dashLengthColumn"
	            }, {
	                "id": "graph2",
	                "balloonText": "<span style='font-size:12px;'>[[title]] in [[category]]:<br><span style='font-size:20px;'>[[value]]</span> [[additional]]</span>",
	                "bullet": "round",
	                "lineThickness": 3,
	                "bulletSize": 7,
	                "bulletBorderAlpha": 1,
	                "bulletColor": "#FFFFFF",
	                "useLineColorForBulletBorder": true,
	                "bulletBorderThickness": 3,
	                "fillAlphas": 0,
	                "lineAlpha": 1,
	                "title": "Closing Price",
	                "valueField": "expenses",
	                "dashLengthField": "dashLengthLine"
	            }],
	            "categoryField": "year",
	            "categoryAxis": {
	                "gridPosition": "start",
	                "axisAlpha": 0,
	                "tickLength": 0
	            },
	            "export": {
	                "enabled": true
	            }
	        });
	    }

	    var demo3 = function() {
	        var chart = AmCharts.makeChart("lion_amcharts_3", {
	            "theme": "dark",
	            "type": "serial",
	            "dataProvider": [{
	                "country": "USA",
	                "year2004": 3.5,
	                "year2005": 4.2
	            }, {
	                "country": "UK",
	                "year2004": 1.7,
	                "year2005": 3.1
	            }, {
	                "country": "Canada",
	                "year2004": 2.8,
	                "year2005": 2.9
	            }, {
	                "country": "Japan",
	                "year2004": 2.6,
	                "year2005": 2.3
	            }, {
	                "country": "France",
	                "year2004": 1.4,
	                "year2005": 2.1
	            }, {
	                "country": "Brazil",
	                "year2004": 2.6,
	                "year2005": 4.9
	            }],
	            "valueAxes": [{
	                "unit": "%",
	                "position": "left",
	                "title": "GDP growth rate",
	            }],
	            "startDuration": 1,
	            "graphs": [{
	                "balloonText": "GDP grow in [[category]] (2004): <b>[[value]]</b>",
	                "fillAlphas": 0.9,
	                "lineAlpha": 0.2,
	                "title": "2004",
	                "type": "column",
	                "valueField": "year2004"
	            }, {
	                "balloonText": "GDP grow in [[category]] (2005): <b>[[value]]</b>",
	                "fillAlphas": 0.9,
	                "lineAlpha": 0.2,
	                "title": "2005",
	                "type": "column",
	                "clustered": false,
	                "columnWidth": 0.5,
	                "valueField": "year2005"
	            }],
	            "plotAreaFillAlphas": 0.1,
	            "categoryField": "country",
	            "categoryAxis": {
	                "gridPosition": "start"
	            },
	            "export": {
	                "enabled": true
	            }

	        });
	    }

	    var demo4 = function() {
	        var chart = AmCharts.makeChart("lion_amcharts_4", {
	            "theme": "dark",
	            "type": "serial",
	            "dataProvider": [{
	                "country": "USA",
	                "year2004": 3.5,
	                "year2005": 4.2
	            }, {
	                "country": "UK",
	                "year2004": 1.7,
	                "year2005": 3.1
	            }, {
	                "country": "Canada",
	                "year2004": 2.8,
	                "year2005": 2.9
	            }, {
	                "country": "Japan",
	                "year2004": 2.6,
	                "year2005": 2.3
	            }, {
	                "country": "France",
	                "year2004": 1.4,
	                "year2005": 2.1
	            }, {
	                "country": "Brazil",
	                "year2004": 2.6,
	                "year2005": 4.9
	            }, {
	                "country": "Russia",
	                "year2004": 6.4,
	                "year2005": 7.2
	            }, {
	                "country": "India",
	                "year2004": 8,
	                "year2005": 7.1
	            }, {
	                "country": "China",
	                "year2004": 9.9,
	                "year2005": 10.1
	            }],
	            "valueAxes": [{
	                "stackType": "3d",
	                "unit": "%",
	                "position": "left",
	                "title": "GDP growth rate",
	            }],
	            "startDuration": 1,
	            "graphs": [{
	                "balloonText": "GDP grow in [[category]] (2004): <b>[[value]]</b>",
	                "fillAlphas": 0.9,
	                "lineAlpha": 0.2,
	                "title": "2004",
	                "type": "column",
	                "valueField": "year2004"
	            }, {
	                "balloonText": "GDP grow in [[category]] (2005): <b>[[value]]</b>",
	                "fillAlphas": 0.9,
	                "lineAlpha": 0.2,
	                "title": "2005",
	                "type": "column",
	                "valueField": "year2005"
	            }],
	            "plotAreaFillAlphas": 0.1,
	            "depth3D": 60,
	            "angle": 30,
	            "categoryField": "country",
	            "categoryAxis": {
	                "gridPosition": "start"
	            },
	            "export": {
	                "enabled": true
	            }
	        });
	    }

	    var demo5 = function() {
	        var chart = AmCharts.makeChart("lion_amcharts_5", {
	            "type": "serial",
	            "theme": "dark",
	            "handDrawn": true,
	            "handDrawScatter": 3,
	            "legend": {
	                "useGraphSettings": true,
	                "markerSize": 12,
	                "valueWidth": 0,
	                "verticalGap": 0
	            },
	            "dataProvider": [{
	                "year": 2005,
	                "income": 23.5,
	                "expenses": 18.1
	            }, {
	                "year": 2006,
	                "income": 26.2,
	                "expenses": 22.8
	            }, {
	                "year": 2007,
	                "income": 30.1,
	                "expenses": 23.9
	            }, {
	                "year": 2008,
	                "income": 29.5,
	                "expenses": 25.1
	            }, {
	                "year": 2009,
	                "income": 24.6,
	                "expenses": 25
	            }],
	            "valueAxes": [{
	                "minorGridAlpha": 0.08,
	                "minorGridEnabled": true,
	                "position": "top",
	                "axisAlpha": 0
	            }],
	            "startDuration": 1,
	            "graphs": [{
	                "balloonText": "<span style='font-size:13px;'>[[title]] in [[category]]:<b>[[value]]</b></span>",
	                "title": "Income",
	                "type": "column",
	                "fillAlphas": 0.8,

	                "valueField": "income"
	            }, {
	                "balloonText": "<span style='font-size:13px;'>[[title]] in [[category]]:<b>[[value]]</b></span>",
	                "bullet": "round",
	                "bulletBorderAlpha": 1,
	                "bulletColor": "#FFFFFF",
	                "useLineColorForBulletBorder": true,
	                "fillAlphas": 0,
	                "lineThickness": 2,
	                "lineAlpha": 1,
	                "bulletSize": 7,
	                "title": "Expenses",
	                "valueField": "expenses"
	            }],
	            "rotate": true,
	            "categoryField": "year",
	            "categoryAxis": {
	                "gridPosition": "start"
	            },
	            "export": {
	                "enabled": true
	            }

	        });
	    }

	    var demo6 = function() {
	        var chart = AmCharts.makeChart("lion_amcharts_6", {
	            "type": "serial",
	            "theme": "dark",
	            "marginRight": 40,
	            "marginLeft": 40,
	            "autoMarginOffset": 20,
	            "mouseWheelZoomEnabled": true,
	            "dataDateFormat": "YYYY-MM-DD",
	            "valueAxes": [{
	                "id": "v1",
	                "axisAlpha": 0,
	                "position": "left",
	                "ignoreAxisWidth": true
	            }],
	            "balloon": {
	                "borderThickness": 1,
	                "shadowAlpha": 0
	            },
	            "graphs": [{
	                "id": "g1",
	                "balloon": {
	                    "drop": true,
	                    "adjustBorderColor": false,
	                    "color": "#ffffff"
	                },
	                "bullet": "round",
	                "bulletBorderAlpha": 1,
	                "bulletColor": "#FFFFFF",
	                "bulletSize": 5,
	                "hideBulletsCount": 50,
	                "lineThickness": 2,
	                "title": "red line",
	                "useLineColorForBulletBorder": true,
	                "valueField": "value",
	                "balloonText": "<span style='font-size:18px;'>[[value]]</span>"
	            }],
	            "chartScrollbar": {
	                "graph": "g1",
	                "oppositeAxis": false,
	                "offset": 30,
	                "scrollbarHeight": 80,
	                "backgroundAlpha": 0,
	                "selectedBackgroundAlpha": 0.1,
	                "selectedBackgroundColor": "#888888",
	                "graphFillAlpha": 0,
	                "graphLineAlpha": 0.5,
	                "selectedGraphFillAlpha": 0,
	                "selectedGraphLineAlpha": 1,
	                "autoGridCount": true,
	                "color": "#AAAAAA"
	            },
	            "chartCursor": {
	                "pan": true,
	                "valueLineEnabled": true,
	                "valueLineBalloonEnabled": true,
	                "cursorAlpha": 1,
	                "cursorColor": "#258cbb",
	                "limitToGraph": "g1",
	                "valueLineAlpha": 0.2,
	                "valueZoomable": true
	            },
	            "valueScrollbar": {
	                "oppositeAxis": false,
	                "offset": 50,
	                "scrollbarHeight": 10
	            },
	            "categoryField": "date",
	            "categoryAxis": {
	                "parseDates": true,
	                "dashLength": 1,
	                "minorGridEnabled": true
	            },
	            "export": {
	                "enabled": true
	            },
	            "dataProvider": [{
	                "date": "2012-07-27",
	                "value": 13
	            }, {
	                "date": "2012-07-28",
	                "value": 11
	            }, {
	                "date": "2012-07-29",
	                "value": 15
	            }, {
	                "date": "2012-07-30",
	                "value": 16
	            }, {
	                "date": "2012-07-31",
	                "value": 18
	            }, {
	                "date": "2012-08-01",
	                "value": 13
	            }, {
	                "date": "2012-08-02",
	                "value": 22
	            }, {
	                "date": "2012-08-03",
	                "value": 23
	            }, {
	                "date": "2012-08-04",
	                "value": 20
	            }, {
	                "date": "2012-08-05",
	                "value": 17
	            }, {
	                "date": "2012-08-06",
	                "value": 16
	            }, {
	                "date": "2012-08-07",
	                "value": 18
	            }, {
	                "date": "2012-08-08",
	                "value": 21
	            }, {
	                "date": "2012-08-09",
	                "value": 26
	            }, {
	                "date": "2012-08-10",
	                "value": 24
	            }, {
	                "date": "2012-08-11",
	                "value": 29
	            }, {
	                "date": "2012-08-12",
	                "value": 32
	            }, {
	                "date": "2012-08-13",
	                "value": 18
	            }, {
	                "date": "2012-08-14",
	                "value": 24
	            }, {
	                "date": "2012-08-15",
	                "value": 22
	            }, {
	                "date": "2012-08-16",
	                "value": 18
	            }, {
	                "date": "2012-08-17",
	                "value": 19
	            }, {
	                "date": "2012-08-18",
	                "value": 14
	            }, {
	                "date": "2012-08-19",
	                "value": 15
	            }, {
	                "date": "2012-08-20",
	                "value": 12
	            }, {
	                "date": "2012-08-21",
	                "value": 8
	            }, {
	                "date": "2012-08-22",
	                "value": 9
	            }, {
	                "date": "2012-08-23",
	                "value": 8
	            }, {
	                "date": "2012-08-24",
	                "value": 7
	            }, {
	                "date": "2012-08-25",
	                "value": 5
	            }, {
	                "date": "2012-08-26",
	                "value": 11
	            }, {
	                "date": "2012-08-27",
	                "value": 13
	            }, {
	                "date": "2012-08-28",
	                "value": 18
	            }, {
	                "date": "2012-08-29",
	                "value": 20
	            }, {
	                "date": "2012-08-30",
	                "value": 29
	            }, {
	                "date": "2012-08-31",
	                "value": 33
	            }, {
	                "date": "2012-09-01",
	                "value": 42
	            }, {
	                "date": "2012-09-02",
	                "value": 35
	            }, {
	                "date": "2012-09-03",
	                "value": 31
	            }, {
	                "date": "2012-09-04",
	                "value": 47
	            }, {
	                "date": "2012-09-05",
	                "value": 52
	            }, {
	                "date": "2012-09-06",
	                "value": 46
	            }, {
	                "date": "2012-09-07",
	                "value": 41
	            }, {
	                "date": "2012-09-08",
	                "value": 43
	            }, {
	                "date": "2012-09-09",
	                "value": 40
	            }, {
	                "date": "2012-09-10",
	                "value": 39
	            }, {
	                "date": "2012-09-11",
	                "value": 34
	            }, {
	                "date": "2012-09-12",
	                "value": 29
	            }, {
	                "date": "2012-09-13",
	                "value": 34
	            }, {
	                "date": "2012-09-14",
	                "value": 37
	            }, {
	                "date": "2012-09-15",
	                "value": 42
	            }, {
	                "date": "2012-09-16",
	                "value": 49
	            }, {
	                "date": "2012-09-17",
	                "value": 46
	            }, {
	                "date": "2012-09-18",
	                "value": 47
	            }, {
	                "date": "2012-09-19",
	                "value": 55
	            }, {
	                "date": "2012-09-20",
	                "value": 59
	            }, {
	                "date": "2012-09-21",
	                "value": 58
	            }, {
	                "date": "2012-09-22",
	                "value": 57
	            }, {
	                "date": "2012-09-23",
	                "value": 61
	            }, {
	                "date": "2012-09-24",
	                "value": 59
	            }, {
	                "date": "2012-09-25",
	                "value": 67
	            }, {
	                "date": "2012-09-26",
	                "value": 65
	            }, {
	                "date": "2012-09-27",
	                "value": 61
	            }, {
	                "date": "2012-09-28",
	                "value": 66
	            }, {
	                "date": "2012-09-29",
	                "value": 69
	            }, {
	                "date": "2012-09-30",
	                "value": 71
	            }, {
	                "date": "2012-10-01",
	                "value": 67
	            }, {
	                "date": "2012-10-02",
	                "value": 63
	            }, {
	                "date": "2012-10-03",
	                "value": 46
	            }, {
	                "date": "2012-10-04",
	                "value": 32
	            }, {
	                "date": "2012-10-05",
	                "value": 21
	            }, {
	                "date": "2012-10-06",
	                "value": 18
	            }, {
	                "date": "2012-10-07",
	                "value": 21
	            }, {
	                "date": "2012-10-08",
	                "value": 28
	            }, {
	                "date": "2012-10-09",
	                "value": 27
	            }, {
	                "date": "2012-10-10",
	                "value": 36
	            }, {
	                "date": "2012-10-11",
	                "value": 33
	            }, {
	                "date": "2012-10-12",
	                "value": 31
	            }, {
	                "date": "2012-10-13",
	                "value": 30
	            }, {
	                "date": "2012-10-14",
	                "value": 34
	            }, {
	                "date": "2012-10-15",
	                "value": 38
	            }, {
	                "date": "2012-10-16",
	                "value": 37
	            }, {
	                "date": "2012-10-17",
	                "value": 44
	            }, {
	                "date": "2012-10-18",
	                "value": 49
	            }, {
	                "date": "2012-10-19",
	                "value": 53
	            }, {
	                "date": "2012-10-20",
	                "value": 57
	            }, {
	                "date": "2012-10-21",
	                "value": 60
	            }, {
	                "date": "2012-10-22",
	                "value": 61
	            }, {
	                "date": "2012-10-23",
	                "value": 69
	            }, {
	                "date": "2012-10-24",
	                "value": 67
	            }, {
	                "date": "2012-10-25",
	                "value": 72
	            }, {
	                "date": "2012-10-26",
	                "value": 77
	            }, {
	                "date": "2012-10-27",
	                "value": 75
	            }, {
	                "date": "2012-10-28",
	                "value": 70
	            }, {
	                "date": "2012-10-29",
	                "value": 72
	            }, {
	                "date": "2012-10-30",
	                "value": 70
	            }, {
	                "date": "2012-10-31",
	                "value": 72
	            }, {
	                "date": "2012-11-01",
	                "value": 73
	            }, {
	                "date": "2012-11-02",
	                "value": 67
	            }, {
	                "date": "2012-11-03",
	                "value": 68
	            }, {
	                "date": "2012-11-04",
	                "value": 65
	            }, {
	                "date": "2012-11-05",
	                "value": 71
	            }, {
	                "date": "2012-11-06",
	                "value": 75
	            }, {
	                "date": "2012-11-07",
	                "value": 74
	            }, {
	                "date": "2012-11-08",
	                "value": 71
	            }, {
	                "date": "2012-11-09",
	                "value": 76
	            }, {
	                "date": "2012-11-10",
	                "value": 77
	            }, {
	                "date": "2012-11-11",
	                "value": 81
	            }, {
	                "date": "2012-11-12",
	                "value": 83
	            }, {
	                "date": "2012-11-13",
	                "value": 80
	            }, {
	                "date": "2012-11-14",
	                "value": 81
	            }, {
	                "date": "2012-11-15",
	                "value": 87
	            }, {
	                "date": "2012-11-16",
	                "value": 82
	            }, {
	                "date": "2012-11-17",
	                "value": 86
	            }, {
	                "date": "2012-11-18",
	                "value": 80
	            }, {
	                "date": "2012-11-19",
	                "value": 87
	            }, {
	                "date": "2012-11-20",
	                "value": 83
	            }, {
	                "date": "2012-11-21",
	                "value": 85
	            }, {
	                "date": "2012-11-22",
	                "value": 84
	            }, {
	                "date": "2012-11-23",
	                "value": 82
	            }, {
	                "date": "2012-11-24",
	                "value": 73
	            }, {
	                "date": "2012-11-25",
	                "value": 71
	            }, {
	                "date": "2012-11-26",
	                "value": 75
	            }, {
	                "date": "2012-11-27",
	                "value": 79
	            }, {
	                "date": "2012-11-28",
	                "value": 70
	            }, {
	                "date": "2012-11-29",
	                "value": 73
	            }, {
	                "date": "2012-11-30",
	                "value": 61
	            }, {
	                "date": "2012-12-01",
	                "value": 62
	            }, {
	                "date": "2012-12-02",
	                "value": 66
	            }, {
	                "date": "2012-12-03",
	                "value": 65
	            }, {
	                "date": "2012-12-04",
	                "value": 73
	            }, {
	                "date": "2012-12-05",
	                "value": 79
	            }, {
	                "date": "2012-12-06",
	                "value": 78
	            }, {
	                "date": "2012-12-07",
	                "value": 78
	            }, {
	                "date": "2012-12-08",
	                "value": 78
	            }, {
	                "date": "2012-12-09",
	                "value": 74
	            }, {
	                "date": "2012-12-10",
	                "value": 73
	            }, {
	                "date": "2012-12-11",
	                "value": 75
	            }, {
	                "date": "2012-12-12",
	                "value": 70
	            }, {
	                "date": "2012-12-13",
	                "value": 77
	            }, {
	                "date": "2012-12-14",
	                "value": 67
	            }, {
	                "date": "2012-12-15",
	                "value": 62
	            }, {
	                "date": "2012-12-16",
	                "value": 64
	            }, {
	                "date": "2012-12-17",
	                "value": 61
	            }, {
	                "date": "2012-12-18",
	                "value": 59
	            }, {
	                "date": "2012-12-19",
	                "value": 53
	            }, {
	                "date": "2012-12-20",
	                "value": 54
	            }, {
	                "date": "2012-12-21",
	                "value": 56
	            }, {
	                "date": "2012-12-22",
	                "value": 59
	            }, {
	                "date": "2012-12-23",
	                "value": 58
	            }, {
	                "date": "2012-12-24",
	                "value": 55
	            }, {
	                "date": "2012-12-25",
	                "value": 52
	            }, {
	                "date": "2012-12-26",
	                "value": 54
	            }, {
	                "date": "2012-12-27",
	                "value": 50
	            }, {
	                "date": "2012-12-28",
	                "value": 50
	            }, {
	                "date": "2012-12-29",
	                "value": 51
	            }, {
	                "date": "2012-12-30",
	                "value": 52
	            }, {
	                "date": "2012-12-31",
	                "value": 58
	            }, {
	                "date": "2013-01-01",
	                "value": 60
	            }, {
	                "date": "2013-01-02",
	                "value": 67
	            }, {
	                "date": "2013-01-03",
	                "value": 64
	            }, {
	                "date": "2013-01-04",
	                "value": 66
	            }, {
	                "date": "2013-01-05",
	                "value": 60
	            }, {
	                "date": "2013-01-06",
	                "value": 63
	            }, {
	                "date": "2013-01-07",
	                "value": 61
	            }, {
	                "date": "2013-01-08",
	                "value": 60
	            }, {
	                "date": "2013-01-09",
	                "value": 65
	            }, {
	                "date": "2013-01-10",
	                "value": 75
	            }, {
	                "date": "2013-01-11",
	                "value": 77
	            }, {
	                "date": "2013-01-12",
	                "value": 78
	            }, {
	                "date": "2013-01-13",
	                "value": 70
	            }, {
	                "date": "2013-01-14",
	                "value": 70
	            }, {
	                "date": "2013-01-15",
	                "value": 73
	            }, {
	                "date": "2013-01-16",
	                "value": 71
	            }, {
	                "date": "2013-01-17",
	                "value": 74
	            }, {
	                "date": "2013-01-18",
	                "value": 78
	            }, {
	                "date": "2013-01-19",
	                "value": 85
	            }, {
	                "date": "2013-01-20",
	                "value": 82
	            }, {
	                "date": "2013-01-21",
	                "value": 83
	            }, {
	                "date": "2013-01-22",
	                "value": 88
	            }, {
	                "date": "2013-01-23",
	                "value": 85
	            }, {
	                "date": "2013-01-24",
	                "value": 85
	            }, {
	                "date": "2013-01-25",
	                "value": 80
	            }, {
	                "date": "2013-01-26",
	                "value": 87
	            }, {
	                "date": "2013-01-27",
	                "value": 84
	            }, {
	                "date": "2013-01-28",
	                "value": 83
	            }, {
	                "date": "2013-01-29",
	                "value": 84
	            }, {
	                "date": "2013-01-30",
	                "value": 81
	            }]
	        });

	        chart.addListener("rendered", zoomChart);

	        zoomChart();

	        function zoomChart() {
	            chart.zoomToIndexes(chart.dataProvider.length - 40, chart.dataProvider.length - 1);
	        }
	    }

	    var demo7 = function() {
	        var chartData = generateChartData();
	        var chart = AmCharts.makeChart("lion_amcharts_7", {
	            "type": "serial",
	            "theme": "dark",
	            "marginRight": 80,
	            "autoMarginOffset": 20,
	            "marginTop": 7,
	            "dataProvider": chartData,
	            "valueAxes": [{
	                "axisAlpha": 0.2,
	                "dashLength": 1,
	                "position": "left"
	            }],
	            "mouseWheelZoomEnabled": true,
	            "graphs": [{
	                "id": "g1",
	                "balloonText": "[[value]]",
	                "bullet": "round",
	                "bulletBorderAlpha": 1,
	                "bulletColor": "#FFFFFF",
	                "hideBulletsCount": 50,
	                "title": "red line",
	                "valueField": "visits",
	                "useLineColorForBulletBorder": true,
	                "balloon": {
	                    "drop": true
	                }
	            }],
	            "chartScrollbar": {
	                "autoGridCount": true,
	                "graph": "g1",
	                "scrollbarHeight": 40
	            },
	            "chartCursor": {
	                "limitToGraph": "g1"
	            },
	            "categoryField": "date",
	            "categoryAxis": {
	                "parseDates": true,
	                "axisColor": "#DADADA",
	                "dashLength": 1,
	                "minorGridEnabled": true
	            },
	            "export": {
	                "enabled": true
	            }
	        });

	        chart.addListener("rendered", zoomChart);
	        zoomChart();

	        // this method is called when chart is first inited as we listen for "rendered" event
	        function zoomChart() {
	            // different zoom methods can be used - zoomToIndexes, zoomToDates, zoomToCategoryValues
	            chart.zoomToIndexes(chartData.length - 40, chartData.length - 1);
	        }


	        // generate some random data, quite different range
	        function generateChartData() {
	            var chartData = [];
	            var firstDate = new Date();
	            firstDate.setDate(firstDate.getDate() - 5);

	            for (var i = 0; i < 1000; i++) {
	                // we create date objects here. In your data, you can have date strings
	                // and then set format of your dates using chart.dataDateFormat property,
	                // however when possible, use date objects, as this will speed up chart rendering.
	                var newDate = new Date(firstDate);
	                newDate.setDate(newDate.getDate() + i);

	                var visits = Math.round(Math.random() * (40 + i / 5)) + 20 + i;

	                chartData.push({
	                    date: newDate,
	                    visits: visits
	                });
	            }
	            return chartData;
	        }
	    }

	    var demo8 = function() {
	        var chart = AmCharts.makeChart("lion_amcharts_8", {
	            "type": "serial",
	            "theme": "dark",
	            "legend": {
	                "equalWidths": false,
	                "useGraphSettings": true,
	                "valueAlign": "left",
	                "valueWidth": 120
	            },
	            "dataProvider": [{
	                "date": "2012-01-01",
	                "distance": 227,
	                "townName": "New York",
	                "townName2": "New York",
	                "townSize": 25,
	                "latitude": 40.71,
	                "duration": 408
	            }, {
	                "date": "2012-01-02",
	                "distance": 371,
	                "townName": "Washington",
	                "townSize": 14,
	                "latitude": 38.89,
	                "duration": 482
	            }, {
	                "date": "2012-01-03",
	                "distance": 433,
	                "townName": "Wilmington",
	                "townSize": 6,
	                "latitude": 34.22,
	                "duration": 562
	            }, {
	                "date": "2012-01-04",
	                "distance": 345,
	                "townName": "Jacksonville",
	                "townSize": 7,
	                "latitude": 30.35,
	                "duration": 379
	            }, {
	                "date": "2012-01-05",
	                "distance": 480,
	                "townName": "Miami",
	                "townName2": "Miami",
	                "townSize": 10,
	                "latitude": 25.83,
	                "duration": 501
	            }, {
	                "date": "2012-01-06",
	                "distance": 386,
	                "townName": "Tallahassee",
	                "townSize": 7,
	                "latitude": 30.46,
	                "duration": 443
	            }, {
	                "date": "2012-01-07",
	                "distance": 348,
	                "townName": "New Orleans",
	                "townSize": 10,
	                "latitude": 29.94,
	                "duration": 405
	            }, {
	                "date": "2012-01-08",
	                "distance": 238,
	                "townName": "Houston",
	                "townName2": "Houston",
	                "townSize": 16,
	                "latitude": 29.76,
	                "duration": 309
	            }, {
	                "date": "2012-01-09",
	                "distance": 218,
	                "townName": "Dalas",
	                "townSize": 17,
	                "latitude": 32.8,
	                "duration": 287
	            }, {
	                "date": "2012-01-10",
	                "distance": 349,
	                "townName": "Oklahoma City",
	                "townSize": 11,
	                "latitude": 35.49,
	                "duration": 485
	            }, {
	                "date": "2012-01-11",
	                "distance": 603,
	                "townName": "Kansas City",
	                "townSize": 10,
	                "latitude": 39.1,
	                "duration": 890
	            }, {
	                "date": "2012-01-12",
	                "distance": 534,
	                "townName": "Denver",
	                "townName2": "Denver",
	                "townSize": 18,
	                "latitude": 39.74,
	                "duration": 810
	            }, {
	                "date": "2012-01-13",
	                "townName": "Salt Lake City",
	                "townSize": 12,
	                "distance": 425,
	                "duration": 670,
	                "latitude": 40.75,
	                "dashLength": 8,
	                "alpha": 0.4
	            }, {
	                "date": "2012-01-14",
	                "latitude": 36.1,
	                "duration": 470,
	                "townName": "Las Vegas",
	                "townName2": "Las Vegas"
	            }, {
	                "date": "2012-01-15"
	            }, {
	                "date": "2012-01-16"
	            }, {
	                "date": "2012-01-17"
	            }, {
	                "date": "2012-01-18"
	            }, {
	                "date": "2012-01-19"
	            }],
	            "valueAxes": [{
	                "id": "distanceAxis",
	                "axisAlpha": 0,
	                "gridAlpha": 0,
	                "position": "left",
	                "title": "distance"
	            }, {
	                "id": "latitudeAxis",
	                "axisAlpha": 0,
	                "gridAlpha": 0,
	                "labelsEnabled": false,
	                "position": "right"
	            }, {
	                "id": "durationAxis",
	                "duration": "mm",
	                "durationUnits": {
	                    "hh": "h ",
	                    "mm": "min"
	                },
	                "axisAlpha": 0,
	                "gridAlpha": 0,
	                "inside": true,
	                "position": "right",
	                "title": "duration"
	            }],
	            "graphs": [{
	                "alphaField": "alpha",
	                "balloonText": "[[value]] miles",
	                "dashLengthField": "dashLength",
	                "fillAlphas": 0.7,
	                "legendPeriodValueText": "total: [[value.sum]] mi",
	                "legendValueText": "[[value]] mi",
	                "title": "distance",
	                "type": "column",
	                "valueField": "distance",
	                "valueAxis": "distanceAxis"
	            }, {
	                "balloonText": "latitude:[[value]]",
	                "bullet": "round",
	                "bulletBorderAlpha": 1,
	                "useLineColorForBulletBorder": true,
	                "bulletColor": "#FFFFFF",
	                "bulletSizeField": "townSize",
	                "dashLengthField": "dashLength",
	                "descriptionField": "townName",
	                "labelPosition": "right",
	                "labelText": "[[townName2]]",
	                "legendValueText": "[[value]]/[[description]]",
	                "title": "latitude/city",
	                "fillAlphas": 0,
	                "valueField": "latitude",
	                "valueAxis": "latitudeAxis"
	            }, {
	                "bullet": "square",
	                "bulletBorderAlpha": 1,
	                "bulletBorderThickness": 1,
	                "dashLengthField": "dashLength",
	                "legendValueText": "[[value]]",
	                "title": "duration",
	                "fillAlphas": 0,
	                "valueField": "duration",
	                "valueAxis": "durationAxis"
	            }],
	            "chartCursor": {
	                "categoryBalloonDateFormat": "DD",
	                "cursorAlpha": 0.1,
	                "cursorColor": "#000000",
	                "fullWidth": true,
	                "valueBalloonsEnabled": false,
	                "zoomable": false
	            },
	            "dataDateFormat": "YYYY-MM-DD",
	            "categoryField": "date",
	            "categoryAxis": {
	                "dateFormats": [{
	                    "period": "DD",
	                    "format": "DD"
	                }, {
	                    "period": "WW",
	                    "format": "MMM DD"
	                }, {
	                    "period": "MM",
	                    "format": "MMM"
	                }, {
	                    "period": "YYYY",
	                    "format": "YYYY"
	                }],
	                "parseDates": true,
	                "autoGridCount": false,
	                "axisColor": "#555555",
	                "gridAlpha": 0.1,
	                "gridColor": "#FFFFFF",
	                "gridCount": 50
	            },
	            "export": {
	                "enabled": true
	            }
	        });
	    }

	    var demo9 = function() {
	        var chart = AmCharts.makeChart("lion_amcharts_9", {
	            "type": "radar",
	            "theme": "dark",
	            "dataProvider": [{
	                "country": "Czech Republic",
	                "litres": 156.9
	            }, {
	                "country": "Ireland",
	                "litres": 131.1
	            }, {
	                "country": "Germany",
	                "litres": 115.8
	            }, {
	                "country": "Australia",
	                "litres": 109.9
	            }, {
	                "country": "Austria",
	                "litres": 108.3
	            }, {
	                "country": "UK",
	                "litres": 99
	            }],
	            "valueAxes": [{
	                "axisTitleOffset": 20,
	                "minimum": 0,
	                "axisAlpha": 0.15
	            }],
	            "startDuration": 2,
	            "graphs": [{
	                "balloonText": "[[value]] litres of beer per year",
	                "bullet": "round",
	                "lineThickness": 2,
	                "valueField": "litres"
	            }],
	            "categoryField": "country",
	            "export": {
	                "enabled": true
	            }
	        });
	    }

	    var demo10 = function() {
	        var chart = AmCharts.makeChart("lion_amcharts_10", {
	            "type": "radar",
	            "theme": "dark",
	            "dataProvider": [{
	                "direction": "N",
	                "value": 8
	            }, {
	                "direction": "NE",
	                "value": 9
	            }, {
	                "direction": "E",
	                "value": 4.5
	            }, {
	                "direction": "SE",
	                "value": 3.5
	            }, {
	                "direction": "S",
	                "value": 9.2
	            }, {
	                "direction": "SW",
	                "value": 8.4
	            }, {
	                "direction": "W",
	                "value": 11.1
	            }, {
	                "direction": "NW",
	                "value": 10
	            }],
	            "valueAxes": [{
	                "gridType": "circles",
	                "minimum": 0,
	                "autoGridCount": false,
	                "axisAlpha": 0.2,
	                "fillAlpha": 0.05,
	                "fillColor": "#FFFFFF",
	                "gridAlpha": 0.08,
	                "guides": [{
	                    "angle": 225,
	                    "fillAlpha": 0.3,
	                    "fillColor": "#0066CC",
	                    "tickLength": 0,
	                    "toAngle": 315,
	                    "toValue": 14,
	                    "value": 0,
	                    "lineAlpha": 0,

	                }, {
	                    "angle": 45,
	                    "fillAlpha": 0.3,
	                    "fillColor": "#CC3333",
	                    "tickLength": 0,
	                    "toAngle": 135,
	                    "toValue": 14,
	                    "value": 0,
	                    "lineAlpha": 0,
	                }],
	                "position": "left"
	            }],
	            "startDuration": 1,
	            "graphs": [{
	                "balloonText": "[[category]]: [[value]] m/s",
	                "bullet": "round",
	                "fillAlphas": 0.3,
	                "valueField": "value"
	            }],
	            "categoryField": "direction",
	            "export": {
	                "enabled": true
	            }
	        });
	    }

	    var demo11 = function() {
	        var chart = AmCharts.makeChart("lion_amcharts_11", {
	            "type": "pie",
	            "theme": "dark",
	            "dataProvider": [{
	                "country": "Lithuania",
	                "litres": 501.9
	            }, {
	                "country": "Czech Republic",
	                "litres": 301.9
	            }, {
	                "country": "Ireland",
	                "litres": 201.1
	            }, {
	                "country": "Germany",
	                "litres": 165.8
	            }, {
	                "country": "Australia",
	                "litres": 139.9
	            }, {
	                "country": "Austria",
	                "litres": 128.3
	            }, {
	                "country": "UK",
	                "litres": 99
	            }, {
	                "country": "Belgium",
	                "litres": 60
	            }, {
	                "country": "The Netherlands",
	                "litres": 50
	            }],
	            "valueField": "litres",
	            "titleField": "country",
	            "balloon": {
	                "fixedPosition": true
	            },
	            "export": {
	                "enabled": true
	            }
	        });
	    }

	    var demo12 = function() {
	        /**
	         * Define data for each year
	         */
	        var chartData = {
	            "1995": [{
	                    "sector": "Agriculture",
	                    "size": 6.6
	                },
	                {
	                    "sector": "Mining and Quarrying",
	                    "size": 0.6
	                },
	                {
	                    "sector": "Manufacturing",
	                    "size": 23.2
	                },
	                {
	                    "sector": "Electricity and Water",
	                    "size": 2.2
	                },
	                {
	                    "sector": "Construction",
	                    "size": 4.5
	                },
	                {
	                    "sector": "Trade (Wholesale, Retail, Motor)",
	                    "size": 14.6
	                },
	                {
	                    "sector": "Transport and Communication",
	                    "size": 9.3
	                },
	                {
	                    "sector": "Finance, real estate and business services",
	                    "size": 22.5
	                }
	            ],
	            "1996": [{
	                    "sector": "Agriculture",
	                    "size": 6.4
	                },
	                {
	                    "sector": "Mining and Quarrying",
	                    "size": 0.5
	                },
	                {
	                    "sector": "Manufacturing",
	                    "size": 22.4
	                },
	                {
	                    "sector": "Electricity and Water",
	                    "size": 2
	                },
	                {
	                    "sector": "Construction",
	                    "size": 4.2
	                },
	                {
	                    "sector": "Trade (Wholesale, Retail, Motor)",
	                    "size": 14.8
	                },
	                {
	                    "sector": "Transport and Communication",
	                    "size": 9.7
	                },
	                {
	                    "sector": "Finance, real estate and business services",
	                    "size": 22
	                }
	            ],
	            "1997": [{
	                    "sector": "Agriculture",
	                    "size": 6.1
	                },
	                {
	                    "sector": "Mining and Quarrying",
	                    "size": 0.2
	                },
	                {
	                    "sector": "Manufacturing",
	                    "size": 20.9
	                },
	                {
	                    "sector": "Electricity and Water",
	                    "size": 1.8
	                },
	                {
	                    "sector": "Construction",
	                    "size": 4.2
	                },
	                {
	                    "sector": "Trade (Wholesale, Retail, Motor)",
	                    "size": 13.7
	                },
	                {
	                    "sector": "Transport and Communication",
	                    "size": 9.4
	                },
	                {
	                    "sector": "Finance, real estate and business services",
	                    "size": 22.1
	                }
	            ],
	            "1998": [{
	                    "sector": "Agriculture",
	                    "size": 6.2
	                },
	                {
	                    "sector": "Mining and Quarrying",
	                    "size": 0.3
	                },
	                {
	                    "sector": "Manufacturing",
	                    "size": 21.4
	                },
	                {
	                    "sector": "Electricity and Water",
	                    "size": 1.9
	                },
	                {
	                    "sector": "Construction",
	                    "size": 4.2
	                },
	                {
	                    "sector": "Trade (Wholesale, Retail, Motor)",
	                    "size": 14.5
	                },
	                {
	                    "sector": "Transport and Communication",
	                    "size": 10.6
	                },
	                {
	                    "sector": "Finance, real estate and business services",
	                    "size": 23
	                }
	            ],
	            "1999": [{
	                    "sector": "Agriculture",
	                    "size": 5.7
	                },
	                {
	                    "sector": "Mining and Quarrying",
	                    "size": 0.2
	                },
	                {
	                    "sector": "Manufacturing",
	                    "size": 20
	                },
	                {
	                    "sector": "Electricity and Water",
	                    "size": 1.8
	                },
	                {
	                    "sector": "Construction",
	                    "size": 4.4
	                },
	                {
	                    "sector": "Trade (Wholesale, Retail, Motor)",
	                    "size": 15.2
	                },
	                {
	                    "sector": "Transport and Communication",
	                    "size": 10.5
	                },
	                {
	                    "sector": "Finance, real estate and business services",
	                    "size": 24.7
	                }
	            ],
	            "2000": [{
	                    "sector": "Agriculture",
	                    "size": 5.1
	                },
	                {
	                    "sector": "Mining and Quarrying",
	                    "size": 0.3
	                },
	                {
	                    "sector": "Manufacturing",
	                    "size": 20.4
	                },
	                {
	                    "sector": "Electricity and Water",
	                    "size": 1.7
	                },
	                {
	                    "sector": "Construction",
	                    "size": 4
	                },
	                {
	                    "sector": "Trade (Wholesale, Retail, Motor)",
	                    "size": 16.3
	                },
	                {
	                    "sector": "Transport and Communication",
	                    "size": 10.7
	                },
	                {
	                    "sector": "Finance, real estate and business services",
	                    "size": 24.6
	                }
	            ],
	            "2001": [{
	                    "sector": "Agriculture",
	                    "size": 5.5
	                },
	                {
	                    "sector": "Mining and Quarrying",
	                    "size": 0.2
	                },
	                {
	                    "sector": "Manufacturing",
	                    "size": 20.3
	                },
	                {
	                    "sector": "Electricity and Water",
	                    "size": 1.6
	                },
	                {
	                    "sector": "Construction",
	                    "size": 3.1
	                },
	                {
	                    "sector": "Trade (Wholesale, Retail, Motor)",
	                    "size": 16.3
	                },
	                {
	                    "sector": "Transport and Communication",
	                    "size": 10.7
	                },
	                {
	                    "sector": "Finance, real estate and business services",
	                    "size": 25.8
	                }
	            ],
	            "2002": [{
	                    "sector": "Agriculture",
	                    "size": 5.7
	                },
	                {
	                    "sector": "Mining and Quarrying",
	                    "size": 0.2
	                },
	                {
	                    "sector": "Manufacturing",
	                    "size": 20.5
	                },
	                {
	                    "sector": "Electricity and Water",
	                    "size": 1.6
	                },
	                {
	                    "sector": "Construction",
	                    "size": 3.6
	                },
	                {
	                    "sector": "Trade (Wholesale, Retail, Motor)",
	                    "size": 16.1
	                },
	                {
	                    "sector": "Transport and Communication",
	                    "size": 10.7
	                },
	                {
	                    "sector": "Finance, real estate and business services",
	                    "size": 26
	                }
	            ],
	            "2003": [{
	                    "sector": "Agriculture",
	                    "size": 4.9
	                },
	                {
	                    "sector": "Mining and Quarrying",
	                    "size": 0.2
	                },
	                {
	                    "sector": "Manufacturing",
	                    "size": 19.4
	                },
	                {
	                    "sector": "Electricity and Water",
	                    "size": 1.5
	                },
	                {
	                    "sector": "Construction",
	                    "size": 3.3
	                },
	                {
	                    "sector": "Trade (Wholesale, Retail, Motor)",
	                    "size": 16.2
	                },
	                {
	                    "sector": "Transport and Communication",
	                    "size": 11
	                },
	                {
	                    "sector": "Finance, real estate and business services",
	                    "size": 27.5
	                }
	            ],
	            "2004": [{
	                    "sector": "Agriculture",
	                    "size": 4.7
	                },
	                {
	                    "sector": "Mining and Quarrying",
	                    "size": 0.2
	                },
	                {
	                    "sector": "Manufacturing",
	                    "size": 18.4
	                },
	                {
	                    "sector": "Electricity and Water",
	                    "size": 1.4
	                },
	                {
	                    "sector": "Construction",
	                    "size": 3.3
	                },
	                {
	                    "sector": "Trade (Wholesale, Retail, Motor)",
	                    "size": 16.9
	                },
	                {
	                    "sector": "Transport and Communication",
	                    "size": 10.6
	                },
	                {
	                    "sector": "Finance, real estate and business services",
	                    "size": 28.1
	                }
	            ],
	            "2005": [{
	                    "sector": "Agriculture",
	                    "size": 4.3
	                },
	                {
	                    "sector": "Mining and Quarrying",
	                    "size": 0.2
	                },
	                {
	                    "sector": "Manufacturing",
	                    "size": 18.1
	                },
	                {
	                    "sector": "Electricity and Water",
	                    "size": 1.4
	                },
	                {
	                    "sector": "Construction",
	                    "size": 3.9
	                },
	                {
	                    "sector": "Trade (Wholesale, Retail, Motor)",
	                    "size": 15.7
	                },
	                {
	                    "sector": "Transport and Communication",
	                    "size": 10.6
	                },
	                {
	                    "sector": "Finance, real estate and business services",
	                    "size": 29.1
	                }
	            ],
	            "2006": [{
	                    "sector": "Agriculture",
	                    "size": 4
	                },
	                {
	                    "sector": "Mining and Quarrying",
	                    "size": 0.2
	                },
	                {
	                    "sector": "Manufacturing",
	                    "size": 16.5
	                },
	                {
	                    "sector": "Electricity and Water",
	                    "size": 1.3
	                },
	                {
	                    "sector": "Construction",
	                    "size": 3.7
	                },
	                {
	                    "sector": "Trade (Wholesale, Retail, Motor)",
	                    "size": 14.2
	                },
	                {
	                    "sector": "Transport and Communication",
	                    "size": 12.1
	                },
	                {
	                    "sector": "Finance, real estate and business services",
	                    "size": 29.1
	                }
	            ],
	            "2007": [{
	                    "sector": "Agriculture",
	                    "size": 4.7
	                },
	                {
	                    "sector": "Mining and Quarrying",
	                    "size": 0.2
	                },
	                {
	                    "sector": "Manufacturing",
	                    "size": 16.2
	                },
	                {
	                    "sector": "Electricity and Water",
	                    "size": 1.2
	                },
	                {
	                    "sector": "Construction",
	                    "size": 4.1
	                },
	                {
	                    "sector": "Trade (Wholesale, Retail, Motor)",
	                    "size": 15.6
	                },
	                {
	                    "sector": "Transport and Communication",
	                    "size": 11.2
	                },
	                {
	                    "sector": "Finance, real estate and business services",
	                    "size": 30.4
	                }
	            ],
	            "2008": [{
	                    "sector": "Agriculture",
	                    "size": 4.9
	                },
	                {
	                    "sector": "Mining and Quarrying",
	                    "size": 0.3
	                },
	                {
	                    "sector": "Manufacturing",
	                    "size": 17.2
	                },
	                {
	                    "sector": "Electricity and Water",
	                    "size": 1.4
	                },
	                {
	                    "sector": "Construction",
	                    "size": 5.1
	                },
	                {
	                    "sector": "Trade (Wholesale, Retail, Motor)",
	                    "size": 15.4
	                },
	                {
	                    "sector": "Transport and Communication",
	                    "size": 11.1
	                },
	                {
	                    "sector": "Finance, real estate and business services",
	                    "size": 28.4
	                }
	            ],
	            "2009": [{
	                    "sector": "Agriculture",
	                    "size": 4.7
	                },
	                {
	                    "sector": "Mining and Quarrying",
	                    "size": 0.3
	                },
	                {
	                    "sector": "Manufacturing",
	                    "size": 16.4
	                },
	                {
	                    "sector": "Electricity and Water",
	                    "size": 1.9
	                },
	                {
	                    "sector": "Construction",
	                    "size": 4.9
	                },
	                {
	                    "sector": "Trade (Wholesale, Retail, Motor)",
	                    "size": 15.5
	                },
	                {
	                    "sector": "Transport and Communication",
	                    "size": 10.9
	                },
	                {
	                    "sector": "Finance, real estate and business services",
	                    "size": 27.9
	                }
	            ],
	            "2010": [{
	                    "sector": "Agriculture",
	                    "size": 4.2
	                },
	                {
	                    "sector": "Mining and Quarrying",
	                    "size": 0.3
	                },
	                {
	                    "sector": "Manufacturing",
	                    "size": 16.2
	                },
	                {
	                    "sector": "Electricity and Water",
	                    "size": 2.2
	                },
	                {
	                    "sector": "Construction",
	                    "size": 4.3
	                },
	                {
	                    "sector": "Trade (Wholesale, Retail, Motor)",
	                    "size": 15.7
	                },
	                {
	                    "sector": "Transport and Communication",
	                    "size": 10.2
	                },
	                {
	                    "sector": "Finance, real estate and business services",
	                    "size": 28.8
	                }
	            ],
	            "2011": [{
	                    "sector": "Agriculture",
	                    "size": 4.1
	                },
	                {
	                    "sector": "Mining and Quarrying",
	                    "size": 0.3
	                },
	                {
	                    "sector": "Manufacturing",
	                    "size": 14.9
	                },
	                {
	                    "sector": "Electricity and Water",
	                    "size": 2.3
	                },
	                {
	                    "sector": "Construction",
	                    "size": 5
	                },
	                {
	                    "sector": "Trade (Wholesale, Retail, Motor)",
	                    "size": 17.3
	                },
	                {
	                    "sector": "Transport and Communication",
	                    "size": 10.2
	                },
	                {
	                    "sector": "Finance, real estate and business services",
	                    "size": 27.2
	                }
	            ],
	            "2012": [{
	                    "sector": "Agriculture",
	                    "size": 3.8
	                },
	                {
	                    "sector": "Mining and Quarrying",
	                    "size": 0.3
	                },
	                {
	                    "sector": "Manufacturing",
	                    "size": 14.9
	                },
	                {
	                    "sector": "Electricity and Water",
	                    "size": 2.6
	                },
	                {
	                    "sector": "Construction",
	                    "size": 5.1
	                },
	                {
	                    "sector": "Trade (Wholesale, Retail, Motor)",
	                    "size": 15.8
	                },
	                {
	                    "sector": "Transport and Communication",
	                    "size": 10.7
	                },
	                {
	                    "sector": "Finance, real estate and business services",
	                    "size": 28
	                }
	            ],
	            "2013": [{
	                    "sector": "Agriculture",
	                    "size": 3.7
	                },
	                {
	                    "sector": "Mining and Quarrying",
	                    "size": 0.2
	                },
	                {
	                    "sector": "Manufacturing",
	                    "size": 14.9
	                },
	                {
	                    "sector": "Electricity and Water",
	                    "size": 2.7
	                },
	                {
	                    "sector": "Construction",
	                    "size": 5.7
	                },
	                {
	                    "sector": "Trade (Wholesale, Retail, Motor)",
	                    "size": 16.5
	                },
	                {
	                    "sector": "Transport and Communication",
	                    "size": 10.5
	                },
	                {
	                    "sector": "Finance, real estate and business services",
	                    "size": 26.6
	                }
	            ],
	            "2014": [{
	                    "sector": "Agriculture",
	                    "size": 3.9
	                },
	                {
	                    "sector": "Mining and Quarrying",
	                    "size": 0.2
	                },
	                {
	                    "sector": "Manufacturing",
	                    "size": 14.5
	                },
	                {
	                    "sector": "Electricity and Water",
	                    "size": 2.7
	                },
	                {
	                    "sector": "Construction",
	                    "size": 5.6
	                },
	                {
	                    "sector": "Trade (Wholesale, Retail, Motor)",
	                    "size": 16.6
	                },
	                {
	                    "sector": "Transport and Communication",
	                    "size": 10.5
	                },
	                {
	                    "sector": "Finance, real estate and business services",
	                    "size": 26.5
	                }
	            ]
	        };

	        /**
	         * Create the chart
	         */
	        var currentYear = 1995;
	        var chart = AmCharts.makeChart("lion_amcharts_12", {
	            "type": "pie",
	            "theme": "dark",
	            "dataProvider": [],
	            "valueField": "size",
	            "titleField": "sector",
	            "startDuration": 0,
	            "innerRadius": 80,
	            "pullOutRadius": 20,
	            "marginTop": 30,
	            "titles": [{
	                "text": "South African Economy"
	            }],
	            "allLabels": [{
	                "y": "54%",
	                "align": "center",
	                "size": 25,
	                "bold": true,
	                "text": "1995",
	                "color": "#555"
	            }, {
	                "y": "49%",
	                "align": "center",
	                "size": 15,
	                "text": "Year",
	                "color": "#555"
	            }],
	            "listeners": [{
	                "event": "init",
	                "method": function(e) {
	                    var chart = e.chart;

	                    function getCurrentData() {
	                        var data = chartData[currentYear];
	                        currentYear++;
	                        if (currentYear > 2014)
	                            currentYear = 1995;
	                        return data;
	                    }

	                    function loop() {
	                        chart.allLabels[0].text = currentYear;
	                        var data = getCurrentData();
	                        chart.animateData(data, {
	                            duration: 1000,
	                            complete: function() {
	                                setTimeout(loop, 3000);
	                            }
	                        });
	                    }

	                    loop();
	                }
	            }],
	            "export": {
	                "enabled": true
	            }
	        });
	    }

		var chart = AmCharts.makeChart("piechart", {
		  "type": "pie",
		  "startDuration": 0,
		  "theme": "dark",
		  "addClassNames": true,
		  "legend":{
			"position":"right",
			"marginRight":100,
			"autoMargins":false
		  },
		  "innerRadius": "30%",
		  "defs": {
			"filter": [{
			  "id": "shadow",
			  "width": "200%",
			  "height": "200%",
			  "feOffset": {
				"result": "offOut",
				"in": "SourceAlpha",
				"dx": 0,
				"dy": 0
			  },
			  "feGaussianBlur": {
				"result": "blurOut",
				"in": "offOut",
				"stdDeviation": 5
			  },
			  "feBlend": {
				"in": "SourceGraphic",
				"in2": "blurOut",
				"mode": "normal"
			  }
			}]
		  },
		  "dataProvider": [
		  {
			"shares": "btc.com",
			"percentage": 21
		  }, {
			"shares": "antpool",
			"percentage": 16
		  }, {
			"shares": "btc.top",
			"percentage": 11
		  }, {
			"shares": "viabtc",
			"percentage": 11
		  }, {
			"shares": "unknown",
			"percentage": 10
		  }, {
			"shares": "slush",
			"percentage": 10
		  }, {
			"shares": "btcc",
			"percentage": 8
		  }, {
			"shares": "f2pool",
			"percentage": 5
		  }, {
			"shares": "bitfury",
			"percentage": 3
		  }, {
			"shares": "gminers",
			"percentage": 2
		  }, {
			"shares": "bitcoin.com",
			"percentage": 1
		  }, {
			"shares": "bitclub",
			"percentage": 1
		  }, {
			"shares": "bwpool",
			"percentage": 1
		  }],
		  "valueField": "percentage",
		  "titleField": "shares",
		  "export": {
			"enabled": true
		  }
		});

		chart.addListener("init", handleInit);

		chart.addListener("rollOverSlice", function(e) {
		  handleRollOver(e);
		});

		function handleInit(){
		  chart.legend.addListener("rollOverItem", handleRollOver);
		}

		function handleRollOver(e){
		  var wedge = e.dataItem.wedge.node;
		  wedge.parentNode.appendChild(wedge);
		}
		
		
	    return {
	        // public functions
	        init: function() {
	            demo1();
	            demo2();
	            demo3();
	            demo4();
	            demo5();
	            demo6();
	            demo7();
	            demo8();
	            demo9();
	            demo10();
	            demo11();
	            demo12();
	        }
	    };
	}();

	jQuery(document).ready(function() {
	    amChartsChartsDemo.init();
	});
	
	</script>
</body>
</html>
