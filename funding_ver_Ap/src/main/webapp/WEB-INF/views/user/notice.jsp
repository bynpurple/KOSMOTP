<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<html class="no-js" lang="ko">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Chrome">
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
                       <div>
                         <table class="table checkout-table">
                           <thead>
                             <tr>
                               <th style="width:70px;">전체</th>
                               <th colspan="6"></th>
                             </tr>
                           </thead>
                           <tbody>
                             <tr>
							    <td>1</td>
							    <td colspan="6" style="padding:0px;"><!-- FAQ Accordion -->
									<div class="panel-group accordions-1" id="faq-accordion-1" role="tablist" aria-multiselectable="true" style="margin:0px;">
										<div class="panel panel-default">
									 		<div class="panel-heading" role="tab" id="heading-1">
									    		<h4 class="panel-title">
									      		<span class="collapsed" role="button" data-toggle="collapse" data-parent="#faq-accordion-1" href="#collapse-1" aria-expanded="false" aria-controls="collapse-1">
									        		Example question in acordion ?
									      		</span>
									   			</h4>
									  		</div>
									  		<div id="collapse-1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading-1">
									    		<div class="panel-body">
									      			Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
									    		</div>
									  		</div>
										</div><!-- / .panel -->
									</div>
                				</td>
                             </tr>
         
                             <tr>
                               <td>2</td>
                               <td colspan="6" style="padding:0px;"><!-- FAQ Accordion -->
									<div class="panel-group accordions-1" id="faq-accordion-1" role="tablist" aria-multiselectable="true" style="margin:0px;">
										<div class="panel panel-default">
									 		<div class="panel-heading" role="tab" id="heading-2">
									    		<h4 class="panel-title">
									      		<span class="collapsed" role="button" data-toggle="collapse" data-parent="#faq-accordion-1" href="#collapse-2" aria-expanded="false" aria-controls="collapse-2">
									        		Example question in acordion ?
									      		</span>
									   			</h4>
									  		</div>
									  		<div id="collapse-2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading-2">
									    		<div class="panel-body">
									      			Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
									    		</div>
									  		</div>
										</div><!-- / .panel -->
									</div>
                				</td>
                             </tr>
         
                             <tr>
                               <td>3</td>
                               <td colspan="6" style="padding:0px;"><!-- FAQ Accordion -->
									<div class="panel-group accordions-1" id="faq-accordion-1" role="tablist" aria-multiselectable="true" style="margin:0px;">
										<div class="panel panel-default">
									 		<div class="panel-heading" role="tab" id="heading-3">
									    		<h4 class="panel-title">
									      		<span class="collapsed" role="button" data-toggle="collapse" data-parent="#faq-accordion-1" href="#collapse-3" aria-expanded="false" aria-controls="collapse-3">
									        		Example question in acordion ?
									      		</span>
									   			</h4>
									  		</div>
									  		<div id="collapse-3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading-3">
									    		<div class="panel-body">
									      			Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
									    		</div>
									  		</div>
										</div><!-- / .panel -->
									</div>
                				</td>
                             </tr>
         
                           </tbody>
                         </table><!-- / .checkout-table -->
                       </div><!-- / .table-responsive -->
         
         
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
                
                
                
                  <!-- Table 2- 공지  -->
                <div role="tabpanel" class="tab-pane" id="tab-reviews">

                  
              <div id="info" style="position: relative; height: 256.047px;">
                    
                    <div class="col-md-12 tab-pane ">
                       <div>
                         <table class="table checkout-table">
                           <thead>
                             <tr>
                               <th style="width:70px;">공지</th>
                               <th colspan="6"></th>
                             </tr>
                           </thead>
                           <tbody>
                             <tr>
                               <td>1</td>
                               <td colspan="6">투자 수요조사 베타 서비스 오픈</td>
                             </tr>
         
                             <tr>
                               <td>2</td>
                               <td colspan="6">투자 수요조사 베타 서비스 오픈</td>
                             </tr>
         
                             <tr>
                               <td>3</td>
                               <td colspan="6">투자 수요조사 베타 서비스 오픈</td>
                             </tr>
         
                           </tbody>
                         </table><!-- / .checkout-table -->
                       </div><!-- / .table-responsive -->
         
         
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
                         <th style="width:70px;">이벤트</th>
                         <th colspan="6"></th>
                       </tr>
                     </thead>
                     <tbody>
                       <tr>
                         <td>1</td>
                         <td colspan="6">투자 수요조사 베타 서비스 오픈</td>
                       </tr>
   
                       <tr>
                         <td>2</td>
                         <td colspan="6">투자 수요조사 베타 서비스 오픈</td>
                       </tr>
   
                       <tr>
                         <td>3</td>
                         <td colspan="6">투자 수요조사 베타 서비스 오픈</td>
                       </tr>
   
                     </tbody>
                   </table><!-- / .checkout-table -->
                 </div><!-- / .table-responsive -->
   
   
   
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
        <script src="${project}js/vendor/jquery.parallax.js"></script>

        <!-- Definity JS -->
        <script src="${project}assets/js/main.js"></script>
    </body>
</html>