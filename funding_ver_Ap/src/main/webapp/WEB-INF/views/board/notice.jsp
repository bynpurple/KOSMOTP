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
	    	
    <body id="page-top" data-spy="scroll" data-target=".navbar">
        <%@ include file="../include/top-header.jsp" %>
        <!-- ========== Page Title ========== -->

        <header class="page-title pt-light pt-plax-md-light"
        data-stellar-background-ratio="0.4">
          <div class="container">
              <div class="row">

                <div class="col-sm-6">
                  <h1>공지사항</h1>
                  <span class="subheading">정보를 확인하세요</span>
                </div>
                <ol class="col-sm-6 text-right breadcrumb">
                  <li><a href="#">더보기</a></li>
                  <li><a href="#">공지</a></li>
                  <li class="active">공지사항</li>
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
                <li role="presentation" class="active"><a href="#tab-description" aria-controls="tab-description" role="tab" data-toggle="tab">전체</a></li>
                <li role="presentation"><a href="#tab-reviews" aria-controls="tab-reviews" role="tab" data-toggle="tab"> 공지 </a></li>
                <li role="presentation"><a href="#tab-help" aria-controls="tab-help" role="tab" data-toggle="tab"> 이벤트 </a></li>
              </ul>

              <!-- 공지사항 탭 -->
              <div class="tab-content">
				
                <div role="tabpanel" class="tab-pane active" id="tab-description">
               	 <div class="col-md-12 tab-pane active" >
                        <form name = "noticeForm">
                       <div>
                         <table class="table checkout-table">
                           <thead>
                             <tr>
                               <th>전체</th>
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
                        
                        
                           <!-- Coupon Form -->
                       <form action="#" class="checkout-coupon-form ws-m">
                         <div class="col-lg-4 no-gap-left">
                           <input type="text" class="form-control" placeholder="검색어를 입력하세요!">
                         </div>
                         <button class="btn btn-ghost">검색</button>
                       </form><!-- / .checkout-coupon-form -->
                       <div align = "center" >
	                       <c:if test="${pageContext.request.userPrincipal.name == 'host'}">
								<a href = "${path}/user/writeNotice"><input type = "button" class="btn" value="공지사항 작성하기"></a>
							</c:if>
						</div>
                       <hr>
         
                        
         
                     </div><!-- md- 12  -->
                
                </div><!-- / .tab-pane #tab-sizeguide -->
                
                
                  <!-- Table 2- 공지  -->
                <div role="tabpanel" class="tab-pane" id="tab-reviews">

                  
              <div id="info" style="position: relative; height: 256.047px;">
                    
                    <div class="col-md-12 tab-pane ">
                       <div>
                         <table class="table checkout-table">
                           <thead>
                             <tr>
                               <th>공지</th>
                               <th></th>
                             </tr>
                           </thead>
                           <tbody>
                             <c:forEach var ="noti" items = "${dtos}">
                             <tr style="height:50px;">
                               <td><a href="noticeContentForm?notice_id=${noti.notice_id}" style="text-align:left;">${noti.notice_subject}</a></td>
                               <td style="width:150px;"><fmt:formatDate type = "both" pattern = "yyyy-MM-dd HH:mm" value = "${noti.notice_date}"/></td>
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
         
                   <!-- Coupon Form -->
                       <form action="#" class="checkout-coupon-form ws-m">
                         <div class="col-lg-4 no-gap-left">
                           <input type="text" class="form-control" placeholder="검색어를 입력하세요!">
                         </div>
                         <button class="btn btn-ghost">검색</button>
                       </form><!-- / .checkout-coupon-form -->
                       <div align = "center" >
	                       <c:if test="${pageContext.request.userPrincipal.name == 'host'}">
								<a href = "writeNotice"><input type = "button" class="btn" value="공지사항 작성하기"></a>
							</c:if>
						</div>
                       <hr>
         
      
                     </div><!-- md- 12  -->
            </div>
                  
                </div><!-- / .prod-reviews #tab-reviews -->
                


              <!-- Table 3 . 이벤트  -->
                <div role="tabpanel" class="tab-pane" id="tab-help">
                  
           <div id="event" style="position: relative; height: 256.047px;">
                 
                 <div class="col-md-12 tab-pane ">
                 <div>
                   <table class="table checkout-table">
                     <thead>
                       <tr>
                         <th>이벤트</th>
                         <th></th>
                       </tr>
                     </thead>
                     <tbody>
                       <c:forEach var ="eve" items = "${dtot}">
                             <tr style="height:50px;">
                               <td><a href="noticeContentForm?notice_id=${eve.notice_id}" style="text-align:left;">${eve.notice_subject}</a></td>
                               <td style="width:150px;"><fmt:formatDate type = "both" pattern = "yyyy-MM-dd HH:mm" value = "${eve.notice_date}"/></td>
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
   
   
             <!-- Coupon Form -->
                 <form action="#" class="checkout-coupon-form ws-m">
                   <div class="col-lg-4 no-gap-left">
                     <input type="text" class="form-control" placeholder="검색어를 입력하세요!">
                   </div>
                   <button class="btn btn-ghost">검색</button>
                 </form><!-- / .checkout-coupon-form -->
                 	<div align = "center" >
                       <c:if test="${pageContext.request.userPrincipal.name == 'host'}">
							<a href = "writeNotice"><input type = "button" class="btn" value="공지사항 작성하기"></a>
						</c:if>
					</div>
                 <hr>
               </div><!-- md- 12  -->
         </div> 
		
                 
                  
                </div><!-- / .ft-steps-numbers #tab-help -->
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
        <script src="${project}js/vendor/jquery.parallax.js"></script>

        <!-- Definity JS -->
        <script src="${project}assets/js/main.js"></script>
    </body>
</html>