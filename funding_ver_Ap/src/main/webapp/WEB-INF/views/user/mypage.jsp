<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<html class="no-js" lang="ko">
    <head>
       <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=chrome">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body id="page-top">
    	<%@ include file="../include/top-header.jsp" %>
    	
    	<header class="page-title pt-large pt-dark pt-plax-lg-dark"
        data-stellar-background-ratio="0.4">
          <div class="container">
              <div class="row">

                <div class="col-sm-6">
                  <h1>MY FUNDING</h1>
                  <span class="subheading">투자내역을 확인하세요</span>
                </div>
                <ol class="col-sm-6 text-right breadcrumb">
                  <li><a href="main">HOME</a></li>
                  <li class="active">MY FUNDING</li>
                </ol>

              </div>
            </div>
        </header>


        
        <!-- ========== Cart Items - (checkout table) ========== -->

		<div class="container section">
			<div class="row">
			  <!-- Checkout Table -->
				<div class="col-lg-9">
					<div class="table-responsive">
				    	<table class="table checkout-table">
				      		<thead>
				        		<tr>
									<th>펀드명</th>
									<th>구좌 수</th>
									<th>총 금액</th>
						        </tr>
							</thead>
				      		<tbody>
				      			<c:forEach var="ftlist" items="${ftlist}">
				      				<tr>
										<td onclick="">${ftlist.fund_subject}</td>
										<td>${ftlist.investvolume}</td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${ftlist.investvolume * ftlist.fund_min_invest}" /> 원</td>
									</tr>
				      			</c:forEach>
								
							</tbody>
						</table><!-- / .checkout-table -->
					</div><!-- / .table-responsive -->
				</div>
				
				
				<div class="col-lg-3 totals-group">
					<div class="totals-heading">
				  		<h6>계좌 정보</h6>
					</div>
					<div class="totals-content">
				  		<div class="subtotal-group">
						    <h5>계좌 번호</h5>
						    <p>${vo.account}</p>
					  	</div>
					  	<div class="shipping-group" style="padding-top:20px;">
						    <h5>보유 금액</h5>
						    <p><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.money}" /> 원</p>
					  	</div>
					  	<!-- <div class="checkout-btn-wrapper">
					    	<a href="../../pages/shop/shop-checkout.html" class="btn checkout-btn">Go to checkout</a>
					  	</div> -->
					</div><!-- / .totals-content -->
				</div><!-- / .col-md-3 -->
			</div>
		</div>
    	

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
		<script src="${project }assets/js/vendor/jquery.mb.YTPlayer.min.js"></script>
		<script src="${project }assets/js/vendor/jquery.ajaxchimp.js"></script>
		<script src="${project }assets/js/vendor/animated-heading.js"></script>

        <!-- Definity JS -->
        <script src="${project }assets/js/main.js"></script>
      
    </body>
</html>