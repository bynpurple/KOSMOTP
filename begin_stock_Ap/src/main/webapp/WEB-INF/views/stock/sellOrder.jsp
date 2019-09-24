<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/header.jsp" %>    
<html>
<body>
   <c:if test="${sellCnt!=1}">
      <div class="row">
        <div class="box-body">
         <h1 class="page-header text-center no-border font-weight-600 font-size-60 mt-25"><span class="text-yellow">이체</span><span class="text-danger">실패</span><br>되었습니다</h1>
           <div align="center"><h4>거래 실패 했습니다<br>가격 및 수량을 다시 확인 해주세요</h4><br><h5>1회 거래가능 가격은 10억 미만입니다</h5></div>
           <div align="center"><input type ="button" value="확인" onclick="window.self.close();" style="width:100px; height:30px; color:black;" class="label label-success"></div>
        </div>
        </div>
   </c:if>
   
   <c:if test="${sellCnt==1}">
      <script type="text/javascript">
      alert("매도 신청이 완료 되었습니다.");
      </script>
      <div class="box-body">
      <div class="table-responsive">
         <table class="table table-bordered">
           <thead>
            <tr class="bg-warning">
              <th scope="col">회사 명 / 회사 코드</th>
              <th scope="col">매도 가격</th>
              <th scope="col">매도 수량</th>
              <th scope="col">합계</th>
            </tr>
           </thead>
           <tbody>
            <tr>
              <th scope="row">${vo.stockName} / ${vo.stockCode}</th>
              <th><fmt:formatNumber type="number" maxFractionDigits="3" value="${sell_price}" />원</th>
              <th>${sell_cnt}주</th>
              <th><fmt:formatNumber type="number" maxFractionDigits="3" value="${sell_total}" />원</th>
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