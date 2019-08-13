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
      <h1>테마 분석</h1>
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="trading"><i class="fa fa-dashboard"></i> 홈</a></li>
        <li class="breadcrumb-item"><a href="choicetheme">테마 분석 및 뉴스</a></li>
        <li class="breadcrumb-item active">테마 분석</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
		<h1 class="page-header text-center mt-30 mb-30">
		  <span class="text-bold text-yellow">EZ-STOCK</span> 테마 <span class="text-bold text-yellow">분석</span><br>
		  <p class="font-size-18 mb-0">선택하신 종목들의 비교하여 각종 통계를 보여줍니다. 선택 가능한 테마 갯수는 최소 2개부터 최대 4개까지 입니다.</p>
	 	</h1>
	 	<div class="box">
	 		<form action="analyzeTheme" method="post" name="chooseThemes" onsubmit="return fchk();">
	 			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		 		<div class="box-header with-border">
					<h3 class="box-title">전체 테마 목록</h3>
					<h6 class="box-subtitle">비교하고 싶은 테마를 선택하고 하단의 "분석" 버튼을 눌러주세요 <span style="color:orange">(최소 2개부터 최대 4개까지 선택) </span></h6>
		        </div>
		 		<div class="box-body">
		 		
		 			<div class="row">
			 			<c:forEach items="${themeList}" var="themeList">
						<div class="col-md-3">
							<div class="form-group">
								<div class="controls">
									<input type="checkbox" id="${themeList}" name="themes" value="${themeList}">
									<label for="${themeList}">${themeList}</label>
								</div>
							</div>
						</div>
						</c:forEach>
					</div>
					
					<div class="row">
						<div class="col-md-3">
							<div class="text-xs-right">
								<input type="submit" class="btn btn-info" value="분석" style="width:80px;">
							</div>
						</div>
					</div>
					
		 		</div>
	 		</form>
		</div>
      <!-- /.row -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
   <footer class="main-footer">
    <%@ include file="../include/main_footer.jsp" %>
  </footer>
  
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
	
	<script src="${project}js/pages/amcharts/stock-charts.js" type="text/javascript"></script>
	
	<!-- Crypto_Admin App -->
	<script src="${project}js/template.js"></script>
</body>
</html>
