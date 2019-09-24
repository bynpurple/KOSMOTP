<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
<script type="text/javascript">
	//id = selectCompany
	function selectCompany(c_name, c_code) {
		alert(c_name);
		alert(c_code);

		var sc = document.getElementById("selectCompany");
		sc.style.display = 'block';
		document.getElementById("companyName").innerHTML = c_name; 	// 기업명 
		
		var param = "proctype=find_memid";
		param += "&c_name=" + c_name;
		param += "&c_code=" + c_code;
		
		$.ajax({
			url : "/stock/user/selectCompany.do",
			data : param,
			type : "POST",
			dataType : "json", 
			success : function(result) {
				console.log(result);
				var stockname = result.stockname; // result의 id가 키니깐 - value 담기는거
				//alert(stockname);
				 if (stockname != null) {
				
				    $(".text-info").text(stockname);
				    $("#totalstock").text(result.totalstock);
				    //$("#mkt_cap").text(result.mkt_cap);
				
				} else {
				    alert("찾으시는 조건의 아이디가 없습니다.");
				} 
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
	}
	
	
	// 삭제 아이콘
	function clickDelete(c_name, c_code){
		
		//alert("딜리트 함수임 " + c_name);
		var delCompany = confirm("'"+c_name +"'"+ "를 관심종목에서 삭제하겠습니까?");
		
		if(delCompany == true){
			window.location="deletePro.do?c_name="+c_name+"&c_code="+c_code;
		}else{
			alert("취소되었습니다.");
		}
		
	}
	
	
</script>


</head>
<body class="hold-transition skin-black sidebar-mini">

	<%@ include file="../include/header.jsp"%>

	<!-- Site wrapper -->
	<div class="wrapper">
	
	<header class="main-header">
    	<%@ include file="../include/main_header.jsp" %>
	</header>
	<aside class="main-sidebar">
	  <%@ include file="../stock/side_menu.jsp" %>
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
								<label>Search: 
									<input type="text" name="searchInput" value="" id="tags" onkeyup="autocomplete();"> 
									<input type="submit" id="searchButton" value="">
								</label>
							</div>
	
							<div align="left" style="padding-top:25px;"> * 상세내역은 종목명 클릭</div>	
							<table id="example1" class="table table-bordered table-striped dataTable" style="cursor: pointer;" role="grid" aria-describedby="example1_info">
								<thead>
									<tr role="row" style="font-weight:bold; font-size:15px; color:white; background-color:black;">
										<th>종목명</th>
										<th>현재가</th>
										<th>대비</th>
										<th>등락률</th>
										<th>거래량</th>
										<th>시가</th>
										<th>고가</th>
										<th>저가</th>
										<th>매도호가</th>
										<th>매도잔량</th>
										<th>매수호가</th>
										<th>매수잔량</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${cnt > 0}">
										<c:forEach var="item" items="${itemList}">
											<tr role="row" class="media-list media-list-hover media-list-divided odd">
												
												<c:if test="${item.stocktheme == '금융업'}">
													<td onclick="selectCompany('${item.stockname}', '${item.stockcode}');">
													<i class="cc ZEC mr-5" title="ZEC" style="witdh:30px; height:30px;"></i>${item.stockname}(${item.stockcode})</td>
												</c:if>
												<c:if test="${item.stocktheme == '의약품'}">
													<td onclick="selectCompany('${item.stockname}', '${item.stockcode}');">
													<i class="cc QTUM mr-5" title="QTUM" style="witdh:30px; height:30px;"></i>${item.stockname}(${item.stockcode})</td>
												</c:if>
												<c:if test="${item.stocktheme == '전기전자'}">
													<td onclick="selectCompany('${item.stockname}', '${item.stockcode}');">
													<i class="cc STRAT mr-5" title="STRAT" style="witdh:30px; height:30px;"></i>${item.stockname}(${item.stockcode})</td>
												</c:if>
												<c:if test="${item.stocktheme != '금융업' and item.stocktheme !='의약품' and item.stocktheme !='전기전자'}">
													<td onclick="selectCompany('${item.stockname}', '${item.stockcode}');">
													<i class="cc BAT mr-5" title="BAT" style="witdh:30px; height:30px;"></i>${item.stockname}(${item.stockcode})</td>
												</c:if>
												
												
												<td style="color:red;"><fmt:formatNumber value="${item.stockcurrent}" pattern="#,###" /></td>
												<td><i class="mdi mdi-arrow-up-bold"></i>${item.gap}</td>
												<!-- <i class="mdi mdi-arrow-up-bold"></i>
												<i class="mdi mdi-arrow-down-bold"></i> -->
												<td>${item.gap}</td>
												<td><fmt:formatNumber value="${item.stockvolume}" pattern="#,###" /></td>
												<td><fmt:formatNumber value="${item.stockopen}" pattern="#,###" /></td>
												<td><fmt:formatNumber value="${item.stockhigh}" pattern="#,###" /></td>
												<td><fmt:formatNumber value="${item.stocklow}" pattern="#,###" /></td>
												<td>매도호가</td>
												<td>매도잔량</td>
												<td>매수호가</td>
												<td>매수잔량</td>
												<td><span class="glyphicon glyphicon-trash" onclick="clickDelete('${item.stockname}', '${item.stockcode}')"></span></td>
											</tr>
										</c:forEach>
									</c:if>
	
									<!-- 주식리스트가 없으면  -->
									<c:if test="${cnt < 0}">
										<tr>
											<td colspan="12" align="center">관심 종목을 선택해주세요!</td>
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
	font-weight: bold;
}

#searchButton {
	background-image: url('/stock/resources/images/top_icon_search.png');
	width: 40px;
	height: 40px;
}

#example1 tbody tr:hover {
   /*  outline: 0; */
    /* text-decoration: none; */
    color: black;  
    background-color: #BDBDBD;
   /*  opacity:0.4;
    transform:scale(1); */
}
</style>



