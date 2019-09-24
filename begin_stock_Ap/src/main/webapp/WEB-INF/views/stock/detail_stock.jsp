<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=chrome">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<%@ include file="../include/header.jsp" %>
	
	<script src="/stock/resources/js/jquery-3.4.1.min.js"></script>
	<c:set var ="project" value="/stock/resources/"/>
  
	<!-- Bootstrap 4.0-->
	<link rel="stylesheet" href="${project}assets/vendor_components/bootstrap/dist/css/bootstrap.min.css">
	
	<!-- Bootstrap extend-->
	<link rel="stylesheet" href="${project}css/bootstrap-extend.css">

	<!-- Theme style -->
	<link rel="stylesheet" href="${project}css/master_style.css">

	<!-- Crypto_Admin skins -->
	<link rel="stylesheet" href="${project}css/skins/_all-skins.css">	
	
	<!-- iCheck -->
	<link rel="stylesheet" href="${project}assets/vendor_plugins/iCheck/flat/blue.css">
	
	
</head>

<body class="hold-transition skin-black sidebar-mini">
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
        테마 분석 결과
      </h1>
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="trading"><i class="fa fa-dashboard"></i> 홈</a></li>
        <li class="breadcrumb-item"><a href="chooseTheme">테마 분석 및 뉴스</a></li>
        <li class="breadcrumb-item active">테마 분석</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	
      <div class="row">
        <div class="col-12">
          <!-- Multiple Data Sets -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Multiple Data Sets</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
              <div class="chart">
                <div id="lion_amcharts_1" style="height: 500px;"></div>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>		  
      </div>
      <!-- /.row -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer">
    <%@ include file="../include/main_footer.jsp" %>
  </footer>
  
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
	<script src="${project}assets/vendor_components/jquery-slimscroll/jquery.slimscroll.js"></script>
		
	<!-- FastClick -->
	<script src="${project}assets/vendor_components/fastclick/lib/fastclick.js"></script>
	
    <!--amcharts charts -->
	<script src="http://www.amcharts.com/lib/3/amcharts.js" type="text/javascript"></script>
	<script src="http://www.amcharts.com/lib/3/serial.js" type="text/javascript"></script>
	<script src="http://www.amcharts.com/lib/3/amstock.js" type="text/javascript"></script>
	<script src="http://www.amcharts.com/lib/3/plugins/animate/animate.min.js" type="text/javascript"></script>
	<script src="http://www.amcharts.com/lib/3/plugins/export/export.min.js" type="text/javascript"></script>
	<script src="http://www.amcharts.com/lib/3/themes/patterns.js" type="text/javascript"></script>
	<script src="http://www.amcharts.com/lib/3/themes/dark.js" type="text/javascript"></script>
	
	
	<!-- Crypto_Admin App -->
	<script src="${project}js/template.js"></script>
	
	<script type="text/javascript">
	//== Class definition
	var amChartsStockChartsDemo = function() {

	    //== Private functions
	    var demo1 = function() {
	    	
	        var chartData1 = [];
	        var chartData2 = [];
	        var chartData3 = [];
	        var chartData4 = [];
			
			
	        generateChartData();

	        function generateChartData() {
	        	var length = ${length};
	        	
	        	<c:forEach items="${rList1}" var="rList1">
		        	chartData1.push({
	                    "date": new Date("${rList1.r_date}"),
	                    "value": ${rList1.r_open},
	                    "volume": ${rList1.r_volume}
	                });
	        	</c:forEach>
	        	
	        	<c:forEach items="${rList2}" var="rList2">
		        	chartData2.push({
		        		"date": new Date("${rList2.r_date}"),
	                    "value": ${rList2.r_open},
	                    "volume": ${rList2.r_volume}
	                });
	        	</c:forEach>
	        	
	        	if(length == 3){
	        		<c:forEach items="${rList3}" var="rList3">
			        	chartData3.push({
			        		"date": new Date("${rList3.r_date}"),
		                    "value": ${rList3.r_open},
		                    "volume": ${rList3.r_volume}
		                });
		        	</c:forEach>
	        	}
	        	
	        	if(length == 4){
	        		<c:forEach items="${rList3}" var="rList3">
			        	chartData3.push({
			        		"date": new Date("${rList3.r_date}"),
		                    "value": ${rList3.r_open},
		                    "volume": ${rList3.r_volume}
		                });
		        	</c:forEach>
	        		<c:forEach items="${rList4}" var="rList4">
			        	chartData4.push({
			        		"date": new Date("${rList4.r_date}"),
		                    "value": ${rList4.r_open},
		                    "volume": ${rList4.r_volume}
		                });
		        	</c:forEach>
	        	}
	        }

	        var chart = AmCharts.makeChart("lion_amcharts_1", 
	        	{
	            "type": "stock",
	            "theme": "dark",
	            "dataSets": [{
	                "title": "${rList1Name}",
	                "fieldMappings": [{
	                    "fromField": "value",
	                    "toField": "value"
	                }, {
	                    "fromField": "volume",
	                    "toField": "volume"
	                }],
	                "dataProvider": chartData1,
	                "categoryField": "date"
	            }, {
	                "title": "${rList2Name}",
	                "fieldMappings": [{
	                    "fromField": "value",
	                    "toField": "value"
	                }, {
	                    "fromField": "volume",
	                    "toField": "volume"
	                }],
	                "dataProvider": chartData2,
	                "categoryField": "date"
	            }, {
		                "title": "${rList3Name}",
		                "fieldMappings": [{
		                    "fromField": "value",
		                    "toField": "value"
		                }, {
		                    "fromField": "volume",
		                    "toField": "volume"
		                }],
		                "dataProvider": chartData3,
		                "categoryField": "date"
		         }, {
		                "title": "${rList4Name}",
		                "fieldMappings": [{
		                    "fromField": "value",
		                    "toField": "value"
		                }, {
		                    "fromField": "volume",
		                    "toField": "volume"
		                }],
		                "dataProvider": chartData4,
		                "categoryField": "date"
		         }],

	            "panels": [{
	                "showCategoryAxis": false,
	                "title": "평균 주가",
	                "percentHeight": 70,
	                "stockGraphs": [{
	                    "id": "g1",
	                    "valueField": "value",
	                    "comparable": true,
	                    "compareField": "value",
	                    "balloonText": "[[title]]:<b>[[value]]</b>",
	                    "compareGraphBalloonText": "[[title]]:<b>[[value]]</b>"
	                }],
	                "stockLegend": {
	                    "periodValueTextComparing": "[[percents.value.close]]%",
	                    "periodValueTextRegular": "[[value.close]]"
	                }
	            }, {
	                "title": "평균 거래량",
	                "percentHeight": 30,
	                "stockGraphs": [{
	                    "valueField": "volume",
	                    "type": "column",
	                    "showBalloon": false,
	                    "fillAlphas": 1
	                }],
	                "stockLegend": {
	                    "periodValueTextRegular": "[[value.close]]"
	                }
	            }],

	            "chartScrollbarSettings": {
	                "graph": "g1"
	            },

	            "chartCursorSettings": {
	                "valueBalloonsEnabled": true,
	                "fullWidth": true,
	                "cursorAlpha": 0.1,
	                "valueLineBalloonEnabled": true,
	                "valueLineEnabled": true,
	                "valueLineAlpha": 0.5
	            },

	            "periodSelector": {
	                "position": "left",
	                "periods": [{
	                    "period": "MM",
	                    "selected": true,
	                    "count": 1,
	                    "label": "한 달동안"
	                }, {
	                    "period": "YYYY",
	                    "count": 1,
	                    "label": "일 년"
	                }, {
	                    "period": "YTD",
	                    "label": "올해부터"
	                }, {
	                    "period": "MAX",
	                    "label": "전체기간"
	                }]
	            },

	            "dataSetSelector": {
	                "position": "left"
	            },

	            "export": {
	                "enabled": true
	            }
	        });
	    }
	    return {
	        // public functions
	        init: function() {
	            demo1();

	        }
	    };
	}();

	jQuery(document).ready(function() {
	    amChartsStockChartsDemo.init();
	});
	</script>
	
	

</body>
</html>
