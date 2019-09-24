<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=chrome">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <%@ include file="../include/header.jsp" %>
  <script src="/stock/resources/js/jquery-3.4.1.min.js"></script>
  <!-- 검색 ajax -->
  <script type="text/javascript">
  $(function() {
       $('#result').html("회사 및 코드를 검색하세요!");
      $('#keyword').keyup(function() {      // keyup : 데이터입력이 끝났을 때
         var keyword = $('#keyword').val();   // 입력한 키워드
         if(keyword.length == 0) {   // 글자수가 0인경우
            //$('#result').css("visibility", "hidden");   // 결과 없으면 숨김
            $('#result').html("회사 및 코드를 검색하세요!");
         } else {
            $('#result').css("visibility", "visible");   // 결과 있으면 보여줌
            $.ajax({
               type:"GET",
               data: "keyword=" + keyword,
               url: '${pageContext.request.contextPath}/user/search_sub',   // {컨트롤러}/이동 url
               success: function(data) {
                  $('#result').html(data);   // 결과 출력
               },
               error: function() {
                  alert('잠시만 기다려주세요');
               }
            });
         }
      });
   });
  
  window.onload = function(){
     $('#asking').css("visibility","visible");
     $.ajax({
        type:"GET",
         data:"CompanyCode=" + '000020',
         url: '${pageContext.request.contextPath}/user/asking_stock',
         success:function(data){
            $('#asking').html(data);
         },
         error:function(){
            alert('오류');
         }
     });
     
     $('#md_checkbox_21').click(function(){
		 if($('#md_checkbox_21').prop('checked')){
			 var buy_cnt =  document.buyinf.buy_cnt.value;
			 var curval = document.value.currVal.value;
			 document.buyinf.buy_price.value = curval;
			 document.buyinf.buy_total.value = buy_cnt * curval;
		 }
		 else{
			 document.buyinf.buy_price.value = "";
		 }
	  });
	  
	  $('#md_checkbox_22').click(function(){
		 if($('#md_checkbox_22').prop('checked')){
			 var curval = document.value.currVal.value;
			 var sell_cnt =  document.sellinf.sell_cnt.value;
			 document.sellinf.sell_price.value = curval;
			 document.sellinf.sell_total.value = sell_cnt * curval;
		 }
		 else{
			 document.sellinf.sell_price.value = "";
		 }
	  });
	  
	  $('#biggistBuyCnt').click(function(){
			 if($('#biggistBuyCnt').prop('checked')){
				 
				 var curval = document.value.currVal.value;
				 var showMoney =  document.buyinf.showMoney.value;
				 var bigBuyCnt =Math.floor(showMoney / curval);
				 
				 document.buyinf.buy_cnt.value = bigBuyCnt;
				 document.buyinf.buy_price.value = curval;
				 document.buyinf.buy_total.value = bigBuyCnt * curval;
				 
			 }
			 else{
				 document.buyinf.buy_cnt.value = "";
			 }
	  });
	  
	  $('#biggistSellCnt').click(function(){
			 if($('#biggistSellCnt').prop('checked')){
				 
				 var curval = document.value.currVal.value;
				 var showCnt =  document.sell.cnt.value;
				 
				 document.sellinf.sell_cnt.value = showCnt;
				 document.sellinf.sell_price.value = curval;
				 document.sellinf.sell_total.value = showCnt * curval;
				 
			 }
			 else{
				 document.sellinf.sell_cnt.value = "";
			 }
	  });
     
	  $.ajax({
			type:"GET",
			data:"CompanyCode=" + '000020' + '&username=' + '${pageContext.request.userPrincipal.name}',
			url: '${pageContext.request.contextPath}/user/complete',
			success:function(data){
				$('#complete').html(data);
			},
			error:function(){
				alert('잠시만 기다려주세요');
			}
		});
 }
  function orderBuy(){
	  var username =  document.id.username.value;
	  var stockcode = document.search.keyword.value;
	  var buy_cnt =  document.buyinf.buy_cnt.value;
	  var buy_price = document.buyinf.buy_price.value;
	  var buy_total =  document.buyinf.buy_total.value;
	  var showMoney =  document.buyinf.showMoney.value;
	  
	  var reg1 =/^[0-9]*$/;
	  
	  var result1 = reg1.test(buy_cnt);
	  var result2 = reg1.test(buy_price);
	  
	  if(stockcode == ""){
		  alert("회사코드를 선택해주세요");
	  }else if(buy_cnt == ""){
		  alert("매수 수량을 입력해주세요");
	  }else if(buy_price == ""){
		  alert("매수 가격을 입력해주세요");
	  }
	  else{
		  if(!result1){
			  alert("수량은 숫자만 가능합니다");
			  buy_cnt = "";
			  document.buyinf.buy_cnt.focus();
			  return false;
		  }
		  if(!result2){
			  alert("가격은 숫자만 가능합니다");
			  buy_price = "";
			  document.buyinf.buy_price.focus();
			  return false;
		  }
		  
		  var url ="buyOrder?stockcode="+stockcode + "&buy_cnt="+buy_cnt+"&buy_price="+buy_price+"&buy_total="+buy_total.replace(/,/g, '')+"&showMoney="+showMoney.replace(/,/g, '')+"&username=" + username;
		  window.open(url,"주식 매수 신청","menubar=no , width=500, height=300");
	  }
  }
  
  function orderSell(){
	  var username = document.id.username.value;
	  var stockcode = document.search.keyword.value;
	  var sell_cnt =  document.sellinf.sell_cnt.value;
	  var sell_price = document.sellinf.sell_price.value;
	  var sell_total =  document.sellinf.sell_total.value;
	  var showCnt =  document.sell.cnt.value;
	  
	  var reg1 =/^[0-9]*$/;
	  
	  var result1 = reg1.test(sell_cnt);
	  var result2 = reg1.test(sell_price);
	  
	  if(stockcode == ""){
		  alert("회사코드를 선택해주세요");
	  }else if(sell_cnt == ""){
		  alert("매도 수량을 입력해주세요");			  
	  }else if(sell_price == ""){
		  alert("매도 가격을 입력해주세요");
	  }
	  else{
		  if(!result1){
			  alert("수량은 숫자만 가능합니다");
			  sell_cnt = "";
			  document.sellinf.sell_cnt.focus();
			  return false;
		  }
		  if(!result2){
			  alert("가격이 숫자만 가능합니다");
			  sell_price = "";
			  document.sellinf.sell_price.focus();
			  return false;
		  }
		  var url ="sellOrder?stockcode="+stockcode + "&sell_cnt="+sell_cnt+"&sell_price="+sell_price+"&sell_total="+sell_total.replace(/,/g, '')+"&showCnt=" + showCnt+"&username=" + username;
		  window.open(url,"주식 매도 신청","menubar=no , width=550, height=300");
	  }
  }
  
  function calcu(){
	  var buy_cnt =  document.buyinf.buy_cnt.value;
	  var buy_price = document.buyinf.buy_price.value;
	  var buysum =  buy_cnt * buy_price;
	  document.buyinf.buy_total.value = buysum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	  
	  var sell_cnt =  document.sellinf.sell_cnt.value;
	  var sell_price = document.sellinf.sell_price.value;
	  var sellsum = sell_cnt * sell_price;
	  document.sellinf.sell_total.value = sellsum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  }

  function curr(val){
	  document.buyinf.buy_price.value = val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	  document.sellinf.sell_price.value = val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");  
  }
  
  
  function buy_cancel(stockname,buy_price,buy_cnt,stockcode){
	   var div_cnt=0;  
	   var result = confirm(stockname+"을 등록 취소 하시겠습니까?");
	   
	   if(result){
	      var url ="cancel_buy_sell?stockcode="+stockcode + "&buy_price="+buy_price+"&buy_cnt="+buy_cnt+"&div_cnt="+div_cnt;
	        window.open(url,"매수 취소","menubar=no , width=500, height=200");
	        window.location.reload();
	   }else{
	      alert("취소 되었습니다");
	   }
	   
	  }
	  
  function sell_cancel(stockname,sell_price,sell_cnt,stockcode){
     var div_cnt=1;
     var result = confirm(stockname+"을 등록 취소 하시겠습니까?");
      
     if(result){
        var url ="cancel_buy_sell?stockcode="+stockcode + "&sell_price="+sell_price+"&sell_cnt="+sell_cnt+"&div_cnt="+div_cnt;
        window.open(url,"매도 취소","menubar=no , width=500, height=200");
        window.location.reload();
     }else{
        alert("취소 되었습니다");
     }  
  }
