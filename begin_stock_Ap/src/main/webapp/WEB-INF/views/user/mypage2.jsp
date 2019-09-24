<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible">
<meta name="viewport"
   content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="${project}images/favicon.ico">

    <title>EZ Stock - Members Profile</title>

<script src="/stock/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">


function send(){
      var pwd = $("#pwd").val();//입력한 키워드 가져옴
      
      if(pwd.length == 0) { //글자수가 0인경우
         $("#result").css("visibility", "hidden"); //숨김
      } else {
         $("#inputPwd").css("visibility", "hidden"); 
         $("#result").css("visibility", "visible");//보임

         $.ajax({
            url:"${pageContext.request.contextPath}/user/modify", //{컨트롤러}/이동페이지
            type: "get",
            data: "pwd=" + pwd,
            success: function(e) {
               console.log(e);
               $("#result").html(e);
            },
            error: function(request, status, error) {
                alert("비밀번호가 일치하지 않습니다.");
            }
         });
      }
   };
   
   
   
</script>
</head>
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
  <!-- ================== main content ============================= -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
           My Page - 마이페이지
      </h1>
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="breadcrumb-item"><a href="#">Members</a></li>
        <li class="breadcrumb-item active">Members Profile</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">


   <!-- 회원정보칸 -->
      <div class="row">
        <div class="col-xl-4 col-lg-5">

          <!-- Profile Image -->
          <div class="box bg-yellow bg-deathstar-dark" style="color:black;">
            <div class="box-body box-profile" style="color:black;">

              <h1 class="profile-username text-center mb-0"> <i class="fa fa-vcard-o" aria-hidden="true"> ${pageContext.request.userPrincipal.name} 님!</i></h1>
            
              <div class="row">
            <div class="col-12">
               <div class="media-list media-list-hover media-list-divided w-p100 mt-30">
               
                    <h4 class="media media-single p-15">
                    <span class="title">- 내 계좌 번호    <b> - ${vo.account} </b></span>
                  </h4>
                  
                  <h4 class="media media-single p-15">
                    <span class="title">- 계좌 잔액    <br> <b> - <fmt:formatNumber value="${vo.money}" pattern="#,###" /></b></span>
                    <span class="title">- 계좌 개설일   <br><b> - <fmt:formatDate value="${vo.reg_date}" pattern="YYYY-MM-dd"/></b></span>
                  </h4>
                  
                  <h4 class="media media-single p-15">
                  <a href="transfer_limit" style="text-decoration:none; color:black;">
                    <i class="fa fa-arrow-circle-o-right mr-10"></i><span class="title"> 계좌 이체  </span>
                  </a>
                  </h4>

                  <h4 class="media media-single p-15">
                  <a href="interestedItems" style="text-decoration:none; color:black;">
                    <i class="fa fa-arrow-circle-o-right mr-10"></i><span class="title"> 관심종목</span>
                  </a>
                  </h4>
                  
               </div>
            </div>
            
            <h2 class="title w-p100 mt-10 mb-0 p-20">미체결 내역</h2>
            <div class="col-12" style="height:400px; overflow:auto;">
            
            
               <div class="media-list media-list-hover w-p100 mt-0">

            <c:if test="${!stockall.isEmpty()}"> <!-- null이 아니면 -->            
               <c:forEach var="dto" items="${stockall}">

                     <!-- 매수  buy -->
                     <c:if test="${dto.bs_sort eq '0'.charAt(0)}"> 
                     
                     <h5 class="media media-single py-10 px-0 w-p100 justify-content-between">
                          <p>
                             <i class="fa fa-circle text-red pr-10 font-size-12"></i>${dto.stockcode} ${dto.stockname}
                             <span class="subtitle pl-20 mt-10 text-red">${dto.bs_date}</span>                    
                          </p>
                          <p class="text-right pull-right"><span class="badge badge-sm badge-danger mb-10">buy</span><br>${dto.price}</p>
                        </h5>
                        
                     </c:if>
                     
                     <!-- 매도 sell -->
                     <c:if test="${dto.bs_sort eq '1'.charAt(0)}"> <!-- char 형은 ""스트링을 char형으로 바꾸어야 한다.  -->
                     
                       <h5 class="media media-single py-10 px-0 w-p100 justify-content-between">
                          <p>
                             <i class="fa fa-circle text-success pr-10 font-size-12"></i>${dto.stockcode} ${dto.stockname}
                             <span class="subtitle pl-20 mt-10 text-success">${dto.bs_date}</span>                    
                          </p>
                          <p class="text-right pull-right"><span class="badge badge-sm badge-success mb-10">sell</span><br>${dto.price}</p>
                        </h5>
                     
                      </c:if> 
                  
               </c:forEach>
               </c:if>
               
               <c:if test="${stockall.isEmpty()}"> <!-- 미체결내역이 없을때  -->
                  <h4>체결 요청중인 내역이 없습니다.</h4>
               </c:if>
        
            
                     </div>
                     
                  </div>  <!-- col- 12 -->
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        
        
       <!--  <div class="col-xl-8 col-lg-7"> -->
       <div class="col-lg-8 col-12">
          <div class="box box-solid bg-black">
         
         
         <!-- 시작  -->
         
         <!-- <div class="col-lg-9 col-12"> -->
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              
              <li><a href="#timeline" data-toggle="tab" class="active show">보유주식현황</a></li>
              <li><a href="#activity" data-toggle="tab" class="">거래내용 종합</a></li>
              <li><a href="#settings" data-toggle="tab" class="">회원정보 수정</a></li>
            </ul>
                        
            <div class="tab-content">
             
             <div class="tab-pane active show" id="timeline">
             
             <form action="financialInfo">
             
                <!-- 보유주식현황 표  -->
              <div class="box-body">
               <div class="table-responsive">
                  <table class="table no-margin table-hover">
                    <thead>               
                     <tr class="bg-dark">
                       <th class="text-yellow">종목코드</th>
                       <th class="text-yellow">종목명</th>
                       <th class="text-yellow">보유 주식수</th>
                       <th class="text-yellow">현재가</th>
                       <th class="text-yellow">합산 자산 금액</th>
                     </tr>
                    </thead>
                    <tbody>
                    
                    <c:if test="${!own.isEmpty()}">
                    <c:forEach var="own" items="${own}">
                     <tr>
                       <td>
                       <input type="submit" class="text-yellow hover-warning" value="${own.stockcode}" style="background:transparent;">
                       <!-- 값 숨겨서보내기 -->
                       <input type="hidden" name="stockcode" value="${own.stockcode}">
                       </td>
                       <td>${own.stockname}</td>
                       <td>
                        <time class="timeago" datetime="2018-02-01T13:38:01Z" title="2018-02-01 13:38 GMT">${own.volume} 주</time>
                       </td>
                       <td><fmt:formatNumber value="${own.stockcurrent}" pattern="#,###" /> 원</td>
                       <td><b class="label label-success"><fmt:formatNumber value="${own.volume * own.stockcurrent}" pattern="#,###" /> 원</b></td>
                     </tr>
                    </c:forEach>
                    </c:if>
                    
                    <c:if test="${own.isEmpty()}">
                       <tr>
                          <td colspan="5"> 보유한 주식이 없습니다. </td>
                       </tr>
                    </c:if>
                    
                    </tbody>
                  </table>
               </div>
            </div>
            
            </form>
                <!-- 거래 표 끝  -->
             
                
              </div>    
              <!-- /.tab-pane -->
              
              <div class="tab-pane" id="activity">
                <!-- 거래 종합   -->
                
                <div class="box-body">
               <div class="table-responsive">
                  <table class="table no-margin no-border b-1 border-gray bg-dark">
                    <thead>
                     <tr class="bg-yellow">
                       <th style="color:black;">거래 카테고리</th>
                       <th style="color:black;">수량</th>
                       <th style="color:black;">종목코드</th>
                       <th style="color:black;">1주 금액</th>
                       <th style="color:black;">합산 금액 </th>
                       <th style="color:black;">거래 일자</th>
                     </tr>
                    </thead>
                    <tbody>
                     
                    <c:if test="${completedCnt > 0}">
                    
                     <c:forEach var="dto2" items="${stockCompleted}">
                        <tr>
                          <td>
                          <c:if test="${dto2.c_category eq '1'.charAt(0)}">
                              <a href="#" class="text-yellow">BUY</a>
                             </c:if>
                           <c:if test="${dto2.c_category eq '0'.charAt(0)}">
                              <a href="#" class="text-yellow">SELL</a>
                             </c:if>
                          </td>
                          <td>${dto2.c_num}주</td>
                          <td>${dto2.stockcode}</td>
                          <td><fmt:formatNumber value="${dto2.c_price}" pattern="#,###" />원</td>
                          <td><fmt:formatNumber value="${dto2.c_total}" pattern="#,###" />원</td>
                          <td><fmt:formatDate value="${dto2.c_date}" pattern="YYYY-MM-dd HH:SS"/></td>
                        </tr>
                     </c:forEach>
                    
                    </c:if> 
                     
                    <c:if test="${completedCnt <= 0}">
                       
                       <td colspan="6"> 완료된 거래내역이 없습니다. </td>
                       
                    </c:if> 

                      
                    </tbody>
                  </table>
               </div>
            </div>
          
                <!-- 최근거래 끝  -->
               
              </div>
              <!-- /.tab-pane -->
              
              
              
              <!-- 회원 정보 변경  -->
               <div class="tab-pane" id="settings">
              
                    
                    <!-- 회원정보출력 -->
                    <div id="result">

   
                    <div id="inputPwd">
                     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                      <div class="form-group row">
                            <label for="inputName" class="col-sm-2 control-label">비밀번호 입력</label>
   
                            <div class="col-sm-10">
                              <input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호 입력"  autofocus>
                            </div>
                     </div>
                       <div class="ml-auto col-sm-10">
                           <input type="button" class="btn btn-success" id="submit" onclick="send();" value="확인">
                         </div>
                      </div>   
                      
                  </div>
                  
               </div> <!-- /.tab-pane : 회원정보 변경  -->
               
               
              
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
         
         
      </div>
        <!-- /.row -->
         
         <!-- 끝  -->

        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
 
   
   <footer class="main-footer">
      <%@ include file="../include/main_footer.jsp" %>
   </footer>
  <!-- /.control-sidebar -->
  
  <!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->


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
   
   <!-- Chartist  -->
   <script src="${project}assets/vendor_components/chartist-js-develop/chartist.min.js"></script>
   <script src="${project}js/pages/widget-chartist.js"></script>
   

</body>

</html>