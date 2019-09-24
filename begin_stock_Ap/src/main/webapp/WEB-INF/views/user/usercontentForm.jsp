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
	<form name = "removeFrm">  
	  <div class="col-12" style="width:90%; margin-left:80px">
 		<div class="box">
		  <table id="example1" class="table table-bordered table-striped"  >
			<tr>
				<td align="center" width="200px"> 작성일 </td>
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
				<td colspan="3" word-break:break-all height="500px">
					${dto.content}
				</td>
			</tr>
		  </table>
		   <div style='display:inline;'>
	              <div style='display:inline;float:right; margin-left:10px;'><input class="btn btn-block btn-default btn-lg" type="button" style="width:150px;" value="수정" onclick="window.location='usermodifyForm?num=${dto.num}'">
	              </div>
				  <div style='display:inline;float:right; margin-left:10px;'><input class="btn btn-block btn-default btn-lg" type="button" style="width:150px;" value="삭제" onclick="window.location='userdeletePro?num=${dto.num}&writer=${dto.writer}'">
				  </div>
				  <div style='display:inline;float:right; margin-left:10px;'><input class="btn btn-block btn-default btn-lg" type="button" style="width:150px;" value="목록"  onclick="window.location='userInquiry?writer=${pageContext.request.userPrincipal.name}'">
		  </div>
	  </div>
    </div>
    </div>
    <section class="content">
      <!-- Default box -->
      <div class="box" style="width:90%; margin-left:80px">
        <div class="box-body" >
        <table>
	        <c:forEach var ="dtos" items = "${dtos}">
				<tr>
					<th align="center">
						${dtos.comments}
					</th>
					<th width="10%">
						<fmt:formatDate type = "both" pattern = "yyyy-MM-dd HH:mm" value = "${dtos.comment_date}"/>
					</th>
				</tr>
			</c:forEach>
		</table>
        <!-- /.box-body -->
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->
	</div>
    </section>
	</form>
	<!-- 댓글 달기 -->
	  <c:if test="${pageContext.request.userPrincipal.name == 'host'}">
		<!-- Content Wrapper. Contains page content -->
		    <!-- Content Header (Page header) -->
			<form action="${path}/user/commentPro" method="post" align="center">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" name="num" value="${num}">
				<input type="hidden" name="username" value="${dto.writer}">
			    <!-- Main content -->
				    <div class="box-body" style="width:90%; margin-left:80px">
                    <textarea id="editor1" name="editor1" rows="10" cols="50">
                    	이곳에 작성할 내용을 적어주세요
                    </textarea>
                    </div>
			    <!-- /.content -->
			    <input type="submit" style="width:150px; margin-left:45%" type="button" class="btn btn-block btn-default btn-lg">
			    </form>
		  </c:if>
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