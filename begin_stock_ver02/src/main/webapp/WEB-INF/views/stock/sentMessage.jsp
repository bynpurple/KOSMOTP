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
	<c:if test="${pageContext.request.userPrincipal.name != param.username}">
		<script type="text/javascript">
			alert("잘못된 입력입니다. 이전페이지로 이동합니다.");
			location.href="logout";
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
      <h1>
        EZ STOCK 메시지
      </h1>
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="breadcrumb-item active">EZ STOCK 메시지</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-lg-3 col-12">
		  <div class="box box-body h-p100">
			  <a href="writeMessage" class="btn btn-success btn-block btn-shadow margin-bottom p-15" style="color:white;">메시지 작성</a>

			  <div class="box no-shadow">
				<div class="box-body no-padding mailbox-nav">
				  <ul class="nav nav-pills flex-column">
					<li class="nav-item"><a class="nav-link" href="javascript:void(0)" onclick="location.href='message?username=${pageContext.request.userPrincipal.name}'"><i class="ion ion-ios-email-outline"></i> 수신 메시지
					  <!-- <span class="label label-success pull-right">12</span>> -->
					  </a>
					  </li>
					<li class="nav-item"><a class="nav-link active" href="javascript:void(0)" onclick="location.href='sentMessage?username=${pageContext.request.userPrincipal.name}'"><i class="ion ion-paper-airplane"></i>보낸 메시지</a></li>
					<li class="nav-item"><a class="nav-link" href="javascript:void(0)" onclick="location.href='deleteMessage?username=${pageContext.request.userPrincipal.name}'"><i class="ion ion-trash-a"></i>삭제 메시지</a></li>
				  </ul>
				</div>
				<!-- /.box-body -->
			  </div>
			  <!-- /. box -->
		  </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-lg-9 col-12">			
			<div class="box">
			  <div class="box-header bg-dark no-border">
				<h3 class="box-title">보낸 메시지</h3>
			  </div>

			  
			  <div class="box-body">
				<div class="table-responsive">
				  <table id="example" class="table table-bordered table-hover display nowrap margin-top-10 w-p100" style="border-left: 0px solid black !important;border-right: 0px solid black !important;">
					<thead>
						<tr>
							<th style="color:white;font-weight:normal;border-left: 0px solid black !important;border-right: 0px solid black !important;">받은 이</th>
						  	<th style="color:white;font-weight:normal;border-left: 0px solid black !important;border-right: 0px solid black !important;">메시지 제목</th>
						  	<th style="color:white;font-weight:normal;border-left: 0px solid black !important;border-right: 0px solid black !important;">보낸 시간</th>
						  	<th style="color:white;font-weight:normal;border-left: 0px solid black !important;border-right: 0px solid black !important;">받은 시간</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${mList_sent}">
						  	<tr>
							<td class="mailbox-name" style="border-left: 0px solid black !important;border-right: 0px solid black !important;">${list.receivename}</td>
							<td class="mailbox-subject" style="border-left: 0px solid black !important;border-right: 0px solid black !important;"><a href="readMessage?message_id=${list.message_id}" style="color:#dee2e6;">${list.message_subject}</a></td>
							<td class="mailbox-date" style="border-left: 0px solid black !important;border-right: 0px solid black !important;"><fmt:formatDate value="${list.message_senddate}" pattern="MM-dd HH:mm" /></td>
							<c:if test="${fn:contains(list.errored, 'n')}">
								<c:if test="${list.message_readdate == null}">
								<td class="mailbox-date" style="border-left: 0px solid black !important;border-right: 0px solid black !important;">안 읽음</td>
								</c:if>
								<c:if test="${list.message_readdate != null}">
									<td class="mailbox-date" style="border-left: 0px solid black !important;border-right: 0px solid black !important;"><fmt:formatDate value="${list.message_readdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								</c:if>
							</c:if>
							<c:if test="${fn:contains(list.errored, 'y')}">
								<td class="mailbox-date" style="color:#dc3545;border-left: 0px solid black !important;border-right: 0px solid black !important;">전송실패</td>
							</c:if>
							
						  </tr>
						  </c:forEach>
					</tbody>			  

				</table>
				</div>              
            </div>
            			  
			</div> 
			
          <!-- /. box -->
        </div>
        <!-- /.col -->
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
	
	<!-- iCheck -->
	<script src="${project}assets/vendor_plugins/iCheck/icheck.js"></script>
	
	<!-- Crypto_Admin for mailbox -->
	<script src="${project}js/pages/mailbox.js"></script>
	
	<!-- Crypto_Admin for demo purposes -->
	<script src="${project}js/demo.js"></script>
	
	<!-- This is data table -->
    <script src="${project}assets/vendor_plugins/DataTables-1.10.15/media/js/jquery.dataTables.min.js"></script>
	
	<!-- Crypto_Admin for Data Table -->
	<script src="${project}js/pages/data-table.js"></script>
	
	
</body>
</html>