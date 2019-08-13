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
	<link rel="icon" href="${project}images/favicon.ico">
	<script src="/stock/resources/js/jquery-3.4.1.min.js"></script>
	<c:set var ="project" value="/stock/resources/"/>
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
	
	<!-- EChartJS JavaScript -->
	<script src="${project}assets/vendor_components/echarts-master/dist/echarts-en.min.js"></script>
	<script src="${project}assets/vendor_components/echarts-liquidfill-master/dist/echarts-liquidfill.min.js"></script>
	
	<!-- Crypto_Admin App -->
	<script src="${project}js/template.js"></script>
	
	<!-- Crypto_Admin for demo purposes -->
	<script src="${project}js/demo.js"></script>
	
</head>
<body class="hold-transition skin-black sidebar-mini">
<div class="wrapper">
	<c:if test="${result == 0}">
		<script type="text/javascript">
			alert("잘못된 입력입니다. 이전페이지로 이동합니다.");
			window.history.back();
		</script>
	</c:if>
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
      <h1>테마 분석  > ${param.theme}</h1>
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i> 홈</a></li>
        <li class="breadcrumb-item"><a href="#">차트 및 종목 분석</a></li>
        <li class="breadcrumb-item active">테마 분석</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
      	<div class="col-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">테마 개요</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
				<div class="table-responsive">
					<table class="table table-bordered">
					  <thead style="text-align:center;">
						<tr>
						  <th rowspan="2" style="vertical-align:middle;">테마명</th>
						  <th scope="col" rowspan="2" style="vertical-align:middle;">전일대비</th>
						  <th scope="col" colspan="3">전일대비 등락현황</th>
						</tr>
						<tr>
						  <th scope="col">전체</th>
						  <th scope="col">상승</th>
						  <th scope="col">하락</th>
						</tr>
					  </thead>
					  <c:set var="svo" value="${svo}"/>
					  <tbody style="text-align:center;">
						<tr>
						  <th scope="col">${param.theme}</th>
						  <c:if test="${svo.avg_gap < 0}">
						  <td><span class="label label-danger">${svo.avg_gap}</span></td>
						  </c:if>
						  <c:if test="${svo.avg_gap == 0}">
						  <td><span class="label label-warning">${svo.avg_gap}</span></td>
						  </c:if>
						  <c:if test="${svo.avg_gap > 0}">
						  <td><span class="label label-success">${svo.avg_gap}</span></td>
						  </c:if>
						  <td>${svo.total_gap_count}</td>
						  <td>${svo.upper_gap_count}</td>
						  <td>${svo.lower_gap_count}</td>
						</tr>
					  </tbody>
					</table>
				</div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
         </div> 		 
        <!-- /.col -->
      
      
      	<div class="col-12">
         
          <div class="box box-solid bg-dark">
            <div class="box-header with-border">
              <h3 class="box-title">해당 테마 포함 종목</h3>
              <h6 class="box-subtitle">우측에 검색하실 수 있습니다.</h6>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
				<div class="table-responsive">
				  <table id="example" class="table table-bordered table-hover display nowrap margin-top-10 w-p100">
					<thead>
						<tr>
							<th>종목코드</th>
							<th>종목명</th>
							<th>현재가</th>
							<th>전일대비등락율</th>
							<th>시가 총액</th>
							<th>거래량</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="lvo" items="${lvo}">
							<tr onclick="location.href='financialInfo?stockcode=${lvo.stockCode}'" style="cursor:pointer;">
								<td>${lvo.stockCode}</td>
								<td>${lvo.stockName}</td>
								<td>${lvo.stockCurrent}</td>
								<c:if test="${lvo.gap < 0}">
									<td><span class="label label-danger">${lvo.gap}</span></td>
								</c:if>
								<c:if test="${lvo.gap == 0}">
									<td><span class="label label-warning">${lvo.gap}</span></td>
								</c:if>
								<c:if test="${lvo.gap > 0}">
									<td><span class="label label-success">${lvo.gap}</span></td>
								</c:if>
								<td>${lvo.totalStock * lvo.stockCurrent}</td>
								<td>${lvo.stockVolume}</td>
							</tr>
						</c:forEach>
					</tbody>			  

				</table>
				</div>              
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->   
        </div>
      	
      
		<div class="col-lg-5 col-12">
          <!-- Chart -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">요일 별 거래량 통계</h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                
              </div>
            </div>
            <div class="box-body" style="color:grey;">
              <div class="chart">
                <div id="e_chart_5" class="" style="height:500px;"></div>	
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <div class="col-lg-7 col-12">
          <!-- Chart -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">1년간 종목별 거래량</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                
              </div>
            </div>
            <div class="box-body">
              <div class="chart">
                <div id="e_chart_7" class="" style="height:500px;"></div>	
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
		  
        <div class="col-lg-6 col-12">
          <!-- Chart -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">User Flow</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                
              </div>
            </div>
            <div class="box-body">
              <div class="chart">
                <div id="e_chart_8" class="" style="height:500px;"></div>	
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
	   <div class="col-lg-6 col-12">
          <!-- Chart -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">User Statistics</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                
              </div>
            </div>
            <div class="box-body">
              <div class="chart">
                <div id="e_chart_3" class="" style="height:500px;"></div>	
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <div class="col-12">
          <!-- Chart -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Market Update</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                
              </div>
            </div>
            <div class="box-body">
              <div class="chart">
                <div id="e_chart_4" class="" style="height:500px;"></div>	
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
		  
       
		  
        <div class="col-12">
          <!-- Chart -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Marketing</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                
              </div>
            </div>
            <div class="box-body">
              <div class="chart">
                <div id="e_chart_1" class="" style="height:500px;"></div>	
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


	<%-- 
	<!-- DataTables -->
	<script src="${project}assets/vendor_components/datatables.net/js/jquery.dataTables.min.js"></script>
	<script src="${project}assets/vendor_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	 --%>
	<!-- SlimScroll -->
	<script src="${project}assets/vendor_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	
	<!-- FastClick -->
	<script src="${project}assets/vendor_components/fastclick/lib/fastclick.js"></script>
	
	<!-- Crypto_Admin App -->
	<script src="${project}js/template.js"></script>
	
	<!-- Crypto_Admin for demo purposes -->
	<script src="${project}js/demo.js"></script>
	
	<!-- This is data table -->
    <script src="${project}assets/vendor_plugins/DataTables-1.10.15/media/js/jquery.dataTables.min.js"></script>
	
	<!-- Crypto_Admin for Data Table -->
	<script src="${project}js/pages/data-table.js"></script>


<script type="text/javascript">
//[charts Javascript]e_chart_1

//Project:	Crypto Admin - Responsive Admin Template
var dom = document.getElementById("e_chart_5");
var myChart = echarts.init(dom);
var app = {};
option = null;
app.title = 'Stock stats by Day';

option = {
	color: ['#fec107', '#f15c30', '#465161'],
	textStyle: {
		color: '#fff'
	},
  angleAxis: {
      type: 'category',
      data: ['월요일', '화요일', '수요일', '목요일', '금요일'],
      z: 10
  },
  radiusAxis: {
  },
  polar: {
  },
  series: [{
      type: 'bar',
      data: [1, 2, 3, 4, 3],
      coordinateSystem: 'polar',
      name: 'A',
      stack: 'a'
  }, {
      type: 'bar',
      data: [2, 4, 6, 1, 3],
      coordinateSystem: 'polar',
      name: 'B',
      stack: 'a'
  }, {
      type: 'bar',
      data: [1, 2, 3, 4, 1],
      coordinateSystem: 'polar',
      name: 'C',
      stack: 'a'
  }],
  legend: {
      show: true,
      data: ['A', 'B', 'C']
  }
};
;
if (option && typeof option === "object") {
  myChart.setOption(option, true);
}

//-----------------------------
var dom = document.getElementById("e_chart_7");
var myChart = echarts.init(dom);
var app = {};
option = null;
var axisData = ['120', '135', '250', '100', '99', '158', '200', '130'];
var data = axisData.map(function (item, i) {
  return Math.round(Math.random() * 1000 * (i + 1));
});
var links = data.map(function (item, i) {
  return {
      source: i,
      target: i + 1
  };
});
links.pop();
option = {
	color: ['#03a9f3'],
	textStyle: {
		color: '#fff'
	},
  tooltip: {},
  xAxis: {
      type : 'category',
      boundaryGap : false,
      data : axisData
  },
  yAxis: {
      type : 'value'
  },
  series: [
      {
          type: 'graph',
          layout: 'none',
          coordinateSystem: 'cartesian2d',
          symbolSize: 40,
          label: {
              normal: {
                  show: true
              }
          },
          edgeSymbol: ['circle', 'arrow'],
          edgeSymbolSize: [4, 10],
          data: data,
          links: links,
          lineStyle: {
              normal: {
                  color: '#2f4554'
              }
          }
      }
  ]
};;
if (option && typeof option === "object") {
  myChart.setOption(option, true);
}

//-----------------------------

var dom = document.getElementById("e_chart_8");
var myChart = echarts.init(dom);
var app = {};
option = null;
option = {
	color: ['#00c292'],
	textStyle: {
		color: '#fff'
	},
  tooltip: {
      trigger: 'axis'
  },
  legend: {
      data:['the highest temperature','the lowest temperature']
  },
	
  xAxis:  {
      type: 'category',
      boundaryGap: false,
      data: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
  },
  yAxis: {
      type: 'value',
      axisLabel: {
          formatter: '{value}'
      }
  },
  series: [
      {
          name:'Maximum',
          type:'line',
          data:[220, 182, 191, 234, 190, 330, 310],
          markPoint: {
              data: [
                  {type: 'max', name: 'Maximum'},
                  {type: 'min', name: 'Minimum'}
              ]
          },
          markLine: {
              data: [
                  {type: 'average', name: 'Average'}
              ]
          }
      }
  ]
};
if (option && typeof option === "object") {
  myChart.setOption(option, true);
}


//-------------------------
var dom = document.getElementById("e_chart_3");
var myChart = echarts.init(dom);
var app = {};
option = null;

option = {
	color: ['#ab8ce4', '#00c292', '#03a9f3', '#fec107', '#f15c30', '#465161'],
	textStyle: {
		color: '#fff'
	},
  tooltip: {
      trigger: 'axis',
      axisPointer: {
          type: 'line',
          lineStyle: {
              color: 'rgba(0,0,0,0.2)',
              width: 1,
              type: 'solid'
          }
      }
  },

  legend: {
      data: ['DQ', 'TY', 'SS', 'QG', 'SY', 'DD']
  },

  singleAxis: {
      top: 50,
      bottom: 50,
      axisTick: {},
      axisLabel: {},
      type: 'time',
      axisPointer: {
          animation: true,
          label: {
              show: true
          }
      },
      splitLine: {
          show: true,
          lineStyle: {
              type: 'dashed',
              opacity: 0.2
          }
      }
  },

  series: [
      {
          type: 'themeRiver',
          itemStyle: {
              emphasis: {
                  shadowBlur: 20,
                  shadowColor: 'rgba(0, 0, 0, 0.8)'
              }
          },
          data: [['2015/11/08',10,'DQ'],['2015/11/09',15,'DQ'],['2015/11/10',35,'DQ'],
          ['2015/11/11',38,'DQ'],['2015/11/12',22,'DQ'],['2015/11/13',16,'DQ'],
          ['2015/11/14',7,'DQ'],['2015/11/15',2,'DQ'],['2015/11/16',17,'DQ'],
          ['2015/11/17',33,'DQ'],['2015/11/18',40,'DQ'],['2015/11/19',32,'DQ'],
          ['2015/11/20',26,'DQ'],['2015/11/21',35,'DQ'],['2015/11/22',40,'DQ'],
          ['2015/11/23',32,'DQ'],['2015/11/24',26,'DQ'],['2015/11/25',22,'DQ'],
          ['2015/11/26',16,'DQ'],['2015/11/27',22,'DQ'],['2015/11/28',10,'DQ'],
          ['2015/11/08',35,'TY'],['2015/11/09',36,'TY'],['2015/11/10',37,'TY'],
          ['2015/11/11',22,'TY'],['2015/11/12',24,'TY'],['2015/11/13',26,'TY'],
          ['2015/11/14',34,'TY'],['2015/11/15',21,'TY'],['2015/11/16',18,'TY'],
          ['2015/11/17',45,'TY'],['2015/11/18',32,'TY'],['2015/11/19',35,'TY'],
          ['2015/11/20',30,'TY'],['2015/11/21',28,'TY'],['2015/11/22',27,'TY'],
          ['2015/11/23',26,'TY'],['2015/11/24',15,'TY'],['2015/11/25',30,'TY'],
          ['2015/11/26',35,'TY'],['2015/11/27',42,'TY'],['2015/11/28',42,'TY'],
          ['2015/11/08',21,'SS'],['2015/11/09',25,'SS'],['2015/11/10',27,'SS'],
          ['2015/11/11',23,'SS'],['2015/11/12',24,'SS'],['2015/11/13',21,'SS'],
          ['2015/11/14',35,'SS'],['2015/11/15',39,'SS'],['2015/11/16',40,'SS'],
          ['2015/11/17',36,'SS'],['2015/11/18',33,'SS'],['2015/11/19',43,'SS'],
          ['2015/11/20',40,'SS'],['2015/11/21',34,'SS'],['2015/11/22',28,'SS'],
          ['2015/11/23',26,'SS'],['2015/11/24',37,'SS'],['2015/11/25',41,'SS'],
          ['2015/11/26',46,'SS'],['2015/11/27',47,'SS'],['2015/11/28',41,'SS'],
          ['2015/11/08',10,'QG'],['2015/11/09',15,'QG'],['2015/11/10',35,'QG'],
          ['2015/11/11',38,'QG'],['2015/11/12',22,'QG'],['2015/11/13',16,'QG'],
          ['2015/11/14',7,'QG'],['2015/11/15',2,'QG'],['2015/11/16',17,'QG'],
          ['2015/11/17',33,'QG'],['2015/11/18',40,'QG'],['2015/11/19',32,'QG'],
          ['2015/11/20',26,'QG'],['2015/11/21',35,'QG'],['2015/11/22',40,'QG'],
          ['2015/11/23',32,'QG'],['2015/11/24',26,'QG'],['2015/11/25',22,'QG'],
          ['2015/11/26',16,'QG'],['2015/11/27',22,'QG'],['2015/11/28',10,'QG'],
          ['2015/11/08',10,'SY'],['2015/11/09',15,'SY'],['2015/11/10',35,'SY'],
          ['2015/11/11',38,'SY'],['2015/11/12',22,'SY'],['2015/11/13',16,'SY'],
          ['2015/11/14',7,'SY'],['2015/11/15',2,'SY'],['2015/11/16',17,'SY'],
          ['2015/11/17',33,'SY'],['2015/11/18',40,'SY'],['2015/11/19',32,'SY'],
          ['2015/11/20',26,'SY'],['2015/11/21',35,'SY'],['2015/11/22',4,'SY'],
          ['2015/11/23',32,'SY'],['2015/11/24',26,'SY'],['2015/11/25',22,'SY'],
          ['2015/11/26',16,'SY'],['2015/11/27',22,'SY'],['2015/11/28',10,'SY'],
          ['2015/11/08',10,'DD'],['2015/11/09',15,'DD'],['2015/11/10',35,'DD'],
          ['2015/11/11',38,'DD'],['2015/11/12',22,'DD'],['2015/11/13',16,'DD'],
          ['2015/11/14',7,'DD'],['2015/11/15',2,'DD'],['2015/11/16',17,'DD'],
          ['2015/11/17',33,'DD'],['2015/11/18',4,'DD'],['2015/11/19',32,'DD'],
          ['2015/11/20',26,'DD'],['2015/11/21',35,'DD'],['2015/11/22',40,'DD'],
          ['2015/11/23',32,'DD'],['2015/11/24',26,'DD'],['2015/11/25',22,'DD'],
          ['2015/11/26',16,'DD'],['2015/11/27',22,'DD'],['2015/11/28',10,'DD']]
      }
  ]
};;
if (option && typeof option === "object") {
  myChart.setOption(option, true);
}


//------------------------

var dom = document.getElementById("e_chart_4");
var myChart = echarts.init(dom);
var app = {};
option = null;

