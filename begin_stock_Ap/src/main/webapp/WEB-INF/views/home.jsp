<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=chrome">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet"
	href="/stock/resources/assets/vendor_components/FlipClock-master/compiled/flipclock.css">
</head>
<body class="hold-transition skin-black sidebar-mini">
	<!-- Site wrapper -->
	<div class="wrapper">

		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">
			<%@ include file="stock/side_menu.jsp"%>
		</aside>

		<header class="main-header">
			<%@ include file="include/main_header.jsp"%>
		</header>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>EZ 거래소</h1>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#"><i
							class="fa fa-dashboard"></i> Home</a></li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Default box -->
				<div class="row" style="height: 1170px;">
					<div class="col-lg-4 col-12">
						<div class="box box-solid bg-dark">
							<div class="box-body">
								<div class="table-responsive">
									<table class="table table-bordered no-footer table-striped"
										style="height: 1080px;">
										<thead>
											<tr>
												<th class="text-center">종목</th>
												<th class="text-center">현재가</th>
												<th class="text-center">상한가</th>
												<th class="text-center">하한가</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="dto" items="${list }" begin="1" end="12">
												<tr>
													<td style="height:20px;"><small><a
															href="${path }/user/financialInfo?stockcode=${dto.stockcode }"
															class="text-yellow hover-warning">${dto.stockcode }</a></small>
														<h6 class="text-muted">${dto.stockname }</h6></td>
													<td class="text-center"><p>
															<fmt:formatNumber value="${dto.stockcurrent}" pattern="#,###" />
														</p></td>
													<td class="no-wrap text-center"><label
														class="label label-success"><i
															class="fa fa-chevron-up"></i>
														<fmt:formatNumber value="${dto.stockhigh}" pattern="#,###" /></label></td>
													<td class="no-wrap text-center"><label
														class="label label-danger"><i
															class="fa fa-chevron-down"></i>
														<fmt:formatNumber value="${dto.stocklow}" pattern="#,###" /></label></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<!-- /.box-body -->
						</div>
					</div>

					<div class="col-lg-4 col-12">
						<%-- <div class="box box-solid bg-dark"> --%>
						<div class="box-body">
							<div class="box-header with-border">
								<h3 class="box-title">오늘의 증시</h3>
							</div>
							<div class="row">
								<div class="box-body text-center">
									<h2 class="mb-0 text-bold">코스피</h2>
									<h4>KOSPI</h4>
									<ul
										class="flexbox flex-justified text-center mt-30 bb-1 border-gray pb-20"
										style="height: 60px;">
										<li class="br-1 border-gray">
											<div>체결가</div> <small class="font-size-18">${kospi.num }</small>
										</li>

										<li class="br-1 border-gray">
											<div>전일비</div> <small class="font-size-18"> <c:if
													test="${fn:contains(kospi.content,'+')}">
													<i class="fa fa-arrow-up text-success pr-5"></i>
												</c:if> <c:if test="${fn:contains(kospi.content,'-')}">
													<i class="fa fa-arrow-down text-danger pr-5"></i>
												</c:if> ${kospi.title }
										</small>
										</li>

										<li>
											<div>등락율</div> <small class="font-size-18"> <c:if
													test="${fn:contains(kospi.content,'+')}">
													<i class="fa fa-arrow-up text-success pr-5"></i>
												</c:if> <c:if test="${fn:contains(kospi.content,'-')}">
													<i class="fa fa-arrow-down text-danger pr-5"></i>
												</c:if> ${kospi.content }
										</small>
										</li>
									</ul>
									<ul class="flexbox flex-justified text-center mt-20"
										style="height: 50px;">
										<li class="br-1 border-gray">
											<div>거래량(천주)</div> <small class="font-size-18">${kospi.url }</small>
										</li>

										<li>
											<div>거래대금(백만)</div> <small class="font-size-18">${kospi.date }</small>
										</li>
									</ul>
								</div>
							</div>
							<!-- row 끝 -->

							<div class="row">
								<div class="box-body text-center">
									<h2 class="mb-0 text-bold">코스닥</h2>
									<h4>KOSDAQ</h4>
									<ul
										class="flexbox flex-justified text-center mt-30 bb-1 border-gray pb-20"
										style="height: 60px;">
										<li class="br-1 border-gray">
											<div>체결가</div> <small class="font-size-18">${kosdaq.num }</small>
										</li>

										<li class="br-1 border-gray">
											<div>전일비</div> <small class="font-size-18"> <c:if
													test="${fn:contains(kosdaq.content,'+')}">
													<i class="fa fa-arrow-up text-success pr-5"></i>
												</c:if> <c:if test="${fn:contains(kosdaq.content,'-')}">
													<i class="fa fa-arrow-down text-danger pr-5"></i>
												</c:if> ${kosdaq.title }
										</small>
										</li>

										<li>
											<div>등락율</div> <small class="font-size-18"> <c:if
													test="${fn:contains(kosdaq.content,'+')}">
													<i class="fa fa-arrow-up text-success pr-5"></i>
												</c:if> <c:if test="${fn:contains(kosdaq.content,'-')}">
													<i class="fa fa-arrow-down text-danger pr-5"></i>
												</c:if> ${kosdaq.content }
										</small>
										</li>
									</ul>
									<ul class="flexbox flex-justified text-center mt-20"
										style="height: 50px;">
										<li class="br-1 border-gray">
											<div>거래량(천주)</div> <small class="font-size-18">${kosdaq.url }</small>
										</li>

										<li>
											<div>거래대금(백만)</div> <small class="font-size-18">${kosdaq.date }</small>
										</li>
									</ul>
								</div>
							</div>
							<!-- row 끝 -->

							<div class="row">
								<div class="box-body text-center">
									<h2 class="mb-0 text-bold">환율</h2>
									<h4>Exchange Rate</h4>
									<ul
										class="flexbox flex-justified text-center mt-30 bb-1 border-gray pb-20">
										<li class="br-1 border-gray">
											<div>미국</div> <small class="font-size-18">USD</small>
										</li>

										<li class="br-1 border-gray">
											<div>매매기준율</div> <small class="font-size-18">${usd.num }</small>
										</li>

										<li>
											<div>전일대비</div> <small class="font-size-18"> <c:if
													test="${fn:contains(usd.content,'상승')}">
													<i class="fa fa-arrow-up text-success pr-5"></i>
												</c:if> <c:if test="${fn:contains(usd.content,'하락')}">
													<i class="fa fa-arrow-down text-danger pr-5"></i>
												</c:if> ${usd.title }
										</small>
										</li>
									</ul>

									<ul
										class="flexbox flex-justified text-center mt-30 bb-1 border-gray pb-20">
										<li class="br-1 border-gray">
											<div>유럽연합</div> <small class="font-size-18">EUR</small>
										</li>

										<li class="br-1 border-gray">
											<div>매매기준율</div> <small class="font-size-18">${eur.num }</small>
										</li>

										<li>
											<div>전일대비</div> <small class="font-size-18"> <c:if
													test="${fn:contains(eur.content,'상승')}">
													<i class="fa fa-arrow-up text-success pr-5"></i>
												</c:if> <c:if test="${fn:contains(eur.content,'하락')}">
													<i class="fa fa-arrow-down text-danger pr-5"></i>
												</c:if> ${eur.title }
										</small>
										</li>
									</ul>

									<ul
										class="flexbox flex-justified text-center mt-30 bb-1 border-gray pb-20">
										<li class="br-1 border-gray">
											<div>일본</div> <small class="font-size-18">JPY</small>
										</li>

										<li class="br-1 border-gray">
											<div>매매기준율</div> <small class="font-size-18">${jpy.num }</small>
										</li>

										<li>
											<div>전일대비</div> <small class="font-size-18"> <c:if
													test="${fn:contains(jpy.content,'상승')}">
													<i class="fa fa-arrow-up text-success pr-5"></i>
												</c:if> <c:if test="${fn:contains(jpy.content,'하락')}">
													<i class="fa fa-arrow-down text-danger pr-5"></i>
												</c:if> ${jpy.title }
										</small>
										</li>
									</ul>

									<ul
										class="flexbox flex-justified text-center mt-30 bb-1 border-gray pb-20">
										<li class="br-1 border-gray">
											<div>중국</div> <small class="font-size-18">CNY</small>
										</li>

										<li class="br-1 border-gray">
											<div>매매기준율</div> <small class="font-size-18">${cny.num }</small>
										</li>

										<li>
											<div>전일대비</div> <small class="font-size-18"> <c:if
													test="${fn:contains(cny.content,'상승')}">
													<i class="fa fa-arrow-up text-success pr-5"></i>
												</c:if> <c:if test="${fn:contains(cny.content,'하락')}">
													<i class="fa fa-arrow-down text-danger pr-5"></i>
												</c:if> ${cny.title }
										</small>
										</li>
									</ul>

								</div>
							</div>
							<!-- row 끝 -->
						</div>
					</div>

					<div class="col-lg-4 col-12">
						<div class="box box-solid bg-dark">
							<div class="box-body">
								<div class="table-responsive">
									<table class="table table-bordered no-footer table-striped"
										style="height: 1080px;">
										<thead>
											<tr style="height:20px;">
												<th class="text-center">종목</th>
												<th class="text-center">현재가</th>
												<th class="text-center">상한가</th>
												<th class="text-center">하한가</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="dto" items="${list }" begin="13" end="24">
												<tr>
													<td><small><a
															href="${path }/user/financialInfo?stockcode=${dto.stockcode }"
															class="text-yellow hover-warning">${dto.stockcode }</a></small>
														<h6 class="text-muted">${dto.stockname }</h6></td>
													<td class="text-right"><p>
															<fmt:formatNumber value="${dto.stockcurrent}"
																pattern="#,###" />
														</p></td>
													<td class="no-wrap text-center"><label
														class="label label-success"><i
															class="fa fa-chevron-up"></i>
														<fmt:formatNumber value="${dto.stockhigh}" pattern="#,###" /></label></td>
													<td class="no-wrap text-center"><label
														class="label label-danger"><i
															class="fa fa-chevron-down"></i>
														<fmt:formatNumber value="${dto.stocklow}" pattern="#,###" /></label></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<!-- /.box-body -->
						</div>
					</div>
					<!-- 3번째 열 끝 -->

				</div>
			</section>
		</div>
		<!-- /.box -->
		<!-- /.content -->
		<!-- /.content-wrapper -->


		<footer class="main-footer">
			<div class="pull-right d-none d-sm-inline-block">
				<ul
					class="nav nav-primary nav-dotted nav-dot-separated justify-content-center justify-content-md-end">
					<li class="nav-item"><a class="nav-link"
						href="javascript:void(0)">FAQ</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Purchase
							Now</a></li>
				</ul>
			</div>
			&copy; 2019 <a href="https://www.multipurposethemes.com/">Multi-Purpose
				Themes</a>. All Rights Reserved.
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
									<h4 class="control-sidebar-subheading">Jhone Updated His
										Profile</h4>

									<p>New Email : jhone_doe@demo.com</p>
								</div>
						</a></li>
						<li><a href="javascript:void(0)"> <i
								class="menu-icon fa fa-envelope-o bg-light-blue"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Disha Joined
										Mailing List</h4>

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


	<!-- jQuery 3 -->
	<script src="${project}assets/vendor_components/jquery/dist/jquery.js"></script>
	<script
		src="${project}assets/vendor_components/jquery/dist/jquery.min.js"></script>
	<!-- popper -->
	<script
		src="${project}assets/vendor_components/popper/dist/popper.min.js"></script>

	<!-- Bootstrap 4.0-->
	<script
		src="${project}assets/vendor_components/bootstrap/dist/js/bootstrap.js"></script>

	<!-- Slimscroll -->
	<script
		src="${project}assets/vendor_components/jquery-slimscroll/jquery.slimscroll.js"></script>

	<!-- FastClick -->
	<script
		src="${project}assets/vendor_components/fastclick/lib/fastclick.js"></script>
	<script
		src="${project}assets/vendor_components/FlipClock-master/compiled/flipclock.min.js"></script>

	<!-- This is data table -->
	<script
		src="${project}assets/vendor_plugins/DataTables-1.10.15/media/js/jquery.dataTables.min.js"></script>

	<!-- Sparkline -->
	<script
		src="${project}assets/vendor_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>

	<!-- Crypto_Admin App -->
	<script src="${project}js/template.js"></script>

	<!-- Crypto_Admin for demo purposes -->
	<script src="${project}js/demo.js"></script>

	<!-- Crypto_Admin for demo purposes -->
	<script src="${project}js/pages/market-capitalizations.js"></script>

	<script
		src="${project}assets/vendor_components/chart.js-master/Chart.min.js"></script>
	<script src="${project}js/pages/chartjs-int.js"></script>
	<script src="${project}js/pages/countdown.js"></script>
</body>
</html>