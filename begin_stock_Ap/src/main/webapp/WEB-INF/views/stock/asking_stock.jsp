<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file ="../include/header.jsp" %>    
<html>
<body>
<div class="box-header with-border">
	<div class="box-controls pull-right" id ="codeCompany">
		<h3>${vo.stockName} <small>${vo.stockCode}</small></h3>
	</div>
</div>
<form name="value">
<div class="box-body" style="height:900px;">
	<div class="table-responsive buyorder">
		<table class="table no-margin no-border">
			<thead>
				<tr class="bg-dark" align="center" style="weight : bold;">
					<th>상한</th>
					<th>가격</th>
					<th>하한</th>
				</tr>
			</thead>
			<%-- <c:if test="${vo.stockOpen>10000}"> --%>
				<tbody>
				  <tr align="center" style="border-top : 1px solid white; border-bottom : 1px solid white;">
					<th>매수 총 거래량</th>
					<th></th>
					<th></th>
				  </tr>	
			  	<c:forEach var="vo1" items = "${vo1}">
				  <tr align="center">
					<th><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo1.buy_cnt}"></fmt:formatNumber></th>
					<th><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo1.buy_price}"></fmt:formatNumber></th>
					<th></th>
				  </tr>
			  	</c:forEach>
				  <%-- <tr align="center">
					<th>
					  <div class="progress xs">
                        <div class="progress-bar progress-bar-aqua" style="width: 30%" role="progressbar"
                             aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">30% Complete</span>
                        </div>
                      </div>
					</th>
					<th><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.stockOpen+150}"></fmt:formatNumber></th>
					<th></th>
				  </tr>
				  <tr align="center">
					<th>
					  <div class="progress xs">
                        <div class="progress-bar progress-bar-aqua" style="width: 30%" role="progressbar"
                             aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">30% Complete</span>
                        </div>
                      </div>
					</th>
					<th><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.stockOpen+100}"></fmt:formatNumber></th>
					<th></th>
				  </tr>
				  <tr align="center">
					<th>
					  <div class="progress xs">
                        <div class="progress-bar progress-bar-aqua" style="width: 30%" role="progressbar"
                             aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">30% Complete</span>
                        </div>
                      </div>
					</th>
					<th><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.stockOpen+50}"></fmt:formatNumber></th>
					<th></th>
				  </tr>	 --%>
				  <tr align="center">
					<th>매수 총 거래량</th>
					<th><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.stockCurrent}"/>
					<input type ="hidden" name ="currVal" value="${vo.stockCurrent}"></th>
					<th>매도 총 거래량</th>
				  </tr>
				<c:forEach var="vo2" items="${vo2}">
				  <tr align="center">
					<th></th>
					<th><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo2.sell_price}"/></th>
					<th><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo2.sell_cnt}"></fmt:formatNumber></th>
				  </tr>
                </c:forEach>
				  <%-- <tr align="center">
					<th></th>
					<th><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.stockOpen-100}"></fmt:formatNumber></th>
					<th>
					  <div class="progress xs">
                        <div class="progress-bar progress-bar-danger" style="width: 20%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">20% Complete</span>
                        </div>
                      </div>
                    </th>
				  </tr>
				  <tr align="center">
					<th></th>
					<th><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.stockOpen-150}"></fmt:formatNumber></th>
					<th>
					  <div class="progress xs">
                        <div class="progress-bar progress-bar-danger" style="width: 20%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">20% Complete</span>
                        </div>
                      </div>
                    </th>
				  </tr>
				  <tr align="center">
					<th></th>
					<th><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.stockOpen-200}"></fmt:formatNumber></th>
					<th>
					  <div class="progress xs">
                        <div class="progress-bar progress-bar-danger" style="width: 20%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">20% Complete</span>
                        </div>
                      </div>
                    </th>
				  </tr> --%>
				  <tr align="center" style="border-top : 1px solid white; border-bottom : 1px solid white;">
					<th></th>
					<th></th>
					<th>매도 총 거래량</th>
				  </tr>
				</tbody>
			<%-- </c:if> --%>
			<%-- <c:if test="${vo.stockOpen<10000}">
				<tbody>
				  <tr align="center" style="border-top : 1px solid white; border-bottom : 1px solid white;">
					<th>매수 총 거래량</th>
					<th></th>
					<th></th>
				  </tr>
				  <tr align="center">
					<th>
					  <div class="progress xs">
                        <div class="progress-bar progress-bar-aqua" style="width: 30%" role="progressbar"
                             aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">30% Complete</span>
                        </div>
                      </div>
					</th>
					<th><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.stockOpen+40}"></fmt:formatNumber></th>
					<th></th>
				  </tr>
				  <tr align="center">
					<th>
					  <div class="progress xs">
                        <div class="progress-bar progress-bar-aqua" style="width: 30%" role="progressbar"
                             aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">30% Complete</span>
                        </div>
                      </div>
					</th>
					<th><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.stockOpen+30}"></fmt:formatNumber></th>
					<th></th>
				  </tr>
				  <tr align="center">
					<th>
					  <div class="progress xs">
                        <div class="progress-bar progress-bar-aqua" style="width: 30%" role="progressbar"
                             aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">30% Complete</span>
                        </div>
                      </div>
					</th>
					<th><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.stockOpen+20}"></fmt:formatNumber></th>
					<th></th>
				  </tr>
				  <tr align="center">
					<th>
					  <div class="progress xs">
                        <div class="progress-bar progress-bar-aqua" style="width: 30%" role="progressbar"
                             aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">30% Complete</span>
                        </div>
                      </div>
					</th>
					<th><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.stockOpen+10}"></fmt:formatNumber></th>
					<th></th>
				  </tr>	
				  <tr align="center">
					<th>매수 총 거래량</th>
					<th><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.stockOpen}"></fmt:formatNumber><input type ="hidden" name ="currVal" value="${vo.stockOpen}"></th>
					<th>매도 총 거래량</th>
				  </tr>
				  <tr align="center">
					<th rowspan="4">
					</th>
					<th><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.stockOpen-10}"></fmt:formatNumber></th>
					<th> 
					  <div class="progress xs">
                        <div class="progress-bar progress-bar-danger" style="width: 20%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">20% Complete</span>
                        </div>
                      </div>
					</th>
				  </tr>
				  <tr align="center">
					<th><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.stockOpen-20}"></fmt:formatNumber></th>
					<th>
					  <div class="progress xs">
                        <div class="progress-bar progress-bar-danger" style="width: 20%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">20% Complete</span>
                        </div>
                      </div>
                    </th>
				  </tr>
				  <tr align="center">
					<th><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.stockOpen-30}"></fmt:formatNumber></th>
					<th>
					  <div class="progress xs">
                        <div class="progress-bar progress-bar-danger" style="width: 20%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">20% Complete</span>
                        </div>
                      </div>
                    </th>
				  </tr>
				  <tr align="center">
					<th><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.stockOpen-40}"></fmt:formatNumber></th>
					<th>
					  <div class="progress xs">
                        <div class="progress-bar progress-bar-danger" style="width: 20%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">20% Complete</span>
                        </div>
                      </div>
                    </th>
				  </tr>
				  <tr align="center" style="border-top : 1px solid white; border-bottom : 1px solid white;">
					<th></th>
					<th></th>
					<th>매도 총 거래량</th>
				  </tr>
				</tbody>
			</c:if> --%>
		</table>
	</div>
</div>
</form>
</body>
</html>