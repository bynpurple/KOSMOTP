<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
   

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

<title>Interested item</title>

<!-- Bootstrap 4.0-->
<link rel="stylesheet"
   href="${project}assets/vendor_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Bootstrap extend-->
<link rel="stylesheet" href="${project}css/bootstrap-extend.css">
<!-- Theme style -->
<link rel="stylesheet" href="${project}css/master_style.css">
<!-- Crypto_Admin skins -->
<link rel="stylesheet" href="${project}css/skins/_all-skins.css">
<!-- Morris charts -->
<link rel="stylesheet" href="${project}assets/vendor_components/morris.js/morris.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
   <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
   <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
   <![endif]-->
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
      <!-- Morris.js charts -->
<script src="${project}assets/vendor_components/raphael/raphael.min.js"></script>
<script src="${project}assets/vendor_components/morris.js/morris.min.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
<script type="text/javascript">

   //가격에 ',' 작성  
   function numberWithCommas(x) {   
       return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
   }


   //id = selectCompany
   function selectCompany(c_name, c_code, c_theme) {
      //alert(c_name);
      //alert(c_theme);

      var sc = document.getElementById("selectCompany");
      sc.style.display = 'block';
      
      // 아이콘 출력
      if(c_theme == "금융업"){
         document.getElementById("companyLogo").innerHTML = "<i class='cc ZEC mr-5' title='ZEC'><i>"; // 기업 아이콘
      }else if(c_theme == "의약품"){
         document.getElementById("companyLogo").innerHTML = "<i class='cc QTUM mr-5' title='QTUM'><i>"; 
      }else if(c_theme == "전기전자"){
         document.getElementById("companyLogo").innerHTML = "<i class='cc STRAT mr-5' title='STRAT'><i>"; 
      }else{
         document.getElementById("companyLogo").innerHTML = "<i class='cc BAT mr-5' title='BAT'><i>"; 
      } 
      
      document.getElementById("companyName").innerHTML = c_name;    // 기업명 
      
      var param = "proctype=find_memid";
      param += "&c_name=" + c_name;
      param += "&c_code=" + c_code;
      
      $.ajax({
         url : "/stock/user/selectCompany",
         data : param,
         type : "get",
         dataType : "json", 
         success : function(result) {
            console.log(result.chart);
            console.log('차트의 타입확인 : '  + typeof result.chart);
            
            var json = jQuery.parseJSON(result.chart);
            var obj = json.mimi;
            
            console.dir(obj);
            /* $.each(json.mimi, function(i, v){
               console.log(i);
               console.log(v);
            }); */
            var stockname = result.stockname; // result의 id가 키니깐 - value 담기는거
            var chart = result.chart; // 차트값
            //var chart2 = JSON.parse(result.chart);
            
            // 이름 출력 
            if (stockname != null) {
                $("#stockvolume").text(numberWithCommas(result.stockvolume)); // 거래량 
                $("#totalstock").text(numberWithCommas(result.totalstock));   // 총 주식수 
                $("#mkt_cap").text(numberWithCommas(result.totalstock * result.stockcurrent));  // 시가총액 계산 
                var Now = new Date();  
                var today = Now.format('yyyy-MM-dd (KS) a/p hh:mm');
                $(".today").text(today);   // 오늘날짜
                $("#stockopen").text(numberWithCommas(result.stockopen));
                $("#stock250high").text(numberWithCommas(result.stock250high));
                $("#stock250low").text(numberWithCommas(result.stock250low));
            
            } else {
                alert("찾으시는 조건의 아이디가 없습니다.");
            } 

            if(result.chart != null){
               // 그래프 출력 
               var line = new Morris.Bar({
                     element: 'line-chart',
                     resize: true,
                     data: obj,
                    xkey: 'r_date',
                    ykeys: ['r_close'],
                    labels: ['Analatics'],
                    lineWidth:3,
                    pointFillColors: ['grey'],
                    pointStrokeColors: ['black'],
                    behaveLikeLine: true,
                    fillOpacity: 0.6,
                    lineColors: ['grey'],
                    hideHover: 'auto'
                   });
            }
         },
         error : function(request, status, error) {
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
         }
      });
   }
   
   
   // 삭제 아이콘
   function clickDelete(c_name, c_code){
      
      //alert("딜리트 함수임 " + c_name);
      var delCompany = confirm("'"+c_name +"'"+ "를 관심종목에서 삭제하겠습니까?");
      
      if(delCompany == true){
         window.location="itemDelete?c_name="+c_name+"&c_code="+c_code;
      }else{
         alert("취소되었습니다.");
      }
      
   }
   
   // 날짜 찍는함수
   Date.prototype.format = function (f) {

       if (!this.valueOf()) return " ";

       var weekKorName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
       var weekKorShortName = ["일", "월", "화", "수", "목", "금", "토"];
       var weekEngName = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
       var weekEngShortName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
       var d = this;

       return f.replace(/(yyyy|yy|MM|dd|KS|KL|ES|EL|HH|hh|mm|ss|a\/p)/gi, function ($1) {
           switch ($1) {
               case "yyyy": return d.getFullYear(); // 년 (4자리)
               case "yy": return (d.getFullYear() % 1000).zf(2); // 년 (2자리)
               case "MM": return (d.getMonth() + 1).zf(2); // 월 (2자리)
               case "dd": return d.getDate().zf(2); // 일 (2자리)
               case "KS": return weekKorShortName[d.getDay()]; // 요일 (짧은 한글)
               case "KL": return weekKorName[d.getDay()]; // 요일 (긴 한글)
               case "ES": return weekEngShortName[d.getDay()]; // 요일 (짧은 영어)
               case "EL": return weekEngName[d.getDay()]; // 요일 (긴 영어)
               case "HH": return d.getHours().zf(2); // 시간 (24시간 기준, 2자리)
               case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2); // 시간 (12시간 기준, 2자리)
               case "mm": return d.getMinutes().zf(2); // 분 (2자리)
               case "ss": return d.getSeconds().zf(2); // 초 (2자리)
               case "a/p": return d.getHours() < 12 ? "오전" : "오후"; // 오전/오후 구분
               default: return $1;
           }
       });
   };

   String.prototype.string = function (len) { var s = '', i = 0; while (i++ < len) { s += this; } return s; };
   String.prototype.zf = function (len) { return "0".string(len - this.length) + this; };
   Number.prototype.zf = function (len) { return this.toString().zf(len); };
   
   
   
