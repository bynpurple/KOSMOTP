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
<%-- 	<c:if test="${result == 0}">
		<script type="text/javascript">
			alert("잘못된 입력입니다. 이전페이지로 이동합니다.");
			window.history.back();
		</script>
	</c:if> --%>
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
					<li class="nav-item"><a class="nav-link" href="javascript:void(0)" onclick="location.href='message'"><i class="ion ion-ios-email-outline"></i> 수신 메시지
					  <!-- <span class="label label-success pull-right">12</span>> -->
					  </a>
					  </li>
					<li class="nav-item"><a class="nav-link" href="javascript:void(0)" onclick="location.href='sentMessage'"><i class="ion ion-paper-airplane"></i>보낸 메시지</a></li>
					<li class="nav-item"><a class="nav-link" href="javascript:void(0)" onclick="location.href='deleteMessage'"><i class="ion ion-trash-a"></i>삭제 메시지</a></li>
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
	        <form action="sendMessagePro" name="writeMessageForm" method="post">
	        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	        <input type="hidden" name="username" value="${pageContext.request.userPrincipal.name}">
				<div class="box box-solid bg-dark">
				  <div class="box-header no-border">
					<h3 class="box-title">메시지 작성</h3>
				  </div>
	
				  <div class="box-body bg-dark">
					  <div class="form-group">
						<input type="text" class="form-control" placeholder="받는 이(존재하지 않는 아이디에게 작성 시 전송 실패합니다.)" name="recename">
					  </div>
					  <div class="form-group">
						<input type="text" class="form-control" placeholder="제목(최대 100자까지 작성가능합니다.)" name="message_subject">
					  </div>
					  <div class="form-group">
							<textarea id="compose-textarea" class="form-control h-300" placeholder="총 길이 4000byte입니다.(한글 2000자 /영문 4000자)" name="message_content"></textarea>
					  </div>
				  </div>			  
					<div class="box-footer bg-dark">
					  <div class="pull-right">
						<input type="submit" class="btn btn-success" value="보내기">
					  </div>
					</div>
				</div> 
		    </form>   
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
	
	
</body>
</html>