<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=chrome">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <%@ include file="../include/header.jsp" %>

  <script src="/stock/resources/js/jquery-3.4.1.min.js"></script>
  <!-- 검색 ajax -->
  <script type="text/javascript">
  $(function() {
	    $('#result').html("회사 및 코드를 검색하세요!");
		$('#keyword').keyup(function() {		// keyup : 데이터입력이 끝났을 때
			var keyword = $('#keyword').val();	// 입력한 키워드
			if(keyword.length == 0) {	// 글자수가 0인경우
				//$('#result').css("visibility", "hidden");	// 결과 없으면 숨김
				$('#result').html("회사 및 코드를 검색하세요!");
			} else {
				$('#result').css("visibility", "visible");	// 결과 있으면 보여줌
				$.ajax({
					type:"GET",
					data: "keyword=" + keyword,
					url: '${pageContext.request.contextPath}/user/search_sub',	// {컨트롤러}/이동 url
					success: function(data) {
						$('#result').html(data);	// 결과 출력
					},
					error: function() {
						alert('잠시만 기다려주세요');
					}
				});
			}
		});
	});
  
  window.onload = function(){
	  $('#asking').css("visibility","visible");
	  $.ajax({
		  type:"GET",
			data:"CompanyCode=" + '000020',
			url: '${pageContext.request.contextPath}/user/asking_stock',
			success:function(data){
				$('#asking').html(data);
			},
			error:function(){
				alert('오류');
			}
	  });
 }
  function buyOrder(){
	  var stockcode = $('#keyword').val();
	  var buy_cnt = $('#buy_cnt').val();
	  var buy_price = $('#buy_price').val();
	  var buy_total = $('#buy_total').val();
	  
  }
  </script>   
  </head>

