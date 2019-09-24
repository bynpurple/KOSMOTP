<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<html class="no-js" lang="ko">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Chrome">
        <title>Definity - Shop Single Product Page</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <script src="/stock/resources/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript">
    $(function() {
		$('#commentCompleted').click(function() {		
			$('#result').css("visibility", "visible");	// 결과 있으면 보여줌
			var commentId = $('#commentId').val();
			var commentPwd = $('#commentPwd').val();
			var comment =$('#comment').val();
			
			$.ajax({
				type:"GET",
				data: "commentId=" + commentId + "&commentPwd="+commentPwd +"&comment="+comment,
				url: '${pageContext.request.contextPath}/user/fundCommnet',	// {컨트롤러}/이동 url
				success: function(data) {
					$('#result').html(data);
				},
				error: function() {
					alert('오류');
				}
			});
		});
	});
	    
    function comment(qna_id,qna_comment,qna_date){
    	var url ="Recomment?qna_id="+qna_id+"&qna_comment="+qna_comment+"&qna_date="+qna_date;
		  window.open(url,"대화창","menubar=no , width=700, height=900");
    }
    
    function deletecomment(DelcommentId,qna_date){
    	var DelcommentPwd = prompt("비밀 번호를 입력 해주세요 : ");	
    	
    	$(function(){
    	$.ajax({
			type:"GET",
			data: "DelcommentPwd="+DelcommentPwd+"&DelcommentId="+DelcommentId+"&qna_date="+qna_date,
			url: '${pageContext.request.contextPath}/user/deleteComment',	// {컨트롤러}/이동 url
			success: function(data) {
				$('#result').html(data);					
			},
			error: function() {
				alert('다시 한번 시도 해주세요');
				}
			});	
    	});
    }	
    
    </script>
    <body id="page-top" data-spy="scroll" data-target=".navbar">
        <%@ include file="../include/top-header.jsp" %>
 
        <!-- ========== Page Title ========== -->
 
        <header class="page-title pt-large pt-light pt-parallax pt-plax-lg-light"
        data-stellar-background-ratio="0.4">
          <div class="container">
              <div class="row">
 
                <div class="col-sm-6">
                  <h1> Funding 상세 보기 </h1>
                  <span class="subheading"><span class="et-traget"> Single Product Page</span></span>
                </div>
                <ol class="col-sm-6 text-right breadcrumb">
                  <li><a href="#">펀딩하기</a></li>
                  <li><a href="#">모집중인 프로젝트</a></li>
                  <li class="active">상세보기</li>
                </ol>
              </div>
            </div>
        </header>
 
        
        <!-- ========== Cart Items - (checkout table) ========== -->
 
        <div class="container section pfolio-single" style="padding-top:70px;">
         
            <div class="row">
 
 
                <div class="col-md-12" style="padding-bottom:50px;">
                <div class="p-table pt-featured" align="center" style="padding: 40px 40px;">
 
                  <!-- Star -->
                  <div class="banner">
                    <span class="linea-basic-lightbulb" style="font-size:50px; color:hotpink;"></span>
                  </div>
                  
                  <!-- Header -->
                  <h1 style="font-size:30px;">${Fundvo.fund_subject}</h1>
                  <div class="price">
                    <span class="currency"><span class="linea-ecommerce-won" style="font-size:30px;">모집금액 </span></span>
                    <span class="value" style="font-size:30px;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${Stockvo.fund_target_money}"/>원</span>
                  </div>
                  <div style="font-size:20px; margin-bottom:15px;">마감일 <fmt:formatDate type="date" pattern="yy/MM/dd" value="${Stockvo.fund_date}"/> 까지</div>
                 <!--  <hr> -->
 
                <!-- 투자 버튼  -->
                <form action="consentForm" method="post">
                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                	<input type="hidden" value="${Fundvo.fund_id}" name="fund_id">
                	<input type="hidden" value="${pageContext.request.userPrincipal.name}" name="username">
	 				<div class="col-md-12" >
	 					<div class="col-md mb-sm-30"><input type="submit" class="btn-ghost btn-large btn-round" value="투자하기"></div>
	 				</div>	
 				</form>
 
                 <!--  <button class="btn-ghost">Sign up now</button> -->
                </div><!-- / .p-table -->
              </div>
 
    
            <!-- progress bar  -->
            <div class="progress-group col-md-12">
                <!-- 펀딩 안내 -->
                <div>
                    <h2> 이 기업에 투자하세요 ! </h2>
                <!--     <h2> 모인 금액 : 345,000,000 </h2>
                    <h2> 투자자 수 : 22명  </h2>
                    <h2> 펀딩 기간 : 18-12-03 ~ 19-02-14 </h2> -->
                </div>
                
                <div class="progress">
                  <div class="progress-bar" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width:<fmt:formatNumber value="${totalInvestMoney/Stockvo.fund_target_money}" type="percent" />; background-color:#e85d7d;">
                    <span class="sr-only"><fmt:formatNumber value="${totalInvestMoney/Stockvo.fund_target_money}" type="percent" /> Complete</span>
                  </div>
                </div>
                <span class="progress-title">
                	모집 금액 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${totalInvestMoney}"/> 원
                	목표 금액 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${Stockvo.fund_target_money}"/> 원
               	</span>
                <span class="progress-value"><fmt:formatNumber value="${totalInvestMoney/Stockvo.fund_target_money}" type="percent" /></span>
           </div>
    
            </div> <!-- row -->
    
    
            <!-- 영상 자료  -->    
            <div class="row">
                <div class="col-md-12">
                    <iframe width="100%" height="700" src="${Fundvo.fund_img_and_video}" 
                    frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
               </div>
 
 
 
          <!-- Product Info - (tabs) -->
          <div class="row" style="margin-top:60px;">
            <div class="col-md-12" style="padding-bottom:120px;">
              <!-- Nav tabs -->
              <ul class="nav nav-tabs" role="tablist">
              	<li role="presentation" class="active"><a href="#tab-coreinf" aria-controls="tab-coreinf" role="tab" data-toggle="tab">핵심 정보</a></li>
                <li role="presentation"><a href="#tab-description" aria-controls="tab-description" role="tab" data-toggle="tab">기업 상세 및 투자 정보</a></li>
                <li role="presentation"><a href="#tab-reviews" aria-controls="tab-reviews" role="tab" data-toggle="tab">커뮤니티</a></li>
                <li role="presentation"><a href="#tab-help" aria-controls="tab-help" role="tab" data-toggle="tab"> 펀딩 안내 </a></li>
              </ul>
 
              <!-- 기업 상세 정보 -->
              <div class="tab-content">
 				<div role="tabpanel" class="tab-pane active" id="tab-coreinf">
	 				<div class="col-md-9">
	 				  <ul class="nav nav-tabs" role="tablist">
		              	<li role="presentation" class="active"><a href="#intro" aria-controls="intro" role="tab" data-toggle="tab">기업 소개</a></li>
		                <li role="presentation"><a href="#core-point" aria-controls="core-point" role="tab" data-toggle="tab">핵심 포인트</a></li>
		                <li role="presentation"><a href="#stratege" aria-controls="stratege" role="tab" data-toggle="tab">비즈니스 전략</a></li>
		                <li role="presentation"><a href="#data" aria-controls="data" role="tab" data-toggle="tab">상세 내용</a></li>
		              </ul>
	 					<table class = "col-md-12" style="border-right:none;border-left:none;border-top:none;border-bottom:none;">
	 						<tr id= "intro">
	 							<td>기업 소개</td>
	 						</tr>
	 						<tr>	
	 							<td>${Fundvo.fund_company}</td>
	 						</tr>
	 						
	 						<tr id= "core-point">
	 							<td>핵심 포인트</td>
	 						</tr>
	 						<tr>	
	 							<td>${Fundvo.fund_point}</td>
	 						</tr>
	 						
	 						<tr id= "stratege">
	 							<td>비즈니스 전략</td>
	 						</tr>
	 						<tr>	
	 							<td>${Fundvo.fund_str_business}</td>
	 						</tr>
	 						<tr id= "data">
	 							<td>상세 내용</td>
	 						</tr>
	 						<tr>	
	 							<td>${Fundvo.fund_detail_content}</td>
	 						</tr>
	 					</table>
	                </div><!-- / .tab-pane #tab-sizeguide -->
	                <form action="consentForm" method="post">
	                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	                	<input type="hidden" value="${Fundvo.fund_id}" name="fund_id">
	                	<input type="hidden" value="${pageContext.request.userPrincipal.name}" name="username">
		 				<div class="col-md-3" >
		 					<div class="col-md mb-sm-30"><input type="submit" class="btn-ghost btn-large btn-round" value="투자하기"></div>
		 				</div>	
	 				</form>
 				</div>
                <div role="tabpanel" class="tab-pane" id="tab-description">
                    
                       <div class="BarBanner_banner__386X1" style="color:red;">
                        <i class="et-caution" aria-hidden="true"></i>
                        <strong>투자 위험 고지</strong>
                        <span>비상장기업 투자는 원금 손실의 가능성이 크니&nbsp;
                        	<span class="label label-danger label-lg"><a href = "#risk">투자 위험 안내</a></span>
                        	를 꼭 확인하세요.</span>
                    </div>
 
                   <br>
                   <h4><span class="linea-basic-pin2">투자포인트 </span></h4> 
                   <div class="alert alert-danger alert-dismissible" role="alert">
                       ${Fundvo.fund_invest_point}
                  </div>
                  
                  <br>
                  <h4><span class="linea-basic-pin2"> 주식 발행 정보 </span></h4> 
                  <table class="table">
                      <tr>
                        <td style="background:rgba(244, 244, 244, 0.85);">주식종류 (모집방법)</td>
                        <td>상환전환우선주(공모)</td>
                        <td style="background:rgba(244, 244, 244, 0.85);">펀딩기간</td>
                        <td><fmt:formatDate type="date" pattern="yyyy/MM/dd" value="${Stockvo.fund_date}"/> 까지</td>
                        <td style="background:rgba(244, 244, 244, 0.85);">목표금액</td>
                        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${Stockvo.fund_target_money}" /> 원</td>
                      </tr>
    
                      <tr>
                        <td style="background:rgba(244, 244, 244, 0.85);">액면가액</td>
                        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${Stockvo.fund_par_value}" /> 원</td>
                        <td style="background:rgba(244, 244, 244, 0.85);">발행가액</td>
                        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${Stockvo.fund_publish_value}"/> 원</td>
                        <td style="background:rgba(244, 244, 244, 0.85);">최소투자단위</td>
                        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${Stockvo.fund_min_invest}"/> 원</td>
                      </tr>
                      
                      <tr>
                        <td style="background:rgba(244, 244, 244, 0.85);">발행예정일</td>
                        <td><fmt:formatDate type="date" pattern="yyyy/MM/dd" value="${Stockvo.fund_schedule_date}"/> 일</td>
                        <td style="background:rgba(244, 244, 244, 0.85);">교부예정일</td>
                        <td><fmt:formatDate type="date" pattern="yyyy/MM/dd" value="${Stockvo.fund_delivery_date}"/> 일</td>
                        <td style="background:rgba(244, 244, 244, 0.85);">기업가치평가</td>
                        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${Stockvo.fund_eval_value}" /> 천원</td>
                      </tr>
                  </table><!-- / .table -->
                  
                  <br id="risk">
                  <h4><span class="linea-basic-pin2" role="tabpanel" class="tab-pane active">리스크 요인 </span></h4>
                  <table class="table">
                  	<tr>
                  		<td style="background:rgba(244, 244, 244, 0.85);">사업위험</td>
                  		<td>
                  			[경쟁 심화 위험] - 대기업 또는 글로벌 기업들이 당사와 같은 사업분야에 진출을 시도할 수 있습니다.
							<br>
							[고객 유치 변동성 위험] - 당사의 수익은 고객 유치에 따라 변동되며, 마케팅 등 다양한 요소에 의해 고객 유치는 변동될 수 있습니다.
                  		</td>
                  	</tr>
                  	<tr>
                  		<td style="background:rgba(244, 244, 244, 0.85);">회사위험</td>
                  		<td>[재무 악화 위험] - 경쟁 심화 및 고객 유치가 어려운 경우 회사의 재무 상태가 나빠질 위험이 있습니다.</td>
                  	</tr>
                  	<tr>
                  		<td style="background:rgba(244, 244, 244, 0.85);">기타위험</td>
                  		<td>
                  		[신주의 환금성 제약] - 금번 청약에 참여하여 배정받은 신주는 비상장주식의 특성상 유동성에 큰 제약이 있습니다.
						<br>	
						[발행일정 변경 위험] - 청약기간이 연장되거나 투자판단과 밀접하게 연관된 주요내용이 변경될 경우 명시된 일정이 변경될 가능성이 존재합니다.
						<br>
						[독자적 투자판단의 필요성] - 본 설명서에 기재된 사항 이외의 투자위험요소를 검토하여 투자자 개인의 독자적인 판단이 필요합니다.
						<br>
						[신주인수권 행사] - 금번 증권발행 이후 신주인수권의 행사로 인해 지분율 변동이 있을 수 있습니다.
                  		</td>
                  	</tr>
                  </table>
                  <br>
                  <p>※ 상기 투자위험은 미래에 대한 예측정보를 포함하고 있습니다. 이러한 내용은 향후 여러 변수로 인해 달라질 수 있으며, 투자판단 시 발행인이 고지한 예측정보의 불확실성과 인지하지 못하여 발생하는 손실에 대한 고려가 필요합니다.
                  </p>
                  
                  <br>
                  <h4><span class="linea-basic-pin2">투자 위험 안내 </span></h4>
                  <table class="table">
                  	<tr>
                  		<td>
                  		<h3>
                  		EZ-FUND에서 진행되는 금융투자상품에 대한 투자는 아래와 같은 투자 위험을 가지고 있습니다.	
                  		</h3>
                  		</td>
                  	</tr>
                  	<tr>	
                  		<td>
                  		<h3>원금손실의 위험이 있습니다.</h3>
                  		모든 투자는 원금손실의 위험을 가지고 있습니다. 때문에 투자 시 한 곳에만 투자하지 아니하고 다양한 상품에 분산하여 투자하실 것을 권유 드립니다. EZ-FUND는 온라인소액투자중개업자로 증권 모집을 중개하는 업을 영위하고 있으며, 원금손실에 대한 책임을 지지 않습니다. 모든 투자는 투자자 본인의 의사에 따라 결정되어야 합니다.
                  		</td>
                  	</tr>
                  	<tr>	
                  		<td>
                  		<h3>환금성이 낮습니다.</h3>
                  		비상장기업에 대한 투자는 환금성이 낮습니다. EZ-FUND의 중개를 통해 모집된 증권은 6개월간 전매가 제한되며, 매매가 가능한 시점이 되더라도 현금으로의 전환이 보장되지는 않습니다. 투자금을 회수하기 위하여 주식의 경우 스타트업 주식거래시장(KSM)에서 거래하거나, 기업의 M&A 또는 주식시장 상장 등이 있을 때까지 기다려야 할 수 있습니다. 채무증권이나 주식 관련 채권의 경우에도 특별한 사정이나 조건이 없는 한 만기까지 기다려야 합니다.
                  		</td>
                  	</tr>
                  	<tr>	
                  		<td>
                  		<h3>배당가능성이 낮습니다.</h3>
                  		EZ-FUND의 중개를 통해 증권을 발행하는 비상장 기업은 성장초기단계에 있는 경우가 많기 때문에, 아직 성장해야 하는 단계이기 때문에 정기 배당을 실시하는 경우가 매우 드뭅니다. 따라서 배당수익을 기대하고 투자를 할 경우 기대한 만큼의 수익을 얻지 못할 수 있습니다.
                  		</td>
                  	</tr>
                  	<tr>	
                  		<td>
                  		<h3>지분 희석이 발생할 수 있습니다.</h3>
                  		EZ-FUND를 통하여 투자한 회사는 지속적으로 성장하기위하여 해당 기업의 정관에 근거하여 유상증자를 실시할 가능성이 높습니다. 유상증자로 인하여 투자자가 보유한 지분율은 감소될 수 있습니다.
                  		</td>
                  	</tr>
                  	
                  	<tr>
                  		<td style="background:rgba(255, 228, 228, 0.85); color:red;">
                  		모든 투자에는 기대수익에 상응하는 투자위험이 있음을 유의하셔야 합니다. 투자자는 투자결과에 따라 높은 수익을 얻을 수도 있지만, 원금의 100%를 손실할 가능성도 있습니다. EZ-FUND는 온라인소액투자중개서비스를 제공하는 회사로서 투자에 따른 손실 또는 그 위험을 보전해 드리지 못하며, 투자에 따른 모든 책임은 각 투자자에게 귀속됩니다. 따라서 투자자가 직접 습득한 정보와 자체적인 투자의 의사결정에 따라 투자에 임하실 것을 당부 드립니다.
                  		</td>
                  	</tr>
                  </table>
                  <br>
                  <table class="table">
                  	<tr>
						<th colspan="2">투자 위험 주지 및 고지</th>
                  	</tr>
                  	<tr>
                  		<td colspan="2">
                  		본 위험고지서는 자본시장과 금융투자에 관한 법률(이하 “자본시장법”이라고만 합니다) 제117조의7 제4항에 의하여 귀하가 EZ-FUND플랫폼 주식회사(이하 EZ-FUND플랫폼 (주)”라고만 합니다)에 청약의 주문을 하기 전에 투자의 위험을 사전에 충분히 인지할 수 있도록 EZ-FUND플랫폼 (주)가 귀하에게 교부하는 것입니다.
                  		</td>
                  	</tr>
                  	<tr>
                  		<td>1.</td>
                  		<td>
                  		귀하는 투자대상인 금융투자상품은 자본시장법에 따른 “증권”에 해당하므로 원본손실의 위험성이 있으며, 청약증거금 등 투자한 자금의 원본을 회수할 없음에 따른 손실의 위험이 있음을 이해합니다. 또한 귀하가 예상하거나 기대하는 수익의 일부 또는 전부를 얻지 못할 수 있습니다.
                  		</td>
                  	</tr>
                  	<tr>
                  		<td>2.</td>
                  		<td>
                  		귀하는 EZ-FUND플랫폼 (주)의 홈페이지에 게재(정정)된 모집되는 증권의 발행조건, 발행인의 재무상태가 기재된 서류 및 사업계획서의 내용, 증권의 취득에 따른 투자위험요소 등을 충분히 확인하였으며, 청약의 주문 시 회사는 투자 위험의 고지 등에 관하여 별도로 정한 방법에 의하여 통지하는 내용에 대하여 확인합니다.
                  		</td>
                  	</tr>
                  	<tr>
                  		<td>3.</td>
                  		<td>
                  		귀하는 금번에 발행되는 비상장 증권의 발행목적은 한국거래소의 상장에 있는 것은 아니므로 증권의 환금성에 큰 제약이 있음과 귀하가 예상하는 회수금액에 대한 일부 또는 전부를 회수할 수 없는 위험이 있음을 이해하며, 귀하가 이를 감당할 수 있음을 확인합니다.
                  		</td>
                  	</tr>
                  	<tr>
                  		<td>4.</td>
                  		<td>
                  		귀하는 시장의 상황, 제도의 변경이 있을 수 있으며, 자본시장법 등 관련법규에 근거하여 투자의 한도에 제한이 있는 경우 이를 준수하여야 함을 이해합니다.
                  		</td>
                  	</tr>
                  	<tr>
                  		<td>5.</td>
                  		<td>
                  		귀하는 자본시장법 제117조의10 제7항에 따라 전문투자자(벤처캐피탈 등)에 대한 매도 등 예외적인 경우를 제외하고는 원칙적으로 6개월간 전매가 제한된다는 점을 이해합니다.
                  		</td>
                  	</tr>
                  	<tr>
                  		<td>6.</td>
                  		<td>
                  		귀하는 정부가 투자대상인 증권과 관련하여 게재된 사항이 진실 또는 정확하다는 것을 인정하거나 해당 증권의 가치를 보증 또는 승인한 것이 아니라는 점과 게재된 투자정보에 관한 사항은 청약기간 종료 전에 정정될 수 있음을 확인합니다.
                  		</td>
                  	</tr>
                  	<tr>
                  		<td>7.</td>
                  		<td>
                  		귀하는 청약기간 중에만 한정하여 청약의 철회가 가능하며(청약기간 종료일 이후에는 청약의 철회 불가), 청약기간의 종료 시 모집금액이 발행인이 목표한 모집예정금액의 80% 미달하는 경우 증권의 발행은 취소된다는 점을 이해합니다.
                  		</td>
                  	</tr>
                  	<tr>
                  		<td>8.</td>
                  		<td>
                  		귀하는 아래 사항들에 대하여도 이해하였음을 확인합니다.
                  		</td>
                  	</tr>
                  	<tr>
                  		<td colspan="2">
                  		<p>
                  		(1).EZ-FUND플랫폼 (주)는 온라인소액증권 청약과 관련하여 별도의 수수료는 징수하지 않습니다.<br>
						(2).발행인이 증권의 발행조건과 관련하여 조기상환조건을 설정한 경우 이에 대한 구체적인 내용을 홈페이지를 통해 반드시 확인하여야 합니다.<br>
						(3).EZ-FUND플랫폼 (주)는 자본시장법상의 온라인소액투자중개업자로서의 지위에서 온라인소액증권발행인과 온라인소액투자중개계약을 체결하여 위 발행인이 발행하는 증권에 대한 청약 거래를 중개하므로, 모집예정금액에 도달한다고 하더라도 직접 증권의 발행하거나 주금을 납입 받지 않습니다.<br>
						(4).청약의 우대차별사유 : EZ-FUND플랫폼 (주)는 발행인의 요청에 따라 합리적이고 명확한 기준(선착순 등)에 따라 투자자의 자격 등을 제한할 수 있습니다. 이 경우 귀하는 위 기준과 조건에 따라 청약거래에 있어 차별을 받게 될 수 있습니다.<br>
						<br><br>
						위 사항들은 청약의 주문 거래에 수반되는 위험∙제도 및 청약의 주문 거래와 관련하여 귀하가 알아야 할 사항을 간략하게 서술한 것으로 귀하의 위 거래와 관련하여 발생될 수 있는 모든 위험과 중요 사항을 전부 기술한 것은 아닙니다. 따라서 상세한 내용은 EZ-FUND플랫폼 (주) 및 관계법규를 통하여 확인하여야 합니다. 또한 이 고지서는 청약의 주문 관련 법규 등에 우선하지 못한다는 점을 양지하시기 바랍니다.
                  		</p>
                  		</td>
                  	</tr>
                 </table>
                 
                </div><!-- / .tab-pane #tab-sizeguide -->
                
                <!-- 펀딩 Q&A -->
                <div role="tabpanel" class="tab-pane prod-reviews" id="tab-reviews" >
                  <div id ="result" style = "height: 500px; overflow:auto;" >
                  <c:forEach var="list" items="${list}">
					<div>
						<p class="tpr-name">ID : <span style="font-weight:bold;font-size:15px;">${list.qna_id}</span><span class="tpr-date">${list.qna_date}<button type="button" class="close" onclick="deletecomment('${list.qna_id}','${list.qna_date}');">×</button></span>
						</p>
						<p class="tpr-content"><a href="javascript:comment('${list.qna_id}','${list.qna_comment}','${list.qna_date}')">${list.qna_comment}</a></p>
						<hr>
					</div>
				  </c:forEach>
                  </div><!-- / .tp-review -->
                  
               	<!-- Leave a comment -->
                 <div class="comment-form">
                   <h4 class="blog-section-title">Q&A 문의하기</h4>

                     <!-- Name -->
                     <div class="col-md-6 form-group no-gap-left">
                       <input type="text" class="form-control" id="commentId" name="commentId" placeholder="아이디를 입력하세요" required>
                       <label for="inpt-name-forms">ID *</label>
                     </div>
                     
                     <!-- Website -->
                     <div class="col-md-6 form-group no-gap-right">
                       <input type="password" class="form-control" id="commentPwd" name="commentPwd" placeholder="비밀번호를 입력하세요" required>
                       <label for="inpt-name-forms">PASSWORD *</label>
                     </div>
                     
                     <!-- Comment -->
                     <div class="col-md-12 form-group no-gap">
                       <textarea class="form-control" name="textarea" id="comment" name="comment" rows="5" placeholder="Your Comment" required></textarea>
                       <label for="txt-forms">Comment *</label>
                     </div>

                     <input type="button" value="문의 작성 완료" id="commentCompleted" class="btn pull-right">
                 </div><!-- / .comment-form -->
               </div><!-- / .blog-post-comments -->
                <!--  펀딩 안내 -->
                <div role="tabpanel" class="tab-pane ft-steps-numbers" id="tab-help">
                  <div class="ws-s"></div>
                    <!-- Step 1 -->
                    <div class="col-lg-4 col-md-6 mb-sm-100 ft-item">
                      <span class="ft-nbr">01</span>
                      <h4>상품정보 고시</h4>
                      <p>Chose the desired product, then select his options if available, like size, color, etc. and press the cart button</p>
                    </div>
 
                    <!-- Step 2 -->
                    <div class="col-lg-4 col-md-6 mb-sm-100 ft-item">
                      <span class="ft-nbr">02</span>
                      <h4>환불에 대한 사항</h4>
                      <p>- 프로젝트 마감일 후에는 즉시 제작 및 실행에 착수하는 프로젝트 특성상 단순 변심에 의한 후원금 환불이 불가능합니다.<br>
                        - 예상 전달일로부터 10일 이상 선물 전달이 이뤄지지 않을 경우, 환불을 원하시는 분들께는 수수료를 제한 후원금을 환불해 드립니다.<br>
                        (플랫폼 수수료: 모금액의 5%, 부가세 별도 / 결제 수수료: 결제 성공액의 3%, 부가세 별도 )<br>
                        - 선물 전달을 위한 배송지 및 서베이 답변은 2019. 08. 26일에 일괄 취합할 예정입니다.<br>
                        - 이후 배송지 변경이나 서베이 답변 변경을 원하실 때에는 '창작자에게 문의하기'로 개별 문의하셔야 합니다.</p>
                    </div>
 
                    <!-- Step 3 -->
                    <div class="col-lg-4 col-md-6 mb-sm-100 ft-item">
                      <span class="ft-nbr">03</span>
                      <h4>Buy</h4>
                      <p>Enter your payment details and the address where you want to receive the product, and press buy</p>
                    </div>
                  
                </div><!-- / .ft-steps-numbers #tab-help -->
              </div>
 
            </div>  
          </div>
        </div><!-- / .container -->
 
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
 
        <!-- Definity JS -->
        <script src="${project}assets/js/main.js"></script>
    </body>
</html>