<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="${project}images/favicon.ico">

    <title> Economy News </title>
  
	<!-- Bootstrap 4.0-->
	<link rel="stylesheet" href="${project}assets/vendor_components/bootstrap/dist/css/bootstrap.min.css">
	
	<!-- Bootstrap extend-->
	<link rel="stylesheet" href="${project}css/bootstrap-extend.css">

	<!-- Theme style -->
	<link rel="stylesheet" href="${project}css/master_style.css">

	<!-- Crypto_Admin skins -->
	<link rel="stylesheet" href="${project}css/skins/_all-skins.css">	

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body class="hold-transition skin-black sidebar-mini">


<!-- Site wrapper -->
<div class="wrapper">
	<header class="main-header">
		<%@ include file="../include/main_header.jsp" %>
	</header>
	  
	<aside class="main-sidebar">
		<%@ include file="side_menu.jsp" %>
	</aside>
  
  <!-- ===============main content================================ -->
  <!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<section class="content-header">
			<h1>금융 뉴스 </h1>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="trading"><i class="fa fa-dashboard"></i> 홈</a></li>
				<li class="breadcrumb-item"><a href="choicetheme">테마 분석 및 뉴스</a></li>
				<li class="breadcrumb-item active">테마별 경제 뉴스</li>
			</ol>
		</section>

		<form action="news222">
			<section class="content">
			
				<!-- 1번째 칸 -->
				<div class="row">
					<div class="col-lg-6 col-md-12">
						<div class="box pull-up text-center bg-success bg-banknote-white" style="height:190px;" id="news1">			 
							<div class="box-body" style="padding-top:65px;">
								<span class="glyphicon glyphicon-list-alt font-size-50">
								<input type="submit" name="button" value="1" style="border:0; outline:0; background-color:transparent; color:white;">. 시황·전망  </span>
							</div>
						</div>
					</div>
				   
				   
				    <!-- 2. 기업·종목분석 -->
					<div class="col-lg-6 col-md-12">                         
				   		<!-- Default box -->
						<div class="box pull-up text-center bg-info bg-banknote-white" style="height:190px;" id="news2">
							<div class="box-body" style="padding-top:65px;">
								<span class="glyphicon glyphicon-list-alt font-size-50">
								<input type="submit" name="button" value="2" style="border:0; outline:0; background-color:transparent; color:white;">. 기업·종목분석 </span>
							</div>
						</div>
					</div>
					
				</div> 
				
				
				<!-- 결과칸  -->
				<div id="news1row">
					<div class="box box-inverse box-dark">
			
					<!-- 결과칸  칸별 이름변경  -->
					<c:if test="${button == 1}">
						<div class="box-header with-border">
							<h3 class="box-title"> 시황·전망 </h3>
						</div>
					</c:if>
			
					<c:if test="${button == 2}">
						<div class="box-header with-border">
							<h3 class="box-title"> 기업·종목분석</h3>
						</div>
					</c:if>
			
					<c:if test="${button == 3}">
						<div class="box-header with-border">
							<h3 class="box-title"> 채권·선물 </h3>
						</div>
					</c:if>
					
					<c:if test="${button == 4}">
						<div class="box-header with-border">
							<h3 class="box-title"> 공시·메모 </h3>
						</div>
					</c:if>
			
						<div class="box-body">
						   	<div class="row">
			
							<c:forEach var="dto" items="${newsList2}">
			   
						   		<div class="col-md-6 col-12">
									<div class="box bg-inverse bg-dark" style="height:100px;">
										<div class="media-list media-list-divided media-list-hover">
											<div class="media">
												<div class="media-body">
													<h5>${dto.title}</h5>
													<p>${dto.lede}</p>
												</div>
											<a class="btn" href="${dto.link}" target="_blank" style="color:white; float:right;">Read more</a>
											</div> <!-- media -->
			
										</div>
									</div>
								</div>
							</c:forEach>
			
							</div>
						</div>
					</div>
				</div>  <!-- 결과칸 끝! -->
			
			
			
			
				<!-- 2번째 줄 -->
				<div class="row">
				
					<!-- 3.채권·선물 -->
					<div class="col-lg-6 col-md-12">                         
					   	<!-- Default box -->
						<div class="box pull-up text-center bg-pink bg-banknote-white" style="height:190px;" id="news3">			 
							<div class="box-body" style="padding-top:65px;">
								<span class="glyphicon glyphicon-list-alt font-size-50">
								<input type="submit" name="button" value="3" style="border:0; outline:0; background-color:transparent; color:white;">. 채권·선물 </span>
							</div>
						</div>
					</div>
						
						<!-- 4.  공시·메모 --> 
					<div class="col-lg-6 col-md-12">                         
				  	   	<!-- Default box -->
						<div class="box pull-up text-center bg-primary bg-banknote-white" style="height:190px;" id="news4">			 
							<div class="box-body" style="padding-top:65px;">
								<span class="glyphicon glyphicon-list-alt font-size-50">
								<input type="submit" name="button" value="4" style="border:0; outline:0; background-color:transparent; color:white;">. 공시·메모 </span>
							</div>
						</div>
					</div>
					
				</div>
				<!-- 2번째 줄 종료-->
			</section>  
		</form> 
		     
     
      </div> <!-- row --> 
	      
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
	<script src="${project}assets/vendor_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <script type="text/javascript">
        $('#slimtest1').slimScroll({
            height: '250px'
        });
        $('#slimtest2').slimScroll({
            height: '250px'
        });
        $('#slimtest3').slimScroll({
            position: 'left'
            , height: '250px'
            , railVisible: true
            , alwaysVisible: true
        });
        $('#slimtest4').slimScroll({
            color: '#00f'
            , size: '10px'
            , height: '250px'
            , alwaysVisible: true
        });
    </script>
	
	<!-- FastClick -->
	<script src="${project}assets/vendor_components/fastclick/lib/fastclick.js"></script>
	
	<!-- Crypto_Admin App -->
	<script src="${project}js/template.js"></script>
	
	<!-- Crypto_Admin for demo purposes -->
	<script src="${project}js/demo.js"></script>
	

</body>
</html>
