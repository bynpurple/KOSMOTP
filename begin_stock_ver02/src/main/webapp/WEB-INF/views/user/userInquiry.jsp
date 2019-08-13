<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html lang="ko">
<head>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
	<%@ include file="../include/header.jsp" %>
	<link rel="icon" href="${project}images/favicon.ico">
	<script src="/stock/resources/js/jquery-3.4.1.min.js"></script>
	<c:set var ="project" value="/stock/resources/"/>

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
	
	<!-- Crypto_Admin for demo purposes -->
	<script src="${project}js/pages/market-capitalizations.js"></script>
	<script type="text/javascript">
		function moveWriForm(){
			location.href="userWriterForm";
		}
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
    <%@ include file="../stock/side_menu.jsp" %>
  </aside>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
       	 1대1 문의
      </h1>
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i>홈</a></li>
        <li class="breadcrumb-item"><a href="#">고객센터</a></li>
        <li class="breadcrumb-item active">1대1문의</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	  <h1 class="page-header text-center mt-30 mb-30">
		  <span class="text-bold text-yellow">EZ-STOCK 1대1 문의</span><br>
		  <p class="font-size-18 mb-0">1대1 문의 사항 입니다.</p>
	  </h1>
	  </section>
	  <div class="box">
	        <div class="box-header with-border">
	          <button class="btn btn-block btn-info btn-lg" onclick="moveWriForm();">1대1문의</button>
	        </div>
	        <!-- /.box-header -->
<div class="box-body">
	<div class="table-responsive">
	  <table id="example1" class="table table-bordered table-striped">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${cnt > 0}">
				<c:forEach var="dto" items="${dtos}">
				<tr>
					<th align="center">
						${dto.num}
					</th>
					<th align="left">
					<!-- 답글인 경우 : 들여쓰기 > 1  -->
					<c:if test="${dto.ref_level > 1 }">
						<c:set var="wid" value="${(dto.ref_level-1) * 10}" />
						<img src ="${project}images/level.gif" border = "0" width="${wid}" height="15">
					</c:if>
					
					<!-- 답글인 경우 : 들여쓰기 > 0  -->
					<c:if test="${dto.ref_level > 0 }">
						<c:set var="wid" value="${(dto.ref_level-1) * 10}" />
						<img src ="${project}images/re.gif" border="0" width="20" height="15">
					</c:if>
					<!-- hot 이미지  -->
					<c:if test="${dto.readCnt > 10 }">
						<c:set var="wid" value="${(dto.ref_level-1) * 10}" />
						<img src ="${project}images/hot.gif" border="0" width="20" height="15">
					</c:if>					
						<!-- 상세페이지  -->
						<a href="usercontentForm?num=${dto.num}&pageNum=${pageNum}">${dto.subject}</a><!-- 상세페이지를 갈때 항상 key,현재페이지번호를 들고가야함  -->
						<!-- contentForm.bo 갈때 num,pageNum,number를 가져간다-->
					</th>
					<th align="center">
					 ${dto.writer}
					</th>
					<th align="center">
					${dto.readCnt}
					</th>
					<th align="center">
						<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.reg_date}" />
					</th>
				</tr>
				</c:forEach>
			</c:if>
		</tbody>
	  </table>
	</div>
 </div>
	        <!-- /.box-body -->
	</div>
	
</div>
 	<!-- jQuery 3 -->
	<script src="${project}assets/vendor_components/jquery/dist/jquery.min.js"></script>
	
	<!-- popper -->
	<script src="${project}assets/vendor_components/popper/dist/popper.min.js"></script>
	
	<!-- Bootstrap 4.0-->
	<script src="${project}assets/vendor_components/bootstrap/dist/js/bootstrap.min.js"></script>
	
	<!-- DataTables -->
	<script src="${project}assets/vendor_components/datatables.net/js/jquery.dataTables.min.js"></script>
	<script src="${project}assets/vendor_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	
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
    
    <!-- start - This is for export functionality only -->
    <script src="${project}assets/vendor_plugins/DataTables-1.10.15/extensions/Buttons/js/dataTables.buttons.min.js"></script>
    <script src="${project}assets/vendor_plugins/DataTables-1.10.15/extensions/Buttons/js/buttons.flash.min.js"></script>
    <script src="${project}assets/vendor_plugins/DataTables-1.10.15/ex-js/jszip.min.js"></script>
    <script src="${project}assets/vendor_plugins/DataTables-1.10.15/ex-js/pdfmake.min.js"></script>
    <script src="${project}assets/vendor_plugins/DataTables-1.10.15/ex-js/vfs_fonts.js"></script>
    <script src="${project}assets/vendor_plugins/DataTables-1.10.15/extensions/Buttons/js/buttons.html5.min.js"></script>
    <script src="${project}assets/vendor_plugins/DataTables-1.10.15/extensions/Buttons/js/buttons.print.min.js"></script>
    <!-- end - This is for export functionality only -->
	
	<!-- Crypto_Admin for Data Table -->
	<script src="${project}js/pages/data-table.js"></script>
 

</body>
</html>