</script>



</head>
<body class="hold-transition skin-black sidebar-mini">

   <!-- Site wrapper -->
   <div class="wrapper">

      <header class="main-header">
         <%@ include file="../include/main_header.jsp" %>
      </header>
        
      <aside class="main-sidebar">
        <%@ include file="side_menu.jsp" %>
      </aside>
  
  

<!-- ====================main content=========================== -->
<form action="interestedItems.do">
   <!-- Content Wrapper. Contains page content -->
   <div class="content-wrapper">

      <!-- Content Header (Page header) -->
      <section class="content-header">
         <h1>Interested Items (관심 종목)</h1>
         <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i
                  class="fa fa-dashboard"></i> Home</a></li>
            <li class="breadcrumb-item"><a href="#">user</a></li>
            <li class="breadcrumb-item active">관심 종목</li>
         </ol>
      </section>


<!-- Content Header (Page header) -->
<section class="content">

   <div class="row">
      <div class="col-md-12 col-12">
         <div class="box box-solid bg-dark">
            <div class="box-body">
               <div class="table-responsive">
                  <div id="example1_wrapper" class="dataTables_wrapper">
   
                     <!-- 검색 -->
                     <div id="example1_filter" class="dataTables_filter">
                        <label>
                           <input type="text" name="searchInput" value="" id="tags" onkeyup="autocomplete();"> 
                           <input type="submit" id="searchButton" value="Search" class="tst2 btn btn-warning" style="width:60; padding:0px;">
                        </label>
                     </div>
   
                     <div align="left" style="padding-top:25px;"> * 상세내역은 종목명 클릭</div>   
                     <table id="example1" class="table table-bordered table-striped dataTable" style="cursor: pointer;  width: 100%;" role="grid" aria-describedby="example1_info">
                        <thead>
                           <tr role="row" style="font-weight:bold; font-size:15px; color:white; background-color:black;">
                              <th style="width:300px;">종목명</th>
                              <th>현재가</th>
                              <th>전일대비</th>
                              <th>등락률</th>
                              <th>거래량</th>
                              <th>시가</th>
                              <th>고가</th>
                              <th>저가</th>
                              <!-- <th>매도호가</th>
                              <th>매도잔량</th>
                              <th>매수호가</th>
                              <th>매수잔량</th> -->
                              <th></th>
                           </tr>
                        </thead>
                        <tbody>
                           <c:if test="${cnt > 0}">
                              <c:forEach var="item" items="${itemList}">
                                 <tr role="row" class="media-list media-list-hover media-list-divided odd">
                                    
                                    <c:if test="${item.stocktheme == '금융업'}">
                                       <td onclick="selectCompany('${item.stockname}', '${item.stockcode}', '${item.stocktheme}');">
                                       <i class="cc ZEC mr-5" title="ZEC" style="witdh:30px; height:30px;"></i>${item.stockname}(${item.stockcode})</td>
                                    </c:if>
                                    <c:if test="${item.stocktheme == '의약품'}">
                                       <td onclick="selectCompany('${item.stockname}', '${item.stockcode}', '${item.stocktheme}');">
                                       <i class="cc QTUM mr-5" title="QTUM" style="witdh:30px; height:30px;"></i>${item.stockname}(${item.stockcode})</td>
                                    </c:if>
                                    <c:if test="${item.stocktheme == '전기전자'}">
                                       <td onclick="selectCompany('${item.stockname}', '${item.stockcode}', '${item.stocktheme}');">
                                       <i class="cc STRAT mr-5" title="STRAT" style="witdh:30px; height:30px;"></i>${item.stockname}(${item.stockcode})</td>
                                    </c:if>
                                    <c:if test="${item.stocktheme != '금융업' and item.stocktheme !='의약품' and item.stocktheme !='전기전자'}">
                                       <td onclick="selectCompany('${item.stockname}', '${item.stockcode}', '${item.stocktheme}');">
                                       <i class="cc BAT mr-5" title="BAT" style="witdh:30px; height:30px;"></i>${item.stockname}(${item.stockcode})</td>
                                    </c:if>
                                    
                                    <!-- 현재가 -->
                                    <td><div><fmt:formatNumber value="${item.stockcurrent}" pattern="#,###" /></div></td> 
                                    
                                    <!-- 대비 (전일종가와 오늘 종가의 차 -->
                                    <c:if test="${item.p_step > 0}">
                                       <td><i class="mdi mdi-arrow-up-bold"> ${item.p_step}</i></td> 
                                    </c:if>
                                    <c:if test="${item.p_step < 0}">
                                       <td><i class="mdi mdi-arrow-down-bold"> ${item.p_step}</i></td>
                                    </c:if>
                                    <c:if test="${item.p_step == 0}">
                                       <td><i class="fa fa-minus"> ${item.p_step}</i></td>
                                    </c:if> 
                                    
                                    <!-- 등락률 -->
                                    <c:if test="${item.gap > 0}">
                                       <td><i class="mdi mdi-arrow-up-bold"></i> ${item.p_step}</td> <!-- 대비 (전일종가와 오늘 종가의 차 -->
                                    </c:if>
                                    <c:if test="${item.gap < 0}">
                                       <td><i class="mdi mdi-arrow-down-bold"> ${item.p_step}</i></td>
                                    </c:if>
                                    <c:if test="${item.gap == 0}">
                                       <td><i class="fa fa-minus"> ${item.p_step}</i></td>
                                    </c:if> 
                                    
                                    <td><fmt:formatNumber value="${item.stockvolume}" pattern="#,###" /></td> <!-- 거래량 -->
                                    <td><fmt:formatNumber value="${item.stockopen}" pattern="#,###" /></td>
                                    <td><fmt:formatNumber value="${item.stockhigh}" pattern="#,###" /></td>
                                    <td><fmt:formatNumber value="${item.stocklow}" pattern="#,###" /></td>
                                    <!-- <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td> -->
                                    <td><span class="glyphicon glyphicon-trash" onclick="clickDelete('${item.stockname}', '${item.stockcode}')"></span></td>
                                 </tr>
                              </c:forEach>
                           </c:if>
   
                           <!-- 주식리스트가 없으면  -->
                           <c:if test="${cnt <= 0}">
                              <tr>
                                 <td colspan="13" align="center">관심 종목을 선택해주세요!</td>
                              </tr>
                           </c:if>
                        </tbody>
                     </table>
   
                     <!-- 페이징 처리  -->
                     <div class="dataTables_info" id="example1_info" role="status" aria-live="polite">Showing ${cnt} companies</div>
   
                     <!-- 검색시에도 페이징 처리 -->
                     <c:set var="addParam" value="searchInput=${param.searchInput}" />
   
                     <div class="dataTables_paginate paging_simple_numbers" id="example1_paginate">
   
                        <!-- 게시글 있으면  -->
                        <c:if test="${cnt > 0}">
                           <c:if test="${startPage > pageBlock}">
                              <a href="interestedItems.do?${addParam}&pageNum=${startPage - pageBlock}" class="paginate_button previous disabled"
                                 aria-controls="example1" data-dt-idx="0" tabindex="0" id="example1_previous">Previous</a>
                           </c:if>
   
                           <!-- 블록내의 페이지 번호  forEach문 돌리기-->
                           <c:forEach var="i" begin="${startPage}" end="${endPage}">
                              <c:if test="${i == currentPage}">
                                 <span class="paginate_button current"><b>${i}</b></span>
                              </c:if>
   
                              <c:if test="${i != currentPage}">
                                 <span><b> <a href="interestedItems.do?${addParam}&pageNum=${i}" class="paginate_button"
                                       aria-controls="example1" data-dt-idx="${i}" tabindex="0"> ${i}</a></b>
                                 </span>
                              </c:if>
                           </c:forEach>
   
                           <!-- 다음블록 [▶] / 끝 [▶▶] -->
                           <c:if test="${pageCount > endPage}">
                              <a href="interestedItems.do?${addParam}&pageNum=${pageCount}" class="paginate_button next" aria-controls="example1"
                                 data-dt-idx="7" tabindex="0" id="example1_next">Next</a>
                              <!-- 전체페이지를 세서  -->
                           </c:if>
                        </c:if>
                     </div>
                     <!-- 페이징 끝 -->
                  </div>
               </div>
            </div>
         </div>
      </div>


<!-- 선택 기업 주식 동향  -->

<style>
#table2 td, #table2 th {
   padding: 15px 15px 5px 15px;
}


#example1 tbody tr:hover {
   /*  outline: 0; */
    /* text-decoration: none; */
    color: black;  
    background-color: #BDBDBD;
   /*  opacity:0.4;
    transform:scale(1); */
}


