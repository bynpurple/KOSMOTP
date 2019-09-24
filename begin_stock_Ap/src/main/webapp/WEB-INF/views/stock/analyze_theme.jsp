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
              <h3 class="box-title">요일 별 시가 통계</h3>
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
app.title = 'Stock status by Day';

option = {
	color: ['#fec107', '#f15c30', 'blue', 'pink', ''],
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
  series: [
	  
	 <% int i=0; %>
	  
	 <c:forEach var="dto" items="${themeChart1}">
	 <% i++; %>
	 
	 {
      type: 'bar',
      data: [${dto.mon_r_open}, ${dto.tue_r_open}, ${dto.wed_r_open}, ${dto.thu_r_open}, ${dto.fri_r_open}],
      coordinateSystem: 'polar',
      name: '${dto.stockname}',
      stack: 'a'

     <% if(i != 5){ %>
     	}, 
     <% } else {%>
     	}
     <% } %>
	  
  	  </c:forEach>
  
  ],
  legend: {
      show: true,
      
      data: [
    	  
    	  <% i=0; %>
	      <c:forEach var="dto2" items="${themeChart1}">
	      <% i++; %>
	    	  '${dto2.stockname}' 
	    	  
	      <% if(i != 5){ %>
	     	, 
	     <% } else {%>
	     <% } %>
	      </c:forEach>
    	 
	      ]
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

var axisData = null;

axisData = [
<% i=0; %>
<c:forEach var="dto3" items="${themeChart2}">
<% i++; %>

    '${dto3.year}'
    
    <% if(i != 10){ %>
		,
    <% } else {%>
	<% } %>

</c:forEach> 
];


var data = null;

data = [
<% i=0; %>
<c:forEach var="dto4" items="${themeChart2}">
<% i++; %>

    '${dto4.volume}'
    
    <% if(i != 10){ %>
		,
    <% } else {%>
	<% } %>

</c:forEach> 
];

/* var data = axisData.map(function (item, i) {
  return Math.round(Math.random() * 1000 * (i + 1));
}); */

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
  series: [   // series가 데이터들어가는데 
     
	  
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




//------------------------------


	
// End of use strict

	</script>
<%-- 	
	<!-- Crypto_Admin for Chart purposes -->
	<script src="${project}js/pages/echarts.js"></script> --%>
</body>
</html>