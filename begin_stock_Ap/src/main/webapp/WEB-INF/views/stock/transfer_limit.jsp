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

    <title>이체 한도 결과 조회 </title>
<script src="/stock/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function selectBank(bank){
		$('#bankName').html(bank); 
	}
	
	//콤마 시작
	$(function(){
		var price = $("#transfer_price");
		price.on('keyup',function(){
			//입력 값 알아내기
			var _this = this;
			numberFormat(_this)
		});
	});
	
	function comma(str){
		str = String(str);
		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
	
	// 콤마 풀기
	function uncomma(str) {
	  str = String(str);
	  return str.replace(/[^\d]+/g, '');
	}

	function numberFormat(obj) {
	  obj.value = comma(uncomma(obj.value));
	}
	
	//콤마끝
	
	$(document).ready(function(){
		var sum = 0;
	  $("#1man").click(function(){
		sum += 10000;
		$("#transfer_price").val(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	  });
	  
	  $("#5man").click(function(){

		  sum += 50000;
		  $("#transfer_price").val(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	  });
	  
	  $("#10man").click(function(){
		  sum += 100000;
	    $("#transfer_price").val(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	  });
	  
	  $("#50man").click(function(){
		  sum += 500000;
	    $("#transfer_price").val(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	  });
	  
	  $("#100man").click(function(){
		  sum += 1000000;
	    $("#transfer_price").val(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	  });
	  
	  $("#whole").click(function(){
		var whole = document.transfer.possible_price.value; 
		$("#transfer_price").val(whole);
		});
	  
	  $("#jungjung").click(function(){
	    $("#transfer_price").val("");
	    sum = 0;
	  });
	});
	
	$(function(){
		var withdraw = document.transfer.withdraw.value;
		$("#yesterday").click(function(){
			$.ajax({
				type:"GET",
				data: "dayDate=" + 1 + "&withdraw=" + withdraw,
				url: '${pageContext.request.contextPath}/user/dateTranseInf',	// {컨트롤러}/이동 url
				success: function(data) {
					$('#result').html(data);	// 결과 출력
				},
				error: function() {
					alert('잠시만 기다려주세요');
				}
			});
		});
		
		$("#week").click(function(){
			$.ajax({
				type:"GET",
				data: "dayDate=" + 7 + "&withdraw=" + withdraw,
				url: '${pageContext.request.contextPath}/user/dateTranseInf',	// {컨트롤러}/이동 url
				success: function(data) {
					$('#result').html(data);	// 결과 출력
				},
				error: function() {
					alert('잠시만 기다려주세요');
				}
			});
		});
		
		$("#month").click(function(){
			$.ajax({
				type:"GET",
				data: "dayDate=" + 30 + "&withdraw=" + withdraw,
				url: '${pageContext.request.contextPath}/user/dateTranseInf',	// {컨트롤러}/이동 url
				success: function(data) {
					$('#result').html(data);	// 결과 출력
				},
				error: function() {
					alert('잠시만 기다려주세요');
				}
			});
		});
		
		$("#years").click(function(){
			$.ajax({
				type:"GET",
				data: "dayDate=" + 365 + "&withdraw=" + withdraw,
				url: '${pageContext.request.contextPath}/user/dateTranseInf',	// {컨트롤러}/이동 url
				success: function(data) {
					$('#result').html(data);	// 결과 출력
				},
				error: function() {
					alert('잠시만 기다려주세요');
				}
			});
		});
		
		$("#wholeDate").click(function(){
			$.ajax({
				type:"GET",
				data: "dayDate=" + 0 + "&withdraw=" + withdraw,
				url: '${pageContext.request.contextPath}/user/dateTranseInf',	// {컨트롤러}/이동 url
				success: function(data) {
					$('#result').html(data);	// 결과 출력
				},
				error: function() {
					alert('잠시만 기다려주세요');
				}
			});
		});
	});		
	
</script>
</head>
<body class="hold-transition skin-black sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">
 
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <%@ include file="side_menu.jsp" %>
  </aside>
  
  <header class="main-header">
    <%@ include file="../include/main_header.jsp" %>
  </header>
  <!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        	이체 한도/결과 조회
      </h1>
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i> MY STOCK</a></li>
        <li class="breadcrumb-item active">이체 한도/결과 조회</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	  <div class="row">
	  	<div class="col-lg-6 col-12" >
	  	<div class="box">
		  <ul class="nav nav-tabs nav-tabs-danger nav-justified" role="tablist">
			<li class="nav-item">
			  <a class="nav-link active font-size-18" data-toggle="tab" href="#nowTransfer" role="tab">즉시 이체 출금</a>
			</li>
		  </ul>
		  <!-- Tab panes -->
		  <div class="box-header col-12">
		  	<span>출금 계좌 정보</span>
		  </div>
		  
		  <div class="box-body tab-content">
			<div class="tab-pane fade active show" id="nowTransfer" style ="height :800px;">
		  		<form name = "transfer">
		  		
		  		<div class="col-lg-6 col-12">
			  		<div class="input-group">
		                <span class="input-group-addon">출금 계좌</span>
		                <input type="text" class="form-control" id="withdraw" value = "${vo.account}"placeholder="출금 계좌번호" readonly style="color:#f15c30">
	                </div>
		  		</div>
			    <br>
			    <div class="col-12">
			    	<div class="input-group">
		                <span class="input-group-addon">비밀번호</span>
		                <input type="password" id="account_pwd" class="form-control col-lg-3 col-12" maxlength="4" placeholder="계좌 비밀번호">
	                	<input type = "button" value = "확인" onclick="searchAccount();">
	                	<input type ="hidden" id ="accountChk" value = "0">
	                	&nbsp;&nbsp;
	                	<span class="input-group-addon">이체 가능 금액 </span>
		                <input type="text" id="possible_price" class="form-control" readonly>
		                <span class="input-group-addon">원</span>
	                </div>
                </div>
                <br>
		  		
		  		<div class="col-lg-12 col-12">
		  		<div class="input-group">
		  			<span class="input-group-addon">이체 금액</span>
		  			<input type="text" id="transfer_price" class="form-control"><span class="input-group-addon">원</span>
		  			<input type="button" value = "1만" id="1man"><input type="button" value = "5만" id="5man">
		  			<input type="button" value = "10만" id="10man"><input type="button" value = "50만" id="50man">
		  			<input type="button" value = "100만" id="100man"><input type="button" value = "전액" id="whole">
		  			<input type="button" value = "정정" id="jungjung">
		  		</div>
		  		</div>
		  		<br>
		  		<div class="col-lg-8 col-12">
		  		<div class="input-group">
		  			<span class="input-group-addon">출금 계좌 표시</span>
		  			<input type="text" id="withdrawMessage" class="form-control">
		  			<span>한글 8자 이내</span>
		  		</div>
				</div>
				<br>
				<div class="box-header with-border"></div>
				<br><br>
				<div class="col-12">
		  		<div class="dropdown">
		  		  <span>입금 계좌 정보&nbsp;</span>	
				  <button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown">은행 선택</button>
				  <div class="dropdown-menu dropdown-grid cols-4">
					<a class="dropdown-item" href="javascript:selectBank('우리은행');">
					  <img class="icon" src="${project}images/bank/woori.png" alt="stack_of_photos.svg"/>
					  <span class="title">우리은행</span>
					</a>
					<a class="dropdown-item" href="javascript:selectBank('신한은행');">
					  <img class="icon" src="${project}images/bank/shinhan.jpg" alt="stack_of_photos.svg"/>
					  <span class="title">신한은행</span>
					</a>
					<a class="dropdown-item" href="javascript:selectBank('수협');">
					  <img class="icon" src="${project}images/bank/sh.jpg" alt="stack_of_photos.svg"/>
					  <span class="title">수협</span>
					</a>
					<a class="dropdown-item" href="javascript:selectBank('SC제일은행');" >
					  <img class="icon" src="${project}images/bank/sc.jpg" alt="stack_of_photos.svg"/>
					  <span class="title">SC제일은행</span>
					</a>
					<a class="dropdown-item" href="javascript:selectBank('농협');">
					  <img class="icon" src="${project}images/bank/nh.png" alt="stack_of_photos.svg"/>
					  <span class="title">농협</span>
					</a>
					<a class="dropdown-item" href="javascript:selectBank('광주은행');">
					  <img class="icon" src="${project}images/bank/kjb.png" alt="stack_of_photos.svg"/>
					  <span class="title">광주은행</span>
					</a>
					<a class="dropdown-item" href="javascript:selectBank('산업은행');">
					  <img class="icon" src="${project}images/bank/kdb.jpg" alt="stack_of_photos.svg"/>								
					  <span class="title">산업은행</span>
					</a>
					<a class="dropdown-item" href="javascript:selectBank('국민은행');">
					  <img class="icon" src="${project}images/bank/kb.jpg" alt="stack_of_photos.svg"/>	
					  <span class="title">국민은행</span>
					</a>
					<a class="dropdown-item" href="javascript:selectBank('카카오뱅크');">
					  <img class="icon" src="${project}images/bank/kakao.png" alt="stack_of_photos.svg"/>	
					  <span class="title">카카오뱅크</span>
					</a>
					<a class="dropdown-item" href="javascript:selectBank('케이뱅크');">
					  <img class="icon" src="${project}images/bank/k.png" alt="stack_of_photos.svg"/>	
					  <span class="title">케이뱅크</span>
					</a>
					<a class="dropdown-item" href="javascript:selectBank('전북은행');">
					  <img class="icon" src="${project}images/bank/jb.jpg" alt="stack_of_photos.svg"/>	
					  <span class="title">전북은행</span>
					</a>
					<a class="dropdown-item" href="javascript:selectBank('IBK기업은행');">
					  <img class="icon" src="${project}images/bank/ibk.png" alt="stack_of_photos.svg"/>	
					  <span class="title">IBK기업은행</span>
					</a>
					<a class="dropdown-item" href="javascript:selectBank('하나은행');">
					  <img class="icon" src="${project}images/bank/hana.jpg" alt="stack_of_photos.svg"/>	
					  <span class="title">하나은행</span>
					</a>
					<a class="dropdown-item" href="javascript:selectBank('한국수출입은행');">
					  <img class="icon" src="${project}images/bank/export.png" alt="stack_of_photos.svg"/>	
					  <span class="title">한국수출입은행</span>
					</a>
					<a class="dropdown-item" href="javascript:selectBank('대구은행');">
					  <img class="icon" src="${project}images/bank/dgb.png" alt="stack_of_photos.svg"/>	
					  <span class="title">대구은행</span>
					</a>
					<a class="dropdown-item" href="javascript:selectBank('시티은행');">
					  <img class="icon" src="${project}images/bank/citi.png" alt="stack_of_photos.svg"/>	
					  <span class="title">시티은행</span>
					</a>
					<a class="dropdown-item" href="javascript:selectBank('부산은행');">
					  <img class="icon" src="${project}images/bank/busan.jpg" alt="stack_of_photos.svg"/>	
					  <span class="title">부산은행</span>
					</a>
					<a class="dropdown-item" href="javascript:selectBank('경남은행');">
					  <img class="icon" src="${project}images/bank/bnk.png" alt="stack_of_photos.svg"/>	
					  <span class="title">경남은행</span>
					</a>
					<a class="dropdown-item" href="javascript:selectBank('경남은행');">
					  <img class="icon" src="${project}images/bank/bnk.png" alt="stack_of_photos.svg"/>	
					  <span class="title">경남은행</span>
					</a>
					<a class="dropdown-item" href="javascript:selectBank('경남은행');">
					  <img class="icon" src="${project}images/bank/bnk.png" alt="stack_of_photos.svg"/>	
					  <span class="title">경남은행</span>
					</a>
				  </div>
				</div>
				<br>
				</div>
				<div class="col-12">
				<div class="input-group">
	                <span class="input-group-addon">입금 계좌 번호</span>
	                <span class="input-group-addon" id = "bankName">은행이름</span>
	                <input type="text" class="form-control" placeholder="입금 계좌번호" id="deposit_account">
	                <span class="input-group-addon">"-없이 입력"</span>
             	</div>
             	</div>
		  		<br>
		  		<div class="col-lg-8 col-12">
		  		<div class="input-group">
		  			<span class="input-group-addon">입금 계좌 표시</span>
		  			<input type="text" id="transferMessage" class="form-control">
		  			<span>한글 8자 이내</span>
		  		</div>
		  		<br>
		  		<input type = "button" value = "이체 실행" class="btn btn-block btn-danger" style="width:100px;" onclick="transferMoney();">
				</div>
				</form>
				<div class="box-header with-border">
				<h3 class="box-title">즉시 이체 서비스 주요 안내</h3>
				</div>
				<div class="box-body">
					<table>
						<tr>
							<td>
							1) OPT 발급/등록 필수<br>
							2) "지정등록" 계좌 후, 이체 가능(수취계좌 위변조 방지 보안 정책)<br>
							<br><br>
							</td>
						</tr>
						<tr>
							<td>
							이체 시간 및 한도<br>
							1)이체 가능 시간<br>
							-영업일 : 00:30 ~ 16:50, 17:00 ~23:30<br>
							<br>
							</td>
							<td>
							2)출금한도 : 보안등급에 따른 한도 적용<br>
							-단, 00:30 ~ 07:00 1천만원<br>
							</td>
						</tr>
					</table>
				</div>
			</div>
		  </div>
		</div>
	  	</div>
	  	<div class="col-lg-6 col-12" >
	  	<div class="box">
		  <ul class="nav nav-tabs nav-justified btn-success" role="tablist">
			<li class="nav-item" style= "color:white; margin : 0 auto;" >
			  <a class="nav-link nav font-size-18" data-toggle="tab" role="tab">즉시 이체 출금 결과 조회</a>
			</li>
		  </ul>
		  <!-- Tab panes -->
		  <div class="box-header col-12">
		  	
		  	<table>
		  		<tr>
		  			<th style="width: 500px;">
		  			<span style="font-size:13px">즉시 이체  출금 결과 조회</span></th>
		  			<th>
		  				<table>
		  				<tr>
				  			<th><input type="button" value="전일" id="yesterday" class="btn btn-block btn-success"></th>
				  			<th><input type="button" value="7일" id="week" class="btn btn-block btn-success"></th>
				  			<th><input type="button" value="30일 " id="month" class="btn btn-block btn-success"></th>
				  			<th><input type="button" value="1년" id="years" class="btn btn-block btn-success"></th>
				  			<th><input type="button" value="전체" id="wholeDate" class="btn btn-block btn-success"></th>
				  		</tr>
		  				</table>
		  			</th>
		  		</tr>
		  	</table>
		  </div>
		  
		  <div class="box-body no-padding">
			<div class="table-responsive" style="height:820px;">
			  <div id="slimtest1">
			  <div id = "result">
			  <table class="table table-hover">
				<tr class="font-size-18">
				  <td align="center">일시</td>
				  <th>입금 계좌</th>
				  <th>이체 금액</th>
				</tr>
			  </table>
			  </div>
			</div>  
			</div>
            </div>
            <!-- /.box-body -->
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
	
	<!-- SlimScroll -->
	<script src="${project}assets/vendor_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <script type="text/javascript">
        $('#slimtest1').slimScroll({
            height: '820px'
        });
    </script>
	

</body>
</html>