var timeData = [
  '2009/6/12 2:00', '2009/6/12 3:00', '2009/6/12 4:00', '2009/6/12 5:00', '2009/6/12 6:00', '2009/6/12 7:00', '2009/6/12 8:00', '2009/6/12 9:00', '2009/6/12 10:00', '2009/6/12 11:00', '2009/6/12 12:00', '2009/6/12 13:00', '2009/6/12 14:00', '2009/6/12 15:00', '2009/6/12 16:00', '2009/6/12 17:00', '2009/6/12 18:00', '2009/6/12 19:00', '2009/6/12 20:00', '2009/6/12 21:00', '2009/6/12 22:00', '2009/6/12 23:00',
  '2009/6/13 0:00', '2009/6/13 1:00', '2009/6/13 2:00', '2009/6/13 3:00', '2009/6/13 4:00', '2009/6/13 5:00', '2009/6/13 6:00', '2009/6/13 7:00', '2009/6/13 8:00', '2009/6/13 9:00', '2009/6/13 10:00', '2009/6/13 11:00', '2009/6/13 12:00', '2009/6/13 13:00', '2009/6/13 14:00', '2009/6/13 15:00', '2009/6/13 16:00', '2009/6/13 17:00', '2009/6/13 18:00', '2009/6/13 19:00', '2009/6/13 20:00', '2009/6/13 21:00', '2009/6/13 22:00', '2009/6/13 23:00',
  '2009/6/14 0:00', '2009/6/14 1:00', '2009/6/14 2:00', '2009/6/14 3:00', '2009/6/14 4:00', '2009/6/14 5:00', '2009/6/14 6:00', '2009/6/14 7:00', '2009/6/14 8:00', '2009/6/14 9:00', '2009/6/14 10:00', '2009/6/14 11:00', '2009/6/14 12:00', '2009/6/14 13:00', '2009/6/14 14:00', '2009/6/14 15:00', '2009/6/14 16:00', '2009/6/14 17:00', '2009/6/14 18:00', '2009/6/14 19:00', '2009/6/14 20:00', '2009/6/14 21:00', '2009/6/14 22:00', '2009/6/14 23:00',
  '2009/6/15 0:00', '2009/6/15 1:00', '2009/6/15 2:00', '2009/6/15 3:00', '2009/6/15 4:00', '2009/6/15 5:00', '2009/6/15 6:00', '2009/6/15 7:00', '2009/6/15 8:00', '2009/6/15 9:00', '2009/6/15 10:00', '2009/6/15 11:00', '2009/6/15 12:00', '2009/6/15 13:00', '2009/6/15 14:00', '2009/6/15 15:00', '2009/6/15 16:00', '2009/6/15 17:00', '2009/6/15 18:00', '2009/6/15 19:00', '2009/6/15 20:00', '2009/6/15 21:00', '2009/6/15 22:00', '2009/6/15 23:00',
  '2009/6/15 0:00', '2009/6/16 1:00', '2009/6/16 2:00', '2009/6/16 3:00', '2009/6/16 4:00', '2009/6/16 5:00', '2009/6/16 6:00', '2009/6/16 7:00', '2009/6/16 8:00', '2009/6/16 9:00', '2009/6/16 10:00', '2009/6/16 11:00', '2009/6/16 12:00', '2009/6/16 13:00', '2009/6/16 14:00', '2009/6/16 15:00', '2009/6/16 16:00', '2009/6/16 17:00', '2009/6/16 18:00', '2009/6/16 19:00', '2009/6/16 20:00', '2009/6/16 21:00', '2009/6/16 22:00', '2009/6/16 23:00',
  '2009/6/15 0:00', '2009/6/17 1:00', '2009/6/17 2:00', '2009/6/17 3:00', '2009/6/17 4:00', '2009/6/17 5:00', '2009/6/17 6:00', '2009/6/17 7:00', '2009/6/17 8:00', '2009/6/17 9:00', '2009/6/17 10:00', '2009/6/17 11:00', '2009/6/17 12:00', '2009/6/17 13:00', '2009/6/17 14:00', '2009/6/17 15:00', '2009/6/17 16:00', '2009/6/17 17:00', '2009/6/17 18:00', '2009/6/17 19:00', '2009/6/17 20:00', '2009/6/17 21:00', '2009/6/17 22:00', '2009/6/17 23:00',
  '2009/6/18 0:00', '2009/6/18 1:00', '2009/6/18 2:00', '2009/6/18 3:00', '2009/6/18 4:00', '2009/6/18 5:00', '2009/6/18 6:00', '2009/6/18 7:00', '2009/6/18 8:00', '2009/6/18 9:00', '2009/6/18 10:00', '2009/6/18 11:00', '2009/6/18 12:00', '2009/6/18 13:00', '2009/6/18 14:00', '2009/6/18 15:00', '2009/6/18 16:00', '2009/6/18 17:00', '2009/6/18 18:00', '2009/6/18 19:00', '2009/6/18 20:00', '2009/6/18 21:00', '2009/6/18 22:00', '2009/6/18 23:00',
  '2009/6/15 0:00', '2009/6/19 1:00', '2009/6/19 2:00', '2009/6/19 3:00', '2009/6/19 4:00', '2009/6/19 5:00', '2009/6/19 6:00', '2009/6/19 7:00', '2009/6/19 8:00', '2009/6/19 9:00', '2009/6/19 10:00', '2009/6/19 11:00', '2009/6/19 12:00', '2009/6/19 13:00', '2009/6/19 14:00', '2009/6/19 15:00', '2009/6/19 16:00', '2009/6/19 17:00', '2009/6/19 18:00', '2009/6/19 19:00', '2009/6/19 20:00', '2009/6/19 21:00', '2009/6/19 22:00', '2009/6/19 23:00',
  '2009/6/20 0:00', '2009/6/20 1:00', '2009/6/20 2:00', '2009/6/20 3:00', '2009/6/20 4:00', '2009/6/20 5:00', '2009/6/20 6:00', '2009/6/20 7:00', '2009/6/20 8:00', '2009/6/20 9:00', '2009/6/20 10:00', '2009/6/20 11:00', '2009/6/20 12:00', '2009/6/20 13:00', '2009/6/20 14:00', '2009/6/20 15:00', '2009/6/20 16:00', '2009/6/20 17:00', '2009/6/20 18:00', '2009/6/20 19:00', '2009/6/20 20:00', '2009/6/20 21:00', '2009/6/20 22:00', '2009/6/20 23:00',
  '2009/6/21 0:00', '2009/6/21 1:00', '2009/6/21 2:00', '2009/6/21 3:00', '2009/6/21 4:00', '2009/6/21 5:00', '2009/6/21 6:00', '2009/6/21 7:00', '2009/6/21 8:00', '2009/6/21 9:00', '2009/6/21 10:00', '2009/6/21 11:00', '2009/6/21 12:00', '2009/6/21 13:00', '2009/6/21 14:00', '2009/6/21 15:00', '2009/6/21 16:00', '2009/6/21 17:00', '2009/6/21 18:00', '2009/6/21 19:00', '2009/6/21 20:00', '2009/6/21 21:00', '2009/6/21 22:00', '2009/6/21 23:00',
  '2009/6/22 0:00', '2009/6/22 1:00', '2009/6/22 2:00', '2009/6/22 3:00', '2009/6/22 4:00', '2009/6/22 5:00', '2009/6/22 6:00', '2009/6/22 7:00', '2009/6/22 8:00', '2009/6/22 9:00', '2009/6/22 10:00', '2009/6/22 11:00', '2009/6/22 12:00', '2009/6/22 13:00', '2009/6/22 14:00', '2009/6/22 15:00', '2009/6/22 16:00', '2009/6/22 17:00', '2009/6/22 18:00', '2009/6/22 19:00', '2009/6/22 20:00', '2009/6/22 21:00', '2009/6/22 22:00', '2009/6/22 23:00',
  '2009/6/23 0:00', '2009/6/23 1:00', '2009/6/23 2:00', '2009/6/23 3:00', '2009/6/23 4:00', '2009/6/23 5:00', '2009/6/23 6:00', '2009/6/23 7:00', '2009/6/23 8:00', '2009/6/23 9:00', '2009/6/23 10:00', '2009/6/23 11:00', '2009/6/23 12:00', '2009/6/23 13:00', '2009/6/23 14:00', '2009/6/23 15:00', '2009/6/23 16:00', '2009/6/23 17:00', '2009/6/23 18:00', '2009/6/23 19:00', '2009/6/23 20:00', '2009/6/23 21:00', '2009/6/23 22:00', '2009/6/23 23:00',
  '2009/6/24 0:00', '2009/6/24 1:00', '2009/6/24 2:00', '2009/6/24 3:00', '2009/6/24 4:00', '2009/6/24 5:00', '2009/6/24 6:00', '2009/6/24 7:00', '2009/6/24 8:00', '2009/6/24 9:00', '2009/6/24 10:00', '2009/6/24 11:00', '2009/6/24 12:00', '2009/6/24 13:00', '2009/6/24 14:00', '2009/6/24 15:00', '2009/6/24 16:00', '2009/6/24 17:00', '2009/6/24 18:00', '2009/6/24 19:00', '2009/6/24 20:00', '2009/6/24 21:00', '2009/6/24 22:00', '2009/6/24 23:00',
  '2009/6/25 0:00', '2009/6/25 1:00', '2009/6/25 2:00', '2009/6/25 3:00', '2009/6/25 4:00', '2009/6/25 5:00', '2009/6/25 6:00', '2009/6/25 7:00', '2009/6/25 8:00', '2009/6/25 9:00', '2009/6/25 10:00', '2009/6/25 11:00', '2009/6/25 12:00', '2009/6/25 13:00', '2009/6/25 14:00', '2009/6/25 15:00', '2009/6/25 16:00', '2009/6/25 17:00', '2009/6/25 18:00', '2009/6/25 19:00', '2009/6/25 20:00', '2009/6/25 21:00', '2009/6/25 22:00', '2009/6/25 23:00',
  '2009/6/26 0:00', '2009/6/26 1:00', '2009/6/26 2:00', '2009/6/26 3:00', '2009/6/26 4:00', '2009/6/26 5:00', '2009/6/26 6:00', '2009/6/26 7:00', '2009/6/26 8:00', '2009/6/26 9:00', '2009/6/26 10:00', '2009/6/26 11:00', '2009/6/26 12:00', '2009/6/26 13:00', '2009/6/26 14:00', '2009/6/26 15:00', '2009/6/26 16:00', '2009/6/26 17:00', '2009/6/26 18:00', '2009/6/26 19:00', '2009/6/26 20:00', '2009/6/26 21:00', '2009/6/26 22:00', '2009/6/26 23:00',
  '2009/6/27 0:00', '2009/6/27 1:00', '2009/6/27 2:00', '2009/6/27 3:00', '2009/6/27 4:00', '2009/6/27 5:00', '2009/6/27 6:00', '2009/6/27 7:00', '2009/6/27 8:00', '2009/6/27 9:00', '2009/6/27 10:00', '2009/6/27 11:00', '2009/6/27 12:00', '2009/6/27 13:00', '2009/6/27 14:00', '2009/6/27 15:00', '2009/6/27 16:00', '2009/6/27 17:00', '2009/6/27 18:00', '2009/6/27 19:00', '2009/6/27 20:00', '2009/6/27 21:00', '2009/6/27 22:00', '2009/6/27 23:00',
  '2009/6/28 0:00', '2009/6/28 1:00', '2009/6/28 2:00', '2009/6/28 3:00', '2009/6/28 4:00', '2009/6/28 5:00', '2009/6/28 6:00', '2009/6/28 7:00', '2009/6/28 8:00', '2009/6/28 9:00', '2009/6/28 10:00', '2009/6/28 11:00', '2009/6/28 12:00', '2009/6/28 13:00', '2009/6/28 14:00', '2009/6/28 15:00', '2009/6/28 16:00', '2009/6/28 17:00', '2009/6/28 18:00', '2009/6/28 19:00', '2009/6/28 20:00', '2009/6/28 21:00', '2009/6/28 22:00', '2009/6/28 23:00',
  '2009/6/29 0:00', '2009/6/29 1:00', '2009/6/29 2:00', '2009/6/29 3:00', '2009/6/29 4:00', '2009/6/29 5:00', '2009/6/29 6:00', '2009/6/29 7:00', '2009/6/29 8:00', '2009/6/29 9:00', '2009/6/29 10:00', '2009/6/29 11:00', '2009/6/29 12:00', '2009/6/29 13:00', '2009/6/29 14:00', '2009/6/29 15:00', '2009/6/29 16:00', '2009/6/29 17:00', '2009/6/29 18:00', '2009/6/29 19:00', '2009/6/29 20:00', '2009/6/29 21:00', '2009/6/29 22:00', '2009/6/29 23:00',
  '2009/6/30 0:00', '2009/6/30 1:00', '2009/6/30 2:00', '2009/6/30 3:00', '2009/6/30 4:00', '2009/6/30 5:00', '2009/6/30 6:00', '2009/6/30 7:00', '2009/6/30 8:00', '2009/6/30 9:00', '2009/6/30 10:00', '2009/6/30 11:00', '2009/6/30 12:00', '2009/6/30 13:00', '2009/6/30 14:00', '2009/6/30 15:00', '2009/6/30 16:00', '2009/6/30 17:00', '2009/6/30 18:00', '2009/6/30 19:00', '2009/6/30 20:00', '2009/6/30 21:00', '2009/6/30 22:00', '2009/6/30 23:00',
  '2009/7/1 0:00', '2009/7/1 1:00', '2009/7/1 2:00', '2009/7/1 3:00', '2009/7/1 4:00', '2009/7/1 5:00', '2009/7/1 6:00', '2009/7/1 7:00', '2009/7/1 8:00', '2009/7/1 9:00', '2009/7/1 10:00', '2009/7/1 11:00', '2009/7/1 12:00', '2009/7/1 13:00', '2009/7/1 14:00', '2009/7/1 15:00', '2009/7/1 16:00', '2009/7/1 17:00', '2009/7/1 18:00', '2009/7/1 19:00', '2009/7/1 20:00', '2009/7/1 21:00', '2009/7/1 22:00', '2009/7/1 23:00',
  '2009/7/2 0:00', '2009/7/2 1:00', '2009/7/2 2:00', '2009/7/2 3:00', '2009/7/2 4:00', '2009/7/2 5:00', '2009/7/2 6:00', '2009/7/2 7:00', '2009/7/2 8:00', '2009/7/2 9:00', '2009/7/2 10:00', '2009/7/2 11:00', '2009/7/2 12:00', '2009/7/2 13:00', '2009/7/2 14:00', '2009/7/2 15:00', '2009/7/2 16:00', '2009/7/2 17:00', '2009/7/2 18:00', '2009/7/2 19:00', '2009/7/2 20:00', '2009/7/2 21:00', '2009/7/2 22:00', '2009/7/2 23:00',
  '2009/7/3 0:00', '2009/7/3 1:00', '2009/7/3 2:00', '2009/7/3 3:00', '2009/7/3 4:00', '2009/7/3 5:00', '2009/7/3 6:00', '2009/7/3 7:00', '2009/7/3 8:00', '2009/7/3 9:00', '2009/7/3 10:00', '2009/7/3 11:00', '2009/7/3 12:00', '2009/7/3 13:00', '2009/7/3 14:00', '2009/7/3 15:00', '2009/7/3 16:00', '2009/7/3 17:00', '2009/7/3 18:00', '2009/7/3 19:00', '2009/7/3 20:00', '2009/7/3 21:00', '2009/7/3 22:00', '2009/7/3 23:00',
  '2009/7/4 0:00', '2009/7/4 1:00', '2009/7/4 2:00', '2009/7/4 3:00', '2009/7/4 4:00', '2009/7/4 5:00', '2009/7/4 6:00', '2009/7/4 7:00', '2009/7/4 8:00', '2009/7/4 9:00', '2009/7/4 10:00', '2009/7/4 11:00', '2009/7/4 12:00', '2009/7/4 13:00', '2009/7/4 14:00', '2009/7/4 15:00', '2009/7/4 16:00', '2009/7/4 17:00', '2009/7/4 18:00', '2009/7/4 19:00', '2009/7/4 20:00', '2009/7/4 21:00', '2009/7/4 22:00', '2009/7/4 23:00',
  '2009/7/5 0:00', '2009/7/5 1:00', '2009/7/5 2:00', '2009/7/5 3:00', '2009/7/5 4:00', '2009/7/5 5:00', '2009/7/5 6:00', '2009/7/5 7:00', '2009/7/5 8:00', '2009/7/5 9:00', '2009/7/5 10:00', '2009/7/5 11:00', '2009/7/5 12:00', '2009/7/5 13:00', '2009/7/5 14:00', '2009/7/5 15:00', '2009/7/5 16:00', '2009/7/5 17:00', '2009/7/5 18:00', '2009/7/5 19:00', '2009/7/5 20:00', '2009/7/5 21:00', '2009/7/5 22:00', '2009/7/5 23:00',
  '2009/7/6 0:00', '2009/7/6 1:00', '2009/7/6 2:00', '2009/7/6 3:00', '2009/7/6 4:00', '2009/7/6 5:00', '2009/7/6 6:00', '2009/7/6 7:00', '2009/7/6 8:00', '2009/7/6 9:00', '2009/7/6 10:00', '2009/7/6 11:00', '2009/7/6 12:00', '2009/7/6 13:00', '2009/7/6 14:00', '2009/7/6 15:00', '2009/7/6 16:00', '2009/7/6 17:00', '2009/7/6 18:00', '2009/7/6 19:00', '2009/7/6 20:00', '2009/7/6 21:00', '2009/7/6 22:00', '2009/7/6 23:00',
  '2009/7/7 0:00', '2009/7/7 1:00', '2009/7/7 2:00', '2009/7/7 3:00', '2009/7/7 4:00', '2009/7/7 5:00', '2009/7/7 6:00', '2009/7/7 7:00', '2009/7/7 8:00', '2009/7/7 9:00', '2009/7/7 10:00', '2009/7/7 11:00', '2009/7/7 12:00', '2009/7/7 13:00', '2009/7/7 14:00', '2009/7/7 15:00', '2009/7/7 16:00', '2009/7/7 17:00', '2009/7/7 18:00', '2009/7/7 19:00', '2009/7/7 20:00', '2009/7/7 21:00', '2009/7/7 22:00', '2009/7/7 23:00',
  '2009/7/8 0:00', '2009/7/8 1:00', '2009/7/8 2:00', '2009/7/8 3:00', '2009/7/8 4:00', '2009/7/8 5:00', '2009/7/8 6:00', '2009/7/8 7:00', '2009/7/8 8:00', '2009/7/8 9:00', '2009/7/8 10:00', '2009/7/8 11:00', '2009/7/8 12:00', '2009/7/8 13:00', '2009/7/8 14:00', '2009/7/8 15:00', '2009/7/8 16:00', '2009/7/8 17:00', '2009/7/8 18:00', '2009/7/8 19:00', '2009/7/8 20:00', '2009/7/8 21:00', '2009/7/8 22:00', '2009/7/8 23:00',
  '2009/7/9 0:00', '2009/7/9 1:00', '2009/7/9 2:00', '2009/7/9 3:00', '2009/7/9 4:00', '2009/7/9 5:00', '2009/7/9 6:00', '2009/7/9 7:00', '2009/7/9 8:00', '2009/7/9 9:00', '2009/7/9 10:00', '2009/7/9 11:00', '2009/7/9 12:00', '2009/7/9 13:00', '2009/7/9 14:00', '2009/7/9 15:00', '2009/7/9 16:00', '2009/7/9 17:00', '2009/7/9 18:00', '2009/7/9 19:00', '2009/7/9 20:00', '2009/7/9 21:00', '2009/7/9 22:00', '2009/7/9 23:00',
  '2009/7/10 0:00', '2009/7/10 1:00', '2009/7/10 2:00', '2009/7/10 3:00', '2009/7/10 4:00', '2009/7/10 5:00', '2009/7/10 6:00', '2009/7/10 7:00', '2009/7/10 8:00', '2009/7/10 9:00', '2009/7/10 10:00', '2009/7/10 11:00', '2009/7/10 12:00', '2009/7/10 13:00', '2009/7/10 14:00', '2009/7/10 15:00', '2009/7/10 16:00', '2009/7/10 17:00', '2009/7/10 18:00', '2009/7/10 19:00', '2009/7/10 20:00', '2009/7/10 21:00', '2009/7/10 22:00', '2009/7/10 23:00',
  '2009/7/11 0:00', '2009/7/11 1:00', '2009/7/11 2:00', '2009/7/11 3:00', '2009/7/11 4:00', '2009/7/11 5:00', '2009/7/11 6:00', '2009/7/11 7:00', '2009/7/11 8:00', '2009/7/11 9:00', '2009/7/11 10:00', '2009/7/11 11:00', '2009/7/11 12:00', '2009/7/11 13:00', '2009/7/11 14:00', '2009/7/11 15:00', '2009/7/11 16:00', '2009/7/11 17:00', '2009/7/11 18:00', '2009/7/11 19:00', '2009/7/11 20:00', '2009/7/11 21:00', '2009/7/11 22:00', '2009/7/11 23:00',
  '2009/7/12 0:00', '2009/7/12 1:00', '2009/7/12 2:00', '2009/7/12 3:00', '2009/7/12 4:00', '2009/7/12 5:00', '2009/7/12 6:00', '2009/7/12 7:00', '2009/7/12 8:00', '2009/7/12 9:00', '2009/7/12 10:00', '2009/7/12 11:00', '2009/7/12 12:00', '2009/7/12 13:00', '2009/7/12 14:00', '2009/7/12 15:00', '2009/7/12 16:00', '2009/7/12 17:00', '2009/7/12 18:00', '2009/7/12 19:00', '2009/7/12 20:00', '2009/7/12 21:00', '2009/7/12 22:00', '2009/7/12 23:00',
  '2009/7/13 0:00', '2009/7/13 1:00', '2009/7/13 2:00', '2009/7/13 3:00', '2009/7/13 4:00', '2009/7/13 5:00', '2009/7/13 6:00', '2009/7/13 7:00', '2009/7/13 8:00', '2009/7/13 9:00', '2009/7/13 10:00', '2009/7/13 11:00', '2009/7/13 12:00', '2009/7/13 13:00', '2009/7/13 14:00', '2009/7/13 15:00', '2009/7/13 16:00', '2009/7/13 17:00', '2009/7/13 18:00', '2009/7/13 19:00', '2009/7/13 20:00', '2009/7/13 21:00', '2009/7/13 22:00', '2009/7/13 23:00',
  '2009/7/14 0:00', '2009/7/14 1:00', '2009/7/14 2:00', '2009/7/14 3:00', '2009/7/14 4:00', '2009/7/14 5:00', '2009/7/14 6:00', '2009/7/14 7:00', '2009/7/14 8:00', '2009/7/14 9:00', '2009/7/14 10:00', '2009/7/14 11:00', '2009/7/14 12:00', '2009/7/14 13:00', '2009/7/14 14:00', '2009/7/14 15:00', '2009/7/14 16:00', '2009/7/14 17:00', '2009/7/14 18:00', '2009/7/14 19:00', '2009/7/14 20:00', '2009/7/14 21:00', '2009/7/14 22:00', '2009/7/14 23:00',
  '2009/7/15 0:00', '2009/7/15 1:00', '2009/7/15 2:00', '2009/7/15 3:00', '2009/7/15 4:00', '2009/7/15 5:00', '2009/7/15 6:00', '2009/7/15 7:00', '2009/7/15 8:00', '2009/7/15 9:00', '2009/7/15 10:00', '2009/7/15 11:00', '2009/7/15 12:00', '2009/7/15 13:00', '2009/7/15 14:00', '2009/7/15 15:00', '2009/7/15 16:00', '2009/7/15 17:00', '2009/7/15 18:00', '2009/7/15 19:00', '2009/7/15 20:00', '2009/7/15 21:00', '2009/7/15 22:00', '2009/7/15 23:00',
  '2009/7/16 0:00', '2009/7/16 1:00', '2009/7/16 2:00', '2009/7/16 3:00', '2009/7/16 4:00', '2009/7/16 5:00', '2009/7/16 6:00', '2009/7/16 7:00', '2009/7/16 8:00', '2009/7/16 9:00', '2009/7/16 10:00', '2009/7/16 11:00', '2009/7/16 12:00', '2009/7/16 13:00', '2009/7/16 14:00', '2009/7/16 15:00', '2009/7/16 16:00', '2009/7/16 17:00', '2009/7/16 18:00', '2009/7/16 19:00', '2009/7/16 20:00', '2009/7/16 21:00', '2009/7/16 22:00', '2009/7/16 23:00',
  '2009/7/17 0:00', '2009/7/17 1:00', '2009/7/17 2:00', '2009/7/17 3:00', '2009/7/17 4:00', '2009/7/17 5:00', '2009/7/17 6:00', '2009/7/17 7:00', '2009/7/17 8:00', '2009/7/17 9:00', '2009/7/17 10:00', '2009/7/17 11:00', '2009/7/17 12:00', '2009/7/17 13:00', '2009/7/17 14:00', '2009/7/17 15:00', '2009/7/17 16:00', '2009/7/17 17:00', '2009/7/17 18:00', '2009/7/17 19:00', '2009/7/17 20:00', '2009/7/17 21:00', '2009/7/17 22:00', '2009/7/17 23:00',
  '2009/7/18 0:00', '2009/7/18 1:00', '2009/7/18 2:00', '2009/7/18 3:00', '2009/7/18 4:00', '2009/7/18 5:00', '2009/7/18 6:00', '2009/7/18 7:00', '2009/7/18 8:00', '2009/7/18 9:00', '2009/7/18 10:00', '2009/7/18 11:00', '2009/7/18 12:00', '2009/7/18 13:00', '2009/7/18 14:00', '2009/7/18 15:00', '2009/7/18 16:00', '2009/7/18 17:00', '2009/7/18 18:00', '2009/7/18 19:00', '2009/7/18 20:00', '2009/7/18 21:00', '2009/7/18 22:00', '2009/7/18 23:00',
  '2009/7/19 0:00', '2009/7/19 1:00', '2009/7/19 2:00', '2009/7/19 3:00', '2009/7/19 4:00', '2009/7/19 5:00', '2009/7/19 6:00', '2009/7/19 7:00', '2009/7/19 8:00', '2009/7/19 9:00', '2009/7/19 10:00', '2009/7/19 11:00', '2009/7/19 12:00', '2009/7/19 13:00', '2009/7/19 14:00', '2009/7/19 15:00', '2009/7/19 16:00', '2009/7/19 17:00', '2009/7/19 18:00', '2009/7/19 19:00', '2009/7/19 20:00', '2009/7/19 21:00', '2009/7/19 22:00', '2009/7/19 23:00',
  '2009/7/20 0:00', '2009/7/20 1:00', '2009/7/20 2:00', '2009/7/20 3:00', '2009/7/20 4:00', '2009/7/20 5:00', '2009/7/20 6:00', '2009/7/20 7:00', '2009/7/20 8:00', '2009/7/20 9:00', '2009/7/20 10:00', '2009/7/20 11:00', '2009/7/20 12:00', '2009/7/20 13:00', '2009/7/20 14:00', '2009/7/20 15:00', '2009/7/20 16:00', '2009/7/20 17:00', '2009/7/20 18:00', '2009/7/20 19:00', '2009/7/20 20:00', '2009/7/20 21:00', '2009/7/20 22:00', '2009/7/20 23:00',
  '2009/7/21 0:00', '2009/7/21 1:00', '2009/7/21 2:00', '2009/7/21 3:00', '2009/7/21 4:00', '2009/7/21 5:00', '2009/7/21 6:00', '2009/7/21 7:00', '2009/7/21 8:00', '2009/7/21 9:00', '2009/7/21 10:00', '2009/7/21 11:00', '2009/7/21 12:00', '2009/7/21 13:00', '2009/7/21 14:00', '2009/7/21 15:00', '2009/7/21 16:00', '2009/7/21 17:00', '2009/7/21 18:00', '2009/7/21 19:00', '2009/7/21 20:00', '2009/7/21 21:00', '2009/7/21 22:00', '2009/7/21 23:00',
  '2009/7/22 0:00', '2009/7/22 1:00', '2009/7/22 2:00', '2009/7/22 3:00', '2009/7/22 4:00', '2009/7/22 5:00', '2009/7/22 6:00', '2009/7/22 7:00', '2009/7/22 8:00', '2009/7/22 9:00', '2009/7/22 10:00', '2009/7/22 11:00', '2009/7/22 12:00', '2009/7/22 13:00', '2009/7/22 14:00', '2009/7/22 15:00', '2009/7/22 16:00', '2009/7/22 17:00', '2009/7/22 18:00', '2009/7/22 19:00', '2009/7/22 20:00', '2009/7/22 21:00', '2009/7/22 22:00', '2009/7/22 23:00',
  '2009/7/23 0:00', '2009/7/23 1:00', '2009/7/23 2:00', '2009/7/23 3:00', '2009/7/23 4:00', '2009/7/23 5:00', '2009/7/23 6:00', '2009/7/23 7:00', '2009/7/23 8:00', '2009/7/23 9:00', '2009/7/23 10:00', '2009/7/23 11:00', '2009/7/23 12:00', '2009/7/23 13:00', '2009/7/23 14:00', '2009/7/23 15:00', '2009/7/23 16:00', '2009/7/23 17:00', '2009/7/23 18:00', '2009/7/23 19:00', '2009/7/23 20:00', '2009/7/23 21:00', '2009/7/23 22:00', '2009/7/23 23:00',
  '2009/7/24 0:00', '2009/7/24 1:00', '2009/7/24 2:00', '2009/7/24 3:00', '2009/7/24 4:00', '2009/7/24 5:00', '2009/7/24 6:00', '2009/7/24 7:00', '2009/7/24 8:00', '2009/7/24 9:00', '2009/7/24 10:00', '2009/7/24 11:00', '2009/7/24 12:00', '2009/7/24 13:00', '2009/7/24 14:00', '2009/7/24 15:00', '2009/7/24 16:00', '2009/7/24 17:00', '2009/7/24 18:00', '2009/7/24 19:00', '2009/7/24 20:00', '2009/7/24 21:00', '2009/7/24 22:00', '2009/7/24 23:00',
  '2009/7/25 0:00', '2009/7/25 1:00', '2009/7/25 2:00', '2009/7/25 3:00', '2009/7/25 4:00', '2009/7/25 5:00', '2009/7/25 6:00', '2009/7/25 7:00', '2009/7/25 8:00', '2009/7/25 9:00', '2009/7/25 10:00', '2009/7/25 11:00', '2009/7/25 12:00', '2009/7/25 13:00', '2009/7/25 14:00', '2009/7/25 15:00', '2009/7/25 16:00', '2009/7/25 17:00', '2009/7/25 18:00', '2009/7/25 19:00', '2009/7/25 20:00', '2009/7/25 21:00', '2009/7/25 22:00', '2009/7/25 23:00',
  '2009/7/26 0:00', '2009/7/26 1:00', '2009/7/26 2:00', '2009/7/26 3:00', '2009/7/26 4:00', '2009/7/26 5:00', '2009/7/26 6:00', '2009/7/26 7:00', '2009/7/26 8:00', '2009/7/26 9:00', '2009/7/26 10:00', '2009/7/26 11:00', '2009/7/26 12:00', '2009/7/26 13:00', '2009/7/26 14:00', '2009/7/26 15:00', '2009/7/26 16:00', '2009/7/26 17:00', '2009/7/26 18:00', '2009/7/26 19:00', '2009/7/26 20:00', '2009/7/26 21:00', '2009/7/26 22:00', '2009/7/26 23:00',
  '2009/7/27 0:00', '2009/7/27 1:00', '2009/7/27 2:00', '2009/7/27 3:00', '2009/7/27 4:00', '2009/7/27 5:00', '2009/7/27 6:00', '2009/7/27 7:00', '2009/7/27 8:00', '2009/7/27 9:00', '2009/7/27 10:00', '2009/7/27 11:00', '2009/7/27 12:00', '2009/7/27 13:00', '2009/7/27 14:00', '2009/7/27 15:00', '2009/7/27 16:00', '2009/7/27 17:00', '2009/7/27 18:00', '2009/7/27 19:00', '2009/7/27 20:00', '2009/7/27 21:00', '2009/7/27 22:00', '2009/7/27 23:00',
  '2009/7/28 0:00', '2009/7/28 1:00', '2009/7/28 2:00', '2009/7/28 3:00', '2009/7/28 4:00', '2009/7/28 5:00', '2009/7/28 6:00', '2009/7/28 7:00', '2009/7/28 8:00', '2009/7/28 9:00', '2009/7/28 10:00', '2009/7/28 11:00', '2009/7/28 12:00', '2009/7/28 13:00', '2009/7/28 14:00', '2009/7/28 15:00', '2009/7/28 16:00', '2009/7/28 17:00', '2009/7/28 18:00', '2009/7/28 19:00', '2009/7/28 20:00', '2009/7/28 21:00', '2009/7/28 22:00', '2009/7/28 23:00',
  '2009/7/29 0:00', '2009/7/29 1:00', '2009/7/29 2:00', '2009/7/29 3:00', '2009/7/29 4:00', '2009/7/29 5:00', '2009/7/29 6:00', '2009/7/29 7:00', '2009/7/29 8:00', '2009/7/29 9:00', '2009/7/29 10:00', '2009/7/29 11:00', '2009/7/29 12:00', '2009/7/29 13:00', '2009/7/29 14:00', '2009/7/29 15:00', '2009/7/29 16:00', '2009/7/29 17:00', '2009/7/29 18:00', '2009/7/29 19:00', '2009/7/29 20:00', '2009/7/29 21:00', '2009/7/29 22:00', '2009/7/29 23:00',
  '2009/7/30 0:00', '2009/7/30 1:00', '2009/7/30 2:00', '2009/7/30 3:00', '2009/7/30 4:00', '2009/7/30 5:00', '2009/7/30 6:00', '2009/7/30 7:00', '2009/7/30 8:00', '2009/7/30 9:00', '2009/7/30 10:00', '2009/7/30 11:00', '2009/7/30 12:00', '2009/7/30 13:00', '2009/7/30 14:00', '2009/7/30 15:00', '2009/7/30 16:00', '2009/7/30 17:00', '2009/7/30 18:00', '2009/7/30 19:00', '2009/7/30 20:00', '2009/7/30 21:00', '2009/7/30 22:00', '2009/7/30 23:00',
  '2009/7/31 0:00', '2009/7/31 1:00', '2009/7/31 2:00', '2009/7/31 3:00', '2009/7/31 4:00', '2009/7/31 5:00', '2009/7/31 6:00', '2009/7/31 7:00', '2009/7/31 8:00', '2009/7/31 9:00', '2009/7/31 10:00', '2009/7/31 11:00', '2009/7/31 12:00', '2009/7/31 13:00', '2009/7/31 14:00', '2009/7/31 15:00', '2009/7/31 16:00', '2009/7/31 17:00', '2009/7/31 18:00', '2009/7/31 19:00', '2009/7/31 20:00', '2009/7/31 21:00', '2009/7/31 22:00', '2009/7/31 23:00',
  '2009/8/1 0:00', '2009/8/1 1:00', '2009/8/1 2:00', '2009/8/1 3:00', '2009/8/1 4:00', '2009/8/1 5:00', '2009/8/1 6:00', '2009/8/1 7:00', '2009/8/1 8:00', '2009/8/1 9:00', '2009/8/1 10:00', '2009/8/1 11:00', '2009/8/1 12:00', '2009/8/1 13:00', '2009/8/1 14:00', '2009/8/1 15:00', '2009/8/1 16:00', '2009/8/1 17:00', '2009/8/1 18:00', '2009/8/1 19:00', '2009/8/1 20:00', '2009/8/1 21:00', '2009/8/1 22:00', '2009/8/1 23:00', '2009/8/2 0:00', '2009/8/2 1:00', '2009/8/2 2:00', '2009/8/2 3:00', '2009/8/2 4:00', '2009/8/2 5:00', '2009/8/2 6:00', '2009/8/2 7:00', '2009/8/2 8:00', '2009/8/2 9:00', '2009/8/2 10:00', '2009/8/2 11:00', '2009/8/2 12:00', '2009/8/2 13:00', '2009/8/2 14:00', '2009/8/2 15:00', '2009/8/2 16:00', '2009/8/2 17:00', '2009/8/2 18:00', '2009/8/2 19:00', '2009/8/2 20:00', '2009/8/2 21:00', '2009/8/2 22:00', '2009/8/2 23:00', '2009/8/3 0:00', '2009/8/3 1:00', '2009/8/3 2:00', '2009/8/3 3:00', '2009/8/3 4:00', '2009/8/3 5:00', '2009/8/3 6:00', '2009/8/3 7:00', '2009/8/3 8:00', '2009/8/3 9:00', '2009/8/3 10:00', '2009/8/3 11:00', '2009/8/3 12:00', '2009/8/3 13:00', '2009/8/3 14:00', '2009/8/3 15:00', '2009/8/3 16:00', '2009/8/3 17:00', '2009/8/3 18:00', '2009/8/3 19:00', '2009/8/3 20:00', '2009/8/3 21:00', '2009/8/3 22:00', '2009/8/3 23:00', '2009/8/4 0:00', '2009/8/4 1:00', '2009/8/4 2:00', '2009/8/4 3:00', '2009/8/4 4:00', '2009/8/4 5:00', '2009/8/4 6:00', '2009/8/4 7:00', '2009/8/4 8:00', '2009/8/4 9:00', '2009/8/4 10:00', '2009/8/4 11:00', '2009/8/4 12:00', '2009/8/4 13:00', '2009/8/4 14:00', '2009/8/4 15:00', '2009/8/4 16:00', '2009/8/4 17:00', '2009/8/4 18:00', '2009/8/4 19:00', '2009/8/4 20:00', '2009/8/4 21:00', '2009/8/4 22:00', '2009/8/4 23:00', '2009/8/5 0:00', '2009/8/5 1:00', '2009/8/5 2:00', '2009/8/5 3:00', '2009/8/5 4:00', '2009/8/5 5:00', '2009/8/5 6:00', '2009/8/5 7:00', '2009/8/5 8:00', '2009/8/5 9:00', '2009/8/5 10:00', '2009/8/5 11:00', '2009/8/5 12:00', '2009/8/5 13:00', '2009/8/5 14:00', '2009/8/5 15:00', '2009/8/5 16:00', '2009/8/5 17:00', '2009/8/5 18:00', '2009/8/5 19:00', '2009/8/5 20:00', '2009/8/5 21:00', '2009/8/5 22:00', '2009/8/5 23:00', '2009/8/6 0:00', '2009/8/6 1:00', '2009/8/6 2:00', '2009/8/6 3:00', '2009/8/6 4:00', '2009/8/6 5:00', '2009/8/6 6:00', '2009/8/6 7:00', '2009/8/6 8:00', '2009/8/6 9:00', '2009/8/6 10:00', '2009/8/6 11:00', '2009/8/6 12:00', '2009/8/6 13:00', '2009/8/6 14:00', '2009/8/6 15:00', '2009/8/6 16:00', '2009/8/6 17:00', '2009/8/6 18:00', '2009/8/6 19:00', '2009/8/6 20:00', '2009/8/6 21:00', '2009/8/6 22:00', '2009/8/6 23:00', '2009/8/7 0:00', '2009/8/7 1:00', '2009/8/7 2:00', '2009/8/7 3:00', '2009/8/7 4:00', '2009/8/7 5:00', '2009/8/7 6:00', '2009/8/7 7:00', '2009/8/7 8:00', '2009/8/7 9:00', '2009/8/7 10:00', '2009/8/7 11:00', '2009/8/7 12:00', '2009/8/7 13:00', '2009/8/7 14:00', '2009/8/7 15:00', '2009/8/7 16:00', '2009/8/7 17:00', '2009/8/7 18:00', '2009/8/7 19:00', '2009/8/7 20:00', '2009/8/7 21:00', '2009/8/7 22:00', '2009/8/7 23:00', '2009/8/8 0:00', '2009/8/8 1:00', '2009/8/8 2:00', '2009/8/8 3:00', '2009/8/8 4:00', '2009/8/8 5:00', '2009/8/8 6:00', '2009/8/8 7:00', '2009/8/8 8:00', '2009/8/8 9:00', '2009/8/8 10:00', '2009/8/8 11:00', '2009/8/8 12:00', '2009/8/8 13:00', '2009/8/8 14:00', '2009/8/8 15:00', '2009/8/8 16:00', '2009/8/8 17:00', '2009/8/8 18:00', '2009/8/8 19:00', '2009/8/8 20:00', '2009/8/8 21:00', '2009/8/8 22:00', '2009/8/8 23:00', '2009/8/9 0:00', '2009/8/9 1:00', '2009/8/9 2:00', '2009/8/9 3:00', '2009/8/9 4:00', '2009/8/9 5:00', '2009/8/9 6:00', '2009/8/9 7:00', '2009/8/9 8:00', '2009/8/9 9:00', '2009/8/9 10:00', '2009/8/9 11:00', '2009/8/9 12:00', '2009/8/9 13:00', '2009/8/9 14:00', '2009/8/9 15:00', '2009/8/9 16:00', '2009/8/9 17:00', '2009/8/9 18:00', '2009/8/9 19:00', '2009/8/9 20:00', '2009/8/9 21:00', '2009/8/9 22:00', '2009/8/9 23:00', '2009/8/10 0:00', '2009/8/10 1:00', '2009/8/10 2:00', '2009/8/10 3:00', '2009/8/10 4:00', '2009/8/10 5:00', '2009/8/10 6:00', '2009/8/10 7:00', '2009/8/10 8:00', '2009/8/10 9:00', '2009/8/10 10:00', '2009/8/10 11:00', '2009/8/10 12:00', '2009/8/10 13:00', '2009/8/10 14:00', '2009/8/10 15:00', '2009/8/10 16:00', '2009/8/10 17:00', '2009/8/10 18:00', '2009/8/10 19:00', '2009/8/10 20:00', '2009/8/10 21:00', '2009/8/10 22:00', '2009/8/10 23:00', '2009/8/11 0:00', '2009/8/11 1:00', '2009/8/11 2:00', '2009/8/11 3:00', '2009/8/11 4:00', '2009/8/11 5:00', '2009/8/11 6:00', '2009/8/11 7:00', '2009/8/11 8:00', '2009/8/11 9:00', '2009/8/11 10:00', '2009/8/11 11:00', '2009/8/11 12:00', '2009/8/11 13:00', '2009/8/11 14:00', '2009/8/11 15:00', '2009/8/11 16:00', '2009/8/11 17:00', '2009/8/11 18:00', '2009/8/11 19:00', '2009/8/11 20:00', '2009/8/11 21:00', '2009/8/11 22:00', '2009/8/11 23:00', '2009/8/12 0:00', '2009/8/12 1:00', '2009/8/12 2:00', '2009/8/12 3:00', '2009/8/12 4:00', '2009/8/12 5:00', '2009/8/12 6:00', '2009/8/12 7:00', '2009/8/12 8:00', '2009/8/12 9:00', '2009/8/12 10:00', '2009/8/12 11:00', '2009/8/12 12:00', '2009/8/12 13:00', '2009/8/12 14:00', '2009/8/12 15:00', '2009/8/12 16:00', '2009/8/12 17:00', '2009/8/12 18:00', '2009/8/12 19:00', '2009/8/12 20:00', '2009/8/12 21:00', '2009/8/12 22:00', '2009/8/12 23:00', '2009/8/13 0:00', '2009/8/13 1:00', '2009/8/13 2:00', '2009/8/13 3:00', '2009/8/13 4:00', '2009/8/13 5:00', '2009/8/13 6:00', '2009/8/13 7:00', '2009/8/13 8:00', '2009/8/13 9:00', '2009/8/13 10:00', '2009/8/13 11:00', '2009/8/13 12:00', '2009/8/13 13:00', '2009/8/13 14:00', '2009/8/13 15:00', '2009/8/13 16:00', '2009/8/13 17:00', '2009/8/13 18:00', '2009/8/13 19:00', '2009/8/13 20:00', '2009/8/13 21:00', '2009/8/13 22:00', '2009/8/13 23:00', '2009/8/14 0:00', '2009/8/14 1:00', '2009/8/14 2:00', '2009/8/14 3:00', '2009/8/14 4:00', '2009/8/14 5:00', '2009/8/14 6:00', '2009/8/14 7:00', '2009/8/14 8:00', '2009/8/14 9:00', '2009/8/14 10:00', '2009/8/14 11:00', '2009/8/14 12:00', '2009/8/14 13:00', '2009/8/14 14:00', '2009/8/14 15:00', '2009/8/14 16:00', '2009/8/14 17:00', '2009/8/14 18:00', '2009/8/14 19:00', '2009/8/14 20:00', '2009/8/14 21:00', '2009/8/14 22:00', '2009/8/14 23:00', '2009/8/15 0:00', '2009/8/15 1:00', '2009/8/15 2:00', '2009/8/15 3:00', '2009/8/15 4:00', '2009/8/15 5:00', '2009/8/15 6:00', '2009/8/15 7:00', '2009/8/15 8:00', '2009/8/15 9:00', '2009/8/15 10:00', '2009/8/15 11:00', '2009/8/15 12:00', '2009/8/15 13:00', '2009/8/15 14:00', '2009/8/15 15:00', '2009/8/15 16:00', '2009/8/15 17:00', '2009/8/15 18:00', '2009/8/15 19:00', '2009/8/15 20:00', '2009/8/15 21:00', '2009/8/15 22:00', '2009/8/15 23:00', '2009/8/16 0:00', '2009/8/16 1:00', '2009/8/16 2:00', '2009/8/16 3:00', '2009/8/16 4:00', '2009/8/16 5:00', '2009/8/16 6:00', '2009/8/16 7:00', '2009/8/16 8:00', '2009/8/16 9:00', '2009/8/16 10:00', '2009/8/16 11:00', '2009/8/16 12:00', '2009/8/16 13:00', '2009/8/16 14:00', '2009/8/16 15:00', '2009/8/16 16:00', '2009/8/16 17:00', '2009/8/16 18:00', '2009/8/16 19:00', '2009/8/16 20:00', '2009/8/16 21:00', '2009/8/16 22:00', '2009/8/16 23:00', '2009/8/17 0:00', '2009/8/17 1:00', '2009/8/17 2:00', '2009/8/17 3:00', '2009/8/17 4:00', '2009/8/17 5:00', '2009/8/17 6:00', '2009/8/17 7:00', '2009/8/17 8:00', '2009/8/17 9:00', '2009/8/17 10:00', '2009/8/17 11:00', '2009/8/17 12:00', '2009/8/17 13:00', '2009/8/17 14:00', '2009/8/17 15:00', '2009/8/17 16:00', '2009/8/17 17:00', '2009/8/17 18:00', '2009/8/17 19:00', '2009/8/17 20:00', '2009/8/17 21:00', '2009/8/17 22:00', '2009/8/17 23:00', '2009/8/18 0:00', '2009/8/18 1:00', '2009/8/18 2:00', '2009/8/18 3:00', '2009/8/18 4:00', '2009/8/18 5:00', '2009/8/18 6:00', '2009/8/18 7:00', '2009/8/18 8:00', '2009/8/18 9:00', '2009/8/18 10:00', '2009/8/18 11:00', '2009/8/18 12:00', '2009/8/18 13:00', '2009/8/18 14:00', '2009/8/18 15:00', '2009/8/18 16:00', '2009/8/18 17:00', '2009/8/18 18:00', '2009/8/18 19:00', '2009/8/18 20:00', '2009/8/18 21:00', '2009/8/18 22:00', '2009/8/18 23:00', '2009/8/19 0:00', '2009/8/19 1:00', '2009/8/19 2:00', '2009/8/19 3:00', '2009/8/19 4:00', '2009/8/19 5:00', '2009/8/19 6:00', '2009/8/19 7:00', '2009/8/19 8:00', '2009/8/19 9:00', '2009/8/19 10:00', '2009/8/19 11:00', '2009/8/19 12:00', '2009/8/19 13:00', '2009/8/19 14:00', '2009/8/19 15:00', '2009/8/19 16:00', '2009/8/19 17:00', '2009/8/19 18:00', '2009/8/19 19:00', '2009/8/19 20:00', '2009/8/19 21:00', '2009/8/19 22:00', '2009/8/19 23:00', '2009/8/20 0:00', '2009/8/20 1:00', '2009/8/20 2:00', '2009/8/20 3:00', '2009/8/20 4:00', '2009/8/20 5:00', '2009/8/20 6:00', '2009/8/20 7:00', '2009/8/20 8:00', '2009/8/20 9:00', '2009/8/20 10:00', '2009/8/20 11:00', '2009/8/20 12:00', '2009/8/20 13:00', '2009/8/20 14:00', '2009/8/20 15:00', '2009/8/20 16:00', '2009/8/20 17:00', '2009/8/20 18:00', '2009/8/20 19:00', '2009/8/20 20:00', '2009/8/20 21:00', '2009/8/20 22:00', '2009/8/20 23:00', '2009/8/21 0:00', '2009/8/21 1:00', '2009/8/21 2:00', '2009/8/21 3:00', '2009/8/21 4:00', '2009/8/21 5:00', '2009/8/21 6:00', '2009/8/21 7:00', '2009/8/21 8:00', '2009/8/21 9:00', '2009/8/21 10:00', '2009/8/21 11:00', '2009/8/21 12:00', '2009/8/21 13:00', '2009/8/21 14:00', '2009/8/21 15:00', '2009/8/21 16:00', '2009/8/21 17:00', '2009/8/21 18:00', '2009/8/21 19:00', '2009/8/21 20:00', '2009/8/21 21:00', '2009/8/21 22:00', '2009/8/21 23:00', '2009/8/22 0:00', '2009/8/22 1:00', '2009/8/22 2:00', '2009/8/22 3:00', '2009/8/22 4:00', '2009/8/22 5:00', '2009/8/22 6:00', '2009/8/22 7:00', '2009/8/22 8:00', '2009/8/22 9:00', '2009/8/22 10:00', '2009/8/22 11:00', '2009/8/22 12:00', '2009/8/22 13:00', '2009/8/22 14:00', '2009/8/22 15:00', '2009/8/22 16:00', '2009/8/22 17:00', '2009/8/22 18:00', '2009/8/22 19:00', '2009/8/22 20:00', '2009/8/22 21:00', '2009/8/22 22:00', '2009/8/22 23:00', '2009/8/23 0:00', '2009/8/23 1:00', '2009/8/23 2:00', '2009/8/23 3:00', '2009/8/23 4:00', '2009/8/23 5:00', '2009/8/23 6:00', '2009/8/23 7:00', '2009/8/23 8:00', '2009/8/23 9:00', '2009/8/23 10:00', '2009/8/23 11:00', '2009/8/23 12:00', '2009/8/23 13:00', '2009/8/23 14:00', '2009/8/23 15:00', '2009/8/23 16:00', '2009/8/23 17:00', '2009/8/23 18:00', '2009/8/23 19:00', '2009/8/23 20:00', '2009/8/23 21:00', '2009/8/23 22:00', '2009/8/23 23:00', '2009/8/24 0:00', '2009/8/24 1:00', '2009/8/24 2:00', '2009/8/24 3:00', '2009/8/24 4:00', '2009/8/24 5:00', '2009/8/24 6:00', '2009/8/24 7:00', '2009/8/24 8:00', '2009/8/24 9:00', '2009/8/24 10:00', '2009/8/24 11:00', '2009/8/24 12:00', '2009/8/24 13:00', '2009/8/24 14:00', '2009/8/24 15:00', '2009/8/24 16:00', '2009/8/24 17:00', '2009/8/24 18:00', '2009/8/24 19:00', '2009/8/24 20:00', '2009/8/24 21:00', '2009/8/24 22:00', '2009/8/24 23:00', '2009/8/25 0:00', '2009/8/25 1:00', '2009/8/25 2:00', '2009/8/25 3:00', '2009/8/25 4:00', '2009/8/25 5:00', '2009/8/25 6:00', '2009/8/25 7:00', '2009/8/25 8:00', '2009/8/25 9:00', '2009/8/25 10:00', '2009/8/25 11:00', '2009/8/25 12:00', '2009/8/25 13:00', '2009/8/25 14:00', '2009/8/25 15:00', '2009/8/25 16:00', '2009/8/25 17:00', '2009/8/25 18:00', '2009/8/25 19:00', '2009/8/25 20:00', '2009/8/25 21:00', '2009/8/25 22:00', '2009/8/25 23:00', '2009/8/26 0:00', '2009/8/26 1:00', '2009/8/26 2:00', '2009/8/26 3:00', '2009/8/26 4:00', '2009/8/26 5:00', '2009/8/26 6:00', '2009/8/26 7:00', '2009/8/26 8:00', '2009/8/26 9:00', '2009/8/26 10:00', '2009/8/26 11:00', '2009/8/26 12:00', '2009/8/26 13:00', '2009/8/26 14:00', '2009/8/26 15:00', '2009/8/26 16:00', '2009/8/26 17:00', '2009/8/26 18:00', '2009/8/26 19:00', '2009/8/26 20:00', '2009/8/26 21:00', '2009/8/26 22:00', '2009/8/26 23:00', '2009/8/27 0:00', '2009/8/27 1:00', '2009/8/27 2:00', '2009/8/27 3:00', '2009/8/27 4:00', '2009/8/27 5:00', '2009/8/27 6:00', '2009/8/27 7:00', '2009/8/27 8:00', '2009/8/27 9:00', '2009/8/27 10:00', '2009/8/27 11:00', '2009/8/27 12:00', '2009/8/27 13:00', '2009/8/27 14:00', '2009/8/27 15:00', '2009/8/27 16:00', '2009/8/27 17:00', '2009/8/27 18:00', '2009/8/27 19:00', '2009/8/27 20:00', '2009/8/27 21:00', '2009/8/27 22:00', '2009/8/27 23:00', '2009/8/28 0:00', '2009/8/28 1:00', '2009/8/28 2:00', '2009/8/28 3:00', '2009/8/28 4:00', '2009/8/28 5:00', '2009/8/28 6:00', '2009/8/28 7:00', '2009/8/28 8:00', '2009/8/28 9:00', '2009/8/28 10:00', '2009/8/28 11:00', '2009/8/28 12:00', '2009/8/28 13:00', '2009/8/28 14:00', '2009/8/28 15:00', '2009/8/28 16:00', '2009/8/28 17:00', '2009/8/28 18:00', '2009/8/28 19:00', '2009/8/28 20:00', '2009/8/28 21:00', '2009/8/28 22:00', '2009/8/28 23:00', '2009/8/29 0:00', '2009/8/29 1:00', '2009/8/29 2:00', '2009/8/29 3:00', '2009/8/29 4:00', '2009/8/29 5:00', '2009/8/29 6:00', '2009/8/29 7:00', '2009/8/29 8:00', '2009/8/29 9:00', '2009/8/29 10:00', '2009/8/29 11:00', '2009/8/29 12:00', '2009/8/29 13:00', '2009/8/29 14:00', '2009/8/29 15:00', '2009/8/29 16:00', '2009/8/29 17:00', '2009/8/29 18:00', '2009/8/29 19:00', '2009/8/29 20:00', '2009/8/29 21:00', '2009/8/29 22:00', '2009/8/29 23:00', '2009/8/30 0:00', '2009/8/30 1:00', '2009/8/30 2:00', '2009/8/30 3:00', '2009/8/30 4:00', '2009/8/30 5:00', '2009/8/30 6:00', '2009/8/30 7:00', '2009/8/30 8:00', '2009/8/30 9:00', '2009/8/30 10:00', '2009/8/30 11:00', '2009/8/30 12:00', '2009/8/30 13:00', '2009/8/30 14:00', '2009/8/30 15:00', '2009/8/30 16:00', '2009/8/30 17:00', '2009/8/30 18:00', '2009/8/30 19:00', '2009/8/30 20:00', '2009/8/30 21:00', '2009/8/30 22:00', '2009/8/30 23:00', '2009/8/31 0:00', '2009/8/31 1:00', '2009/8/31 2:00', '2009/8/31 3:00', '2009/8/31 4:00', '2009/8/31 5:00', '2009/8/31 6:00', '2009/8/31 7:00', '2009/8/31 8:00', '2009/8/31 9:00', '2009/8/31 10:00', '2009/8/31 11:00', '2009/8/31 12:00', '2009/8/31 13:00', '2009/8/31 14:00', '2009/8/31 15:00', '2009/8/31 16:00', '2009/8/31 17:00', '2009/8/31 18:00', '2009/8/31 19:00', '2009/8/31 20:00', '2009/8/31 21:00', '2009/8/31 22:00', '2009/8/31 23:00',
  '2009/9/1 0:00', '2009/9/1 1:00', '2009/9/1 2:00', '2009/9/1 3:00', '2009/9/1 4:00', '2009/9/1 5:00', '2009/9/1 6:00', '2009/9/1 7:00', '2009/9/1 8:00', '2009/9/1 9:00', '2009/9/1 10:00', '2009/9/1 11:00', '2009/9/1 12:00', '2009/9/1 13:00', '2009/9/1 14:00', '2009/9/1 15:00', '2009/9/1 16:00', '2009/9/1 17:00', '2009/9/1 18:00', '2009/9/1 19:00', '2009/9/1 20:00', '2009/9/1 21:00', '2009/9/1 22:00', '2009/9/1 23:00', '2009/9/2 0:00', '2009/9/2 1:00', '2009/9/2 2:00', '2009/9/2 3:00', '2009/9/2 4:00', '2009/9/2 5:00', '2009/9/2 6:00', '2009/9/2 7:00', '2009/9/2 8:00', '2009/9/2 9:00', '2009/9/2 10:00', '2009/9/2 11:00', '2009/9/2 12:00', '2009/9/2 13:00', '2009/9/2 14:00', '2009/9/2 15:00', '2009/9/2 16:00', '2009/9/2 17:00', '2009/9/2 18:00', '2009/9/2 19:00', '2009/9/2 20:00', '2009/9/2 21:00', '2009/9/2 22:00', '2009/9/2 23:00', '2009/9/3 0:00', '2009/9/3 1:00', '2009/9/3 2:00', '2009/9/3 3:00', '2009/9/3 4:00', '2009/9/3 5:00', '2009/9/3 6:00', '2009/9/3 7:00', '2009/9/3 8:00', '2009/9/3 9:00', '2009/9/3 10:00', '2009/9/3 11:00', '2009/9/3 12:00', '2009/9/3 13:00', '2009/9/3 14:00', '2009/9/3 15:00', '2009/9/3 16:00', '2009/9/3 17:00', '2009/9/3 18:00', '2009/9/3 19:00', '2009/9/3 20:00', '2009/9/3 21:00', '2009/9/3 22:00', '2009/9/3 23:00', '2009/9/4 0:00', '2009/9/4 1:00', '2009/9/4 2:00', '2009/9/4 3:00', '2009/9/4 4:00', '2009/9/4 5:00', '2009/9/4 6:00', '2009/9/4 7:00', '2009/9/4 8:00', '2009/9/4 9:00', '2009/9/4 10:00', '2009/9/4 11:00', '2009/9/4 12:00', '2009/9/4 13:00', '2009/9/4 14:00', '2009/9/4 15:00', '2009/9/4 16:00', '2009/9/4 17:00', '2009/9/4 18:00', '2009/9/4 19:00', '2009/9/4 20:00', '2009/9/4 21:00', '2009/9/4 22:00', '2009/9/4 23:00', '2009/9/5 0:00', '2009/9/5 1:00', '2009/9/5 2:00', '2009/9/5 3:00', '2009/9/5 4:00', '2009/9/5 5:00', '2009/9/5 6:00', '2009/9/5 7:00', '2009/9/5 8:00', '2009/9/5 9:00', '2009/9/5 10:00', '2009/9/5 11:00', '2009/9/5 12:00', '2009/9/5 13:00', '2009/9/5 14:00', '2009/9/5 15:00', '2009/9/5 16:00', '2009/9/5 17:00', '2009/9/5 18:00', '2009/9/5 19:00', '2009/9/5 20:00', '2009/9/5 21:00', '2009/9/5 22:00', '2009/9/5 23:00', '2009/9/6 0:00', '2009/9/6 1:00', '2009/9/6 2:00', '2009/9/6 3:00', '2009/9/6 4:00', '2009/9/6 5:00', '2009/9/6 6:00', '2009/9/6 7:00', '2009/9/6 8:00', '2009/9/6 9:00', '2009/9/6 10:00', '2009/9/6 11:00', '2009/9/6 12:00', '2009/9/6 13:00', '2009/9/6 14:00', '2009/9/6 15:00', '2009/9/6 16:00', '2009/9/6 17:00', '2009/9/6 18:00', '2009/9/6 19:00', '2009/9/6 20:00', '2009/9/6 21:00', '2009/9/6 22:00', '2009/9/6 23:00', '2009/9/7 0:00', '2009/9/7 1:00', '2009/9/7 2:00', '2009/9/7 3:00', '2009/9/7 4:00', '2009/9/7 5:00', '2009/9/7 6:00', '2009/9/7 7:00', '2009/9/7 8:00', '2009/9/7 9:00', '2009/9/7 10:00', '2009/9/7 11:00', '2009/9/7 12:00', '2009/9/7 13:00', '2009/9/7 14:00', '2009/9/7 15:00', '2009/9/7 16:00', '2009/9/7 17:00', '2009/9/7 18:00', '2009/9/7 19:00', '2009/9/7 20:00', '2009/9/7 21:00', '2009/9/7 22:00', '2009/9/7 23:00', '2009/9/8 0:00', '2009/9/8 1:00', '2009/9/8 2:00', '2009/9/8 3:00', '2009/9/8 4:00', '2009/9/8 5:00', '2009/9/8 6:00', '2009/9/8 7:00', '2009/9/8 8:00', '2009/9/8 9:00', '2009/9/8 10:00', '2009/9/8 11:00', '2009/9/8 12:00', '2009/9/8 13:00', '2009/9/8 14:00', '2009/9/8 15:00', '2009/9/8 16:00', '2009/9/8 17:00', '2009/9/8 18:00', '2009/9/8 19:00', '2009/9/8 20:00', '2009/9/8 21:00', '2009/9/8 22:00', '2009/9/8 23:00', '2009/9/9 0:00', '2009/9/9 1:00', '2009/9/9 2:00', '2009/9/9 3:00', '2009/9/9 4:00', '2009/9/9 5:00', '2009/9/9 6:00', '2009/9/9 7:00', '2009/9/9 8:00', '2009/9/9 9:00', '2009/9/9 10:00', '2009/9/9 11:00', '2009/9/9 12:00', '2009/9/9 13:00', '2009/9/9 14:00', '2009/9/9 15:00', '2009/9/9 16:00', '2009/9/9 17:00', '2009/9/9 18:00', '2009/9/9 19:00', '2009/9/9 20:00', '2009/9/9 21:00', '2009/9/9 22:00', '2009/9/9 23:00', '2009/9/10 0:00', '2009/9/10 1:00', '2009/9/10 2:00', '2009/9/10 3:00', '2009/9/10 4:00', '2009/9/10 5:00', '2009/9/10 6:00', '2009/9/10 7:00', '2009/9/10 8:00', '2009/9/10 9:00', '2009/9/10 10:00', '2009/9/10 11:00', '2009/9/10 12:00', '2009/9/10 13:00', '2009/9/10 14:00', '2009/9/10 15:00', '2009/9/10 16:00', '2009/9/10 17:00', '2009/9/10 18:00', '2009/9/10 19:00', '2009/9/10 20:00', '2009/9/10 21:00', '2009/9/10 22:00', '2009/9/10 23:00', '2009/9/11 0:00', '2009/9/11 1:00', '2009/9/11 2:00', '2009/9/11 3:00', '2009/9/11 4:00', '2009/9/11 5:00', '2009/9/11 6:00', '2009/9/11 7:00', '2009/9/11 8:00', '2009/9/11 9:00', '2009/9/11 10:00', '2009/9/11 11:00', '2009/9/11 12:00', '2009/9/11 13:00', '2009/9/11 14:00', '2009/9/11 15:00', '2009/9/11 16:00', '2009/9/11 17:00', '2009/9/11 18:00', '2009/9/11 19:00', '2009/9/11 20:00', '2009/9/11 21:00', '2009/9/11 22:00', '2009/9/11 23:00', '2009/9/12 0:00', '2009/9/12 1:00', '2009/9/12 2:00', '2009/9/12 3:00', '2009/9/12 4:00', '2009/9/12 5:00', '2009/9/12 6:00', '2009/9/12 7:00', '2009/9/12 8:00', '2009/9/12 9:00', '2009/9/12 10:00', '2009/9/12 11:00', '2009/9/12 12:00', '2009/9/12 13:00', '2009/9/12 14:00', '2009/9/12 15:00', '2009/9/12 16:00', '2009/9/12 17:00', '2009/9/12 18:00', '2009/9/12 19:00', '2009/9/12 20:00', '2009/9/12 21:00', '2009/9/12 22:00', '2009/9/12 23:00', '2009/9/13 0:00', '2009/9/13 1:00', '2009/9/13 2:00', '2009/9/13 3:00', '2009/9/13 4:00', '2009/9/13 5:00', '2009/9/13 6:00', '2009/9/13 7:00', '2009/9/13 8:00', '2009/9/13 9:00', '2009/9/13 10:00', '2009/9/13 11:00', '2009/9/13 12:00', '2009/9/13 13:00', '2009/9/13 14:00', '2009/9/13 15:00', '2009/9/13 16:00', '2009/9/13 17:00', '2009/9/13 18:00', '2009/9/13 19:00', '2009/9/13 20:00', '2009/9/13 21:00', '2009/9/13 22:00', '2009/9/13 23:00', '2009/9/14 0:00', '2009/9/14 1:00', '2009/9/14 2:00', '2009/9/14 3:00', '2009/9/14 4:00', '2009/9/14 5:00', '2009/9/14 6:00', '2009/9/14 7:00', '2009/9/14 8:00', '2009/9/14 9:00', '2009/9/14 10:00', '2009/9/14 11:00', '2009/9/14 12:00', '2009/9/14 13:00', '2009/9/14 14:00', '2009/9/14 15:00', '2009/9/14 16:00', '2009/9/14 17:00', '2009/9/14 18:00', '2009/9/14 19:00', '2009/9/14 20:00', '2009/9/14 21:00', '2009/9/14 22:00', '2009/9/14 23:00', '2009/9/15 0:00', '2009/9/15 1:00', '2009/9/15 2:00', '2009/9/15 3:00', '2009/9/15 4:00', '2009/9/15 5:00', '2009/9/15 6:00', '2009/9/15 7:00', '2009/9/15 8:00', '2009/9/15 9:00', '2009/9/15 10:00', '2009/9/15 11:00', '2009/9/15 12:00', '2009/9/15 13:00', '2009/9/15 14:00', '2009/9/15 15:00', '2009/9/15 16:00', '2009/9/15 17:00', '2009/9/15 18:00', '2009/9/15 19:00', '2009/9/15 20:00', '2009/9/15 21:00', '2009/9/15 22:00', '2009/9/15 23:00', '2009/9/16 0:00', '2009/9/16 1:00', '2009/9/16 2:00', '2009/9/16 3:00', '2009/9/16 4:00', '2009/9/16 5:00', '2009/9/16 6:00', '2009/9/16 7:00', '2009/9/16 8:00', '2009/9/16 9:00', '2009/9/16 10:00', '2009/9/16 11:00', '2009/9/16 12:00', '2009/9/16 13:00', '2009/9/16 14:00', '2009/9/16 15:00', '2009/9/16 16:00', '2009/9/16 17:00', '2009/9/16 18:00', '2009/9/16 19:00', '2009/9/16 20:00', '2009/9/16 21:00', '2009/9/16 22:00', '2009/9/16 23:00', '2009/9/17 0:00', '2009/9/17 1:00', '2009/9/17 2:00', '2009/9/17 3:00', '2009/9/17 4:00', '2009/9/17 5:00', '2009/9/17 6:00', '2009/9/17 7:00', '2009/9/17 8:00', '2009/9/17 9:00', '2009/9/17 10:00', '2009/9/17 11:00', '2009/9/17 12:00', '2009/9/17 13:00', '2009/9/17 14:00', '2009/9/17 15:00', '2009/9/17 16:00', '2009/9/17 17:00', '2009/9/17 18:00', '2009/9/17 19:00', '2009/9/17 20:00', '2009/9/17 21:00', '2009/9/17 22:00', '2009/9/17 23:00', '2009/9/18 0:00', '2009/9/18 1:00', '2009/9/18 2:00', '2009/9/18 3:00', '2009/9/18 4:00', '2009/9/18 5:00', '2009/9/18 6:00', '2009/9/18 7:00', '2009/9/18 8:00', '2009/9/18 9:00', '2009/9/18 10:00', '2009/9/18 11:00', '2009/9/18 12:00', '2009/9/18 13:00', '2009/9/18 14:00', '2009/9/18 15:00', '2009/9/18 16:00', '2009/9/18 17:00', '2009/9/18 18:00', '2009/9/18 19:00', '2009/9/18 20:00', '2009/9/18 21:00', '2009/9/18 22:00', '2009/9/18 23:00', '2009/9/19 0:00', '2009/9/19 1:00', '2009/9/19 2:00', '2009/9/19 3:00', '2009/9/19 4:00', '2009/9/19 5:00', '2009/9/19 6:00', '2009/9/19 7:00', '2009/9/19 8:00', '2009/9/19 9:00', '2009/9/19 10:00', '2009/9/19 11:00', '2009/9/19 12:00', '2009/9/19 13:00', '2009/9/19 14:00', '2009/9/19 15:00', '2009/9/19 16:00', '2009/9/19 17:00', '2009/9/19 18:00', '2009/9/19 19:00', '2009/9/19 20:00', '2009/9/19 21:00', '2009/9/19 22:00', '2009/9/19 23:00', '2009/9/20 0:00', '2009/9/20 1:00', '2009/9/20 2:00', '2009/9/20 3:00', '2009/9/20 4:00', '2009/9/20 5:00', '2009/9/20 6:00', '2009/9/20 7:00', '2009/9/20 8:00', '2009/9/20 9:00', '2009/9/20 10:00', '2009/9/20 11:00', '2009/9/20 12:00', '2009/9/20 13:00', '2009/9/20 14:00', '2009/9/20 15:00', '2009/9/20 16:00', '2009/9/20 17:00', '2009/9/20 18:00', '2009/9/20 19:00', '2009/9/20 20:00', '2009/9/20 21:00', '2009/9/20 22:00', '2009/9/20 23:00', '2009/9/21 0:00', '2009/9/21 1:00', '2009/9/21 2:00', '2009/9/21 3:00', '2009/9/21 4:00', '2009/9/21 5:00', '2009/9/21 6:00', '2009/9/21 7:00', '2009/9/21 8:00', '2009/9/21 9:00', '2009/9/21 10:00', '2009/9/21 11:00', '2009/9/21 12:00', '2009/9/21 13:00', '2009/9/21 14:00', '2009/9/21 15:00', '2009/9/21 16:00', '2009/9/21 17:00', '2009/9/21 18:00', '2009/9/21 19:00', '2009/9/21 20:00', '2009/9/21 21:00', '2009/9/21 22:00', '2009/9/21 23:00', '2009/9/22 0:00', '2009/9/22 1:00', '2009/9/22 2:00', '2009/9/22 3:00', '2009/9/22 4:00', '2009/9/22 5:00', '2009/9/22 6:00', '2009/9/22 7:00', '2009/9/22 8:00', '2009/9/22 9:00', '2009/9/22 10:00', '2009/9/22 11:00', '2009/9/22 12:00', '2009/9/22 13:00', '2009/9/22 14:00', '2009/9/22 15:00', '2009/9/22 16:00', '2009/9/22 17:00', '2009/9/22 18:00', '2009/9/22 19:00', '2009/9/22 20:00', '2009/9/22 21:00', '2009/9/22 22:00', '2009/9/22 23:00', '2009/9/23 0:00', '2009/9/23 1:00', '2009/9/23 2:00', '2009/9/23 3:00', '2009/9/23 4:00', '2009/9/23 5:00', '2009/9/23 6:00', '2009/9/23 7:00', '2009/9/23 8:00', '2009/9/23 9:00', '2009/9/23 10:00', '2009/9/23 11:00', '2009/9/23 12:00', '2009/9/23 13:00', '2009/9/23 14:00', '2009/9/23 15:00', '2009/9/23 16:00', '2009/9/23 17:00', '2009/9/23 18:00', '2009/9/23 19:00', '2009/9/23 20:00', '2009/9/23 21:00', '2009/9/23 22:00', '2009/9/23 23:00', '2009/9/24 0:00', '2009/9/24 1:00', '2009/9/24 2:00', '2009/9/24 3:00', '2009/9/24 4:00', '2009/9/24 5:00', '2009/9/24 6:00', '2009/9/24 7:00', '2009/9/24 8:00', '2009/9/24 9:00', '2009/9/24 10:00', '2009/9/24 11:00', '2009/9/24 12:00', '2009/9/24 13:00', '2009/9/24 14:00', '2009/9/24 15:00', '2009/9/24 16:00', '2009/9/24 17:00', '2009/9/24 18:00', '2009/9/24 19:00', '2009/9/24 20:00', '2009/9/24 21:00', '2009/9/24 22:00', '2009/9/24 23:00', '2009/9/25 0:00', '2009/9/25 1:00', '2009/9/25 2:00', '2009/9/25 3:00', '2009/9/25 4:00', '2009/9/25 5:00', '2009/9/25 6:00', '2009/9/25 7:00', '2009/9/25 8:00', '2009/9/25 9:00', '2009/9/25 10:00', '2009/9/25 11:00', '2009/9/25 12:00', '2009/9/25 13:00', '2009/9/25 14:00', '2009/9/25 15:00', '2009/9/25 16:00', '2009/9/25 17:00', '2009/9/25 18:00', '2009/9/25 19:00', '2009/9/25 20:00', '2009/9/25 21:00', '2009/9/25 22:00', '2009/9/25 23:00', '2009/9/26 0:00', '2009/9/26 1:00', '2009/9/26 2:00', '2009/9/26 3:00', '2009/9/26 4:00', '2009/9/26 5:00', '2009/9/26 6:00', '2009/9/26 7:00', '2009/9/26 8:00', '2009/9/26 9:00', '2009/9/26 10:00', '2009/9/26 11:00', '2009/9/26 12:00', '2009/9/26 13:00', '2009/9/26 14:00', '2009/9/26 15:00', '2009/9/26 16:00', '2009/9/26 17:00', '2009/9/26 18:00', '2009/9/26 19:00', '2009/9/26 20:00', '2009/9/26 21:00', '2009/9/26 22:00', '2009/9/26 23:00', '2009/9/27 0:00', '2009/9/27 1:00', '2009/9/27 2:00', '2009/9/27 3:00', '2009/9/27 4:00', '2009/9/27 5:00', '2009/9/27 6:00', '2009/9/27 7:00', '2009/9/27 8:00', '2009/9/27 9:00', '2009/9/27 10:00', '2009/9/27 11:00', '2009/9/27 12:00', '2009/9/27 13:00', '2009/9/27 14:00', '2009/9/27 15:00', '2009/9/27 16:00', '2009/9/27 17:00', '2009/9/27 18:00', '2009/9/27 19:00', '2009/9/27 20:00', '2009/9/27 21:00', '2009/9/27 22:00', '2009/9/27 23:00', '2009/9/28 0:00', '2009/9/28 1:00', '2009/9/28 2:00', '2009/9/28 3:00', '2009/9/28 4:00', '2009/9/28 5:00', '2009/9/28 6:00', '2009/9/28 7:00', '2009/9/28 8:00', '2009/9/28 9:00', '2009/9/28 10:00', '2009/9/28 11:00', '2009/9/28 12:00', '2009/9/28 13:00', '2009/9/28 14:00', '2009/9/28 15:00', '2009/9/28 16:00', '2009/9/28 17:00', '2009/9/28 18:00', '2009/9/28 19:00', '2009/9/28 20:00', '2009/9/28 21:00', '2009/9/28 22:00', '2009/9/28 23:00', '2009/9/29 0:00', '2009/9/29 1:00', '2009/9/29 2:00', '2009/9/29 3:00', '2009/9/29 4:00', '2009/9/29 5:00', '2009/9/29 6:00', '2009/9/29 7:00', '2009/9/29 8:00', '2009/9/29 9:00', '2009/9/29 10:00', '2009/9/29 11:00', '2009/9/29 12:00', '2009/9/29 13:00', '2009/9/29 14:00', '2009/9/29 15:00', '2009/9/29 16:00', '2009/9/29 17:00', '2009/9/29 18:00', '2009/9/29 19:00', '2009/9/29 20:00', '2009/9/29 21:00', '2009/9/29 22:00', '2009/9/29 23:00', '2009/9/30 0:00', '2009/9/30 1:00', '2009/9/30 2:00', '2009/9/30 3:00', '2009/9/30 4:00', '2009/9/30 5:00', '2009/9/30 6:00', '2009/9/30 7:00', '2009/9/30 8:00', '2009/9/30 9:00', '2009/9/30 10:00', '2009/9/30 11:00', '2009/9/30 12:00', '2009/9/30 13:00', '2009/9/30 14:00', '2009/9/30 15:00', '2009/9/30 16:00', '2009/9/30 17:00', '2009/9/30 18:00', '2009/9/30 19:00', '2009/9/30 20:00', '2009/9/30 21:00', '2009/9/30 22:00', '2009/9/30 23:00',
  '2009/10/1 0:00', '2009/10/1 1:00', '2009/10/1 2:00', '2009/10/1 3:00', '2009/10/1 4:00', '2009/10/1 5:00', '2009/10/1 6:00', '2009/10/1 7:00', '2009/10/1 8:00', '2009/10/1 9:00', '2009/10/1 10:00', '2009/10/1 11:00', '2009/10/1 12:00', '2009/10/1 13:00', '2009/10/1 14:00', '2009/10/1 15:00', '2009/10/1 16:00', '2009/10/1 17:00', '2009/10/1 18:00', '2009/10/1 19:00', '2009/10/1 20:00', '2009/10/1 21:00', '2009/10/1 22:00', '2009/10/1 23:00', '2009/10/2 0:00', '2009/10/2 1:00', '2009/10/2 2:00', '2009/10/2 3:00', '2009/10/2 4:00', '2009/10/2 5:00', '2009/10/2 6:00', '2009/10/2 7:00', '2009/10/2 8:00', '2009/10/2 9:00', '2009/10/2 10:00', '2009/10/2 11:00', '2009/10/2 12:00', '2009/10/2 13:00', '2009/10/2 14:00', '2009/10/2 15:00', '2009/10/2 16:00', '2009/10/2 17:00', '2009/10/2 18:00', '2009/10/2 19:00', '2009/10/2 20:00', '2009/10/2 21:00', '2009/10/2 22:00', '2009/10/2 23:00', '2009/10/3 0:00', '2009/10/3 1:00', '2009/10/3 2:00', '2009/10/3 3:00', '2009/10/3 4:00', '2009/10/3 5:00', '2009/10/3 6:00', '2009/10/3 7:00', '2009/10/3 8:00', '2009/10/3 9:00', '2009/10/3 10:00', '2009/10/3 11:00', '2009/10/3 12:00', '2009/10/3 13:00', '2009/10/3 14:00', '2009/10/3 15:00', '2009/10/3 16:00', '2009/10/3 17:00', '2009/10/3 18:00', '2009/10/3 19:00', '2009/10/3 20:00', '2009/10/3 21:00', '2009/10/3 22:00', '2009/10/3 23:00', '2009/10/4 0:00', '2009/10/4 1:00', '2009/10/4 2:00', '2009/10/4 3:00', '2009/10/4 4:00', '2009/10/4 5:00', '2009/10/4 6:00', '2009/10/4 7:00', '2009/10/4 8:00', '2009/10/4 9:00', '2009/10/4 10:00', '2009/10/4 11:00', '2009/10/4 12:00', '2009/10/4 13:00', '2009/10/4 14:00', '2009/10/4 15:00', '2009/10/4 16:00', '2009/10/4 17:00', '2009/10/4 18:00', '2009/10/4 19:00', '2009/10/4 20:00', '2009/10/4 21:00', '2009/10/4 22:00', '2009/10/4 23:00', '2009/10/5 0:00', '2009/10/5 1:00', '2009/10/5 2:00', '2009/10/5 3:00', '2009/10/5 4:00', '2009/10/5 5:00', '2009/10/5 6:00', '2009/10/5 7:00', '2009/10/5 8:00', '2009/10/5 9:00', '2009/10/5 10:00', '2009/10/5 11:00', '2009/10/5 12:00', '2009/10/5 13:00', '2009/10/5 14:00', '2009/10/5 15:00', '2009/10/5 16:00', '2009/10/5 17:00', '2009/10/5 18:00', '2009/10/5 19:00', '2009/10/5 20:00', '2009/10/5 21:00', '2009/10/5 22:00', '2009/10/5 23:00', '2009/10/6 0:00', '2009/10/6 1:00', '2009/10/6 2:00', '2009/10/6 3:00', '2009/10/6 4:00', '2009/10/6 5:00', '2009/10/6 6:00', '2009/10/6 7:00', '2009/10/6 8:00', '2009/10/6 9:00', '2009/10/6 10:00', '2009/10/6 11:00', '2009/10/6 12:00', '2009/10/6 13:00', '2009/10/6 14:00', '2009/10/6 15:00', '2009/10/6 16:00', '2009/10/6 17:00', '2009/10/6 18:00', '2009/10/6 19:00', '2009/10/6 20:00', '2009/10/6 21:00', '2009/10/6 22:00', '2009/10/6 23:00', '2009/10/7 0:00', '2009/10/7 1:00', '2009/10/7 2:00', '2009/10/7 3:00', '2009/10/7 4:00', '2009/10/7 5:00', '2009/10/7 6:00', '2009/10/7 7:00', '2009/10/7 8:00', '2009/10/7 9:00', '2009/10/7 10:00', '2009/10/7 11:00', '2009/10/7 12:00', '2009/10/7 13:00', '2009/10/7 14:00', '2009/10/7 15:00', '2009/10/7 16:00', '2009/10/7 17:00', '2009/10/7 18:00', '2009/10/7 19:00', '2009/10/7 20:00', '2009/10/7 21:00', '2009/10/7 22:00', '2009/10/7 23:00', '2009/10/8 0:00', '2009/10/8 1:00', '2009/10/8 2:00', '2009/10/8 3:00', '2009/10/8 4:00', '2009/10/8 5:00', '2009/10/8 6:00', '2009/10/8 7:00', '2009/10/8 8:00', '2009/10/8 9:00', '2009/10/8 10:00', '2009/10/8 11:00', '2009/10/8 12:00', '2009/10/8 13:00', '2009/10/8 14:00', '2009/10/8 15:00', '2009/10/8 16:00', '2009/10/8 17:00', '2009/10/8 18:00', '2009/10/8 19:00', '2009/10/8 20:00', '2009/10/8 21:00', '2009/10/8 22:00', '2009/10/8 23:00', '2009/10/9 0:00', '2009/10/9 1:00', '2009/10/9 2:00', '2009/10/9 3:00', '2009/10/9 4:00', '2009/10/9 5:00', '2009/10/9 6:00', '2009/10/9 7:00', '2009/10/9 8:00', '2009/10/9 9:00', '2009/10/9 10:00', '2009/10/9 11:00', '2009/10/9 12:00', '2009/10/9 13:00', '2009/10/9 14:00', '2009/10/9 15:00', '2009/10/9 16:00', '2009/10/9 17:00', '2009/10/9 18:00', '2009/10/9 19:00', '2009/10/9 20:00', '2009/10/9 21:00', '2009/10/9 22:00', '2009/10/9 23:00', '2009/10/10 0:00', '2009/10/10 1:00', '2009/10/10 2:00', '2009/10/10 3:00', '2009/10/10 4:00', '2009/10/10 5:00', '2009/10/10 6:00', '2009/10/10 7:00', '2009/10/10 8:00', '2009/10/10 9:00', '2009/10/10 10:00', '2009/10/10 11:00', '2009/10/10 12:00', '2009/10/10 13:00', '2009/10/10 14:00', '2009/10/10 15:00', '2009/10/10 16:00', '2009/10/10 17:00', '2009/10/10 18:00', '2009/10/10 19:00', '2009/10/10 20:00', '2009/10/10 21:00', '2009/10/10 22:00', '2009/10/10 23:00', '2009/10/11 0:00', '2009/10/11 1:00', '2009/10/11 2:00', '2009/10/11 3:00', '2009/10/11 4:00', '2009/10/11 5:00', '2009/10/11 6:00', '2009/10/11 7:00', '2009/10/11 8:00', '2009/10/11 9:00', '2009/10/11 10:00', '2009/10/11 11:00', '2009/10/11 12:00', '2009/10/11 13:00', '2009/10/11 14:00', '2009/10/11 15:00', '2009/10/11 16:00', '2009/10/11 17:00', '2009/10/11 18:00', '2009/10/11 19:00', '2009/10/11 20:00', '2009/10/11 21:00', '2009/10/11 22:00', '2009/10/11 23:00', '2009/10/12 0:00', '2009/10/12 1:00', '2009/10/12 2:00', '2009/10/12 3:00', '2009/10/12 4:00', '2009/10/12 5:00', '2009/10/12 6:00', '2009/10/12 7:00', '2009/10/12 8:00', '2009/10/12 9:00', '2009/10/12 10:00', '2009/10/12 11:00', '2009/10/12 12:00', '2009/10/12 13:00', '2009/10/12 14:00', '2009/10/12 15:00', '2009/10/12 16:00', '2009/10/12 17:00', '2009/10/12 18:00', '2009/10/12 19:00', '2009/10/12 20:00', '2009/10/12 21:00', '2009/10/12 22:00', '2009/10/12 23:00', '2009/10/13 0:00', '2009/10/13 1:00', '2009/10/13 2:00', '2009/10/13 3:00', '2009/10/13 4:00', '2009/10/13 5:00', '2009/10/13 6:00', '2009/10/13 7:00', '2009/10/13 8:00', '2009/10/13 9:00', '2009/10/13 10:00', '2009/10/13 11:00', '2009/10/13 12:00', '2009/10/13 13:00', '2009/10/13 14:00', '2009/10/13 15:00', '2009/10/13 16:00', '2009/10/13 17:00', '2009/10/13 18:00', '2009/10/13 19:00', '2009/10/13 20:00', '2009/10/13 21:00', '2009/10/13 22:00', '2009/10/13 23:00', '2009/10/14 0:00', '2009/10/14 1:00', '2009/10/14 2:00', '2009/10/14 3:00', '2009/10/14 4:00', '2009/10/14 5:00', '2009/10/14 6:00', '2009/10/14 7:00', '2009/10/14 8:00', '2009/10/14 9:00', '2009/10/14 10:00', '2009/10/14 11:00', '2009/10/14 12:00', '2009/10/14 13:00', '2009/10/14 14:00', '2009/10/14 15:00', '2009/10/14 16:00', '2009/10/14 17:00', '2009/10/14 18:00', '2009/10/14 19:00', '2009/10/14 20:00', '2009/10/14 21:00', '2009/10/14 22:00', '2009/10/14 23:00', '2009/10/15 0:00', '2009/10/15 1:00', '2009/10/15 2:00', '2009/10/15 3:00', '2009/10/15 4:00', '2009/10/15 5:00', '2009/10/15 6:00', '2009/10/15 7:00', '2009/10/15 8:00', '2009/10/15 9:00', '2009/10/15 10:00', '2009/10/15 11:00', '2009/10/15 12:00', '2009/10/15 13:00', '2009/10/15 14:00', '2009/10/15 15:00', '2009/10/15 16:00', '2009/10/15 17:00', '2009/10/15 18:00', '2009/10/15 19:00', '2009/10/15 20:00', '2009/10/15 21:00', '2009/10/15 22:00', '2009/10/15 23:00', '2009/10/16 0:00', '2009/10/16 1:00', '2009/10/16 2:00', '2009/10/16 3:00', '2009/10/16 4:00', '2009/10/16 5:00', '2009/10/16 6:00', '2009/10/16 7:00', '2009/10/16 8:00', '2009/10/16 9:00', '2009/10/16 10:00', '2009/10/16 11:00', '2009/10/16 12:00', '2009/10/16 13:00', '2009/10/16 14:00', '2009/10/16 15:00', '2009/10/16 16:00', '2009/10/16 17:00', '2009/10/16 18:00', '2009/10/16 19:00', '2009/10/16 20:00', '2009/10/16 21:00', '2009/10/16 22:00', '2009/10/16 23:00', '2009/10/17 0:00', '2009/10/17 1:00', '2009/10/17 2:00', '2009/10/17 3:00', '2009/10/17 4:00', '2009/10/17 5:00', '2009/10/17 6:00', '2009/10/17 7:00', '2009/10/17 8:00', '2009/10/17 9:00', '2009/10/17 10:00', '2009/10/17 11:00', '2009/10/17 12:00', '2009/10/17 13:00', '2009/10/17 14:00', '2009/10/17 15:00', '2009/10/17 16:00', '2009/10/17 17:00', '2009/10/17 18:00', '2009/10/17 19:00', '2009/10/17 20:00', '2009/10/17 21:00', '2009/10/17 22:00', '2009/10/17 23:00', '2009/10/18 0:00', '2009/10/18 1:00', '2009/10/18 2:00', '2009/10/18 3:00', '2009/10/18 4:00', '2009/10/18 5:00', '2009/10/18 6:00', '2009/10/18 7:00', '2009/10/18 8:00'
];

