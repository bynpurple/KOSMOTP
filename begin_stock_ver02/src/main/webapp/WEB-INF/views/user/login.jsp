<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="Chrome">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <%@ include file="../include/header.jsp" %>
    <%@ include file="../include/cssExpansion.jsp" %>
    <link rel="icon" href="${project}images/favicon.ico">

    <title>EZ Stock - Log in </title>
	<script type="text/javascript">
	function join(){
		location.href="${path}/user/join";
	}
	</script>
  
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="${path}/user/trading"><b>EZ</b>Stock</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">로그인 정보를 입력해주세요</p>

    <form action="${path}/user/login_check" method="post" class="form-element">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="ID" name="username">
        <span class="ion ion-email form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Password" name ="password">
        <span class="ion ion-locked form-control-feedback"></span>
      </div>
      <div class="row">

        <!-- /.col -->
        <div class="col-6">
         <div class="fog-pwd">
          	<a href="javascript:void(0)" ><i onclick="findInfo();">아이디 또는 패스워드 찾기</i></a><br>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-12 text-center">
          <button type="submit" class="btn btn-submit btn-block margin-top-10">SIGN IN</button>
        </div>
        <!-- /.col -->
      </div>
    </form>
    <!-- /.social-auth-links -->

    <div class="margin-top-30 text-center">
    	<p>계정이 없으신가요? &nbsp; <a href="${path}/user/join" class="text-info m-l-5">회원가입</a></p>
    </div>

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->


	<!-- jQuery 3 -->
	<script src="${project}assets/vendor_components/jquery/dist/jquery.min.js"></script>
	
	<!-- popper -->
	<script src="${project}assets/vendor_components/popper/dist/popper.min.js"></script>
	
	<!-- Bootstrap 4.0-->
	<script src="${project}assets/vendor_components/bootstrap/dist/js/bootstrap.min.js"></script>

</body>
</html>
