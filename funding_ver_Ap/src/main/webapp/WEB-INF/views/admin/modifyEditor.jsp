<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Chrome">
        <title>EZ FUND - Fund 게시글 작성</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body id="page-top" data-spy="scroll" data-target=".navbar">
        <%@ include file="../include/top-header.jsp" %>
 
        <!-- ========== Page Title ========== -->
 
        <header class="page-title pt-large pt-light pt-parallax pt-plax-lg-light"
        data-stellar-background-ratio="0.4">
          <div class="container">
              <div class="row">
 
                <div class="col-sm-6">
                  <h1> Funding 수정하기 </h1>
                  <span class="subheading"><span class="et-traget"> Single Product Page</span></span>
                </div>
                <ol class="col-sm-6 text-right breadcrumb">
                  <li><a href="#">펀딩신청</a></li>
                  <li><a href="#">크라우드 펀딩 레포트 수정</a></li>
                  <li class="active">레포트 수정(3)</li>
                </ol>
              </div>
            </div>
        </header>
        
        <!-- ========== Cart Items - (checkout table) ========== -->
        
 		<form action = "modifyEditor1" method="post" name="modifyEditor" onsubmit="return valModifyChk();">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        <input type="hidden" name="fund_id" value="${fund_id}">
		<input type="hidden" name="nonum" value="${nonum}">        
		<div class="container" style="padding-top:0px;">
         
        <div class="col-md-12" style="padding-bottom:0px;">
		
		<h4><span class="linea-basic-pin2"> 화면 구성 정보 </span></h4> 
        <table class="table">
        	<tr>
	       		<td style="background:rgba(244, 244, 244, 0.85); width:250px;">
	       			구분
	       		</td>
	       		<td>
	       			<input type ="radio" name ="content_div" value="s" checked>
	       			<label for ="content_div">스타트업</label>
	       			<input type ="radio" name ="content_div" value="c">
	       			<label for ="content_div">문화 컨텐츠</label>
	       		</td>
        	</tr>
            <tr>
              <td style="background:rgba(244, 244, 244, 0.85); width:250px;">메인 제목</td>
              <td><input class="form-control" type="text" name ="main_subject" id="main_subject" value="${Fundvo.fund_subject}" required></td>
            </tr>
            
            <tr>  
              <td style="background:rgba(244, 244, 244, 0.85);">썸네일 이미지<br><small>(url주소를 입력해주세요)</small></td>
              <td>
			  <input class="form-control" type="url" name="thumbnail" id="thumbnail" value="${Fundvo.fund_thumbnail}" required>
			  </td>
			</tr>
			
			<tr>  
              <td style="background:rgba(244, 244, 244, 0.85);">상세 화면 이미지 및 동영상<br><small>(url주소를 입력해주세요)</small></td>
              <td>
              <input class="form-control" type="url" name="imageAndVideo" id="imageAndVideo" value="${Fundvo.fund_img_and_video}" required>
              </td>
            </tr>
		</table>
		
		<h4><span class="linea-basic-pin2"> 주식 발행 정보 </span></h4> 
        <table class="table">
            <tr>
              <td style="background:rgba(244, 244, 244, 0.85);">주식종류 (모집방법)</td>
              <td>상환전환우선주(공모)</td>
              <td style="background:rgba(244, 244, 244, 0.85);">펀딩기간</td>
              <td>
			  <input class="form-control" type="date" name="fundingDate" id="fundingDate" value="${Stockvo.fund_date}" required>
			  </td>
              <td style="background:rgba(244, 244, 244, 0.85);">목표금액</td>
              <td>
              <input class="form-control" type="text" name="goalPrice" id="goalPrice" value="${Stockvo.fund_target_money}" required>원
              </td>
            </tr>

            <tr>
              <td style="background:rgba(244, 244, 244, 0.85);">액면가액</td>
              <td>
              <input class="form-control" type="text" name="faceAmount" id="faceAmount" value="${Stockvo.fund_par_value}" required>원
              </td>
              <td style="background:rgba(244, 244, 244, 0.85);">발행가액</td>
              <td>
              <input class="form-control" type="text" name="issuingPrice" id="issuingPrice" value="${Stockvo.fund_publish_value}" required>원
              </td>
              <td style="background:rgba(244, 244, 244, 0.85);">최소투자단위</td>
              <td>
              <input class="form-control" type="text" name="minInvPrice" id="minInvPrice" value="${Stockvo.fund_min_invest}" required>원
              </td>
            </tr>
            
            <tr>
              <td style="background:rgba(244, 244, 244, 0.85);">발행예정일</td>
              <td>
              <input class="form-control" type="date" name="publishDate" id="publishDate" value="${Stockvo.fund_schedule_date}" required>
              </td>
              <td style="background:rgba(244, 244, 244, 0.85);">교부예정일</td>
              <td>
              <input class="form-control" type="date" name="issueDate" id="issueDate" value="${Stockvo.fund_delivery_date}" required>
              </td>
              <td style="background:rgba(244, 244, 244, 0.85);">기업가치평가</td>
              <td>
              <input class="form-control" type="text" name="corpValTest" id="corpValTest" value="${Stockvo.fund_eval_value}" required>천원
              </td>
            </tr>
        </table><!-- / .table -->
        <br>
        
        <div class="p-table pt-featured" align="center" style="padding: 40px 40px;">
 
		 	<div class="box-header">
		 	<h3 class="box-title">펀딩 게시글 작성 (1)<br></h3>
		    <input type="text" class="form-control" name="subject" value="기업 소개" readonly>
		    </div>
		  <!-- /.box-header -->
		  <div class="box-body">
		          <textarea id="editor1" name="editor1" rows="10" cols="80" required>
		                 ${Fundvo.fund_company}                
		          </textarea>
		    </div>
		</div>
        <br>
        <div align="center">
			<input class="btn btn-large" type= "submit" value="다음으로">
		</div>
		</div>
   		</div>
   		</form>
   		<br><br>
        <%@ include file="../include/footer.jsp" %>
        <!-- ========== Scripts ========== -->
 
        <script src="${project}assets/js/vendor/jquery-2.1.4.min.js"></script>
        <script src="${project}assets/js/vendor/google-fonts.js"></script>
        <%-- <script src="${project}assets/js/vendor/jquery.easing.js"></script> --%>
        <script src="${project}assets/js/vendor/jquery.waypoints.min.js"></script>
        <script src="${project}assets/js/vendor/bootstrap.min.js"></script>
        <script src="${project}assets/js/vendor/bootstrap-hover-dropdown.min.js"></script>
        <script src="${project}assets/js/vendor/smoothscroll.js"></script>
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
 
        <!-- Definity JS -->
        <script src="${project}assets/js/main.js"></script>
        
    <!-- jQuery 3 -->
	<script src="${project}assets/vendor_components/jquery/dist/jquery.min.js"></script>
	
	<!-- popper -->
	<script src="${project}assets/vendor_components/popper/dist/popper.min.js"></script>
	
	<!-- Bootstrap 4.0-->
	<%-- <script src="${project}assets/vendor_components/bootstrap/dist/js/bootstrap.min.js"></script> --%>
	
	<!-- SlimScroll -->
	<script src="${project}assets/vendor_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	
	<!-- FastClick -->
	<script src="${project}assets/vendor_components/fastclick/lib/fastclick.js"></script>
	
	<!-- Crypto_Admin App -->
	<script src="${project}assets/js/template.js"></script>
	
	<!-- Crypto_Admin for demo purposes -->
	<script src="${project}assets/js/demo.js"></script>	
	
	<!-- CK Editor -->
	<script src="${project}assets/vendor_components/ckeditor/ckeditor.js"></script>
	
	<!-- Bootstrap WYSIHTML5 -->
	<script src="${project}assets/vendor_plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.js"></script>
	
	<!-- Crypto_Admin for editor -->
	<script src="${project}assets/js/pages/editor.js"></script>

    </body>
</html>