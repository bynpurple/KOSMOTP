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
				alert('잠시만 기다려주세요');
			}
	  });
	  
	  $('#md_checkbox_21').click(function(){
			 if($('#md_checkbox_21').prop('checked')){
				 var curval = document.value.currVal.value;
				 document.buyinf.buy_price.value = curval;
			 }
			 else{
				 document.buyinf.buy_price.value = "";
			 }
		  });
		  
	  $('#md_checkbox_22').click(function(){
		 if($('#md_checkbox_22').prop('checked')){
			 var curval = document.value.currVal.value;
			 document.sellinf.sell_price.value = curval;
		 }
		 else{
			 document.sellinf.sell_price.value = "";
		 }
	  });
	  
	  $.ajax({
			type:"GET",
			data:"CompanyCode=" + '000020',
			url: '${pageContext.request.contextPath}/user/inf_stock',
			success:function(data){
				$('#inf').html(data);
			},
			error:function(){
				alert('잠시만 기다려주세요');
			}
		});	  
  }	  
  	function orderBuy(){
	  var stockcode = document.search.keyword.value;
	  var buy_cnt =  document.buyinf.buy_cnt.value;
	  var buy_price = document.buyinf.buy_price.value;
	  var buy_total =  document.buyinf.buy_total.value;
	  
	  var reg1 =/^[1-9]{1,9}$/;
	  
	  var result1 = reg1.test(buy_cnt);
	  var result2 = reg1.test(buy_price);
	  
	  if(stockcode == ""){
		  alert("회사코드를 선택해주세요");
	  }else if(buy_cnt == ""){
		  alert("매수 수량을 입력해주세요");
	  }else if(buy_price == ""){
		  alert("매수 가격을 입력해주세요");
	  }
	  else{
		  if(!result1){
			  alert("수량이 잘못되었습니다");
			  buy_cnt = "";
			  document.buyinf.buy_cnt.focus();
			  return false;
		  }
		  if(!result2){
			  alert("가격이 잘못되었습니다");
			  buy_price = "";
			  document.buyinf.buy_price.focus();
			  return false;
		  }
		  
		  var url ="예약 테이블 만들어지면 새로 만들기"//"buyOrder?stockcode="+stockcode + "&buy_cnt="+buy_cnt+"&buy_price="+buy_price+"&buy_total="+buy_total;
		  window.open(url,"주식 매수 신청","menubar=no , width=500, height=300");
	  }
  }
  
  	function orderSell(){
	  var stockcode = document.search.keyword.value;
	  var sell_cnt =  document.sellinf.sell_cnt.value;
	  var sell_price = document.sellinf.sell_price.value;
	  var sell_total =  document.sellinf.sell_total.value;
	  
	  var reg1 =/^[1-9]{1,9}$/;
	  
	  var result1 = reg1.test(sell_cnt);
	  var result2 = reg1.test(sell_price);
	  
	  if(stockcode == ""){
		  alert("회사코드를 선택해주세요");
	  }else if(sell_cnt == ""){
		  alert("매도 수량을 입력해주세요");			  
	  }else if(sell_price == ""){
		  alert("매도 가격을 입력해주세요");
	  }
	  else{
		  if(!result1){
			  alert("수량이 잘못되었습니다");
			  sell_cnt = "";
			  document.sellinf.sell_cnt.focus();
			  return false;
		  }
		  if(!result2){
			  alert("가격이 잘못 되었습니다");
			  sell_price = "";
			  document.sellinf.sell_price.focus();
			  return false;
		  }
		  var url ="예약 테이블 만들어지면 새로 만들기" //"sellOrder?stockcode="+stockcode + "&sell_cnt="+sell_cnt+"&sell_price="+sell_price+"&sell_total="+sell_total;
		  window.open(url,"주식 매도 신청","menubar=no , width=500, height=300");
	  }
  }
  
  function calcu(){
	  var buy_cnt =  document.buyinf.buy_cnt.value;
	  var buy_price = document.buyinf.buy_price.value;
	  document.buyinf.buy_total.value = buy_cnt * buy_price;
	  
	  var sell_cnt =  document.sellinf.sell_cnt.value;
	  var sell_price = document.sellinf.sell_price.value;
	 document.sellinf.sell_total.value = sell_cnt * sell_price;
  }

 	function curr(val){
	  document.buyinf.buy_price.value = val;  
	  document.sellinf.sell_price.value = val;  
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
			<!-- 매수/매도 창 시작 -->
		<div class="col-xl-4 col-12">
			<div class="box" style="height:945px;">
			<div class="col-13" style="height: 400px; overflow: auto;" id="slimtest1">
	       <div class="box">
	       <div class="box-body">
			<div class="table-responsive">
				<div class="box-header with-border" style ="height :72px;" >
				  <h4 class="box-title">Search</h4>
					<div class="box-controls pull-right">
						<span class="search-box">
						<br>
						<form class="app-search" style="top:-45%;" name="search"> <!-- style="display: none;" --> 
							<input type="text" class="form-control" placeholder="Search &amp; enter" id="keyword"> <a class="srh-btn"></a>
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
				<form name = "buyinf">
				<!--Default!-->
			    <div class="col-lg-4">
			    <div class="btn-group">
				  <button class="btn btn-light dropdown-toggle" type="button" data-toggle="dropdown">종류</button>
				  <div class="dropdown-menu">
					<a class="dropdown-item" href="javascript:mark()" style="weight:bold; color:white" >지정가</a>
					<a class="dropdown-item" href="javascript:curr(document.value.currVal.value);" style="weight:bold; color:white" >시장가</a>
				  </div>
				</div>
			    </div>
			    <br>
			    <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="date" id="buyBookStart" class="form-control pull-right">
                  <input type="date" id="buyBookEnd" class="form-control pull-right">
                </div>
			  	<br>
			  	<div class="form-group">
				<div class="input-group">
				<span class="input-group-addon">수량</span>
				<input type="text" id = "buy_cnt" name="buy_cnt" class="form-control" placeholder="매수 수량을 입력해 주세요" onkeyup="calcu();">
				<span class="input-group-addon">주</span>
				</div>
				</div>
	  		
  				<div class="form-group">
				<div class="input-group">
				<span class="input-group-addon">가격</span>
				<input type="text" id = "buy_price" name="buy_price" class="form-control"  placeholder="가격을 입력해 주세요" onkeyup="calcu();">
				<span class="input-group-addon">원</span>
				</div>
				</div>
  				<input type="checkbox" id="md_checkbox_21" class="filled-in chk-col-red" />
				<label for="md_checkbox_21">현재가</label>		
					
		  		<p class="my-10">주문금액</p>
				<div class="input-group">
					<input type="text" class="form-control" name="buy_total" id="buy_total" readonly >
					<span class="input-group-addon">원</span>
			  	</div>
				<br>  
				<div class="d-block">
					<button type="button" class="btn btn-block btn-success btn-lg" onclick="orderBuy();">BUY ORDER</button>
				</div>
				</form>
			 </div>
			 <div class="tab-pane fade" id="sell">
			 <form name = "sellinf">
				<!--Default!-->
			    <div class="col-lg-4">
			    <div class="btn-group">
				  <button class="btn btn-light dropdown-toggle" type="button" data-toggle="dropdown">종류</button>
				  <div class="dropdown-menu">
					<a class="dropdown-item" href="javascript:mark()" style="weight:bold; color:white" >지정가</a>
					<a class="dropdown-item" href="javascript:curr(document.value.currVal.value);" style="weight:bold; color:white" >시장가</a>
				  </div>
				</div>
			    </div>
			    <br>
			    <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="date" id = "sellBookStart" class="form-control pull-right">
                  <input type="date" id = "sellBookEnd" class="form-control pull-right">
                </div>
			  	<br>
			  	<div class="form-group">
				<div class="input-group">
				<span class="input-group-addon">수량</span>
				<input type="text" id = "sell_cnt" name="sell_cnt" class="form-control" placeholder="매도 수량을 입력해 주세요" onkeyup="calcu();">
				<span class="input-group-addon">주</span>
				</div>
				</div>
	  		
  				<div class="form-group">
				<div class="input-group">
				<span class="input-group-addon">가격</span>
				<input type="text" id = "sell_price" name="sell_price" class="form-control"  placeholder="가격을 입력해 주세요" onkeyup="calcu();">
				<span class="input-group-addon">원</span>
				</div>
				</div>
  				<input type="checkbox" id="md_checkbox_22" class="filled-in chk-col-red" />
				<label for="md_checkbox_22">현재가</label>		
					
		  		<p class="my-10">주문금액</p>
				<div class="input-group">
					<input type="text" class="form-control" name="sell_total" id="sell_total" readonly >
					<span class="input-group-addon">원</span>
			  	</div>
				<br>  
				<div class="d-block">
					<button type="button" class="btn btn-block btn-success btn-lg" onclick="orderSell();">SELL ORDER</button>
				</div>
			</form>	
			</div>
		  </div>
		</div>
		</div>
		<!-- 매수/매도 창 종료 -->
		
		<!-- 해당 주식 간편 정보 시작 -->
		<div class="col-xl-4 col-12">
			<div class="box" id="inf"></div>
			<div class="box">
			<div class="box-body no-padding" style="overflow : auto;">
			<div class="table table-hover" style="height :250px; overflow : auto;">
				<table>
				<thead>
					<tr>
						<th colspan="6"><h3 class="box-title text-warning">나의 보유 종목</h3></th>
					</tr>
					<tr>
						<th>날짜</th>
						<th>업종</th>
						<th>회사명</th>
						<th>가격</th>
						<th>수량</th>
						<th>총합</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var = "list" items="${list}">
					<tr>
						<th><fmt:formatDate value="${list.c_date}" pattern="yy/MM/dd"/></th>
						<th>${list.stocktheme}</th>
						<th>${list.stockname}</th>
						<th><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.c_price}"></fmt:formatNumber>원</th>
						<th><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.c_cnt}"></fmt:formatNumber>주</th>
						<th><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.c_total}"></fmt:formatNumber>원</th>
					</tr>
					</c:forEach>
				</tbody>
				</table>
			</div>	
			</div>
			</div>
		</div>	   
		<!-- 해당 주식 간편 정보 끝 -->
		
		<!-- 상승하락창  시작 -->
		<div class="col-xl-4 col-12" style="height: 945px; overflow: hidden;">
			<div class="box" id="asking">
			</div>
		</div>
		
		<!-- 상승하락창 끝 -->
	   
	   <!-- 매도 매수 창 시작 -->
	   <div class="col-12">
	<div class="row">
	<div class="col-lg-6 col-12">
	  <!-- Default box -->
	  <div class="box box-solid bg-black">
		<div class="box-header with-border">
		  <h3 class="box-title">매수 예약 내역</h3>

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
				<table class="table table-bordered no-margin">
				  <thead>
					<tr>
					  <th>매수 예약 날짜</th>
					  <th>종목 코드</th>
					  <th>구분(테마)</th>
					  <th>회사명</th>
					  <th>매수 예약가</th>
					  <th>매수 수량</th>
					</tr>
				  </thead>
				  <tbody>
				  <c:forEach var="buy" items="${buyBookStock}">
				  	<tr>
				  	  <td class="text-red hover-danger"><fmt:formatDate value="${buy.stockDate}" pattern ="yy/MM/dd"/>
				  	  </td>
					  <td>${buy.stockCode}</td>
					  <td>${buy.stockTheme}</td>
					  <td>${buy.stockName}</td>
					  <td>${buy.stockCurrent}</td>
					  <td>${buy.totalStock}</td>
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
		
		<div class="col-lg-6 col-12">
		  <!-- Default box -->
		  <div class="box box-solid bg-black">
			<div class="box-header with-border">
			  <h3 class="box-title">매도 예약 내역</h3>

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
					<table class="table table-bordered table-striped no-margin">
					  <thead>
						<tr>
						  <th>매도 예약 날짜</th>
						  <th>종목 코드</th>
						  <th>구분(테마)</th>
						  <th>회사명</th>
						  <th>매도예약가</th>
						  <th>매도 수량</th>
						</tr>
					  </thead>
					  <tbody>
						<c:forEach var="sell" items="${sellBookStock}">
					  	<tr>
					  	  <td class="text-yellow hover-warning"><fmt:formatDate value="${sell.stockDate}" pattern ="yy/MM/dd"/>
					  	  </td>
						  <td>${sell.stockCode}</td>
						  <td>${sell.stockTheme}</td>
						  <td>${sell.stockName}</td>
						  <td>${sell.stockCurrent}</td>
						  <td>${sell.totalStock}</td>
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
		</div>	
		</div>
		<!-- 매도 매수 창 종료 -->
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
	<script src="${project}assets/vendor_components/jquery/dist/jquery.min.js"></script>
	
	<!-- popper -->
	<script src="${project}assets/vendor_components/popper/dist/popper.min.js"></script>
	
	<!-- Bootstrap 4.0-->
	<script src="${project}assets/vendor_components/bootstrap/dist/js/bootstrap.js"></script>
	
	<!-- Bootstrap 4.0-->
	<script src="${project}assets/vendor_components/bootstrap/dist/js/bootstrap.min.js"></script>
	
	<!-- Select2 -->
	<script src="${project}assets/vendor_components/select2/dist/js/select2.full.js"></script>
		
	<!-- Slimscroll -->
	<script src="${project}assets/vendor_components/jquery-slimscroll/jquery.slimscroll.js"></script>
	
	<!-- SlimScroll -->
	<script src="${project}assets/vendor_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>

	<!-- FastClick -->
	<script src="${project}assets/vendor_components/fastclick/lib/fastclick.js"></script>
	
	<!-- InputMask -->
	<script src="${project}assets/vendor_plugins/input-mask/jquery.inputmask.js"></script>
	<script src="${project}assets/vendor_plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script src="${project}assets/vendor_plugins/input-mask/jquery.inputmask.extensions.js"></script>
	
	<!-- bootstrap datepicker -->
	<script src="${project}assets/vendor_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	
	<!-- date-range-picker -->
	<script src="${project}assets/vendor_components/moment/min/moment.min.js"></script>
	<script src="${project}assets/vendor_components/bootstrap-daterangepicker/daterangepicker.js"></script>
	
	<!-- bootstrap color picker -->
	<script src="${project}assets/vendor_components/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
	
	<!-- bootstrap time picker -->
	<script src="${project}assets/vendor_plugins/timepicker/bootstrap-timepicker.min.js"></script>
	
	<!-- iCheck 1.0.1 -->
	<script src="${project}assets/vendor_plugins/iCheck/icheck.min.js"></script>
	
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
	
	<!-- Crypto_Admin for advanced form element -->
	<script src="${project}js/pages/advanced-form-element.js"></script>
	
	<!-- Crypto_Admin for demo purposes -->
	<script src="${project}js/demo.js"></script>
	
	<!-- SlimScroll -->
	<script src="${project}assets/vendor_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <script type="text/javascript">
        $('#slimtest1').slimScroll({
            height: '400px'
        });
    </script>
	
</body>
</html>
