<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<html class="no-js" lang="ko">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=chrome">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    </head>
    <body id="page-top">

	<%@ include file="../include/top-header.jsp" %>
	
	<!-- ========== Page Title ========== -->

    <header class="page-title pt-large pt-light pt-parallax pt-plax-lg-light" data-stellar-background-ratio="0.4">
      <div class="container">
          <div class="row">

            <div class="col-sm-6">
              <h1>크라우드 펀딩?</h1>
              <span class="subheading">크라우드펀딩에 대해 알아보고 현명한 펀딩을 실현해 보세요</span>
            </div>
            <ol class="col-sm-6 text-right breadcrumb">
              <li><a href="#">정보라운지</a></li>
              <li><a href="#">크라우드 펀딩?</a></li>
            </ol>
          </div>

        </div>
    </header>

	<div class="body crowd mb-5">
		<div class="container">
			<div class="mb-5">
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link active" data-toggle="tab" href="#tabSummary">개요/운영구조</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#tabLaw">관련법령</a>
					</li>
				</ul>
			</div>
			<div class="tab-content">
				<div class="tab-pane active" id="tabSummary">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="col-md-12 mb-4"><h3 class="txt_1"><span>크라우드펀딩</span><font>이란?</font></h3></div>
							<div class="col-md-12 mb-4"><img src="../resources/assets/images/crowdfunding/crowd_img0.jpg" class="img-responsive"></div>
							<div class="col-md-12 sub_txt">
								크라우드펀딩은 군중 또는 다수를 의미하는 영어단어 <span>크라우드(Crowd)</span>와 자금조달을 뜻하는 <span>펀딩(Funding)</span>을 조합한 용어입니다.
							</div>
							<div class="col-md-12 sub_txt">
								<span>창의적 아이템을 가진 초기 기업가를 비롯한 자금수요자</span>가 중개업자(온라인소액투자중개업자)의 <span>온라인플랫폼</span>에서
							</div>
							<div class="col-md-12 sub_txt mb-5">
								집단지성(The Wisdom of  Crowds)을 활용하여 <span>다수의 소액투자자로부터 자금을 조달하는 행위</span>를 크라우드펀딩이라 합니다.
							</div>
							<div class="col-md-12 pt-45">
								<h3 class="txt_1 mb-4"><font>크라우드펀딩</font> <span>종류</span></h3>
							</div>
							<div class="col-md-12 sub_txt mb-5">
								자금모집 및 보상방식 등에 따라 <span>후원기부형, 증권형,대출형</span>의 세가지 유형으로 구분됩니다.
							</div>
							<div class="col-md-12 mb-5">
								<table class="col-md-4 fl">
									<tr class="col-md-12">
										<td>
											<img src="${project }assets/images/crowdfunding/crowd_img1_1.jpg" class="img-responsive">
										</td>
									</tr>
								</table>
								<table class="col-md-4 fl">
									<tr class="col-md-12">
										<td>
											<img src="${project }assets/images/crowdfunding/crowd_img1_2.jpg" class="img-responsive">
										</td>
									</tr>
								</table>
								<table class="col-md-4">
									<tr class="col-md-12">
										<td>
											<img src="${project }assets/images/crowdfunding/crowd_img1_3.jpg" class="img-responsive">
										</td>
									</tr>
								</table>
							</div>
							<div class="col-md-12 mb-5"><h3 class="txt_1 mb-4"><span>참가자</span></h3></div>
							<div class="col-md-12 mb-5 sub_tit">
								<img class="va" src="${project }assets/images/crowdfunding/stick_img.jpg"> 투자자
							</div>
							<div class="col-md-12 mb-5">
								<div class="col-md-12 sub_txt">
									신생·창업기업에 대한 투자에 관심을 가진 사람이라면 누구나 증권형 크라우드펀딩의 투자자가 될 수 있습니다.
								</div>
								<div class="col-md-12 sub_txt">
									자본시장법에서는 투자자들이 과도한 금액을 투자하여 상당한 손실을 입는 것을 사전에 방지하기 위해서 투자한도를 정하고 있으며,
								</div>
								<div class="col-md-12 sub_txt">
									 투자자의 전문성, 위험감수능력에 따라 투자한도를 차등화하여 적용하고 있습니다.
								</div>
							</div>
							<div class="col-md-12 mb-5 sub_tit">
								<img class="va" src="${project }assets/images/crowdfunding/stick_img.jpg"> 발행인
							</div>
							<div class="col-md-12 mb-5">
								<div class="col-md-12 sub_txt">
									크라우드펀딩을 통하여 증권을 발행할 수 있는 자(온라인소액증권발행인)는 비상장 중소기업으로서 창업 후 7년 이내이거나
								</div>
								<div class="col-md-12 sub_txt">
									프로젝트성 사업을 수행하는 기업이어야 합니다. 다만, 비상장 벤처기업 또는 이노비즈기업 및 메인비즈기업, 사회적기업은
								</div>
								<div class="col-md-12 sub_txt">
									업력이 7년을 초과하더라도 크라우드펀딩을 통한 증권발행이 가능합니다.
								</div>
								<div class="col-md-12 sub_txt">
									크라우드펀딩 제외업종:금융·보험업, 부동산업, 무도장, 골프장, 스키장, 베팅업, 숙박 및 음식점업 등
								</div>
							</div>
							<div class="col-md-12 mb-5 sub_tit">
								<img class="va" src="${project }assets/images/crowdfunding/stick_img.jpg"> 온라인중개업자
							</div>
							<div class="col-md-12 mb-5">
								<div class="col-md-12 sub_txt">
									온라인중개업자는 크라우드펀딩 중개를 담당하는 금융투자업자로서, 고객자산을 직접 수탁하거나 운용하지 않고 발행인과
								</div>
								<div class="col-md-12 sub_txt">
									투자자 사이에서 증권의 모집 또는 사모에 관해 단순히 중개하는 역할을 수행합니다. 온라인중개업자는 투자자를 보호하고
								</div>
								<div class="col-md-12 sub_txt">
									시장질서 교란을 방지하기 위하여 반드시 자본금, 인적·물적요건 등의 일정 요건을 갖추어 금융위원회에 등록하여야 합니다.
								</div>
							</div>
							<div class="col-md-12 mb-5"><h3 class="txt_1 mb-4"><font>크라우드펀딩</font> <span>운영구조</span></h3></div>
							<div class="col-md-12 mb-4"><img src="${project }assets/images/crowdfunding/crowd_img2.jpg" class="img-responsive"></div>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="tabLaw">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="col-md-12 mb-5">
								<h3 class="txt_1 mb-4"><span>자본시장</span><font>과</font><span>금융투자업</span><font>에관한</font> <span>법률</span></h3>
							</div>
							<div class="col-md-12 sub_txt">
								온라인을 통한 소액의 증권모집에 대해 증권신고서 등 증권발행에 수반되는 기존의 공모 공시규제를 완화하고
							</div>
							<div class="col-md-12 sub_txt mb-5">
								온라인중개업자를 신설하여 크라우드펀딩이 신생·창업 기업의 자금조달 수단으로 활용될 수 있도록 자본시장법에 규정되어 있습니다.
							</div>
							<div class="col-md-12 mb-5">
								<table class="col-md-6 fl">
									<tr class="col-md-12">
										<td>
											<img src="${project }assets/images/crowdfunding/crowd_img3_1.jpg" class="img-responsive">
										</td>
									</tr>
								</table>
								<table class="col-md-6">
									<tr class="col-md-12">
										<td>
											<img src="${project }assets/images/crowdfunding/crowd_img3_2.jpg" class="img-responsive">
										</td>
									</tr>
								</table>
							</div>
							<div class="col-md-12 mb-5 sub_tit2">
								<img class="va" src="${project }assets/images/crowdfunding/stick_img.jpg"> 규제완화
							</div>
							<div class="col-md-12 mb-5 sub_tit">
								-발행인의 공시부담 완화 등
							</div>
							<div class="col-md-12 mb-5">
								<div class="col-md-12 sub_txt">
									일반적인 증권의 모집 또는 매출은 발행인이 그 모집 또는 매출에 관한 신고서를 금융위원회에 제출하고 수리되어야 하지만,
								</div>
								<div class="col-md-12 sub_txt">
									크라우드펀딩의 경우 발행인은 증권신고서 제출 의무를 적용 받지 않도록 간소화하였습니다.
								</div>
							</div>
							<div class="col-md-12 mb-3">
							<div class="table-responsive" style="overflow-x:hidden;">
								<table class="table table-hover">
								<thead>
									<tr>
										<tg colspan="3" class="panel_tb_tit1">
											발행공시 부담완화 비교
										</th>
									</tr>
									<tr>
										<th class="panel_tb_tit2">
											일반공모
										</th>
										<th class="panel_tb_tit3">
											소액공모
										</th>
										<th class="panel_tb_tit4">
											크라우드펀딩
										</th>
									</tr>
								</thead>
								<tbody>
									<tr class="bg_white">
										<td class="panel_tb_txt2">
											증권신고서(약27종)
										</td>
										<td class="panel_tb_txt3">
											소액공모 공시서류(약17종)
										</td>
										<td class="panel_tb_txt4">
											증권 발행 조건,재무상황,사업계획서 등
										</td>
									</tr>
									<tr class="bg_white">
										<td class="panel_tb_txt2">
											금융위 수리
										</td>
										<td class="panel_tb_txt3">
											금융위 제출
										</td>
										<td class="panel_tb_txt4">
											중개업자 홈페이지 및 크라우드넷 펀딩아카이브 게재
										</td>
									</tr>
								</tbody>
								</table>
							</div>
							</div>
							<div class="col-md-12 mb-5">
								<div class="col-md-12 sub_txt">
									또한, 자본시장법은 발행인이 온라인중개업자의 홈페이지 등에 증권의 발행조건, 재무상태, 사업계획서 등의 정보를 게재하고 그 정보에
								</div>
								<div class="col-md-12 sub_txt">
									관하여 발행인과 투자자 간, 투자자 상호 간에 의견이 교환이 이루어질 수 있도록 하고 있습니다.
								</div>
							</div>
							<div class="col-md-12 mb-3 sub_tit">
								-온라인소액투자중개업 신설
							</div>
							<div class="col-md-12 mb-5">
								<div class="col-md-12 sub_txt">
									자본시장법은 크라우드펀딩 중개를 담당하는 금융투자업자를 온라인소액투자중개업자로 정의하고 있습니다.
								</div>
								<div class="col-md-12 sub_txt">
									온라인중개업자에 대하여는 일반적인 투자중개업자에 비해 영업범위가 협소하고 투자자 재산을 관리하지 않는 점 등을 고려하여
								</div>
								<div class="col-md-12 sub_txt">
									진입규제의 수준을 완화하고 있습니다.
								</div>
							</div>
							<div class="col-md-12 mb-4"><img src="${project }assets/images/crowdfunding/crowd_img4.jpg" class="img-responsive"></div>
							<div class="col-md-12 pt-5 mb-5 sub_tit2">
								<img class="va" src="${project }assets/images/crowdfunding/stick_img.jpg"> 투자자보호장치
							</div>
							<div class="col-md-12 mb-3 sub_tit">
								-발행한도
							</div>
							<div class="col-md-12 mb-5">
								<div class="col-md-12 sub_txt">
									크라우드펀딩을 통한 모집할 수 있는 금액은 1년동안 7억원*으로 제한하고 있습니다.
								</div>
								<div class="col-md-12 fs-15">
									<span style="color:#ff7800;">*</span> 크라우드펀딩을 통한 모집가액과 과거 1년간 발행금액(증권신고서를 제출하고 발행한 금액+소액공모 금액+크라우드펀딩 금액)을 모두 합산한 금액이
								</div>
								<div class="col-md-12 fs-15">
									발행한도 7억원을 초과하지 않아야 합니다.
								</div>
							</div>
							<div class="col-md-12 mb-3 sub_tit">
								-증권 발행 취소
							</div>
							<div class="col-md-12 mb-5">
								<div class="col-md-12 sub_txt">
									크라우드펀딩은 집단지성을 이용한다는 취지에 따라 청약금액이 모집예정금액의 80%에 미달하는 경우에는 펀딩 전체를 취소하고
								</div>
								<div class="col-md-12 sub_txt">
									투자자에게 청약증거금을 반환하도록 하고 있습니다.
								</div>
							</div>
							<div class="col-md-12 mb-3 sub_tit">
								-정보게재 의무
							</div>
							<div class="col-md-12 mb-5">
								<div class="col-md-12 sub_txt">
									투자자들의 투자판단에 필요한 증권 발행조건, 재무 서류, 사업계획서 등을 온라인중개업자의 홈페이지에 게재하도록 하고 있습니다.
								</div>
								<div class="col-md-12 sub_txt">
									더불어 투자자들이 이러한 정보를 한 곳에서 손쉽게 접근할 수 있도록 크라우드넷(CrowdNet) 내의 펀딩정보아카이브에도 함께
								</div>
								<div class="col-md-12 sub_txt">
									게재하도록 하였습니다.
								</div>
							</div>
							<div class="col-md-12 mb-3 sub_tit">
								-발행인 및 대주주의 보유지분 매도 제한
							</div>
							<div class="col-md-12 mb-5">
								<div class="col-md-12 sub_txt">
									사업계획의 이행 및 투자자들의 신뢰를 보장하기 위하여 발행인 및 그 대주주는 크라우드펀딩을 통한 증권발행 후 1년간 기존 보유지분을
								</div>
								<div class="col-md-12 sub_txt">
									매도할 수 없습니다.
								</div>
								<div class="col-md-12 fs-15">
									<span style="color:#ff7800;">*</span> 투자자의 전매제한의 경우와 달리 발행인 및 대주주의 보유지분은 예외적 매도도 금지되어 있습니다.
								</div>
							</div>
							<div class="col-md-12 mb-3 sub_tit">
								-발행인 등의 손해배상책임
							</div>
							<div class="col-md-12 mb-5">
								<div class="col-md-12 sub_txt">
									발행인이 온라인중개업자의 홈페이지에 게재한 정보의 허위·누락 등으로 인해 투자자의 손해 발생시 발행인 등은 손해배상책임*을
								</div>
								<div class="col-md-12 sub_txt">
									부담하도록 하고 있습니다.
								</div>
								<div class="col-md-12 fs-15">
									<span style="color:#ff7800;">*</span> 손해배상책임자는 발행인, 발행인의 대표자 또는 이사, 해당사항의 작성을 지시하거나 집행한 자, 해당 정보의 진실 또는 정확성을 증명하여 서명한
								</div>
								<div class="col-md-12 fs-15">
									공인회계사 등
								</div>
							</div>
							<div class="col-md-12 mb-5">
								<h3 class="txt_1 mb-4"><span>투자한도 설정</span> <font>등</font></h3>
							</div>
							<div class="col-md-12 mb-3 sub_tit2">
								<img class="va" src="${project }assets/images/crowdfunding/stick_img.jpg"> 투자한도
							</div>
							<div class="col-md-12 mb-5">
								<div class="col-md-12 sub_txt">
									자본시장법은 일반 투자자들이 과도한 금액을 투자하여 손실이 커지는 것을 방지하기 위하여 투자회사별·연간 투자한도를 정하고 있습니다.
								</div>
							</div>
							<div class="col-md-12 mb-4"><img src="${project }assets/images/crowdfunding/crowd_img5.jpg" class="img-responsive"></div>
							<div class="col-md-12 pt-5 mb-5 sub_tit2">
								<img class="va" src="${project }assets/images/crowdfunding/stick_img.jpg"> 발행증권 예탁의무 및 6개월간 유통제한
							</div>
							<div class="col-md-12 mb-3">
								<div class="col-md-12 sub_txt">
									크라우드펀딩을 통해 발행된 증권은 의무적으로 한국예탁결제원에 예탁 또는 보호예수하여야 하고, 6개월간 매도나 양도가 제한됩니다.
								</div>
								<div class="col-md-12 sub_txt">
									다만, 전문성을 갖추고 위험감수능력이 있는 전문투자자 등에 대한 매도나 KSM에 등록된 기업의 발행증권을 KSM에서 매매하는 것은
								</div>
								<div class="col-md-12 sub_txt">
									허용하고 있습니다.
								</div>
							</div>
							<div class="col-md-12 mb-3 sub_tit2">
								<img class="va" src="${project }assets/images/crowdfunding/stick_img.jpg"> 청약의사의 철회
							</div>
							<div class="col-md-12 mb-5">
								<div class="col-md-12 sub_txt">
									투자자는 증권의 청약기간 종료일까지 청약의사를 철회할 수 있습니다. 이 경우 온라인중개업자는 그 투자자의 청약증거금을 지체없이
								</div>
								<div class="col-md-12 sub_txt">
									반환하여야 합니다.
								</div>
							</div>
							<div class="col-md-12 pt-4 mb-5">
								<h3 class="txt_1 mb-4"><span>온라인중개업자</span><font>의</font> <span>영업행위 규제</span></h3>
							</div>
							<div class="col-md-12 mb-3 sub_tit2">
								<img class="va" src="${project }assets/images/crowdfunding/stick_img.jpg"> 중개증권 취득 등 금지
							</div>
							<div class="col-md-12 mb-5">
								<div class="col-md-12 sub_txt">
									온라인중개업자는 자신이 중개하는 크라우드펀딩 증권을 자기의 계산으로 취득하거나 증권의 발행 또는 그 청약을 주선 또는 대리하는
								</div>
								<div class="col-md-12 sub_txt">
									행위가 금지됩니다.
								</div>
							</div>
							<div class="col-md-12 mb-3 sub_tit2">
								<img class="va" src="${project }assets/images/crowdfunding/stick_img.jpg"> 투자자와 발행인에 대한 자문금지
							</div>
							<div class="col-md-12 mb-5">
								<div class="col-md-12 sub_txt">
									온라인중개업자는 발행인의 신용 또는 투자여부 등 투자자의 판단에 영향을 미칠 수 있는 자문이나 발행인의 경영에 관한 자문을 할 수
								</div>
								<div class="col-md-12 sub_txt">
									없도록 하고 있습니다.
								</div>
							</div>
							<div class="col-md-12 mb-3 sub_tit2">
								<img class="va" src="${project }assets/images/crowdfunding/stick_img.jpg"> 청약 전 투자내용·위험 주지 및 확인 의무
							</div>
							<div class="col-md-12 mb-5">
								<div class="col-md-12 sub_txt">
									온라인중개업자는 투자자가 청약의 내용, 투자에 따르는 위험, 증권의 매도 제한, 증권의 발행조건과 발행인의 재무상태가 기재된 서류 및
								</div>
								<div class="col-md-12 sub_txt">
									사업계획서의 내용을 충분히 확인하였는지의 여부를 확인하기 전에는 그 청약의 의사표시를 받아서는 아니됩니다.
								</div>
							</div>
							<div class="col-md-12 mb-3 sub_tit2">
								<img class="va" src="${project }assets/images/crowdfunding/stick_img.jpg"> 투자자·발행인 간 부당 차별 금지
							</div>
							<div class="col-md-12 mb-5">
								<div class="col-md-12 sub_txt">
									온라인중개업자는 발행인에 관한 정보의 제공, 청약주문의 처리 등의 업무수행에 있어서 특정한 발행인 또는 투자자를 부당하게 우대하거나
								</div>
								<div class="col-md-12 sub_txt">
									차별하는 행위가 금지됩니다.
								</div>
							</div>
							<div class="col-md-12 mb-3 sub_tit2">
								<img class="va" src="${project }assets/images/crowdfunding/stick_img.jpg"> 청약결과 투자자 통지 의무
							</div>
							<div class="col-md-12 mb-5">
								<div class="col-md-12 sub_txt">
									온라인중개업자는 증권의 청약기간이 만료된 경우에 증권의 청약 및 발행에 관한 내역을 홈페이지나 전자우편 등을 통하여 지체없이
								</div>
								<div class="col-md-12 sub_txt">
									투자자에게 통지하여야 합니다.
								</div>
							</div>
							<div class="col-md-12 mb-3 sub_tit2">
								<img class="va" src="${project }assets/images/crowdfunding/stick_img.jpg"> 증권의 발행한도 및 투자한도 관리
							</div>
							<div class="col-md-12 mb-5">
								<div class="col-md-12 sub_txt">
									온라인중개업자는 증권의 발행한도 및 투자자의 투자한도가 준수될 수 있도록 조치를 취하여야 하며, 이를 위해 중앙기록관리기관에
								</div>
								<div class="col-md-12 sub_txt">
									한도관리 업무를 위탁하여야 합니다.
								</div>
							</div>
							<div class="col-md-12 mb-3 sub_tit2">
								<img class="va" src="${project }assets/images/crowdfunding/stick_img.jpg"> 손해배상책임
							</div>
							<div class="col-md-12 mb-5">
								<div class="col-md-12 sub_txt">
									온라인중개업자는 법령 위반 및 게재 내용의 사실 확인 의무 소홀에 따른 허위정보 게재로 인한 투자자 손해에 대하여 손해배상 책임을
								</div>
								<div class="col-md-12 sub_txt">
									집니다.
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		
        
        <%@ include file="../include/footer.jsp" %>
    
        <!-- ========== Scripts ========== -->

        <script src="${project }assets/js/vendor/jquery-2.1.4.min.js"></script>
        <script src="${project }assets/js/vendor/google-fonts.js"></script>
        <script src="${project }assets/js/vendor/jquery.easing.js"></script>
        <script src="${project }assets/js/vendor/jquery.waypoints.min.js"></script>
        <script src="${project }assets/js/vendor/bootstrap.min.js"></script>
        <script src="${project }assets/js/vendor/bootstrap-hover-dropdown.min.js"></script>
        <script src="${project }assets/js/vendor/smoothscroll.js"></script>
        <script src="${project }assets/js/vendor/jquery.localScroll.min.js"></script>
        <script src="${project }assets/js/vendor/jquery.scrollTo.min.js"></script>
        <script src="${project }assets/js/vendor/jquery.stellar.min.js"></script>
        <script src="${project }assets/js/vendor/jquery.parallax.js"></script>
        <script src="${project }assets/js/vendor/slick.min.js"></script>
        <script src="${project }assets/js/vendor/jquery.easypiechart.min.js"></script>
        <script src="${project }assets/js/vendor/countup.min.js"></script>
        <script src="${project }assets/js/vendor/isotope.min.js"></script>
        <script src="${project }assets/js/vendor/jquery.magnific-popup.min.js"></script>
        <script src="${project }assets/js/vendor/wow.min.js"></script>

        <!-- Definity JS -->
        <script src="${project }assets/js/main.js"></script>
    </body>
</html>