</script>   
</head>

<body class="hold-transition skin-black sidebar-mini fixed">
<div class="wrapper">
<form name="id">
	<input type="hidden" name="username" value="${username}">
</form> 
  
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <%@ include file="side_menu.jsp" %>
  </aside>
  
  <header class="main-header">
    <%@ include file="../include/main_header.jsp" %>
  </header>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
     

    <!-- Main content -->
    <section class="content">
      <div class="row">
         <div class="col-12">
            <div class="box box-inverse box-dark">
              <div class="box-body">
                 
                 <ul id="webticker-1">
                   <c:forEach var = "yesDate" items="${yesDate}">
                  <li class="br-1">
                     <div class="mx-20">
                        <div class="d-flex justify-content-between">
                           <h5 class="mr-40 text-white-50">${yesDate.stockCode} + 회사명</h5>
                           <c:if test="${(yesDate.r_close - yesDate.r_empty) / yesDate.r_empty * 100 <= 0}">
                              <p class="text-danger"><fmt:formatNumber type ="number" pattern = "0.00" value ="${(yesDate.r_close - yesDate.r_empty) / yesDate.r_empty * 100}"/></p>
                           </c:if>
                           <c:if test="${(yesDate.r_close - yesDate.r_empty) / yesDate.r_empty * 100 > 0}">
                              <p class="text-success"><fmt:formatNumber type ="number" pattern = "+0.00" value ="${(yesDate.r_close - yesDate.r_empty) / yesDate.r_empty * 100}"/></p>
                           </c:if>
                        </div>
                        <div class="d-flex justify-content-between">
                           <h4 class="my-0 mr-40">금일 종가 <fmt:formatNumber type ="number" pattern = ",000,000" value ="${yesDate.r_empty}"/>원</h4>
                           <span class="sparklines">${yesDate.stockCode}</span>
                        </div>
                     </div>
                  </li>
                  </c:forEach>
                 </ul>
              </div>
           </div>
         </div>
         <!-- 검색 창 시작 -->
         <div class="col-xl-4 col-12">
         <div class="box">
             <div class="col-13" style="height: 400px; overflow: auto;" id="slimtest1">
               <div class="box">
               <div class="box-body">
               <div class="table-responsive">
                  <div class="box-header with-border" style ="height :72px;" >
                    <h4 class="box-title">Search</h4>
                     <div class="box-controls pull-right">
                        <span class="search-box">
                        <br>
                        <form class="app-search" style="top:-45%;" name="search"> <!-- style="display: none;" --> 
                           <input type="text" class="form-control" autocomplete=off placeholder="Search &amp; enter" id="keyword"> <a class="srh-btn"></a>
                        </form>
                        </span>
                     </div>
                  </div>
                 <table id="example5" class="table table-hover">
                  <tr>
                     <td>
                        <p class="mb-0">
                          <strong id ="result"></strong>
                        </p>
                     </td>
                  </tr>
              </table>
               </div>
               </div>
               <!-- /.box-body -->
             </div>
             <!-- /.box -->
             </div>
           </div>
           
          <div class="box">
            <div class="box-header">
              <i class="fa fa-bar-chart-o"></i>
              <h3 class="box-title text-warning">나의 보유 주식</h3>
            </div>
            <div class="box-body text-center" id="complete" style="height : 160px;"></div>
          </div>
          
          <div class="box">
            <div class="box-header">
              <i class="fa fa-bar-chart-o"></i>
              <h3 class="box-title text-warning">매도/매수 등록 현황</h3>
            </div>
            <div class="box-body text-center" id="reg_buy_sell" style="height : 215px; overflow:auto;" >
               <table>
                  <tr>
                     <th style="width:60px; height:40px;">구분</th>
                     <th style="width:60px; height:40px;">날짜</th>
                     <th style="width:120px; height:40px;">주식명</th>
                     <th style="width:120px; height:40px;">가격</th>
                     <th style="width:100px; height:40px;" colspan="2">수량</th>
                  </tr>
               <c:forEach var ="b" items="${b_vo}">
                  <tbody>
                  <tr>
                     <td style="width:60px; height:40px;"><span class="label label-info">매수</span></td>
                     <td style="width:60px; height:40px;"><fmt:formatDate value="${b.buy_date}" pattern ="MM/dd"/></td>
                     <td style="width:120px; height:40px;">${b.stockname}</td>
                     <td style="width:120px; height:40px;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${b.buy_price}" />원</td>
                     <td style="width:100px; height:40px;">${b.buy_cnt}주 &nbsp;</td>
                     <td><input class="label label-info" type="button" value="취소" onclick="buy_cancel('${b.stockname}','${b.buy_price}','${b.buy_cnt}','${b.stockcode}');"></td>
                  </tr>
                  <c:forEach var ="s" items="${s_vo}">
                  <tbody>
                  <tr>
                     <td style="width:60px; height:40px;"><span class="label label-danger">매도</span></td>
                     <td style="width:60px; height:40px;"><fmt:formatDate value="${s.sell_date}" pattern ="MM/dd"/></td>
                     <td style="width:120px; height:40px;">${s.stockname}</td>
                     <td style="width:120px; height:40px;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${s.sell_price}" />원</td>
                     <td style="width:100px; height:40px;">${s.sell_cnt}주 &nbsp; </td>
                     <td><input type="button" class="label label-danger" value="취소" onclick="sell_cancel('${s.stockname}','${s.sell_price}','${s.sell_cnt}','${s.stockcode}');"></td>
                  </tr>
                  </tbody>
                  </c:forEach>
                  </tbody>
               </c:forEach>   
               </table>
            </div>
          </div>
      </div>
   <!-- 검색창 끝 -->
   
   <!-- 주식호가창  시작 -->
   <div class="col-xl-4 col-12" style="height: 945px; overflow: hidden;">
      <div class="box" id="asking">
      </div>   
   </div>   
   <!-- 상승하락창 끝 -->
   <!-- 매수/매도 창 시작 -->
   <div class="col-xl-4 col-12">
      <div class="box" style="height: 450px;">
         <div class="box box-solid bg-dark">
               <div class="box-header with-border">
                 <h3 class="box-title">인기 검색 종목</h3>
                 <div class="box-tools pull-right">
                   <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                   <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                 </div>
               </div>
               <div class="box-body">
               <div class="table-responsive">
                  <table class="table no-margin table-hover">
                     ${thead }
                     ${tbody }
                  </table>
               </div>
            </div>
           </div>
      </div>

      <div class="box">
		  <ul class="nav nav-tabs nav-tabs-danger nav-justified" role="tablist">
			<li class="nav-item">
			  <a class="nav-link active font-size-18" data-toggle="tab" href="#buy" role="tab">BUY</a>
			</li>
			<li class="nav-item">
			  <a class="nav-link font-size-18" data-toggle="tab" href="#sell" role="tab">SELL</a>
			</li>
		  </ul>

		  <!-- Tab panes -->
		  <div class="box-body tab-content">
			<div class="tab-pane fade active show" id="buy" style ="height :390px;">
		  		<form name = "buyinf">
		  		<!--Default!-->
		  		<table>
		  		 <tr>
				  <td style="width:500px" align="right">
				  <div class="col-lg-8">
					<div class="input-group">
					<span class="input-group-addon">보유</span>
					<input type="hidden" id="showMoney" value="${money.money}">
					<input type = "text"  class="form-control" value="<fmt:formatNumber type="number" maxFractionDigits="3" value="${money.money}" />" readonly>
					<span class="input-group-addon">원</span>
					</div>
				  </div>
				  </td>
				  </tr>
				</table>  	 
					<br>
	  			<div class="form-group">
				<div class="input-group">
				<span class="input-group-addon">수량</span>
				<input type="text" id = "buy_cnt" name="buy_cnt" class="form-control" placeholder="매수 수량을 입력해 주세요" onkeyup="calcu();">
				<span class="input-group-addon">주</span>
				</div>
				</div>
	  		
  				<div class="form-group">
				<div class="input-group">
				<span class="input-group-addon">가격</span>
				<input type="text" id = "buy_price" name="buy_price" class="form-control"  placeholder="가격을 입력해 주세요" onkeyup="calcu();">
				<span class="input-group-addon">원</span>
				</div>
				</div>
  				<input type="checkbox" id="md_checkbox_21" class="filled-in chk-col-red" />
				<label for="md_checkbox_21">현재가</label>		
				&nbsp;
				<input type="checkbox" id="biggistBuyCnt" class="filled-in chk-col-red" />
				<label for="biggistBuyCnt">최대 매수량</label>		
				
		  		<p class="my-10">주문금액</p>
				<div class="input-group">
					<input type="text" class="form-control" name="buy_total" id="buy_total" readonly >
					<span class="input-group-addon">원</span>
			  	</div>
				<br>  
				<div class="d-block">
					<button type="button" class="btn btn-block btn-success btn-lg" onclick="orderBuy();">BUY ORDER</button>
				</div>
				</form>
			</div>
			<div class="tab-pane fade" id="sell" style ="height :390px;">
				<form name = "sellinf">
				<!--Default!-->
	  			<div class="form-group">
				<div class="input-group">
				<span class="input-group-addon">수량</span>
				<input type="text" name="sell_cnt" class="form-control" placeholder="매도 수량을 입력해 주세요" onkeyup="calcu();">
				<span class="input-group-addon">주</span>
				</div>
				</div>
	  		
  				<div class="form-group">
				<div class="input-group">
				<span class="input-group-addon">가격</span>
				<input type="text" name="sell_price" class="form-control" placeholder="가격을 입력해 주세요" onkeyup="calcu();">
				<span class="input-group-addon">원</span>
				</div>
				</div>
  				<input type="checkbox" id="md_checkbox_22" class="filled-in chk-col-red" />
				<label for="md_checkbox_22">현재가</label>
				&nbsp;
				<input type="checkbox" id="biggistSellCnt" class="filled-in chk-col-red" />
				<label for="biggistSellCnt">최대 매도량</label>			
					
		  		<p class="my-10">주문금액</p>
				<div class="input-group">
					<input type="text" class="form-control" name="sell_total" readonly >
					<span class="input-group-addon">원</span>
			  	</div>
				<br>  
				<div class="d-block">
					<button type="button" class="btn btn-block btn-success btn-lg" onclick="orderSell();">SELL ORDER</button>
				</div>
				</form>
			</div>
		  </div>
		</div>
	</div>
                  
         <!-- price chart 시작 -->
      <div class="col-12">
      <div class="box box-solid bg-dark">
         <div class="box-header with-border">
           <h4 class="box-title">Price Chart</h4>     
         </div>
         <div class="box-body">
            <div class="box-body">
               <div class="chart" id="chart_stock"></div>
            </div>
         </div>
         <!-- /.box-body -->
        </div>
      </div>
      <!-- price chart 끝 -->
      
     
   </div>   
   </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
  <footer class="main-footer">
    <%@ include file="../include/main_footer.jsp" %>
  </footer>
  
