<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<html>
<body onbody="">
<div class="box-header with-border">
	<div class="box-controls pull-right" id ="codeCompany">
		<h3>${vo.stockName} <small>${vo.stockCode}</small></h3>
	</div>
</div>
<div class="box-body">
	<div class="table-responsive buyorder">
		<table class="table no-margin no-border">
			<thead>
				<tr class="bg-dark" align="center" style="weight : bold;">
					<th>상한</th>
					<th>가격</th>
					<th>하한</th>
				</tr>
			</thead>
			<c:if test="${vo.stockOpen>10000}">
				<tbody>
				  <tr align="center">
					<th>
					  <div class="progress xs">
                        <div class="progress-bar progress-bar-aqua" style="width: 30%" role="progressbar"
                             aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">30% Complete</span>
                        </div>
                      </div>
					</th>
					<th>${vo.stockOpen+200}</th>
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
					<th>${vo.stockOpen+150}</th>
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
					<th>${vo.stockOpen+100}</th>
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
					<th>${vo.stockOpen+50}</th>
					<th></th>
				  </tr>	
				  <tr align="center" style="border-top : 1px solid white; border-bottom : 1px solid white;">
					<th>현재가</th>
					<th>${vo.stockOpen}</th>
					<th></th>
				  </tr>
				  <tr align="center">
					<th></th>
					<th>${vo.stockOpen-50}</th>
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
					<th>${vo.stockOpen-100}</th>
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
					<th>${vo.stockOpen-150}</th>
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
					<th>${vo.stockOpen-200}</th>
					<th>
					  <div class="progress xs">
                        <div class="progress-bar progress-bar-danger" style="width: 20%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">20% Complete</span>
                        </div>
                      </div>
                    </th>
				  </tr>
				</tbody>
			</c:if>
			<c:if test="${vo.stockOpen<10000}">
				<tbody>
				  <tr align="center">
					<th>
					  <div class="progress xs">
                        <div class="progress-bar progress-bar-aqua" style="width: 30%" role="progressbar"
                             aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">30% Complete</span>
                        </div>
                      </div>
					</th>
					<th>${vo.stockOpen+40}</th>
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
					<th>${vo.stockOpen+30}</th>
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
					<th>${vo.stockOpen+20}</th>
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
					<th>${vo.stockOpen+10}</th>
					<th></th>
				  </tr>	
				  <tr align="center" style="border-top : 1px solid white; border-bottom : 1px solid white;">
					<th>현재가</th>
					<th>${vo.stockOpen}</th>
					<th></th>
				  </tr>
				  <tr align="center">
					<th></th>
					<th>${vo.stockOpen-10}</th>
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
					<th>${vo.stockOpen-20}</th>
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
					<th>${vo.stockOpen-30}</th>
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
					<th>${vo.stockOpen-40}</th>
					<th>
					  <div class="progress xs">
                        <div class="progress-bar progress-bar-danger" style="width: 20%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">20% Complete</span>
                        </div>
                      </div>
                    </th>
				  </tr>
				</tbody>
			</c:if>
		</table>
	</div>
</div>
</body>
</html>