timeData = timeData.map(function (str) {
  return str.replace('2009/', '');
});

option = {
  color: ['#f15c30', '#03a9f3'],
	textStyle: {
		color: '#fff'
	},
  tooltip: {
      trigger: 'axis',
      axisPointer: {
          animation: false
      }
  },
  legend: {
      data:['BSE','Nifty'],
      x: 'left'
  },
  axisPointer: {
      link: {xAxisIndex: 'all'}
  },
  dataZoom: [
      {
          show: true,
          realtime: true,
          start: 30,
          end: 70,
          xAxisIndex: [0, 1]
      },
      {
          type: 'inside',
          realtime: true,
          start: 30,
          end: 70,
          xAxisIndex: [0, 1]
      }
  ],
  grid: [{
      left: 50,
      right: 50,
      height: '35%'
  }, {
      left: 50,
      right: 50,
      top: '55%',
      height: '35%'
  }],
  xAxis : [
      {
          type : 'category',
          boundaryGap : false,
          axisLine: {onZero: true},
          data: timeData
      },
      {
          gridIndex: 1,
          type : 'category',
          boundaryGap : false,
          axisLine: {onZero: true},
          data: timeData,
          position: 'top'
      }
  ],
  yAxis : [
      {
          name : 'BSE',
          type : 'value',
          max : 500
      },
      {
          gridIndex: 1,
          name : 'Nifty',
          type : 'value',
          inverse: true
      }
  ],
  series : [
      {
          name:'BSE',
          type:'line',
          symbolSize: 8,
          hoverAnimation: false,
          data:[
              0.97,0.96,0.96,0.95,0.95,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.93,0.92,0.91,0.9,0.89,0.88,0.87,0.87,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.87,0.88,0.9,0.93,0.96,0.99,1.03,1.06,1.1,1.14,1.17,1.2,1.23,1.26,1.29,1.33,1.36,1.4,1.43,1.45,1.48,1.49,1.51,1.51,1.5,1.49,1.47,1.44,1.41,1.37,1.34,1.3,1.27,1.24,1.22,1.2,1.19,1.18,1.16,1.15,1.14,1.13,1.12,1.11,1.11,1.1,1.1,1.1,1.1,1.1,1.1,1.1,1.1,1.1,1.1,1.1,1.1,1.1,1.1,1.1,1.1,1.1,1.09,1.09,1.08,1.07,1.06,1.05,1.04,1.03,1.03,1.02,1.01,1.01,1,0.99,0.98,0.97,0.96,0.96,0.95,0.95,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.93,0.92,0.91,0.9,0.89,0.88,0.87,0.87,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.85,0.84,0.83,0.82,0.81,0.8,0.8,0.79,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.77,0.75,0.73,0.71,0.68,0.65,0.63,0.61,0.59,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.57,0.57,0.57,0.56,0.55,0.55,0.54,0.54,0.53,0.52,0.52,0.51,0.51,0.5,0.5,0.49,0.48,0.48,0.47,0.47,0.47,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.46,0.52,0.67,0.9,1.19,1.52,1.87,2.22,2.55,2.84,3.07,3.22,3.28,3.28,3.28,3.28,3.28,3.28,3.28,3.28,3.28,3.28,3.28,3.28,3.28,3.24,3.13,2.97,2.77,2.54,2.3,2.05,1.82,1.62,1.46,1.35,1.31,1.31,1.31,1.31,1.31,1.31,1.31,1.31,1.31,1.31,1.31,1.31,1.31,1.31,1.31,1.31,1.31,1.31,1.31,1.31,1.31,1.31,1.31,1.31,1.31,1.31,1.31,1.31,1.31,1.31,1.31,1.31,1.31,1.31,1.31,1.31,1.31,1.3,1.26,1.21,1.14,1.06,0.97,0.89,0.81,0.74,0.69,0.65,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.63,0.63,0.62,0.62,0.61,0.6,0.59,0.59,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.59,0.61,0.63,0.65,0.68,0.71,0.73,0.75,0.77,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.77,0.75,0.73,0.71,0.68,0.65,0.63,0.61,0.59,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.58,0.59,0.59,0.6,0.61,0.62,0.62,0.63,0.63,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.65,0.66,0.68,0.69,0.71,0.73,0.74,0.76,0.77,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.79,0.81,0.82,0.84,0.86,0.88,0.9,0.92,0.93,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.94,0.93,0.92,0.91,0.9,0.89,0.88,0.87,0.87,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.86,0.85,0.84,0.82,0.8,0.78,0.76,0.75,0.73,0.72,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.72,0.73,0.74,0.76,0.78,0.79,0.82,0.84,0.86,0.89,0.91,0.94,0.97,1,1.02,1.05,1.08,1.11,1.14,1.17,1.19,1.22,1.25,1.27,1.29,1.31,1.33,1.35,1.36,1.38,1.39,1.39,1.4,1.4,1.4,1.39,1.37,1.35,1.32,1.29,1.26,1.22,1.18,1.14,1.1,1.05,1.01,0.97,0.93,0.89,0.85,0.82,0.78,0.76,0.74,0.72,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.72,0.73,0.74,0.75,0.77,0.78,0.8,0.82,0.84,0.87,0.89,0.92,0.94,0.97,0.99,1.02,1.05,1.08,1.1,1.13,1.16,1.18,1.21,1.23,1.26,1.28,1.3,1.32,1.34,1.35,1.37,1.38,1.39,1.4,1.41,1.41,1.42,1.42,1.43,1.43,1.43,1.44,1.44,1.44,1.44,1.45,1.45,1.45,1.46,1.46,1.46,1.47,1.47,1.48,1.48,1.49,1.5,1.51,1.54,1.62,1.73,1.88,2.05,2.24,2.45,2.67,2.89,3.11,3.31,3.51,3.69,3.86,4.03,4.18,4.33,4.48,4.62,4.76,4.89,5.02,5.16,5.29,5.43,5.57,5.71,5.86,6.02,6.18,6.36,6.54,6.73,6.93,7.15,7.38,7.62,7.88,8.16,8.46,8.77,9.11,9.46,9.84,10.24,10.67,11.12,11.6,12.3,13.66,16,38.43,82.21,146.6,218.7,226,225.23,223.08,219.78,212,199.82,184.6,168,151.65,137.21,126.31,119.94,115.52,112.06,108.92,105.44,101,94.56,86.36,77.67,69.76,63.9,60.38,57.41,54.84,52.57,50.56,48.71,46.97,45.25,43.48,41.6,39.5,37.19,34.81,32.46,30.27,28.36,26.85,25.86,25.5,25.5,25.5,25.5,25.5,25.5,25.5,25.5,25.5,25.5,25.5,25.5,25.5,25.27,24.65,23.7,22.52,21.17,19.75,18.33,16.98,15.8,14.85,14.23,14,14.02,14.08,14.17,14.29,14.44,14.61,14.8,15.01,15.23,15.47,15.71,15.95,16.19,16.43,16.67,16.89,17.1,17.29,17.46,17.61,17.73,17.82,17.88,17.9,17.63,16.88,15.75,14.33,12.71,10.98,9.23,7.56,6.05,4.81,3.92,3.47,3.28,3.1,2.93,2.76,2.61,2.46,2.32,2.19,2.07,1.96,1.85,1.75,1.66,1.58,1.51,1.44,1.39,1.34,1.29,1.26,1.23,1.22,1.2,1.2,1.2,1.2,1.2,1.2,1.21,1.21,1.21,1.21,1.22,1.22,1.22,1.23,1.23,1.23,1.24,1.24,1.25,1.25,1.25,1.26,1.26,1.27,1.27,1.27,1.28,1.28,1.28,1.29,1.29,1.29,1.29,1.3,1.3,1.3,1.3,1.3,1.3,1.3,1.3,1.3,1.3,1.3,1.29,1.29,1.29,1.29,1.28,1.28,1.28,1.27,1.27,1.26,1.25,1.25,1.24,1.23,1.23,1.22,1.21,1.2,1.16,1.06,0.95,0.83,0.74,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.71,0.7,0.7,0.7,0.7,0.7,0.7,0.7,0.7,0.7,0.7,0.7,0.69,0.69,0.69,0.69,0.69,0.69,0.69,0.69,0.68,0.68,0.68,0.68,0.68,0.68,0.67,0.67,0.67,0.67,0.67,0.67,0.67,0.66,0.66,0.66,0.66,0.66,0.66,0.66,0.65,0.65,0.65,0.65,0.65,0.65,0.65,0.65,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.65,0.66,0.68,0.69,0.71,0.73,0.74,0.76,0.77,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.78,0.8,0.86,0.95,1.08,1.25,1.46,1.7,1.97,2.28,2.63,3.01,3.42,3.87,4.35,4.86,5.4,5.98,6.59,7.92,10.49,14.04,18.31,23.04,27.98,32.87,37.45,41.46,44.64,46.74,47.5,46.86,45.16,42.77,40.04,37.33,35,32.74,30.21,27.7,25.5,23.9,23.2,23.06,22.94,22.84,22.77,22.72,22.7,22.8,23.23,23.95,24.91,26.04,27.3,28.76,30.7,33.39,37.12,42.15,48.77,65.22,252.1,257,237.32,221.19,212,208.67,206.89,205.2,202.15,189.82,172,165.3,160.49,156.8,153.44,149.62,144.6,138.27,131,123.11,114.9,106.69,98.79,91.5,85.13,80,75.53,71.03,66.65,62.54,58.85,55.73,53.31,51.75,51.2,56.53,68.25,80,91.01,102.03,109,112.37,115.29,117.68,119.48,120.61,121,119.45,115.57,110.52,105.47,101.58,100,99.97,99.94,99.92,99.9,99.88,99.86,99.85,99.84,99.83,99.82,99.81,99.81,99.8,99.8,99.8,122.15,163.65,186,182.96,175.15,164.56,153.18,143,136,131.37,126.98,122.81,118.85,115.09,111.52,108.13,104.9,101.83,98.9,96.11,93.44,90.87,88.41,86.04,83.74,81.51,79.33,77.2,75.1,73.02,70.95,68.88,66.8,64.87,63.14,61.4,59.53,57.67,56,54.6,53.36,52.2,51.05,49.85,48.5,46.87,44.92,42.74,40.42,38.04,35.69,33.46,31.44,29.72,28.38,27.51,27.2,27.2,27.2,27.2,27.2,27.2,27.2,27.2,27.2,27.2,27.2,27.2,27.2,27.14,26.97,26.7,26.35,25.95,25.49,25.02,24.53,24.04,23.58,23.16,22.8,22.46,22.11,21.75,21.39,21.03,20.69,20.36,20.05,19.78,19.54,19.35,19.2,19.09,19,18.92,18.85,18.79,18.74,18.68,18.62,18.56,18.49,18.4,18.3,18.17,18.02,17.83,17.63,17.41,17.18,16.93,16.68,16.43,16.18,15.93,15.7,15.47,15.22,14.97,14.71,14.45,14.18,13.93,13.68,13.44,13.21,13,12.8,12.62,12.46,12.31,12.16,12.03,11.89,11.76,11.62,11.48,11.33,11.17,11,10.81,10.59,10.36,10.12,9.86,9.61,9.36,9.12,8.89,8.68,8.5,8.35,8.21,8.08,7.94,7.81,7.68,7.56,7.46,7.36,7.29,7.23,7.19,7.18,7.51,8.42,9.81,11.58,13.63,15.86,18.16,20.44,22.58,24.49,26.06,27.2,28.08,28.95,29.81,30.65,31.48,32.28,33.07,33.82,34.55,35.25,35.92,36.56,37.15,37.71,38.23,38.7,39.13,39.5,39.83,40.1,40.31,40.47,40.57,40.6,40.49,40.16,39.64,38.94,38.09,37.1,36,34.79,33.51,32.17,30.79,29.39,27.99,26.6,25.25,23.96,22.75,21.63,20.63,19.76,19.04,18.49,18.14,18,17.97,17.95,17.94,17.92,17.91,17.9,17.89,17.88,17.87,17.85,17.83,17.8,17.7,17.46,17.13,16.7,16.21,15.68,15.13,14.57,14.04,13.56,13.14,12.8,12.52,12.27,12.02,11.79,11.57,11.37,11.16,10.97,10.78,10.59,10.39,10.2,10.01,9.81,9.63,9.44,9.26,9.08,8.9,8.73,8.56,8.39,8.22,8.06,7.9,7.73,7.57,7.41,7.25,7.09,6.94,6.79,6.65,6.52,6.4,6.28,6.17,6.08,5.98,5.9,5.81,5.73,5.65,5.57,5.49,5.41,5.32,5.23,5.14,5.04,4.94,4.84,4.74,4.63,4.53,4.43,4.33,4.23,4.13,4.03,3.93,3.81,3.69,3.57,3.45,3.33,3.22,3.12,3.04,2.98,2.93,2.92,2.92,2.92,2.92,2.92,2.92,2.92,2.92,2.92,2.92,2.92,2.92,2.92,2.9,2.86,2.8,2.71,2.62,2.52,2.42,2.33,2.24,2.18,2.14,2.12,2.12,2.12,2.12,2.12,2.12,2.12,2.12,2.12,2.12,2.12,2.12,2.12,2.1,2.06,2,1.91,1.82,1.71,1.61,1.5,1.4,1.32,1.25,1.2,1.16,1.13,1.1,1.06,1.03,1,0.97,0.93,0.9,0.87,0.85,0.82,0.79,0.77,0.74,0.72,0.69,0.67,0.65,0.63,0.61,0.59,0.58,0.56,0.54,0.53,0.52,0.51,0.5,0.49,0.48,0.48,0.47,0.47,0.46,0.46,0.47,0.48,0.5,0.53,0.56,0.59,0.62,0.64,0.67,0.69,0.7,0.71,0.71,0.71,0.71,0.7,0.7,0.7,0.69,0.69,0.69,0.68,0.68,0.67,0.67,0.67,0.66,0.66,0.65,0.65,0.65,0.65,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.64,0.65,0.65,0.65,0.66,0.66,0.67,0.68,0.69,0.69,0.7,0.71,0.73,0.74,0.75,0.76,0.78,0.8,0.81,0.83,0.85,0.87,0.89,0.92,0.94,0.97,0.99,1.02,1.05,1.08,1.11,1.15,1.18,1.32,1.66,2.21,2.97,3.94,5.11,6.5,8.1,9.9,11.92,14.15,16.6,22.3,22.8,24.48,30.38,35.74,42.4,57.14,94.04,112.9,123.4,130.4,130,119.4,120.7,116.8,118.1,119.4,124.8,143.5,204,294,319.2,328.4,365,350.8,347.6,347.6,325,331.6,319.2,308,308,308,308,296.8,300,281,278.4,270.6,271,253.6,233.5,219.2,207.8,205.9,204,189.6,178.8,173.4,160,154.4,146,145,140.5,130.4,126.2,116.8,112.9,106.5,101.6,98.51,82.67,67.3,80.05,76.12,72.3,71.02,69.78,67.3,67.3,68.54,57.6,71.02,66.06,59.12,57.14,55.16,55.16,52.19,52.19,51.2,48.56,44.16,43,45.92,49.44,44.16,36.48,35.74,35,32.36,37.22,32.36,32.36,32.36,33.68,32.36,31.7,35.74,29.72,32.36,30.38,29.72,28.4,28.4,28.4,27.28,25.6,25.04,23.92,22.3,21.8,21.8,21.8,22.8,21.8,25.6,22.8,22.8,17.8,16.04,16.04,16.04,16.04,16.04,16.04,16.04,16.04,16.04,16.04,15.02,14,14.03,14.11,14.25,14.45,14.72,15.06,15.46,15.95,16.51,17.15,17.87,18.69,19.59,20.59,21.69,22.88,24.18,25.59,27.1,28.73,30.48,32.34,34.33,36.44,38.69,41.06,43.57,46.22,49.01,51.95,55.04,58.27,61.66,65.21,68.92,72.8,88.09,104.9,105.7,110.3,111.6,110.3,106.5,105.7,103.3,100,97.02,98.8,91.07,83.98,88.09,81.36,78.74,77.43,77.43,73.5,74.81,72.63,68.58,66.4,68.54,69.78,67.3,64.82,61.1,59.12,56.15,53.18,50.32,49.44,44.16,36.5,42.4,37.96,37.22,33.68,36.48,35.74,35,35,37.22,37.22,39.44,32.6,34.54,36.48,35.74,34.34,33.68,33.02,31.04,29.72,29.72,29.72,26.16,25.6,29.72,18.3,22.3,21.3,21.8,21.8,20.3,20.8,25.04,25.04,25.6,25.6,25.04,25.6,25.04,25.6,23.92,25.04,21.3,21.8,22.3,21.8,20.8,16.1,20.3,18.3,13.22,19.3,19.3,18.3,14.4,13.86,13.36,12.9,12.48,12.1,11.75,11.43,11.15,10.9,10.67,10.48,10.31,10.16,10.04,9.93,9.85,9.78,9.73,9.69,9.67,9.65,9.65,12.08,8.67,11.7,11.38,10.65,9.84,9.32,9.07,8.85,8.66,8.49,8.35,8.22,8.1,7.98,7.86,7.74,7.61,7.47,7.31,7.14,6.96,6.78,6.58,6.39,6.19,5.99,5.78,5.58,5.39,5.2,5.01,4.83,4.67,4.51,4.37,4.24,4.12,4.02,3.95,3.89,3.85,3.84,4.41,5.77,7.39,8.75,9.32,9.18,9,8.94,8.88,8.83,8.78,8.73,8.68,8.64,8.6,8.56,8.53,8.5,8.47,8.45,8.42,8.4,8.39,8.37,8.36,8.35,8.35,8.34,8.34,8.67,9.65,9.62,9.53,9.4,9.21,8.98,8.7,8.4,8.06,7.69,7.3,6.89,6.47,6.03,5.59,5.14,4.7,4.26,3.83,3.42,3.02,2.65,2.3,1.98,1.7,1.45,1.25,1.09,0.99,0.94,0.92,0.91,0.89,0.87,0.85,0.84,0.82,0.81,0.79,0.78,0.77,0.75,0.74,0.73,0.72,0.71,0.7,0.69,0.68,0.67,0.66,0.65,0.64,0.64,0.63,0.63,0.62,0.62,0.61,0.61,0.61,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.61,0.61,0.61,0.61,0.61,0.61,0.62,0.62,0.62,0.62,0.63,0.63,0.63,0.63,0.63,0.64,0.64,0.64,0.64,0.64,0.65,0.65,0.65,0.65,0.65,0.65,0.65,0.65,0.65,0.65,0.65,0.65,0.65,0.65,0.65,0.65,0.65,0.65,0.65,0.65,0.65,0.65,0.65,0.64,0.63,0.62,0.6,0.59,0.57,0.55,0.54,0.53,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.51,0.51,0.51,0.5,0.5,0.49,0.48,0.47,0.47,0.46,0.45,0.45,0.44,0.43,0.42,0.42,0.41,0.41,0.41,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.41,0.42,0.43,0.44,0.46,0.48,0.5,0.53,0.55,0.58,0.61,0.64,0.67,0.7,0.73,0.77,0.8,0.83,0.87,0.9,0.93,0.96,0.99,1.02,1.05,1.08,1.1,1.12,1.14,1.16,1.17,1.18,1.19,1.2,1.2,1.2,1.19,1.17,1.15,1.12,1.09,1.06,1.02,0.98,0.94,0.9,0.86,0.82,0.78,0.74,0.7,0.66,0.63,0.6,0.57,0.55,0.53,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.52,0.51,0.51,0.5,0.5,0.49,0.49,0.48,0.47,0.47,0.47,0.46,0.46,0.45,0.45,0.45,0.44,0.44,0.44,0.43,0.43,0.43,0.42,0.42,0.42,0.41,0.41,0.41,0.41,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.41,0.41,0.41,0.41,0.41,0.41,0.41,0.41,0.41,0.41,0.41,0.41,0.41,0.41,0.41,0.42,0.42,0.42,0.42,0.42,0.42,0.42,0.42,0.42,0.43,0.43,0.43,0.43,0.43,0.43,0.44,0.44,0.44,0.44,0.44,0.44,0.45,0.45,0.45
          ]
      },
      {
          name:'Nifty',
          type:'line',
          xAxisIndex: 1,
          yAxisIndex: 1,
          symbolSize: 8,
          hoverAnimation: false,
          data: [
              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.005,0.017,0.017,0.017,0.017,0.011,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.021,0.026,0.03,0.036,0.036,0.195,0.221,0.019,0.013,0.017,0.03,0.03,0.03,0.046,0.045,0.038,0.084,0.045,0.045,0.037,0.034,0.035,0.036,0.044,0.052,0.048,0.109,0.033,0.029,0.04,0.042,0.042,0.042,0.073,0.076,0.062,0.066,0.066,0.075,0.096,0.128,0.121,0.128,0.14,0.226,0.143,0.097,0.018,0,0,0,0,0,0.018,0.047,0.054,0.054,0.054,0.036,0.185,0.009,0.038,0.061,0.077,0.091,0.126,0.69,0.182,0.349,0.231,0.146,0.128,0.167,0.1,0.075,0.071,0.071,0.117,0.01,0.002,0.002,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.005,0.026,0.038,0.038,0.038,0.076,0.086,0.109,0.213,0.276,0.288,0.297,0.642,1.799,1.236,2.138,0.921,0.497,0.685,0.828,0.41,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.018,0.024,0.024,0.024,0.024,0.006,0.003,0.046,0.046,0.046,0.046,0.043,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.204,0.303,1.028,1.328,1.524,1.41,1.362,1.292,1.191,0.529,0.501,0.944,1.81,2.899,0.859,0.126,0.087,0.047,0,0,0,0,0.011,0.028,0.028,0.028,0.028,0.017,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.099,0.159,0.297,0.309,0.309,0.614,0.818,1.436,1.195,0.553,0.542,0.955,0.898,0.466,0.386,0.556,0.388,0.221,0.192,0.192,0.187,0.166,0.18,0.302,0.158,0.009,0.009,0.009,0.009,0.009,0.007,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.004,0.032,0.032,0.032,0.032,0.082,0.149,0.204,0.247,0.262,0.49,0.51,0.533,0.746,0.847,2.393,1.188,1.114,0.475,0.043,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.017,0.017,0.021,0.042,0.079,0.111,0.126,0.122,0.133,0.846,0.102,0.077,0.067,0.056,0.005,0,0,0,0,0,0,0,0,0,0,0,0,0,0.011,0.017,0.017,0.017,0.017,0.006,0,0,0,0,0,0.01,0.03,0.054,0.067,0.07,0.25,0.251,0.494,0.065,0.054,0.054,0.064,0.084,0.077,0.101,0.132,0.248,0.069,0.117,0.115,0.087,0.326,0.036,0.009,0.009,0.009,0.009,0.009,0.004,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.02,0.039,0.04,0.04,0.04,0.229,0.079,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.023,0.069,0.082,0.082,0.082,0.503,0.774,0.038,0.012,0.012,0.012,0.016,0.02,0.028,0.051,0.06,0.064,0.19,0.15,0.164,0.139,0.13,0.085,0.031,0.023,0.022,0.007,0.005,0.005,0.001,0,0.02,0.048,0.048,0.053,0.056,0.036,0.008,0.008,0.004,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.013,0.017,0.036,0.068,0.095,0.233,0.272,0.377,0.722,1.494,3.756,0.954,0.439,0.442,0.462,0.373,0.249,0.214,0.1,0.044,0.037,0.023,0.002,0,0,0,0,0,0,0.02,0.024,0.024,0.024,0.024,0.004,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.008,0.017,0.017,0.045,0.186,0.308,0.241,0.241,0.893,4.067,4.494,5.015,3.494,2.057,1.411,0.718,0.407,0.313,0.339,1.537,1.105,0.218,0.136,0.03,0.005,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.037,0.448,1.2,1.309,1.309,1.425,1.223,0.471,0.767,0.423,0.273,0.412,0.646,0.481,0.239,0.131,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.044,0.15,0.223,0.388,0.513,0.883,2.828,4.786,5.959,4.95,6.434,6.319,3.35,2.806,4.204,1.395,1.015,1.015,0.836,0.74,0.72,0.615,0.477,0.192,0.046,0.007,0.007,0.007,0.007,0.007,0.007,0.007,0.008,0.005,0.005,0.005,0.005,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.001,0.012,0.012,0.012,0.012,0.011,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.002,0.012,0.028,0.028,0.028,0.138,0.092,0.082,0.082,0.096,0.719,0.155,0.042,0.047,0.129,0.021,0.021,0.014,0.009,0.029,0.067,0.088,0.095,0.095,0.138,0.091,0.032,0.025,0.025,0.003,0,0,0,0,0,0,0,0,0,0,0,0,0.002,0.045,0.228,0.297,0.325,0.339,0.581,1.244,0.796,0.517,0.227,0.053,0.006,0,0,0,0,0,0,0,0,0,0.003,0.005,0.005,0.005,0.005,0.081,0.129,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.014,0.041,0.041,0.041,0.041,0.027,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.009,0.017,0.017,0.017,0.017,0.355,0.174,0.009,0.009,0.012,0.136,0.208,0.208,0.208,0.215,7.359,1.858,0.458,0.053,0.053,0.047,0.045,0.045,0.059,0.136,0.188,0.206,0.21,0.588,1.517,6.02,4.688,4.42,0.624,0.326,0.359,0.553,0.899,0.94,2.95,9.415,5.752,1.092,0.096,0.035,0.026,0.018,0.015,0.011,0.011,0.011,0,0,0,0,0,0,0,0,0,0,0,0.056,0.27,0.314,0.351,0.354,0.609,0.796,1.857,0.848,0.538,0.214,0.178,0.178,0.201,0.231,0.227,0.272,0.397,0.45,1.014,2.917,1.675,0.081,0.059,0.059,0.148,0.075,0.075,0.078,0.236,0.784,0.784,0.784,0.784,0.741,0.115,0.058,0.058,0.058,0.029,0.015,0.015,0.015,0.015,0.012,0.008,0.604,0.985,1.305,2.273,2.528,2.336,2.496,2.281,1.397,1.713,3.259,1.167,0.745,0.548,1.058,0.684,0.728,0.392,0.179,0.283,0.283,0.46,0.08,0.099,0.099,0.099,0.1,0.143,0.137,0.238,0.317,0.262,0.225,0.792,0.426,0.332,0.261,0.11,0.093,0.102,0.171,0.292,0.504,0.605,1.745,2.485,1.964,0.33,0.171,0.259,0.242,0.215,0.366,0.354,0.205,0.203,0.262,0.153,0.13,0.137,0.362,0.691,0.295,0.433,0.154,0.056,0.053,0.053,0.053,0.051,0.047,0.065,0.078,0.091,0.206,0.813,0.102,0.151,0.05,0.024,0.004,0.001,0,0,0,0.021,0.021,0.021,0.021,0.021,0.013,0.013,0.013,0.013,0.013,0.013,0.013,0.013,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.008,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.018,0.021,0.021,0.021,0.021,0.003,0,0,0,0,0,0,0,0,0,0.024,0.173,0.261,0.267,0.267,0.534,1.354,1.772,0.72,0.218,0.018,0.018,0.028,0.036,0.032,0.194,0.082,0.035,0.286,0.027,0.038,0.038,0.027,0.021,0.014,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.016,0.017,0.017,0.031,0.047,0.043,0.056,0.104,0.149,0.179,0.205,0.328,0.998,0.522,1.851,3.727,3.273,2.204,1.169,1.006,1.179,0.74,0.741,1.065,0.925,0.671,0.497,0.431,0.327,0.277,0.126,0.581,0.207,0.359,2.485,0.038,0.036,0.003,0.003,0.003,0.003,0.004,0.098,0.023,0.021,0.021,0.022,0.041,0.041,0.043,0.045,0.043,0.014,0.014,0.014,0.014,0.014,0.014,0.014,0.031,0.046,0.063,0.119,0.107,0.092,0.085,0.065,0.06,0.054,0.042,0.039,0.046,0.044,0.028,0.028,0.02,0.013,0.013,0.013,0.013,0.016,0.032,0.031,0.031,0.031,0.028,0.011,0.011,0.011,0.011,0.011,0.023,0.024,0.024,0.024,0.019,0.015,0.015,0.015,0.015,0.015,0.015,0.013,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.001,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.011,0.017,0.024,0.026,0.061,0.172,0.206,0.213,0.267,0.511,0.668,0.157,0.017,0.017,0.017,0.046,0.054,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.001,0.017,0.017,0.017,0.017,0.016,0,0,0,0,0,0,0,0,0,0.01,0.017,0.017,0.017,0.017,0.012,0.017,0.017,0.017,0.017,0.012,0,0,0,0,0,0.003,0.031,0.066,0.093,0.112,0.122,0.202,0.068,0.041,0.022,0.011,0,0,0,0,0,0,0,0,0,0,0,0.002,0.005,0.012,0.021,0.021,0.019,0.033,0.03,0.026,0.026,0.034,0.095,0.024,0.024,0.024,0.023,0.019,0.018,0.018,0.018,0.011,0.03,0.045,0.044,0.044,0.044,0.022,0.009,0.024,0.033,0.033,0.033,0.024,0.009,0,0,0,0,0,0,0.003,0.017,0.017,0.017,0.017,0.014,0,0,0,0,0,0.032,0.032,0.032,0.032,0.032,0.005,0.008,0.009,0.014,0.014,0.009,0.005,0.004,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.007,0.009,0.009,0.009,0.009,0.043,0.063,0.084,0.098,0.101,0.213,0.334,0.383,0.43,0.448,0.511,0.801,0.835,1.642,1.614,1.496,1.496,1.476,1.068,0.481,0.22,0.119,0.099,0.07,0.072,0.063,0.076,0.14,0.205,0.28,0.297,0.3,0.479,0.877,1.098,1.611,1.629,1.686,1.686,1.631,1.528,1.862,1.703,1.531,2.196,0.395,0.416,0.453,0.728,0.917,0.986,1.17,2.171,3.011,2.909,3.301,1.377,0.778,0.799,0.947,1.039,0.879,0.76,1.372,1.674,1.674,1.68,1.823,1.793,1.162,0.783,0.216,0.152,0.152,0.152,0.049,0,0,0,0.117,0.127,0.127,0.127,0.127,0.127,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.003,0.005,0.005,0.005,0.005,0.003,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.309,0.364,0.364,0.364,0.364,0.063,0.01,0.01,0.01,0.012,0.015,0.015,0.11,0.55,0.824,0.825,0.829,1.39,1.429,1.342,1.43,1.636,1.717,2.135,2.203,3.191,3.022,1.589,0.86,0.807,0.645,0.595,0.588,0.557,0.552,1.271,0.708,0.677,0.629,0.714,0.203,0.133,0.061,0.062,0.018,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.001,0.072,0.29,0.438,0.53,0.557,0.873,1.039,1.04,0.208,0.049,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.03,0.039,0.039,0.039,0.039,0.098,0.008,0.007,0.007,0.007,0.007,0.007,0.007,0.007,0.007,0.007,0.056,0.062,0.065,0.065,0.065,0.047,0.216,0.256,0.315,0.4,0.502,0.449,0.47,0.571,0.814,1.153,0.774,0.202,0.086,0.075,0.071,0.032,0.019,0.003,0.004,0.004,0.004,0.004,0.004,0.004,0.007,0.072,0.153,0.256,0.306,0.404,0.698,0.733,0.823,0.715,0.563,0.404,0.293,0.217,0.213,0.202,0.202,0.294,0.704,0.797,1.359,1.101,0.72,0.514,0.539,0.434,0.389,0.387,0.386,0.375,0.369,0.319,0.239,0.183,0.136,0.062,0.052,0.096,0.119,0.119,0.114,0.127,0.132,0.139,0.169,0.191,0.278,0.254,0.214,0.237,0.221,0.143,0.129,0.125,0.109,0.1,0.087,0.06,0.038,0.029,0.029,0.028,0.048,0.053,0.053,0.111,0.125,0.102,0.097,0.097,0.039,0.02,0.02,0.02,0.014,0.004,0.031,0.043,0.047,0.052,0.08,0.144,0.182,0.176,0.171,0.149,0.112,0.025,0,0,0,0,0,0,0,0.016,0.031,0.031,0.031,0.031,0.015,0,0,0,0,0,0.005,0.005,0.005,0.005,0.005,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.005,0.005,0.005,0.005,0.005,0.001,0,0,0
          ]
      }
  ]
};;
if (option && typeof option === "object") {
  myChart.setOption(option, true);
}


