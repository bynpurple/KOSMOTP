<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/header.jsp" %>    
<html>
<body style="background:#252525;">
	
	<c:if test="${Bookbuy!=1}">
		<div class="row">
  		<div class="box-body">
			<h1 class="page-header text-center no-border font-weight-600 font-size-60 mt-25"><span class="text-yellow">이체</span><span class="text-danger">실패</span><br>되었습니다</h1>
  			<div align="center"><h4>거래 실패 했습니다<br>가격 및 수량을 다시 확인 해주세요</h4><br><h5>1회 거래가능 가격은 10억 미만입니다</h5></div>
  			<div align="center"><input type ="button" value="확인" onclick="window.self.close();" style="width:100px; height:30px; color:black;" class="label label-success"></div>
  		</div>
  		</div>
	</c:if>
	
	<c:if test="${Bookbuy==1}">
		<script type="text/javascript">
		alert("매수 예약 신청이 완료 되었습니다.");
		</script>
		<div class="box-body">
		<div class="table-responsive">
			<table class="table table-bordered">
			  <thead>
				<tr class="bg-warning">
				  <th scope="col">예약 날짜</th>	
				  <th scope="col">회사 코드</th>
				  <th scope="col">매수 가격</th>
				  <th scope="col">매수 수량</th>
				</tr>
			  </thead>
			  <tbody>
				<tr>
				  <th>
				  ${buyBookStart}
				  <br>
				  <div align ="center">~</div>
				  ${buyBookEnd}
				  </th>
				  <th scope="row">${stockcode}</th>
				  <th><fmt:formatNumber type="number" maxFractionDigits="3" value="${buy_price}" />원</th>
				  <th>${buy_cnt}주</th>
				</tr>
			  </tbody>
			</table>
			<div align ="center">
				<input type = "button" class="btn btn-block btn-success btn-lg" value = "확인" onclick="window.close();"> 			
			</div>
		</div>
        </div>
      <!-- /.box-body -->
	</c:if>
</body>
</html>