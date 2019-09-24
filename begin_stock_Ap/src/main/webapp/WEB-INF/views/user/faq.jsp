<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/jsExpansion.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>EZ Stock - FAQ</title>
</head>
<body class="hold-transition skin-black sidebar-mini fixed">
   <div class="wrapper">
      <header class="main-header">
         <%@ include file="../include/main_header.jsp"%>
      </header>

      <!-- Left side column. contains the logo and sidebar -->

      <aside class="main-sidebar">
         <%@ include file="../stock/side_menu.jsp"%>
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper" style="margin-top: 3%">
         <!-- Content Header (Page header) -->
         <section class="content-header">
            <h1>FAQ</h1>
         </section>

         <!-- Main content -->
         <section class="content">
            <div class="box">
               <div class="box-body bg-dark">
                  <div class="row">
                     <div class="col-lg-2 col-12">
                        <!-- Panel -->
                        <div class="panel">
                           <div class="panel-body">
                              <div class="list-group faq-list" role="tablist">
                                 <a class="list-group-item active" data-toggle="tab"   href="#category-1" aria-controls="category-1" role="tab">회원가입 및 계정</a> 
                                 <a class="list-group-item" data-toggle="tab" href="#category-2" aria-controls="category-2" role="tab">트레이딩</a>
                                 <a class="list-group-item" data-toggle="tab" href="#category-3" aria-controls="category-3" role="tab">미수동결계좌제도</a>
                                 <a class="list-group-item" data-toggle="tab" href="#category-4" aria-controls="category-4" role="tab">FAQ BEST</a>
                              </div>
                           </div>
                        </div>
                        <!-- End Panel -->
                     </div>

                     <div class="col-lg-10 col-12">
                        <!-- Panel -->
                        <div class="panel text-gray">
                           <div class="panel-body">
                              <div class="tab-content">
                                 <!-- Categroy 1 -->
                                 <div class=" tab-pane animation-fade active" id="category-1" role="tabpanel">
                                    <div class="panel-group panel-group-simple panel-group-continuous" id="accordion2" aria-multiselectable="true" role="tablist">
                                       <!-- Question 1 -->
                                       <div class="panel">
                                          <div class="panel-heading" id="question-1" role="tab">
                                             <a class="panel-title" aria-controls="answer-1" aria-expanded="true" data-toggle="collapse" href="#answer-1" data-parent="#accordion2"> 
                                                회원가입을 하고 싶습니다. 어디서 회원가입을 할 수 있나요? 
                                             </a>
                                          </div>
                                          <div class="panel-collapse collapse show" id="answer-1" aria-labelledby="question-1" role="tabpanel">
                                             <div class="panel-body">
                                                회원가입은 회원가입 페이지를 통해 가입을 할 수 있습니다.<br> '
                                                <a href="${path}/user/join">이곳</a>'을 눌러 회원가입 페이지로 이동 가능합니다.
                                             </div>
                                          </div>
                                       </div>
                                       <!-- End Question 1 -->

                                       <!-- Question 2 -->
                                       <div class="panel">
                                          <div class="panel-heading" id="question-2" role="tab">
                                             <a class="panel-title" aria-controls="answer-2"
                                                aria-expanded="false" data-toggle="collapse"
                                                href="#answer-2" data-parent="#accordion2"> 
                                                아이디 또는 패스워드가 생각나지 않습니다. 어떻게 찾을 수 있나요? </a>
                                          </div>
                                          <div class="panel-collapse collapse" id="answer-2"
                                             aria-labelledby="question-2" role="tabpanel">
                                             <div class="panel-body">
                                                아이디와 패스워드는 로그인 페이지의 '아이디 또는 패스워드 찾기'버튼을 클릭 하거나 아래의 '아이디 또는 패스워드 찾기'를 클릭해 찾을 수 있습니다.<br> 
                                                아이디와 패스워드를 찾을 때는 가입 시 인증번호를 받은 휴대폰 번호로 문자가 발송되니 번호가 변경되거나 문자를 받을 수 없는 고객님은
                                                1대1 고객센터를 이용해 주시기 바랍니다.<br> 
                                                <a href="#"><t onclick="findInfo();">아이디 또는 패스워드 찾기</t></a><br> 
                                                <a href="#">1대1 고객센터 이동</a>
                                             </div>
                                          </div>
                                       </div>
                                       <!-- End Question 2 -->

                                       <!-- Question 3 -->
                                       <div class="panel">
                                          <div class="panel-heading" id="question-3" role="tab">
                                             <a class="panel-title" aria-controls="answer-3"
                                                aria-expanded="false" data-toggle="collapse"
                                                href="#answer-3" data-parent="#accordion2"> 
                                                회원정보를 수정 또는 탈퇴를하고 싶습니다. 어디서 할 수 있나요? </a>
                                          </div>
                                          <div class="panel-collapse collapse" id="answer-3"
                                             aria-labelledby="question-3" role="tabpanel">
                                             <div class="panel-body">
                                                회원정보 수정 또는 탈퇴는 mypage의 회원 정보 수정을 통해 할 수 있습니다.<br>
                                                회원 탈퇴시 탈퇴한 계정의 정보는 다시 복구할 수 없으니 탈퇴 시 주의하시기 바랍니다.<br>
                                                '<a href="${path}/stock/mypage">이곳</a>'을 눌러 회원정보 페이지로 이동 가능합니다.
                                             </div>
                                          </div>
                                       </div>
                                       <!-- End Question 3 -->

                                       <!-- Question 4 -->
                                       <div class="panel">
                                          <div class="panel-heading" id="question-4" role="tab">
                                             <a class="panel-title" aria-controls="answer-4"
                                                aria-expanded="false" data-toggle="collapse"
                                                href="#answer-4" data-parent="#accordion2"> 
                                                하나의 핸드폰번호로 다중 아이디를 사용하고 싶습니다. 사용 가능한가요? </a>
                                          </div>
                                          <div class="panel-collapse collapse" id="answer-4"
                                             aria-labelledby="question-4" role="tabpanel">
                                             <div class="panel-body">
                                                하나의 실명 핸드폰 번호로 하나의 계정만 생성 할 수 있습니다.<br> 
                                                다른 계정을 생성하기 위해서는 회원 탈퇴 후 다시 가입해 주시기 바랍니다.
                                             </div>
                                          </div>
                                       </div>
                                       <!-- End Question 4 -->
                                    </div>
                                 </div>
                                 <!-- End Categroy 1 -->

                                 <!-- Categroy 2 -->
                                 <div class="tab-pane animation-fade" id="category-2"
                                    role="tabpanel">
                                    <div
                                       class="panel-group panel-group-simple panel-group-continuous"
                                       id="accordion" aria-multiselectable="true" role="tablist">
                                       <!-- Question 5 -->
                                       <div class="panel">
                                          <div class="panel-heading" id="question-5" role="tab">
                                             <a class="panel-title" aria-controls="answer-5"
                                                aria-expanded="true" data-toggle="collapse"
                                                href="#answer-5" data-parent="#accordion"> 
                                                주식을 사거나 팔고 싶습니다. 어떻게 할 수 있나요? </a>
                                          </div>
                                          <div class="panel-collapse collapse show" id="answer-5"
                                             aria-labelledby="question-5" role="tabpanel">
                                             <div class="panel-body">
                                             계좌를 먼저 발급 받은 뒤 해당 계좌로 입금을 하여 입금한 금액과 동일한 금액이 입금되었는지 확인합니다.<br>
                                             이후 트레이딩 페이지로 이동하여 매수하려는 회사이름 및 회사코드를 검색한 후 선택하여 우측 하단에 보이는<br> 매수(매도) 창에
                                              해당 회사의 주식 수량 및   가격을 기입하여 매수(매도)를하면 매수(매도) 신청이 완료됩니다.<br><br>
                                             ※ 수량과 가격을 기입 후 하단의 주문금액과 맞는지 확인 후 매수(매도)를 신청해주시기 바랍니다.
                                             </div>
                                          </div>
                                       </div>
                                       <!-- End Question 5 -->

                                       <!-- Question 6 -->
                                       <div class="panel">
                                          <div class="panel-heading" id="question-6" role="tab">
                                             <a class="panel-title" aria-controls="answer-6"
                                                aria-expanded="false" data-toggle="collapse"
                                                href="#answer-6" data-parent="#accordion"> 
                                                미수가 났습니다.    어떻게 해야하나요? </a>
                                          </div>
                                          <div class="panel-collapse collapse" id="answer-6"
                                             aria-labelledby="question-6" role="tabpanel">
                                             <div class="panel-body">
                                                주식 주문시 가지고 있는 돈(보유현금)보다 주문량을 많이 냈습니다.<br> 
                                                미수가 발생했을 때 어떻게 해야되는지요.<br><br> 
                                                보유현금보다 초과매매하여 결제일에 부족금이 발생하게 된 계좌를 미수계좌라 하며,   부족금액을 미수금액이라 합니다.<br><br> 
                                                거래소의 경우 위탁증거금은 주문하고자 하는 전체 매매대금의 30%(현금15%, 대용15%), 40%(현금20%, 대용 20%), 100% (수수료포함 현금100%)가 있으면<br> 
                                                매매가 가능하고, 현금과 보유주식이 충분한 경우 계좌 보유현금이 주문하고자 하는 전체 매매대금의 15%, 20%, 100%가 있으면 매매가 가능합니다.<br> 
                                                즉, 보유현금의 6.6배까지 매매가 가능합니다.<br><br> 
                                                매매체결 후 3일째(매매일 포함)되는 날 결제되며, 보유현금보다 초과매매한 경우   부족분에 해당하는 금액이 미수금으로 처리됩니다.<br> 
                                                3일째되는날 미수금에 해당하는 금액을 입금하거나 매도주문 하지않으면 익일 동시호가에<br> 
                                                반대매매 당일 기준가의 80%로 계산한    수량을 시장가로 임의 반대매매주문이 나가게 됩니다!!<br> 
                                                결제예정금액은 예수금 변동현황을 참고하시기 바랍니다.<br>
                                             </div>
                                          </div>
                                       </div>
                                       <!-- End Question 6 -->

                                       <!-- Question 7 -->
                                       <div class="panel">
                                          <div class="panel-heading" id="question-7" role="tab">
                                             <a class="panel-title" aria-controls="answer-7"
                                                aria-expanded="false" data-toggle="collapse"
                                                href="#answer-7" data-parent="#accordion"> 
                                                자고났더니 주가가 빠져 있어요. 어떻게 된 것인가요? (배당락, 권리락, 액면분할) </a>
                                          </div>
                                          <div class="panel-collapse collapse" id="answer-7"
                                             aria-labelledby="question-7" role="tabpanel">
                                             <div class="panel-body">
                                                <b>전일종가가 아닌 다른 매매기준가로 매매가 시작되는 경우</b> <br> 
                                                배당, 유.무상증자 또는 액면분할 등의 이유로 매매기준가가 변경되었기 때문입니다.<br><br> 
                                                <b>배당락</b><br> 
                                                -결산월 마지막 날에 주식을 보유한 투자자는 배당권리를 가지는데, 배당락은 배당 기준일이 지나 배당을 받을 수 없는 상태.<br>
                                                -배당락에는 결산월 말일로부터 증권시장일로 1영업일 전일 종가에서<br> 
                                                배당부분만큼 주가를 떨어뜨려 매매를 시작<br> (현금배당인 경우는 배당락이 없음) <br><br> 
                                                <b>권리락</b><br> -기업이 증자(유상/무상증자)를 하는 경우 신주인수권 확정을 위해 신주배정 기준일을 정함.<br> 
                                                -이때 그 기준일 이후에 결제되는 주권에는 신주인수권이 없어지므로 기준일 전일 매매시에는 권리락 조치가 취해짐. <br>
                                                ※신주인수권 : 회사가 신주를 발행할 때 그것을 배정받을 권리<br><br> 
                                                <b>액면분할</b><br> -일반주식의 경우 액면가가 5,000원이 보통인데, 유동성 등을 고려해 액면가를 나누어 재발행하는 것<br><br> 
                                                ■ 배당금지급은 주총에서 배당금 지급결의가 있는 날로부터 일반적으로 30일 이내 계좌에 자동입금 됩니다.<br> 
                                                ■ 유상청약신주는 청약대금 납입일로부터 약 한달후에 계좌에 자동입고 됩니다.
                                             </div>
                                          </div>
                                       </div>
                                       <!-- End Question 7 -->

                                       <div class="panel">
                                          <div class="panel-heading" id="question-9" role="tab">
                                             <a class="panel-title" aria-controls="answer-9"
                                                aria-expanded="false" data-toggle="collapse"
                                                href="#answer-9" data-parent="#accordion1"> 
                                                오늘 미체결된 주문은 언제까지 유효한가요? </a>
                                          </div>
                                          <div class="panel-collapse collapse" id="answer-9"
                                             aria-labelledby="question-9" role="tabpanel">
                                             <div class="panel-body">
                                                당일 해당 거래시간까지만 유효합니다. <br> 
                                                체결이 이루어지지 않을 경우 장이 마감되면 효력은 상실됩니다. <br> 
                                                정규시장 거래는 15시30분까지, 장시작전 시간외 주문은 08:40까지, 장후시간외 주문은 16:00까지, 시간외단일가매매는 18:00까지입니다.
                                             </div>
                                          </div>
                                       </div>
                                       <div class="panel">
                                          <div class="panel-heading" id="question-10" role="tab">
                                             <a class="panel-title" aria-controls="answer-10"
                                                aria-expanded="false" data-toggle="collapse"
                                                href="#answer-10" data-parent="#accordion1"> 
                                                상하한가 계산 방법을 알려주세요 </a>
                                          </div>
                                          <div class="panel-collapse collapse" id="answer-10"
                                             aria-labelledby="question-10" role="tabpanel">
                                             <div class="panel-body">
                                                가격제한폭이란 하루의 주가가 변동할 수 있는 최고한도(상한가)와 최저한도(하한가)를 정해, 주가의
                                                급격한 등락에 따른 투자자의 불안감을 감소시키기 위함으로 가격제한폭은 유가증권시장(구
                                                거래소)/코스닥시장 기준가±30% 입니다. <br><br>
                                                ■ 계산방법 <br> 
                                                ①기준가격에 0.30를 곱합니다. <br>
                                                ②기준가격의 호가가격단위에 해당하는 가격 미만을 절사합니다. <br> 
                                                ③기준가격에 2차계산에 의한 수치를 가감하되, 당해가격의 호가가격단위 미만은 절사합니다.<br><br> 
                                                ☞ 예시 : 당일종가가 9,750원이라고 가정한 경우 익일의 상/하한가 계산은<br>
                                                ①기준가(당일 종가) × 0.30, 즉 9,750 × 0.30 = 2,925원<br>
                                                ②9,750원의 호가가격단위인 10원미만 절사 = 2,920원<br> 
                                                ③10,000원 미만의 호가단위는 10원, 50,000원 미만의 호가단위는 50원이기 때문에<br>
                                                9,750원+2,920원=12,670원이나 상한가는 12,650원이 되며,<br>
                                                9,750원-2,920원=6,830원, 하한가는 6,830원이 됩니다. <br>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <!-- End Categroy 2 -->

                                 <!-- Categroy 3 -->
                                 <div class="tab-pane animation-fade" id="category-3"
                                    role="tabpanel">
                                    <div
                                       class="panel-group panel-group-simple panel-group-continuous"
                                       id="accordion1" aria-multiselectable="true" role="tablist">
                                       <!-- Question 8 -->
                                       <div class="panel">
                                          <div class="panel-heading" id="question-11" role="tab">
                                             <a class="panel-title" aria-controls="answer-11"
                                                aria-expanded="true" data-toggle="collapse"
                                                href="#answer-11" data-parent="#accordion1"> 
                                                미수란 무엇인가요? </a>
                                          </div>
                                          <div class="panel-collapse collapse show" id="answer-11"
                                             aria-labelledby="question-11" role="tabpanel">
                                             <div class="panel-body">
                                                미수란 주식을 매수하거나 공매도 한 경우<br> 
                                                고객이 증권회사에 납부해야 하는 현금(또는 유가증권)을 결제일(T+2)까지 증권회사에 납부하지 못한 경우를 말합니다.
                                             </div>
                                          </div>
                                       </div>
                                       <!-- End Question 8 -->

                                       <!-- Question 9 -->
                                       <div class="panel">
                                          <div class="panel-heading" id="question-12" role="tab">
                                             <a class="panel-title" aria-controls="answer-12"
                                                aria-expanded="false" data-toggle="collapse"
                                                href="#answer-12" data-parent="#accordion1">
                                                미수동결계좌제도는 언제부터 시행되었나요? </a>
                                          </div>
                                          <div class="panel-collapse collapse" id="answer-12"
                                             aria-labelledby="question-12" role="tabpanel">
                                             <div class="panel-body">
                                                미수동결계좌제도는 2007년 5월 1일 미수금이 있는 투자자부터 적용되었습니다.<br> 
                                                즉, 5월 1일 현재 10만원 이상의 결제대금을 증권회사에 납부하지 못한 투자자에 대해서 최소 매매일인    5월 2일부터 5월 31일까지<br> 
                                                30일간 동결계좌가 적용되었습니다. 전증권사 공통사항이며, 고객단위로 적용되기 때문에 한 계좌에서 미수가 발생했다<br> 
                                                하더라도 전 증권사에 동일 명의의 계좌에 대해서는 동일하게 동결계좌가 적용됩니다.
                                             </div>
                                          </div>
                                       </div>
                                       <!-- End Question 9 -->

                                       <!-- Question 10 -->
                                       <div class="panel">
                                          <div class="panel-heading" id="question-10" role="tab">
                                             <a class="panel-title" aria-controls="answer-10"
                                                aria-expanded="false" data-toggle="collapse"
                                                href="#answer-10" data-parent="#accordion1"> 
                                                미수동결 해지를 위해서는 어떻게 해야하나요? </a>
                                          </div>
                                          <div class="panel-collapse collapse" id="answer-10"
                                             aria-labelledby="question-10" role="tabpanel">
                                             <div class="panel-body">
                                                동결지정된 계좌는 당사 및 타증권사에까지 내용이 전달되어 30일간(영업일 기준이 아닌 달력기준) 증거금 100% 징구되며 해당<br> 
                                                기간 종료후에는 자동으로 증거금 100%가 해제됩니다.
                                             </div>
                                          </div>
                                       </div>
                                       <!-- End Question 10 -->
                                    </div>
                                 </div>
                                 <!-- End Categroy 3 -->

                                 <!-- Categroy 4 -->
                                 <div class="tab-pane animation-fade" id="category-4"
                                    role="tabpanel">
                                    <div class="panel-group panel-group-simple panel-group-continuous"
                                       id="accordion3" aria-multiselectable="true" role="tablist">
                                       <!-- Question 11 -->
                                       <div class="panel">
                                          <div class="panel-heading" id="question-11" role="tab">
                                             <a class="panel-title" aria-controls="answer-11"
                                                aria-expanded="true" data-toggle="collapse"
                                                href="#answer-11" data-parent="#accordion3"> 
                                                계좌가 휴면계좌라고 나오는데 휴면계좌가 무엇인가요? </a>
                                          </div>
                                          <div class="panel-collapse collapse show" id="answer-11"
                                             aria-labelledby="question-11" role="tabpanel">
                                             <div class="panel-body">
                                                <b>휴면계좌</b>란 현금을 포함한 잔고평가금액이 10만원 이하이면서 최근 6개월동안 매매거래 및 입출금 거래가 없는 경우 휴면계좌로 등록되어 별도 관리됩니다.<br>
                                                <br> 휴면된 계좌는 입출금 및 입고거래가 불가하며, 매매 및 일부 서비스신청 등은 가능합니다.<br><br> 
                                                휴면된 계좌를 해지하고자 할 때에는 홈페이지 또는 모바일 앱, 고객지원센터(☎ 1544-3663)를 통해 가능합니다.<br><br> 
                                                [휴면해지방법]<br> 
                                                ○ 홈페이지 및 모바일 앱 (온라인서비스 약정계좌 가능)<br> 
                                                - 홈페이지 : 뱅킹/계좌정보 > 계좌/개인정보관리 > 휴면계좌조회/휴면해지<br>
                                                - 모바일앱 : 안내/문의/등록/설정 > 개인정보/서비스 > 서비스신청/변경 > 휴면계좌 해지<br><br>
                                                ○ 고객지원센터(☎1544-3663)<br> 
                                                - 본인 확인절차 후 해지 가능<br><br> 
                                                [휴면해지 처리 가능시간]<br> 
                                                - 영업일 09:30 ~ 16:00
                                             </div>
                                          </div>
                                       </div>
                                       <!-- End Question 11 -->

                                       <!-- Question 12 -->
                                       <div class="panel">
                                          <div class="panel-heading" id="question-12" role="tab">
                                             <a class="panel-title" aria-controls="answer-12"
                                                aria-expanded="false" data-toggle="collapse"
                                                href="#answer-12" data-parent="#accordion3"> 
                                                계좌개설, 입출금, 입출고 시간과 방법을 알려주세요. </a>
                                          </div>
                                          <div class="panel-collapse collapse" id="answer-12"
                                             aria-labelledby="question-12" role="tabpanel">
                                             <div class="panel-body">
                                                <b>■ 계좌개설 및 일반업무</b> : [평일] 09:30 ~ 16:00<br><br> 
                                                <b>■ 입출금</b><br>
                                                <table style="border: 1px solid #fff; width: 510px; height: 240px;">
                                                   <tr align="center">
                                                      <td>구분</td>
                                                      <td>평일</td>
                                                      <td>토,일,공휴일</td>
                                                   </tr>
                                                   <tr align="center">
                                                      <td>입금(영업점)</td>
                                                      <td>09:30 ~ 15:40</td>
                                                      <td></td>
                                                   </tr>
                                                   <tr align="center">
                                                      <td>출금(영업점)</td>
                                                      <td>10:00 ~ 15:40</td>
                                                      <td></td>
                                                   </tr>
                                                   <tr align="center">
                                                      <td>계좌간 대체</td>
                                                      <td>09:30 ~ 16:00</td>
                                                      <td></td>
                                                   </tr>
                                                   <tr align="center">
                                                      <td>은행이체(온라인)</td>
                                                      <td>00:30 ~ 23:40</td>
                                                      <td>00:30 ~ 23:40</td>
                                                   </tr>
                                                   <tr align="center">
                                                      <td>이체입금</td>
                                                      <td>07:10 ~ 22:00</td>
                                                      <td>07:10 ~ 22:00</td>
                                                   </tr>
                                                </table>
                                             </div>
                                          </div>
                                       </div>
                                       <!-- End Question 12 -->

                                       <!-- Question 13 -->
                                       <div class="panel">
                                          <div class="panel-heading" id="question-13" role="tab">
                                             <a class="panel-title" aria-controls="answer-13"
                                                aria-expanded="false" data-toggle="collapse"
                                                href="#answer-13" data-parent="#accordion3"> 
                                                사용할수록 화면이 점점 느려집니다. </a>
                                          </div>
                                          <div class="panel-collapse collapse" id="answer-13"
                                             aria-labelledby="question-13" role="tabpanel">
                                             <div class="panel-body">
                                                동시 사용중인 다른 프로그램이 많아서 컴퓨터 메모리가 부족한 경우입니다.<br><br>
                                                1. 컴퓨터의 메모리를 업그레이드 하세요.<br> 
                                                메모리를 구매하셔서 용량을 늘리거나, 속도 개선 유틸리티를 활용하시기 바랍니다.<br><br> 
                                                2. 꼭 필요한 프로그램만 사용하세요.<br>

                                                동시 사용중인 프로그램이 많으면 속도 저하기 될 수 있습니다. 지금 사용하지 않는데 구동시키는 프로그램은 종료하셔서<br> 
                                                메모리를 효율적으로 사용하시기 바랍니다.<br><br> 
                                                ※ 위와 같은 조치를 취했는데도 문제가 해결되지 않으면 고객지원센터(☎1544-3663)로 연락 주시기 바랍니다.
                                             </div>
                                          </div>
                                       </div>
                                       <!-- End Question 13 -->
                                    </div>
                                 </div>
                                 <!-- End Categroy 4 -->
                              </div>
                           </div>
                        </div>
                        <!-- End Panel -->
                     </div>
                  </div>
               </div>
               <!-- /.box-body -->
            </div>
            <!-- /. box -->
         </section>
         <!-- /.content -->
      </div>
      <!-- /.content-wrapper -->
      <footer class="main-footer">
         <div class="pull-right d-none d-sm-inline-block">
            <ul class="nav nav-primary nav-dotted nav-dot-separated justify-content-center justify-content-md-end">
               <li class="nav-item"><a class="nav-link"
                  href="javascript:void(0)">FAQ</a></li>
               <li class="nav-item"><a class="nav-link" href="#">Purchase Now</a></li>
            </ul>
         </div>

         © 2019 <a href="https://www.multipurposethemes.com/">Multi-Purpose Themes</a>. All Rights Reserved.
      </footer>
      <!-- Control Sidebar -->
      <aside class="control-sidebar control-sidebar-dark">
         <!-- Create the tabs -->
         <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
            <li class="nav-item"><a href="#control-sidebar-home-tab"
               data-toggle="tab"><i class="fa fa-home"></i></a></li>
            <li class="nav-item"><a href="#control-sidebar-settings-tab"
               data-toggle="tab"><i class="fa fa-cog fa-spin"></i></a></li>
         </ul>
         <!-- Tab panes -->
         <div class="tab-content">
            <!-- Home tab content -->
            <div class="tab-pane" id="control-sidebar-home-tab">
               <h3 class="control-sidebar-heading">Recent Activity</h3>
               <ul class="control-sidebar-menu">
                  <li><a href="javascript:void(0)"> <i
                        class="menu-icon fa fa-birthday-cake bg-red"></i>
                        <div class="menu-info">
                           <h4 class="control-sidebar-subheading">Admin Birthday</h4>
                           <p>Will be July 24th</p>
                        </div>
                  </a></li>
                  <li><a href="javascript:void(0)"> <i
                        class="menu-icon fa fa-user bg-yellow"></i>
                        <div class="menu-info">
                           <h4 class="control-sidebar-subheading">Jhone Updated His Profile</h4>
                           <p>New Email : jhone_doe@demo.com</p>
                        </div>
                  </a></li>
                  <li><a href="javascript:void(0)"> <i
                        class="menu-icon fa fa-envelope-o bg-light-blue"></i>
                        <div class="menu-info">
                           <h4 class="control-sidebar-subheading">Disha Joined Mailing List</h4>
                           <p>disha@demo.com</p>
                        </div>
                  </a></li>
                  <li><a href="javascript:void(0)"> <i
                        class="menu-icon fa fa-file-code-o bg-green"></i>
                        <div class="menu-info">
                           <h4 class="control-sidebar-subheading">Code Change</h4>
                           <p>Execution time 15 Days</p>
                        </div>
                  </a></li>
               </ul>
               <!-- /.control-sidebar-menu -->
               <h3 class="control-sidebar-heading">Tasks Progress</h3>
               <ul class="control-sidebar-menu">
                  <li><a href="javascript:void(0)">
                        <h4 class="control-sidebar-subheading">
                           Web Design <span class="label label-danger pull-right">40%</span>
                        </h4>
                        <div class="progress progress-xxs">
                           <div class="progress-bar progress-bar-danger"
                              style="width: 40%"></div>
                        </div>
                  </a></li>
                  <li><a href="javascript:void(0)">
                        <h4 class="control-sidebar-subheading">
                           Update Data <span class="label label-success pull-right">75%</span>
                        </h4>
                        <div class="progress progress-xxs">
                           <div class="progress-bar progress-bar-success"
                              style="width: 75%"></div>
                        </div>
                  </a></li>
                  <li><a href="javascript:void(0)">
                        <h4 class="control-sidebar-subheading">
                           Order Process <span class="label label-warning pull-right">89%</span>
                        </h4>
                        <div class="progress progress-xxs">
                           <div class="progress-bar progress-bar-warning"
                              style="width: 89%"></div>
                        </div>
                  </a></li>
                  <li><a href="javascript:void(0)">
                        <h4 class="control-sidebar-subheading">
                           Development <span class="label label-primary pull-right">72%</span>
                        </h4>
                        <div class="progress progress-xxs">
                           <div class="progress-bar progress-bar-primary"
                              style="width: 72%"></div>
                        </div>
                  </a></li>
               </ul>
               <!-- /.control-sidebar-menu -->
            </div>
            <!-- /.tab-pane -->
            <!-- Stats tab content -->
            <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab
               Content</div>
            <!-- /.tab-pane -->
            <!-- Settings tab content -->
            <div class="tab-pane" id="control-sidebar-settings-tab">
               <form method="post">
                  <h3 class="control-sidebar-heading">General Settings</h3>
                  <div class="form-group">
                     <input type="checkbox" id="report_panel" class="chk-col-grey">
                     <label for="report_panel" class="control-sidebar-subheading ">Report
                        panel usage</label>
                     <p>general settings information</p>
                  </div>
                  <!-- /.form-group -->
                  <div class="form-group">
                     <input type="checkbox" id="allow_mail" class="chk-col-grey">
                     <label for="allow_mail" class="control-sidebar-subheading ">Mail
                        redirect</label>
                     <p>Other sets of options are available</p>
                  </div>
                  <!-- /.form-group -->
                  <div class="form-group">
                     <input type="checkbox" id="expose_author" class="chk-col-grey">
                     <label for="expose_author" class="control-sidebar-subheading ">Expose
                        author name</label>
                     <p>Allow the user to show his name in blog posts</p>
                  </div>
                  <!-- /.form-group -->
                  <h3 class="control-sidebar-heading">Chat Settings</h3>
                  <div class="form-group">
                     <input type="checkbox" id="show_me_online" class="chk-col-grey">
                     <label for="show_me_online" class="control-sidebar-subheading ">Show
                        me as online</label>
                  </div>
                  <!-- /.form-group -->
                  <div class="form-group">
                     <input type="checkbox" id="off_notifications"
                        class="chk-col-grey"> <label for="off_notifications"
                        class="control-sidebar-subheading ">Turn off
                        notifications</label>
                  </div>
                  <!-- /.form-group -->
                  <div class="form-group">
                     <label class="control-sidebar-subheading"> <a
                        href="javascript:void(0)" class="text-red margin-r-5"><i
                           class="fa fa-trash-o"></i></a> Delete chat history
                     </label>
                  </div>
                  <!-- /.form-group -->
               </form>
            </div>
            <!-- /.tab-pane -->
         </div>
      </aside>
      <!-- /.control-sidebar -->
      <!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
      <div class="control-sidebar-bg"></div>
   </div>
   <!-- ./wrapper -->
</body>
</html>
</html>