<!-- 선택 기업  출력 -->

<div class="col-md-12 col-12" style="margin-top: 50px; display: none;" id="selectCompany">
	<div class="box box-solid bg-dark">
		<div class="box-body">
			<div class="table-responsive" style="overflow-x:hidden;">

				<div class="row">
					<div class="col-md-8 col-12">
					
						<div class="box-body">	<!-- 글자안내칸 -->
							<div class="media align-items-center">
								<h3 class="no-margin text-bold" style="color: white; color: white; margin-bottom: 30px; margin-top: 20px;" id="companyName"></h3>
								<!-- 선택기업이름 삽입  -->
							</div>

							<table style="padding: 5px; font-weight: bold;" id="table2">
								<tr>
									<th><span class="text-yellow">250일 최고</span></th>
									<td>
										<span class="text-info">$0.04</span> 
										<span class="text-success">+1.35%</span> 
										<span class="text-info">18/09/02</span>
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
										<span class="text-info">$0.04</span> 
										<span class="text-success">+1.35%</span> 
										<span class="text-info">18/09/02</span>
									</td>
									<th><span class="text-yellow">자본금</span></th>
									<td><span class="text-success">355억</span></td>
									<th><span class="text-yellow">대용가</span></th>
									<td><span class="text-success">31,180</span></td>
									<th><span class="text-yellow">PER</span></th>
									<td><span class="text-success">--</span></td>
								</tr>
								<tr>
									<th><span class="text-yellow">외국인보유</span></th>
									<td>
										<span class="text-info">7.62%</span> 
										<span class="text-success"> -- </span> 
										<span class="text-info">5,141(천)</span>
									</td>
									<th><span class="text-yellow">주식수</span></th>
									<td><span class="text-success" id=totalstock><fmt:formatNumber value="" pattern="#,###" /></span></td>
									<th><span class="text-yellow">신용비율</span></th>
									<td><span class="text-success">2.81%</span></td>
									<th><span class="text-yellow">결산월</span></th>
									<td><span class="text-success">12월</span></td>
								</tr>
							</table>

						</div>


						<!-- 표 -->
						<div class="box-body">
							<div class="table-responsive">
								<div id="dataTable_crypto_wrapper" class="dataTables_wra<!-- pper no-footer">
									<div id="dataTable_crypto_filter" class="dataTables_filter"></div>
									<table class="table table-bordered dataTable no-footer table-striped" id="dataTable_crypto" role="grid"
										aria-describedby="dataTable_crypto_info">
										<thead>
											<tr role="row">
												<th>시간</th>
												<th>체결가</th>
												<th>전일대비</th>
												<th>체결량</th>
												<th>체결강도</th>
											</tr>
										</thead>
										<tbody>
											<tr role="row" class="odd">
												<td><p class="text-yellow hover-warning">10:59:41</p></td>
												<td><p>31,200</p></td>
												<td><p>13,350</p></td>
												<td><p style="color: red">1</p></td>
												<td>
													<label class="label label-danger">
													<i class="fa fa-chevron-<!-- down"></i>500.00</label>
												</td>
												<!-- <canvas width="48" height="19" style="display: inline-block; width: 48px; height: 19px; vertical-align: top;"></canvas> -->
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>

					</div>


					<!-- 그래프  -->
					<div class="col-md-4 col-12">
						<div class="box-body" style="padding-top: 80px;">
							
							
				
							<div class="chart-responsive">
             					 <div class="chart" id="line-chart" style="height: 300px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
									<svg height="300" version="1.1" width="766" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" 
										 style="overflow: hidden; position: relative; top: -0.5px;">
										 
									<desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with Raphaël 2.2.0</desc>
									<defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs>
									
									<text x="49.578125" y="259" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" 
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal">
									<tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">0</tspan>
									</text>
									
									<path fill="none" stroke="#aaaaaa" d="M62.078125,259H741.5" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
									<text x="49.578125" y="200.5" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" 
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal">
									<tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">22,500</tspan>
									</text>
									
									<path fill="none" stroke="#aaaaaa" d="M62.078125,200.5H741.5" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
									<text x="49.578125" y="142" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" 
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal">
									<tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">45,000</tspan>
									</text>
									
									<path fill="none" stroke="#aaaaaa" d="M62.078125,142H741.5" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
									<text x="49.578125" y="83.5" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" 
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal">
									<tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">67,500</tspan>
									</text>
									
									<path fill="none" stroke="#aaaaaa" d="M62.078125,83.5H741.5" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
									<text x="49.578125" y="25" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" 
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal">
									<tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">90,000</tspan>
									</text>
									
									<path fill="none" stroke="#aaaaaa" d="M62.078125,25H741.5" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
									<text x="741.5" y="271.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" 
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8)">
									<tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2016</tspan>
									</text>
									
									<text x="666.0546138195923" y="271.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" 
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8)">
									<tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2015</tspan>
									</text>
									
									<text x="590.6092276391846" y="271.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" 
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8)">
									<tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2014</tspan>
									</text>
									
									<text x="515.1638414587769" y="271.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" 
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8)">
									<tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2013</tspan>
									</text>
									
									<text x="439.5117555902038" y="271.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" 
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8)">
									<tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2012</tspan>
									</text>
									
									<text x="364.06636940979615" y="271.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" 
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8)">
									<tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2011</tspan>
									</text>
									
									<text x="288.62098322938846" y="271.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" 
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8)">
									<tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2010</tspan>
									</text>
									
									<text x="213.17559704898082" y="271.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" 
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8)">
									<tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2009</tspan>
									</text>
									
									<text x="137.52351118040767" y="271.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" 
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8)">
									<tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2008</tspan>
									</text>
									
									<text x="62.078125" y="271.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" 
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8)">
									<tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2007</tspan>
									</text>
									
									<path fill="none" stroke="#1e88e5" d="M62.078125,218.7286C80.93947154510192,192.0136,118.66216463530574,118.34964685362519,137.52351118040767,111.86860000000001C156.43653264755096,105.36979685362519,194.26257558183752,176.28256675786594,213.17559704898082,166.8092C232.03694359408274,157.36171675786593,269.75963668428653,43.152550000000005,288.62098322938846,
									36.18520000000001C307.4823297744904,29.217850000000006,345.20502286469423,88.252475,364.06636940979615,111.0704C382.9277159548981,133.888325,420.65040904510187,224.89515266757866,439.5117555902038,218.7286C458.42477705734706,212.54515266757866,496.25081999163365,
									74.61463337893296,515.1638414587769,61.6704C534.0251880038788,48.76153337893297,571.7478810940827,102.45562500000001,590.6092276391846,115.31620000000001C609.4705741842865,128.17677500000002,647.1932672744904,150.684975,666.0546138195923,164.555C684.9159603646942,178.425025,722.6386534548981,210.84605,741.5,226.2764" stroke-opacity="1" stroke-width="3" 
									style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
									
									<circle cx="62.078125" cy="218.7286" r="4" fill="#1e88e5" stroke="#ffffff" fill-opacity="1" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
									<circle cx="137.52351118040767" cy="111.86860000000001" r="4" fill="#1e88e5" stroke="#ffffff" fill-opacity="1" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
									<circle cx="213.17559704898082" cy="166.8092" r="4" fill="#1e88e5" stroke="#ffffff" fill-opacity="1" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
									<circle cx="288.62098322938846" cy="36.18520000000001" r="4" fill="#1e88e5" stroke="#ffffff" fill-opacity="1" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
									<circle cx="364.06636940979615" cy="111.0704" r="4" fill="#1e88e5" stroke="#ffffff" fill-opacity="1" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
									<circle cx="439.5117555902038" cy="218.7286" r="4" fill="#1e88e5" stroke="#ffffff" fill-opacity="1" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
									<circle cx="515.1638414587769" cy="61.6704" r="4" fill="#1e88e5" stroke="#ffffff" fill-opacity="1" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
									<circle cx="590.6092276391846" cy="115.31620000000001" r="4" fill="#1e88e5" stroke="#ffffff" fill-opacity="1" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
									<circle cx="666.0546138195923" cy="164.555" r="4" fill="#1e88e5" stroke="#ffffff" fill-opacity="1" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
									<circle cx="741.5" cy="226.2764" r="4" fill="#1e88e5" stroke="#ffffff" fill-opacity="1" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
									</svg>
									
									<div class="morris-hover morris-default-style" style="display: none;"></div>
								</div>
							</div>
						
						<!-- 그래프 끝 -->	
						</div>
					</div>
				</div> <!-- 선택기업 row  -->
			</div>
		</div>
	</div>
</div><!-- id: selectCompany -->
</div>
</section>



</div>
</form>

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
		
		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	    <script>
	      // 검색 자동완성 -- 안되고 있음^^
	      $(function autocomplete(){
	         var stock = [${list}];
	         
	         $("#tags").autocomplete({
	            source: stock
	         });
	      });
	    </script>
		
</body>
</html>