<body class="hold-transition skin-black sidebar-mini fixed">
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
	  

    <!-- Main content -->
    <section class="content">
		<div class="row">
			<div class="col-12">
				<div class="box box-inverse box-dark">
				  <div class="box-body">
				  	
					  <ul id="webticker-1">
					    <c:forEach var = "yesDate" items="${yesDate}">
						<li class="br-1">
							<div class="mx-20">
								<div class="d-flex justify-content-between">
									<h5 class="mr-40 text-white-50">${yesDate.stockCode} + 회사명</h5>
									<c:if test="${(yesDate.r_close - yesDate.r_empty) / yesDate.r_empty * 100 <= 0}">
										<p class="text-danger"><fmt:formatNumber type ="number" pattern = "0.00" value ="${(yesDate.r_close - yesDate.r_empty) / yesDate.r_empty * 100}"/></p>
									</c:if>
									<c:if test="${(yesDate.r_close - yesDate.r_empty) / yesDate.r_empty * 100 > 0}">
										<p class="text-success"><fmt:formatNumber type ="number" pattern = "+0.00" value ="${(yesDate.r_close - yesDate.r_empty) / yesDate.r_empty * 100}"/></p>
									</c:if>
								</div>
								<div class="d-flex justify-content-between">
									<h4 class="my-0 mr-40">금일 종가 <fmt:formatNumber type ="number" pattern = ",000,000" value ="${yesDate.r_empty}"/>원</h4>
									<span class="sparklines">${yesDate.stockCode}</span>
								</div>
							</div>
						</li>
						</c:forEach>
					  </ul>
				  </div>
			  </div>
			</div>
			<!-- 검색 창 시작 -->
			<div class="col-xl-4 col-12">
			<div class="box">
	          <div class="col-13" style="height: 800px; overflow: auto;">
	            <div class="box">
	            <div class="box-body">
					<div class="table-responsive">
						<div class="box-header with-border" style ="height :72px;" >
						  <h4 class="box-title">Search</h4>
							<div class="box-controls pull-right">
								<span class="search-box">
								<br>
								<form class="app-search" name="search"> <!-- style="display: none;" --> 
									<input type="text" class="form-control" placeholder="Search &amp; enter" id="keyword"> <a class="srh-btn"><i class="ti-close"></i></a>
								</form>
								</span>
							</div>
						</div>
					  <table id="example5" class="table table-hover">
						<tr>
							<td>
								<p class="mb-0">
								  <strong id ="result"></strong>
								</p>
							</td>
						</tr>
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
			
			<!-- 주식호가창  시작 -->
			<div class="col-xl-4 col-12" style="height: 820px; overflow: hidden;">
				<div class="box" id="asking">
				</div>	
			</div>	
			<!-- 상승하락창 끝 -->
			<!-- 매수/매도 창 시작 -->
			<div class="col-xl-4 col-12">
				<div class="box" style="height: 300px;">
					<div class="box-header with-border">
					  <h4 class="box-title">현재 보유 자산</h4>
					</div>
					<div class="box-body">
						<div class="d-flex justify-content-between bb-1 pb-5">
							<h5 class="text-fade">자산</h5>
							<h5 class="text-fade">종류</h5>
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
					<div class="tab-pane fade active show" id="buy" style ="height :390px;">
				  		<table>
				  			<tr>
				  				<td>종목</td>
				  				<td id = "keyword">
				  					
				  				</td>
				  				<td>기업명</td>
				  			</tr>
				  			<tr>
				  				<td>종류</td>
				  				<td>
				  				<select>
				  					<option>지정가</option>
				  					<option>시장가</option>
				  				</select>
				  				</td>
				  			</tr>
				  		</table>
				  		
			  			<div class="form-group">
						<div class="input-group">
						<span class="input-group-addon">수량</span>
						<input type="number" name="onlyNum" class="form-control" id="buy_cnt" required data-validation-required-message="This field is required">
						<span class="input-group-addon">주</span>
						</div>
						</div>
			  		
		  				<div class="form-group">
						<div class="input-group">
						<span class="input-group-addon">가격</span>
						<input type="number" name="onlyNum" class="form-control"   required data-validation-required-message="This field is required">
						<span class="input-group-addon">원</span>
						</div>
						</div>
		  				<input type="checkbox" id="md_checkbox_21" class="filled-in chk-col-red" checked />
						<label for="md_checkbox_21">현재가</label>		
							
				  		<p class="my-10">주문금액</p>
						<div class="input-group">
							<input type="text" class="form-control" placeholder="3987.55" id="buy_total" disabled >
							<span class="input-group-addon">원</span>
					  	</div>
						<br>  
						<div class="d-block">
							<button type="button" class="btn btn-block btn-success btn-lg" onclick="buyOrder();">BUY ORDER</button>
						</div>
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
							<button type="button" class="btn btn-block btn-success btn-lg" >PLACE ORDER</button>
						</div>
					  </form>
					</div>
				  </div>
				</div>
			</div>
			<!-- 매수/매도 창 시작 -->
					   
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
	<script src="${project}assets/vendor_components/jquery/dist/jquery.js"></script>
	
	<!-- popper -->
	<script src="${project}assets/vendor_components/popper/dist/popper.min.js"></script>
	
	<!-- Bootstrap 4.0-->
	<script src="${project}assets/vendor_components/bootstrap/dist/js/bootstrap.js"></script>
		
	<!-- Slimscroll -->
	<script src="${project}assets/vendor_components/jquery-slimscroll/jquery.slimscroll.js"></script>
	
	<!-- FastClick -->
	<script src="${project}assets/vendor_components/fastclick/lib/fastclick.js"></script>
	
	<!-- 추가 맵핑 적용 -->
	<script src="${project}assets/vendor_components/Ionicons/css/ionicons.css"></script>
	<script src="${project}assets/vendor_components/font-awesome/css/font-awesome.css"></script>
	<script src="${project}assets/vendor_components/themify-icons/themify-icons.css"></script>
	<script src="${project}assets/vendor_components/linea-icons/linea.css"></script>
	<script src="${project}assets/vendor_components/flag-icon/css/flag-icon.css"></script>
	<script src="${project}assets/vendor_components/glyphicons/glyphicon.css"></script>
	<script src="${project}assets/vendor_components/material-design-iconic-font/css/materialdesignicons.css"></script>
	<script src="${project}assets/vendor_components/simple-line-icons-master/css/simple-line-icons.css"></script>
	<script src="${project}assets/vendor_components/cryptocoins-master/webfont/cryptocoins.css"></script>
	
    <!-- Resources -->
	<script src="https://www.amcharts.com/lib/4/core.js"></script>
	<script src="https://www.amcharts.com/lib/4/charts.js"></script>
	<script src="https://www.amcharts.com/lib/4/themes/dark.js"></script>
	<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
	
	<!-- webticker -->
	<script src="${project}assets/vendor_components/Web-Ticker-master/jquery.webticker.min.js"></script>
		
	<!-- Sparkline -->
	<script src="${project}assets/vendor_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
		
	<!-- Crypto_Admin App -->
	<script src="${project}js/template.js"></script>
	
	<!-- Crypto_Admin dashboard demo (This is only for demo purposes) -->
	<script src="${project}js/pages/dashboard.js"></script>
	<script src="${project}js/pages/dashboard-chart.js"></script>
	
	<!-- Crypto_Admin for demo purposes -->
	<script src="${project}js/demo.js"></script>

	
</body>
</html>