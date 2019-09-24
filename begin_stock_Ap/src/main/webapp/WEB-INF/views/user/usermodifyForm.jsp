<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>
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
	  <form action="${path}/user/usermodifyPro" method="post" name="usermodifyform">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		
		<input type="hidden" name="num" value="${num}">
		<input type="hidden" name="ref" value="${ref}">
		<input type="hidden" name="ref_step" value="${ref_step}">
		<input type="hidden" name="ref_level" value="${ref_level}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="writer" value="${pageContext.request.userPrincipal.name}">
		
		<!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-12">
          <div class="box">
          
            <div class="box-header">
              <h3 class="box-title">&nbsp;<br>
              </h3>
              <input type="text" class="form-control" placeholder="변경할 제목을 입력하세요" name="subject" required>
              <!-- tools box -->
              <div class="pull-right box-tools">
                <button type="button" class="btn btn-info btn-sm" data-widget="collapse" data-toggle="tooltip"
                        title="Collapse">
                  <i class="fa fa-minus"></i></button>
                <button type="button" class="btn btn-info btn-sm" data-widget="remove" data-toggle="tooltip"
                        title="Remove">
                  <i class="fa fa-times"></i></button>
              </div>
              <!-- /. tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                    <textarea id="editor1" name="editor1" rows="10" cols="80">
                    	변경할 내용을 입력해주세요
                    </textarea>
              <div style='display:inline;'>
	              <div style='display:inline;float:right; margin-left:10px;'><input class="btn btn-block btn-default btn-lg" type="submit" style="width:150px;" value="수정"></div>
				  <div style='display:inline;float:right; margin-left:10px;'><input class="btn btn-block btn-default btn-lg" type="reset" style="width:150px;" value="취소"></div>
				  <div style='display:inline;float:right; margin-left:10px;'><input class="btn btn-block btn-default btn-lg" type="button" style="width:150px;" value="목록" onclick="window.history.go(-1);"></div>
			  </div>
            </div>
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col-->
      </div>
      <!-- ./row -->
    </section>
    <!-- /.content -->
	</form>
	</div>
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
	
	<!-- Crypto_Admin for demo purposes -->
	<script src="${project}js/demo.js"></script>	
	
	<!-- CK Editor -->
	<script src="${project}assets/vendor_components/ckeditor/ckeditor.js"></script>
	
	<!-- Bootstrap WYSIHTML5 -->
	<script src="${project}assets/vendor_plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.js"></script>
	
	<!-- Crypto_Admin for editor -->
	<script src="${project}js/pages/editor.js"></script>
</body>
</html>