</div>
<!-- ./wrapper -->
     
   <!-- jQuery 3 -->
   <script src="${project}assets/vendor_components/jquery/dist/jquery.js"></script>
   <script src="${project}assets/vendor_components/jquery/dist/jquery.min.js"></script>
   <!-- popper -->
   <script src="${project}assets/vendor_components/popper/dist/popper.min.js"></script>
   
   <!-- Bootstrap 4.0-->
   <script src="${project}assets/vendor_components/bootstrap/dist/js/bootstrap.js"></script>
      
   <!-- Slimscroll -->
   <script src="${project}assets/vendor_components/jquery-slimscroll/jquery.slimscroll.js"></script>
   
   <!-- FastClick -->
   <script src="${project}assets/vendor_components/fastclick/lib/fastclick.js"></script>
   
    <!-- Resources -->
   <script src="https://www.amcharts.com/lib/4/core.js"></script>
   <script src="https://www.amcharts.com/lib/4/charts.js"></script>
   <script src="https://www.amcharts.com/lib/4/themes/dark.js"></script>
   <script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
   
   <!-- webticker -->
   <script src="${project}assets/vendor_components/Web-Ticker-master/jquery.webticker.min.js"></script>
      
   <!-- Sparkline -->
   <script src="${project}assets/vendor_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
      
   <!-- Crypto_Admin App -->
   <script src="${project}js/template.js"></script>
   <script src="${project}js/amcharts4/core.js"></script>
   <script src="${project}js/amcharts4/charts.js"></script>
   <!-- Crypto_Admin dashboard demo (This is only for demo purposes) -->
   <script src="${project}js/pages/dashboard.js"></script>
   
   <!-- Crypto_Admin for demo purposes -->
   <script src="${project}js/demo.js"></script>
   
   <!-- jQuery Knob -->
   <script src="${project}assets/vendor_components/jquery-knob/js/jquery.knob.js"></script>
   
   <!-- SlimScroll -->
   <script src="${project}assets/vendor_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <script type="text/javascript">
        $('#slimtest1').slimScroll({
            height: '400px'
        });
    </script>
    
    <script type="text/javascript">
        $('#reg_buy_sell').slimScroll({
            height: '215px'
        });
    </script>
</body>
</html>