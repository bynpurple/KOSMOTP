<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>
<!doctype html>
<html class="no-js" lang="ko">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Chrome">
        <title>이지 펀딩</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body id="page-top">
    	<%@ include file="../include/top-header.jsp" %>
        <!-- ========== Page Title ========== -->

        <header class="page-title pt-large pt-light pt-parallax pt-plax-lg-light">
          <div class="container">
            <div class="row">
              <h1 class="col-sm-6">Login Page</h1>
              <ol class="col-sm-6 text-right breadcrumb">
                <li><a href="#">Home</a></li>
                <li><a href="#">Login</a></li>
              </ol>
            </div>
          </div>
        </header>

        <!-- ========== Login From ========== -->

        <div class="login-1">
          <div class="bg-overlay">
            <div class="container">
              <div class="row">
                <div class="col-md-offset-3 col-md-6">
                  
                  <!-- Log in -->
                  <div class="panel-group" id="login-accordion" role="tablist" aria-multiselectable="true">
                    <div class="panel top-panel panel-default">
                      <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">
                          <a role="button" data-toggle="collapse" data-parent="#login-accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            Login to your account
                          </a>
                        </h4>
                      </div>
                      <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body">

                          <div class="form-login">
                            <form action="${path}/user/loginPro" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                              <!-- Username -->
                              <div class="form-group">
                                <label for="username-login-1">ID</label>
                                <input type="text" id="username" name="username" class="form-control" placeholder="Enter your ID">
                              </div>
                              <!-- Password -->
                              <div class="form-group">
								<label for="pass-login-1">Password</label>
                                <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password">
                                <span class="pull-right"><a href="#" class="forget-pass-link"><i onclick="findInfo();">Find Member Information</i></a></span>
                              </div>
                              <!-- Submit -->
                              <input type="submit" value="Login" class="btn">
                            </form>
                          </div><!-- / .form-wrapper -->

                        </div><!-- / .panel-body -->
                      </div><!-- / .panel-collapse -->
                    </div><!-- / .panel -->
                    
                    <!-- Register Account -->
                    <div class="panel bottom-panel panel-default">
                      <div class="panel-heading" role="tab" id="headingTwo">
                        <h4 class="panel-title">
                          <a class="collapsed" role="button" data-toggle="collapse" data-parent="#login-accordion" href="#register-login-page-2" aria-expanded="false" aria-controls="register-login-page-2">
                            Register account
                          </a>
                        </h4>
                      </div>
                      <div id="register-login-page-2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body">

                          <div class="form-register">
                            <form action="${path}/user/insertUser" method="post" name="joinForm" onsubmit = "return inputCheck();">
 	                           <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
 	                           	    <input type = "hidden" name = "hiddenId" value = "0">
								    <input type = "hidden" name = "hiddenHp" value = "0">
                              <div class="form-group">
                                <input type="text" id="name-signup-1" name="name" class="form-control" placeholder="Enter your name" required>
                                <label for="re-pass-signup-1">Name</label>
                              </div>
                              <!-- Email -->
                              <div class="form-group">
                                <input type="text" id="email-signup-1" name="username" class="form-control" placeholder="Enter your ID" required>
                                <div style="margin-top:10px; margin-botton:20px;">
                                	<label for="email-signup-1">ID</label>
	                                <input type="button" style="width:160px; float:right;" value="ID Check" class="btn" onclick="confirmId();">
                                </div>
                              </div>
                              <!-- Password -->
                              <div class="form-group">
                                <input type="password" id="pass-signup-1" name="password" class="form-control" placeholder="Enter a password" required>
                                <label for="pass-signup-1">Password</label>
                              </div>
                              <!-- Re-Enter Password -->
                              <div class="form-group">
                                <input type="password" id="re-pass-signup-1" name="repassword" class="form-control" placeholder="Re-enter your password" required>
                                <label for="re-pass-signup-1">Re-enter password</label>
                              </div>
                              <!-- Newsletter check -->
                              <div class="form-group">
                                <input type="text" id="hp-signup-1" name="hp" class="form-control" placeholder="Enter your HP" required>
                                <div style="margin-top:10px;">
                                	<label for="re-pass-signup-1">HP</label>
	                                <input type="button" style="width:160px; float:right;" value="HP Check" class="btn" onclick="confirmHp();">
                                </div>
                              </div>
                              <!-- Submit -->
                              <div align="center" class = "form-group" style="margin-top:50px;">
                              <input type="submit" value="Register" class="btn">
                              </div>
                            </form>
                          </div><!-- / .form-wrapper -->

                        </div><!-- / .panel-body -->
                      </div><!-- / #register-login-page-2 .panel-colapse -->
                    </div><!-- / .panel -->
                  </div><!-- / #login-accordion .panel-group -->


                </div><!-- / .col-md-6 -->
              </div><!-- / .row -->
            </div><!-- / .container -->

          </div><!-- / .bg-overlay -->
        </div><!-- / .bg-login -->



        <!-- ========== Footer Widgets ========== -->
        
        <%@ include file="../include/footer.jsp" %>

        <!-- ========== Scripts ========== -->

        <script src="${project }assets/js/vendor/jquery-2.1.4.min.js"></script>
        <script src="${project }assets/js/vendor/google-fonts.js"></script>
        <script src="${project }assets/js/vendor/jquery.easing.js"></script>
        <script src="${project }assets/js/vendor/jquery.waypoints.min.js"></script>
        <script src="${project }assets/js/vendor/bootstrap.min.js"></script>
        <script src="${project }assets/js/vendor/bootstrap-hover-dropdown.min.js"></script>
        <script src="${project }assets/js/vendor/smoothscroll.js"></script>
        <script src="${project }assets/js/vendor/jquery.localScroll.min.js"></script>
        <script src="${project }assets/js/vendor/jquery.scrollTo.min.js"></script>
        <script src="${project }assets/js/vendor/jquery.stellar.min.js"></script>
        <script src="${project }assets/js/vendor/jquery.parallax.js"></script>
        <script src="${project }assets/js/vendor/slick.min.js"></script>
        <script src="${project }assets/js/vendor/jquery.easypiechart.min.js"></script>
        <script src="${project }assets/js/vendor/countup.min.js"></script>
        <script src="${project }assets/js/vendor/isotope.min.js"></script>
        <script src="${project }assets/js/vendor/jquery.magnific-popup.min.js"></script>
        <script src="${project }assets/js/vendor/wow.min.js"></script>

        <!-- Definity JS -->
        <script src="${project }assets/js/main.js"></script>
    </body>
</html>
