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
        
        <script type="text/javascript">
		function moveWriForm(){
			location.href="/funding/user/userWriterForm";
		}
	</script>
    </head>
    <body id="page-top" data-spy="scroll" data-target=".navbar">
        <%@ include file="../include/top-header.jsp" %>
        <!-- ========== Page Title ========== -->

        <header class="page-title pt-light pt-plax-md-light"
        data-stellar-background-ratio="0.4">
          <div class="container">
              <div class="row">

                <div class="col-sm-6">
                  <h1>1대1문의</h1>
                  <span class="subheading">1대1문의 입니다.</span>
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
              

              <!-- 공지사항 탭 -->
              <div class="tab-content">

                <div role="tabpanel" class="tab-pane active" id="tab-description">
                
                        <div class="col-md-12 tab-pane active" >
                       <div>
                         <table class="table checkout-table">
                           <thead>
                            <tr>
                              	<th style="text-align:center">번호</th>
								<th>제목</th>
								<th style="text-align:center">작성자</th>
								<th style="text-align:center">조회수</th>
								<th style="text-align:center">작성일</th>
                             </tr>
                           </thead>
                           <tbody>
                            <c:if test="${cnt > 0}">
								<c:forEach var="dto" items="${dtos}">
								<tr style="height:50px;">
									<th style="text-align:center; width:5%;">
										${dto.num}
									</th>
									<th align="left" width="65%">
										<!-- 상세페이지  -->
										<c:if test="${dto.reply_cnt == 0}">
											<a href="${path}/user/usercontentForm?num=${dto.num}">${dto.subject}</a> &nbsp;&nbsp;
										</c:if>
										<c:if test="${dto.reply_cnt > 0}">
											<a href="${path}/user/usercontentForm?num=${dto.num}">${dto.subject}</a> &nbsp;&nbsp; [답변완료]
										</c:if>
									</th>
									<th style="text-align:center; width:10%">
									 ${dto.writer}
									</th>
									<th style="text-align:center; width:10%">
									${dto.readCnt}
									</th>
									<th style="text-align:center; width:10%">
										<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.reg_date}" />
									</th>
								</tr>
								</c:forEach>
							</c:if>
                           </tbody>
                         </table><!-- / .checkout-table -->
                       </div><!-- / .table-responsive -->
                       
         			 <div class="box-header with-border">
	        		  <button class="btn btn-block btn-info btn-lg" onclick="moveWriForm();">1대1문의하기</button>
	       			 </div>
         
                     <!-- 페이징처리 -->
                     <div class="row">
                          <nav class="blog-pagination text-center">
                            <ul class="pagination">
                              <li>
                                <a href="#" aria-label="Previous">
                                  <span aria-hidden="true"><i class="fa fa-angle-double-left"></i></span>
                                </a>
                              </li>
                              <li><a href="#">1</a></li>
                              <li><a href="#">2</a></li>
                              <li><a href="#">...</a></li>
                              <li><a href="#">7</a></li>
                              <li>
                                <a href="#" aria-label="Next">
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
                       <hr>
                     </div><!-- md- 12  -->
                </div><!-- / .tab-pane #tab-sizeguide -->
        </div><!-- / .container -->
      </div>
      </div>
      </div>
      </div>
      


		<%@ include file="../include/footer.jsp" %>

        <!-- ========== Scripts ========== -->

        <script src="${project}assets/js/vendor/jquery-2.1.4.min.js"></script>
        <script src="${project}assets/js/vendor/google-fonts.js"></script>
        <script src="${project}assets/js/vendor/jquery.easing.js"></script>
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
        <script src="${project}assets/js/vendor/jquery.parallax.js"></script>

        <!-- Definity JS -->
        <script src="${project}assets/js/main.js"></script>
    </body>
</html>