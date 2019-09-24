<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %> 
<!DOCTYPE html>
<html lang="ko">
<body style="background:#252525;">
  <!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->
  <c:if test="${transCnt == 1}">
	  	<div class="row">
  		<div class="box-body">
			<h1 class="page-header text-center no-border font-weight-600 font-size-60 mt-25"><span class="text-yellow">이체</span><span class="text-danger">완료</span><br>되었습니다</h1>
  			<div align="center"><input type ="button" value="확인" onclick="window.self.close();" style="width:100px; height:30px;" class="label label-success"></div>
  		</div>
  		</div>
  </c:if>
 
  <c:if test="${transCnt != 1}">
	  	<div class="row">
  		<div class="box-body">
			<h1 class="page-header text-center no-border font-weight-600 font-size-60 mt-25"><span class="text-yellow">이체</span><span class="text-danger">실패</span><br>되었습니다</h1>
  			<div align="center"><h3>이체 금액 및 계좌 번호를<br>다시 확인 해주세요</h3></div>
  			<div align="center"><input type ="button" value="확인" onclick="window.self.close();" style="width:100px; height:30px; color:black;" class="label label-success"></div>
  		</div>
  		</div>
  </c:if>	
</body>
</html>
