<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<%@ include file = "../include/header.jsp" %>
<html class="no-js" lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Chrome">
    <title>Definity - Shop Checkout Page</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<script src="/stock/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#modifyChk').click(function(){
			var id = document.fundId.pls.value;
			var data = "<iframe src=modifyEditor?fund_id="+id+" width ='100%' height ='100%' id='hostframe'></iframe>";
			$('#login-accordion').css("visibility","hidden");
			$('#modify').html(data);
			$('#modify').css("height","1200px");
		});
	});
</script>
	    	
<body id="page-top" data-spy="scroll" data-target=".navbar">
<c:if test="${pageContext.request.userPrincipal.name != 'host'}">
	<script type="text/javascript">
		alert("해당 페이지는 관리자만 접근 가능한 페이지입니다. \n메인 페이지로 이동합니다.");
		location.href = "${path}/user/main";
	</script>
</c:if>
<%@ include file="../include/top-header.jsp" %>
<!-- ========== Page Title ========== -->
	<header class="page-title pt-light pt-plax-md-light" data-stellar-background-ratio="0.4">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<h1>관리자페이지</h1>			
					<span class="subheading">EZ FUND 관리자 페이지입니다</span>	
				</div>
				<ol class="col-sm-6 text-right breadcrumb">	
					<li><a href="#">관리자</a></li>
					<li><a href="#">관리자페이지</a></li>	
				</ol>
			</div>
		</div>
	</header>
        
      <!-- ========== Number Counters ========== -->
	<div class="number-counters">
		<div class="container">
			<div class="row count-wrapper">
				<!-- Item 1 -->
					<div class="col-md-3 mb-sm-100 count-item">
						<span class="count-nbr">${memcnt}</span>
				 		<span class="count-text">EZ FUND 회원수</span>
					</div>

					<!-- Item 2 -->
             		<div class="col-md-3 mb-sm-100 count-item">
                		<span class="count-nbr">0</span>
                		<span class="count-text">예정 펀드</span>
              		</div>

              		<!-- Item 3 -->
              		<div class="col-md-3 mb-sm-100 count-item">
                		<span id="count-3" class="count-nbr">${fundingCnt}</span>
                		<span class="count-text">진행 펀드</span>
              		</div>

              		<!-- Item 4 -->
           			<div class="col-md-3 count-item">
                		<span id="count-4" class="count-nbr">0</span>
						<span class="count-text">종료 펀드</span>
              		</div>
           		</div><!-- / .row -->
        	</div><!-- / .container -->
        </div><!-- / .number-counters -->       
        
		<!-- ========== 테이블 ========== -->
		<div class="container section" style="padding-top:50px;">
    		<div class="row">
        		<!-- Product Info - (tabs) -->
        		<div class="row" style="margin-top:60px;">
            		<div class="col-md-12" style="padding-bottom:120px;">
          		    	<!-- Nav tabs -->
              			<ul class="nav nav-tabs" role="tablist" style="padding-bottom:50px;">
	             			<!--  <ul id="pfolio-filters" role="tablist" class="portfolio-filters" style="font-size:25px;"> -->
	                		<li role="presentation" class="active"><a href="#tab-description" aria-controls="tab-description" role="tab" data-toggle="tab">Member</a></li>
	                		<li role="presentation"><a href="#tab-reviews" aria-controls="tab-reviews" role="tab" data-toggle="tab"> One on One </a></li>
	                		<li role="presentation"><a href="#tab-help" aria-controls="tab-help" role="tab" data-toggle="tab"> notice </a></li>
	                		<li role="presentation"><a href="#editor" aria-controls="editor" role="tab" data-toggle="tab"> editor </a></li>
	                		<li role="presentation"><a href="#modify" aria-controls="modify" role="tab" data-toggle="tab"> modify </a></li>
	                		<li role="presentation"><a href="#tab-fund" aria-controls="tab-fund" role="tab" data-toggle="tab"> requestFund </a></li>
	              		</ul>

 		                <!-- 회원 리스트 탭 -->
    	   		        <div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="tab-description">
								<div class="col-md-12 tab-pane active" >
                        			<form name = "noticeForm">
                       					<div>
                         					<table class="table checkout-table">
                           						<thead>
	                             					<tr>
		                               					<th>Member</th>
						                                <th></th>
						                                <th></th>
						                                <th></th>
		                             				</tr>
                           						</thead>
                           						<tbody>
		                           					<tr style="height:50px;">
							                           	<td>ID</td>
							                           	<td align="center">NAME</td>
							                           	<td align="center">HP</td>
							                           	<td align="center">JOIN DATE</td>
		                           					</tr>
		                           					<c:forEach var ="mem" items = "${dtom}">
		                             					<tr style="height:50px;" align="center">
							                               <td style="width:25%;">${mem.username}</td>
							                               <td style="width:25%;">${mem.name}</td>
							                               <td style="width:25%;">${mem.hp}</td>
							                               <td style="width:25%;"><fmt:formatDate type = "both" pattern = "yyyy-MM-dd HH:mm" value = "${mem.join_date}"/></td>
							                             </tr>
		                            				</c:forEach>
                           						</tbody>
                        					</table><!-- / .checkout-table -->
                    					</div><!-- / .table-responsive -->
                       				</form>
         
				                     <!-- 페이징처리 -->
				                     <div class="row">
									 	<nav class="blog-pagination text-center">
                   							<ul class="pagination">
                     							<li>
                       								<a href="notice" aria-label="Previous">
                        							<span aria-hidden="true"><i class="fa fa-angle-double-left"></i></span>
                       								</a>
                       								<a href = "notice?pageNum=${startPage - pageBlock}">
                       								<span aria-hidden="true"><i class="fa fa-angle-left"></i></span>
                       								</a>
                     							</li>
                     							<li>
                     							<c:forEach var ="i" begin="${startPage}" end="${endPage}">
													<c:if test="${i == currentPage}">
														<span><b>${i}</b></span>
													</c:if>
													<c:if test="${i != currentPage}">
														<span><b><a href = "notice?pageNum=${i}">${i}</a></b></span>
													</c:if>
												</c:forEach>
												</li>
												<li>
						                       <a href="notice?pageNum=${startPage + pageBlock}" aria-label="Next">
						                       	<span aria-hidden="true"><i class="fa fa-angle-right"></i></span>
						                       </a>
						                       <a href="notice?pageNum=${pageCount}" aria-label="Next">
						                         <span aria-hidden="true"><i class="fa fa-angle-double-right"></i></span>
						                       </a>
						                       </li>
						                   </ul>
						                 </nav>
						               </div>
				                     </div><!-- md- 12  -->
					                </div><!-- / .tab-pane #tab-sizeguide -->
                
                
                  <!-- Table 2- 1대1 문의  -->
                <div role="tabpanel" class="tab-pane" id="tab-reviews">
  		            <div id="info" style="position: relative; height: 256.047px;">
        	            <div class="col-md-12 tab-pane ">
            	           <div>
                	         <table class="table checkout-table">
                   	         <thead>
                             <tr>
                               <th>One on One</th>
                               <th></th>
                               <th>총작성글 : ${board_cnt}</th>
                               <th>총답글수 : ${board_rp_cnt}</th>
                             </tr>
                           </thead>
                           <tbody>
	                           <tr style="height:50px;" align="center">
	                           	<td>작성자</td>
	                           	<td>고객명</td>
	                           	<td>작성글</td>
	                           	<td>답변글</td>
	                           </tr>
                             <c:forEach var ="qui" items = "${dtob}">
                             <tr style="height:50px;" align="center">
                               <td style="width:25%"><a href="${path}/user/userInquiry?writer=${qui.username}">${qui.username}</a></td>
                               <td style="width:25%"><a href="${path}/user/userInquiry?writer=${qui.username}">${qui.name}</a></td>
                               <td style="width:25%">${qui.board_cnt}</td>
                               <td style="width:25%">${qui.board_rp_cnt}</td>
                             </tr>
                            </c:forEach>
                           </tbody>
                         </table><!-- / .checkout-table -->
                       </div><!-- / .table-responsive -->
         
                  <!-- 페이징처리 -->
                  <div class="row">
                 <nav class="blog-pagination text-center">
                   <ul class="pagination">
                     <li>
                       <a href="notice" aria-label="Previous">
                         <span aria-hidden="true"><i class="fa fa-angle-double-left"></i></span>
                       </a>
                       <a href = "notice?pageNum=${startPage - pageBlock}">
                       	<span aria-hidden="true"><i class="fa fa-angle-left"></i></span>
                       </a>
                     </li>
                     <li>
                     <c:forEach var ="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}">
							<span><b>${i}</b></span>
						</c:if>
						<c:if test="${i != currentPage}">
							<span><b><a href = "notice?pageNum=${i}">${i}</a></b></span>
						</c:if>
					</c:forEach>
					</li>
					<li>
                       <a href="notice?pageNum=${startPage + pageBlock}" aria-label="Next">
                         <span aria-hidden="true"><i class="fa fa-angle-right"></i></span>
                       </a>
                       <a href="notice?pageNum=${pageCount}" aria-label="Next">
                         <span aria-hidden="true"><i class="fa fa-angle-double-right"></i></span>
                       </a>
                     </li>
                   </ul>
                 </nav>
               </div>
              </div><!-- md- 12  -->
            </div>
           </div><!-- / .prod-reviews #tab-reviews -->

              <!-- Table 3 . 공지사항  -->
          <div role="tabpanel" class="tab-pane" id="tab-help">
           <div id="event" style="position: relative; height: 256.047px;">
                 <div class="col-md-12 tab-pane ">
                 <div>
                   <table class="table checkout-table">
                     <thead>
                       <tr>
                         <th>notice</th>
                         <th></th>
                       </tr>
                     </thead>
                     <tbody>
                       <c:forEach var ="all" items = "${dto}">
                             <tr style="height:50px;">
                               <td><a href="noticeContentForm?notice_id=${all.notice_id}" style="text-align:left;">${all.notice_subject}</a></td>
                               <td style="width:150px;"><fmt:formatDate type = "both" pattern = "yyyy-MM-dd HH:mm" value = "${all.notice_date}"/></td>
                             </tr>
                            </c:forEach>
                     </tbody>
                   </table><!-- / .checkout-table -->
                 </div><!-- / .table-responsive -->
   
            <!-- 페이징처리 -->
            <div class="row">
                 <nav class="blog-pagination text-center">
                   <ul class="pagination">
                     <li>
                       <a href="notice" aria-label="Previous">
                         <span aria-hidden="true"><i class="fa fa-angle-double-left"></i></span>
                       </a>
                       <a href = "notice?pageNum=${startPage - pageBlock}">
                       	<span aria-hidden="true"><i class="fa fa-angle-left"></i></span>
                       </a>
                     </li>
                     <li>
                     <c:forEach var ="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}">
							<span><b>${i}</b></span>
						</c:if>
						<c:if test="${i != currentPage}">
							<span><b><a href = "notice?pageNum=${i}">${i}</a></b></span>
						</c:if>
					</c:forEach>
					</li>
					<li>
                       <a href="notice?pageNum=${startPage + pageBlock}" aria-label="Next">
                         <span aria-hidden="true"><i class="fa fa-angle-right"></i></span>
                       </a>
                       <a href="notice?pageNum=${pageCount}" aria-label="Next">
                         <span aria-hidden="true"><i class="fa fa-angle-double-right"></i></span>
                       </a>
                     </li>
                   </ul>
                 </nav>
               </div>
              </div><!-- md- 12  -->
	         </div> 
             </div><!-- / .ft-steps-numbers #tab-help -->
             
             <div role="tabpanel" class="tab-pane" id="editor">
           		<div id="event" style="position: relative; height: 256.047px;">
                 <div class="col-md-12 tab-pane ">
                 <div>
                   <table class="table checkout-table">
                     <thead>
                       <tr>
                         <th>editor</th>
                       </tr>
                     </thead>
                     <tbody>
                     	<tr>
                     		<td id="editor" style="height:1200px;">
                     			<iframe src="editor" width ="100%" height ="100%"></iframe>
                     		</td>	
                     	</tr>
                     </tbody>
                   </table><!-- / .checkout-table -->
                 </div><!-- / .table-responsive -->
            	<!-- 페이징처리 -->
              	</div><!-- md- 12  -->
	           </div> 
             </div><!-- / .ft-steps-numbers #edit -->
             
             <div role="tabpanel" class="tab-pane" id="modify">
           		<div id="event" style="position: relative; height: 256.047px;">
                 <div class="col-md-12 tab-pane ">
                 <div>
                   <table class="table checkout-table">
                     <thead>
                       <tr>
                         <th>modify</th>
                       </tr>
                     </thead>
                     <tbody>
                     	<tr>
                     		<td id="modify" style="height:500px;">
                     		<div class="row">
                			<div class="col-md-offset-3 col-md-6">
                     			<div class="panel-group" id="login-accordion" role="tablist" aria-multiselectable="true">
			                    <div class="panel top-panel panel-default">
			                      <div class="panel-heading" role="tab" id="headingOne">
			                        <h4 class="panel-title">
			                          <a role="button" data-toggle="collapse" data-parent="#login-accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
			                            Login to your Fund
			                          </a>
			                        </h4>
			                      </div>
			                      <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
			                        <div class="panel-body">
									<form name = "fundId">
			                          <div class="form-login">
			                              <!-- Username -->
			                              <div class="form-group">
			                                <label for="username-login-1">FUND_ID</label>
			                                <input type="text" id ="pls" name="pls" class="form-control" placeholder="Enter The FUND_ID">
			                              </div>
			                              <!-- Submit -->
			                              <input type="button" value="Login" class="btn" id="modifyChk">
			                          </div><!-- / .form-wrapper -->
			                        </form>	  
			                        </div><!-- / .panel-body -->
			                      </div><!-- / .panel-collapse -->
			                    </div><!-- / .panel -->
			                    </div>
			                </div>
			                </div>    
                     		</td>	
                     	</tr>
                     </tbody>
                   </table><!-- / .checkout-table -->
                 </div><!-- / .table-responsive -->
            	<!-- 페이징처리 -->
              	</div><!-- md- 12  -->
	           </div> 
             </div><!-- / .ft-steps-numbers #modify -->
             
              <!-- Table 펀드 신청 리스트  -->
                <div role="tabpanel" class="tab-pane" id="tab-fund">
  		            <div id="info" style="position: relative; height: 256.047px;">
        	            <div class="col-md-12 tab-pane ">
            	           <div>
                	         <table class="table checkout-table">
                   	         <thead>
                             <tr>
                               <th>requestList</th>
                               <th></th>
                               <th>신청 수 : ${fundCount}</th>
                               <th colspan="3"></th>
                             </tr>
                           </thead>
                           <tbody>
	                           <tr style="height:50px;" align="center">
	                           	<td>신청회사</td>
	                           	<td>신청자명</td>
	                           	<td>이메일</td>
	                           	<td>연락처</td>
	                           	<td>응답여부</td>
	                           	<td>담당자</td>
	                           </tr>
                             <c:forEach var ="fund" items = "${dtof}">
                             <tr style="height:50px;" align="center">
                               <td style="width:20%"><a href="${path}/user/confirmFundRequest?reserve_id=${fund.reserve_id}">${fund.company_name}</a></td>
                               <td style="width:20%"><a href="${path}/user/confirmFundRequest?reserve_id=${fund.reserve_id}">${fund.username}</a></td>
                               <td style="width:20%">${fund.client_email}</td>
                               <td style="width:20%">${fund.client_ph}</td>
                               <td style="width:10%">${fund.reserve_accepted}</td>
                               <td style="width:10%">${fund.reserve_account}</td>
                             </tr>
                            </c:forEach>
                           </tbody>
                         </table><!-- / .checkout-table -->
                       </div><!-- / .table-responsive -->
         
                  <!-- 페이징처리 -->
                  <div class="row">
                 <nav class="blog-pagination text-center">
                   <ul class="pagination">
                     <li>
                       <a href="notice" aria-label="Previous">
                         <span aria-hidden="true"><i class="fa fa-angle-double-left"></i></span>
                       </a>
                       <a href = "notice?pageNum=${startPage - pageBlock}">
                       	<span aria-hidden="true"><i class="fa fa-angle-left"></i></span>
                       </a>
                     </li>
                     <li>
                     <c:forEach var ="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}">
							<span><b>${i}</b></span>
						</c:if>
						<c:if test="${i != currentPage}">
							<span><b><a href = "notice?pageNum=${i}">${i}</a></b></span>
						</c:if>
					</c:forEach>
					</li>
					<li>
                       <a href="notice?pageNum=${startPage + pageBlock}" aria-label="Next">
                         <span aria-hidden="true"><i class="fa fa-angle-right"></i></span>
                       </a>
                       <a href="notice?pageNum=${pageCount}" aria-label="Next">
                         <span aria-hidden="true"><i class="fa fa-angle-double-right"></i></span>
                       </a>
                     </li>
                   </ul>
                 </nav>
               </div>
              </div><!-- md- 12  -->
            </div>
           </div><!-- / .prod-reviews #tab-reviews -->
             
           </div>
         </div>  
       </div>
     </div><!-- / .container -->
   </div>

<%@ include file="../include/footer.jsp" %>

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
	
	<!-- Definity JS -->
	<script src="${project}assets/js/main.js"></script>
</body>
</html>