//-----------------------




//---------------------------
var dom = document.getElementById("e_chart_1");
var myChart = echarts.init(dom);
var app = {};
option = null;
option = {
	color: ['#ab8ce4', '#00c292', '#03a9f3', '#fec107', '#f15c30'],
	textStyle: {
		color: '#fff'
	},
  tooltip : {
      trigger: 'axis',
      axisPointer: {
          type: 'cross',
          label: {
              backgroundColor: '#6a7985'
          }
      }
  },
  legend: {
      data:['Mail Marketing', 'Union Advertising', 'Video Advertising', 'Direct Access', 'Search Engine']
  },
  toolbox: {
      feature: {
          saveAsImage: {}
      }
  },
  grid: {
      left: '3%',
      right: '4%',
      bottom: '3%',
      containLabel: true
  },
  xAxis : [
      {
          type : 'category',
          boundaryGap : false,
          data : ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
      }
  ],
  yAxis : [
      {
          type : 'value'
      }
  ],
  series : [
      {
          name:'Mail Marketing',
          type:'line',
          stack: 'Total amount',
          areaStyle: {normal: {}},
          data:[120, 132, 101, 134, 90, 230, 210]
      },
      {
          name:'Union Advertising',
          type:'line',
          stack: 'Total amount',
          areaStyle: {normal: {}},
          data:[220, 182, 191, 234, 290, 330, 310]
      },
      {
          name:'Video Advertising',
          type:'line',
          stack: 'Total amount',
          areaStyle: {normal: {}},
          data:[150, 232, 201, 154, 190, 330, 410]
      },
      {
          name:'Direct Access',
          type:'line',
          stack: 'Total amount',
          areaStyle: {normal: {}},
          data:[320, 332, 301, 334, 390, 330, 320]
      },
      {
          name:'Search Engine',
          type:'line',
          stack: 'Total amount',
          label: {
              normal: {
                  show: true,
                  position: 'top'
              }
          },
          areaStyle: {normal: {}},
          data:[820, 932, 901, 934, 1290, 1330, 1320]
      }
  ]
};
;
if (option && typeof option === "object") {
  myChart.setOption(option, true);
}


//---------------------------



//------------------------------


	
// End of use strict

	</script>
<%-- 	
	<!-- Crypto_Admin for Chart purposes -->
	<script src="${project}js/pages/echarts.js"></script> --%>
</body>
</html>