<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="Chrome">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
<%@ include file="../include/header.jsp" %>
    
    <link rel="icon" href="${project}images/favicon.ico">

    <title>Crypto Admin - Registration </title>
    <%@ include file="../include/header.jsp" %>
</head>
<body class="hold-transition register-page">
<div class="register-box">

  <div class="register-box-body">
	  <div class="register-logo">
		<a href="${path}/user/trading"><b>EZ</b>Stock</a>
	  </div>
    <p class="login-box-msg">아래 회원 정보를 입력하세요</p>

    <form action="${path}/user/insertUser" method="post" class="form-element" name="joinForm" onsubmit = "return inputCheck();">
	    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	    <input type="hidden" name="authority" value="ROLE_USER">
	    <input type = "hidden" name = "hiddenId" value = "0">
	    <input type = "hidden" name = "hiddenHp" value = "0">
      <div class="form-group has-feedback" style="height:72.5px;">
        <input type="text" class="form-control" placeholder="ID" name="username" minlength="3" maxlength="16" >
        <span class="ion ion-email form-control-feedback "></span>
        <button style="margin-top:10px;" type="button" class="btn btn-danger pull-right" onclick = "confirmId();">ID CHECK</button>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Password" name="password" >
        <span class="ion ion-locked form-control-feedback "></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Retype Password" name="repassword" >
        <span class="ion ion-log-in form-control-feedback "></span>
      </div>
      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="Full name" name="name" >
        <span class="ion ion-person form-control-feedback "></span>
      </div>
      <div class="form-group has-feedback" style="height:72.5px;">
        <input type="text" class="form-control" placeholder="H.P (ex 01012345678)" name="hp" >
        <span class="ion ion-person form-control-feedback "></span>
        <button style="margin-top:10px;" type="button" class="btn btn-danger pull-right" onclick = "confirmHp();">H.P CHECK</button>
      </div>
      <div class="row">
        <div class="col-12">
          <div class="checkbox">
            <input type="checkbox" id="basic_checkbox_1" >
			<label for="basic_checkbox_1">약관동의</label>&nbsp;&nbsp;&nbsp;<span onclick="confirmTerms();"><b>[전문보기]</b></span>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-12 text-center">
          <button type="submit" class="btn btn-submit btn-block margin-top-10">SIGN UP</button>
        </div>
        <!-- /.col -->
      </div>
    </form>
    
     <div class="margin-top-20 text-center">
    	<p>이미 가입한 계정이 있습니까?<a href="${path}/user/login" class="text-info m-l-5"> 로그인하기</a></p>
     </div>
  </div>
  <!-- /.form-box -->
</div>
<!-- /.register-box -->
	
</body>
</html>