#searchButton {
   background-image: url('/stock/resources/searchIcon.PNG');
   width: 25px;
   height: 25px;
}


#line-chart{
  min-height: 250px;
}

</style>



<!-- 선택 기업  출력 -->

<div class="col-md-12 col-12" style="margin-top: 50px; display: none;" id="selectCompany">
   <div class="box box-solid bg-dark">
      <div class="box-body">
         <div class="table-responsive" style="overflow-x:hidden;">

            <div class="row">
               <div class="col-md-12 col-12">
               
                  <div class="box-body">   <!-- 글자안내칸 -->
                     <div class="media align-items-center" style="padding-bottom:45px;">
                        <div id="companyLogo"></div>
                        <div><h3 class="no-margin text-bold" style="color: white;" id="companyName"></h3></div>
                        <!-- 선택기업이름 삽입  -->
                     </div>

                     <table style="padding: 5px; witdh:100%; border=1px;" id="table2">
                        <tr><td colspan="4">기준일자 : <span class="text-info today"></span></td></tr>
                        <tr>
                           <th><span class="text-yellow">250일 최고</span></th>
                           <td>
                              <span class="text-success" id="stock250high"></span> 원
                              <!-- <span class="text-success">+1.35%</span>  -->
                           </td>
                           <th><span class="text-yellow">액면가</span></th>
                           <td><span class="text-success">500원</span></td>
                           <th><span class="text-yellow">시가총액</span></th>
                           <td><span class="text-success" id="mkt_cap"></span></td>
                           <th><span class="text-yellow">EPS</span></th>
                           <td><span class="text-success">-810</span></td>
                        </tr>
                        <tr>
                           <th><span class="text-yellow">250일 최저</span></th>
                           <td>
                              <span class="text-success" id="stock250low"></span> 원  
                              <!-- span class="text-info">+1.35%</span>  -->
                           </td>
                           <th><span class="text-yellow">자본금</span></th>
                           <td><span class="text-success">355억</span></td>
                           <th><span class="text-yellow">대용가</span></th>
                           <td><span class="text-success">31,180</span></td>
                           <th><span class="text-yellow">PER</span></th>
                           <td><span class="text-success">--</span></td>
                        </tr>
                        <tr>
                           <th><span class="text-yellow">거래량</span></th>
                           <td>
                              <span class="text-success" id=stockvolume></span> 건
                           </td>
                           <th><span class="text-yellow">주식수</span></th>
                           <td><span class="text-success" id=totalstock></span></td>
                           <th><span class="text-yellow">신용비율</span></th>
                           <td><span class="text-success">2.81%</span></td>
                           <th><span class="text-yellow">결산월</span></th>
                           <td><span class="text-success">12월</span></td>
                        </tr>
                        
                        <tr>
                           <th><span class="text-yellow">체결가</span></th>
                           <td>
                              <span class="text-success" id=stockopen></span> 원
                           </td>
                           <th><span class="text-yellow">전일대비</span></th>
                           <td><span class="text-success"><fmt:formatNumber value="0" pattern="#,###" /></span></td>
                           <th><span class="text-yellow">체결량</span></th>
                           <td><span class="text-success">2.81%</span></td>
                           <th><span class="text-yellow">체결강도</span></th>
                           <td><span class="btn btn-danger">500.00</span></td>
                        </tr>
                     </table>

                  </div>

               </div>


               <!-- 그래프  -->
               <div class="col-md-12 col-12">
                  
                  <div class="box-body" style="padding-top: 30px;">
                     
                     <div class="box-header with-border">
                             <h3 class="box-title">가장 최근 10일  종가 기록 그래프</h3>
            
                          <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                          </div>
                        </div>
                        
                       <div class="box-body chart-responsive">
                          <div class="chart" id="line-chart" style="height: 300px;"></div>
                        </div>
                     
                     
                  </div>
                  
               </div><!-- 그래프 끝 -->
               
            </div> <!-- 선택기업 row  -->
         </div>
      </div>
   </div>
</div><!-- id: selectCompany -->
</div>
</section>

</div>
</form>

</div>

      <!-- /.content-wrapper -->
   <footer class="main-footer">
      <%@ include file="../include/main_footer.jsp" %>
   </footer>

      <!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
      <div class="control-sidebar-bg"></div>
      <!-- ./wrapper -->



      <!-- SlimScroll -->
      <script
         src="${project}assets/vendor_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>

      <!-- FastClick -->
      <script
         src="${project}assets/vendor_components/fastclick/lib/fastclick.js"></script>

      <!-- Crypto_Admin App -->
      <script src="${project}js/template.js"></script>

      <!-- Crypto_Admin for demo purposes -->
      <script src="${project}js/demo.js"></script>
      
      
</body>
</html>