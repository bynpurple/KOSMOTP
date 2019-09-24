<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="ko">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Chrome">
        <title>Definity - Shop Checkout Page</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
      
    </head>
    <body id="page-top" data-spy="scroll" data-target=".navbar">
        <%@ include file="../include/top-header-non.jsp" %>
        <!-- ========== Page Title ========== -->

        <header class="page-title pt-light pt-plax-md-light"
        data-stellar-background-ratio="0.4">
          <div class="container">
              <div class="row">

                <div class="col-sm-6">
                  <h1>1대1문의</h1>
	                </div>
                <ol class="col-sm-6 text-right breadcrumb">
                  <li><a href="#">더보기</a></li>
                  <li><a href="#">공지</a></li>
                  <li class="active">1대1문의</li>
                </ol>

              </div>
            </div>
        </header>


        
        <!-- ========== Cart Items - (checkout table) ========== -->

        <div class="container section" style="padding-top:50px;">
          <div class="row">
          
   
      
         <!-- Product Info - (tabs) -->
          <div class="row" style="margin-top:60px;">
            <div class="col-md-12" style="padding-bottom:120px;">
              <!-- Nav tabs -->
              <ul class="nav nav-tabs" role="tablist" style="padding-bottom:50px;">
             <!--  <ul id="pfolio-filters" role="tablist" class="portfolio-filters" style="font-size:25px;"> -->
                <li role="presentation" class="active"><a href="#tab-description" aria-controls="tab-description" role="tab" data-toggle="tab">1대1문의</a></li>
              </ul>
              

            <form name = "removeFrm">  
	  <div class="col-12" style="margin-left:80px">
 		<div class="box">
		  <table id="example1" style="width:1050px;" class="table table-bordered table-striped"  >
			<tr>
				<td align="center" width="100px"> 작성일 </td>
				<td colspan="2" align="center">
					<fmt:formatDate  type="both" pattern="yyyy-MM-dd HH:mm"  value="${dto.reg_date}"/>
				</td>
			</tr>
			<tr>
				<td align="center" > 글제목 </td>
				<td colspan="3" align="center">
					${dto.subject}
				</td>
			</tr>
			<tr>
				<td align="center"> 글내용 </td>
				<td colspan="3" style="word-break:break-all; height:500px; text-align:left; vertical-align:top;">
					${dto.content}
				</td>
			</tr>
		  </table >
		   <div style='display:inline;'>
	              <div style="display:inline;float:right;">
	              </div>
					  <div style="width:1050px; height:40px;" align="center">
						  <input class="btn" type="button" style="width:150px;" value="수정" onclick="window.location='usermodifyForm?num=${dto.num}'">
						  <input class="btn" type="button" style="width:150px;" value="삭제" onclick="window.location='userdeletePro?num=${dto.num}&writer=${dto.username}'">
						  <input class="btn" type="button" style="width:150px;" value="목록"  onclick="history.go(-1);">
				  </div>
			  </div>
		    </div>
				    </div>
					</form>
					</div>
			</div>
		</div>
		<table id="example2" style="width:1050px; margin-left:80px;" class="table table-bordered table-striped">
			<c:forEach var ="dtos" items = "${dtos}">
			<tr>
				<td style="text-align:left"> ${dtos.content} </td>
				<td align="center" width="15%">
					<fmt:formatDate  type="both" pattern="yyyy-MM-dd HH:mm"  value="${dtos.co_reg_date}"/>
				</td>
			</tr>
			</c:forEach>
		</table>
		<c:if test="${pageContext.request.userPrincipal.name == 'host'}">
			<form action="${path}/user/commentPro" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" name="num" value="${num}">
				<input type="hidden" name="username" value="${dto.username}">
				<input type="hidden" name="name" value="${dto.name}">
			    <!-- Main content -->
				    <div class="box-body" style="width:90%; margin-left:80px">
	                   <textarea id="editor1" name="editor1" rows="10" cols="50">
	                   	이곳에 작성할 내용을 적어주세요
	                   </textarea>
	                   </div>
			    <!-- /.content -->
			    <input type="submit" style="width:150px; margin-left:45%" type="button" class="btn">
			</form>
		</c:if>
	</div>
	
	<!-- footer -->
	<%@ include file = "../include/footer.jsp" %>
	
	<!-- ========== Scripts ========== -->
	
	<script src="${project}assets/js/vendor/jquery-2.1.4.min.js"></script>
	<script src="${project}assets/js/vendor/google-fonts.js"></script>
	<script src="${project}assets/js/vendor/jquery.easing.js"></script>
	<script src="${project}assets/js/vendor/jquery.waypoints.min.js"></script>
	<script src="${project}assets/js/vendor/bootstrap.min.js"></script>
	<script src="${project}assets/js/vendor/bootstrap-hover-dropdown.min.js"></script>
	<script src="${project}assets/js/vendor/jquery.localScroll.min.js"></script>
	<script src="${project}assets/js/vendor/jquery.scrollTo.min.js"></script>
	<script src="${project}assets/js/vendor/jquery.stellar.min.js"></script>
	<script src="${project}assets/js/vendor/jquery.parallax.js"></script>
	<script src="${project}assets/js/vendor/slick.min.js"></script>
	<script src="${project}assets/js/vendor/jquery.easypiechart.min.js"></script>
	<script src="${project}assets/js/vendor/countup.min.js"></script>
	<script src="${project}assets/js/vendor/isotope.min.js"></script>
	<script src="${project}assets/js/vendor/jquery.magnific-popup.min.js"></script>
	<script src="${project}assets/js/vendor/wow.min.js"></script>
	<script src="${project}assets/js/vendor/jquery.parallax.js"></script>
	<script src="${project}assets/vendor_components/jquery/dist/jquery.min.js"></script>
	<script src="${project}assets/vendor_components/popper/dist/popper.min.js"></script>
	<script src="${project}assets/vendor_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="${project}assets/vendor_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="${project}assets/vendor_components/fastclick/lib/fastclick.js"></script>
	<script src="${project}js/template.js"></script>
	<script src="${project}js/demo.js"></script>	
	<script src="${project}assets/vendor_components/ckeditor/ckeditor.js"></script>
	<script src="${project}assets/vendor_plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.js"></script>
	<script src="${project}js/pages/editor.js"></script>
	<script src="${project}js/common.js"></script>
	
	<!-- Definity JS -->
	<script src="${project}assets/js/main.js"></script>
</body>
</html>
