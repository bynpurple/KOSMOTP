<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Chrome">
<meta name="viewport"
   content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="${project}images/favicon.ico">

<title>EZ Stock - 관리자페이지</title>

<!-- Bootstrap 4.0-->
<link rel="stylesheet"
   href="${project}assets/vendor_components/bootstrap/dist/css/bootstrap.min.css">

<!-- Bootstrap extend-->
<link rel="stylesheet" href="${project}css/bootstrap-extend.css">

<!-- Theme style -->
<link rel="stylesheet" href="${project}css/master_style.css">

<!-- Crypto_Admin skins -->
<link rel="stylesheet" href="${project}css/skins/_all-skins.css">

<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet"
   href="${project}assets/vendor_plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.css">

</head>
<body class="hold-transition skin-black sidebar-mini">
<c:if test="${pageContext.request.userPrincipal.name == 'host'}">
   <div class="wrapper">
      <header class="main-header">
         <%@ include file="../include/main_header.jsp"%>
      </header>

      <aside class="main-sidebar">
         <%@ include file="../stock/side_menu.jsp"%>
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
         <!-- Content Header (Page header) -->
         <section class="content-header">
            <h1>관리자 페이지</h1>
            <ol class="breadcrumb">
               <li class="breadcrumb-item"><a href="#"><i
                     class="fa fa-dashboard"></i> Home</a></li>
               <li class="breadcrumb-item"><a href="#">HOST STOCK</a></li>
               <li class="breadcrumb-item active">HOST PAGE</li>
            </ol>
         </section>

         <!-- Main content -->
         <section class="content">

            <div class="row">
               <div class="col-lg-3 col-12">

                  <!-- Profile Image -->
                  <div class="box bg-inverse bg-dark bg-hexagons-white">
                     <div class="box-body box-profile">
                        <img
                           class="profile-user-img rounded-circle img-fluid mx-auto d-block"
                           src="${project}images/5.jpg" alt="User profile picture">

                        <h3 class="profile-username text-center">EZ STOCK</h3>

                        <p class="text-center">관리자 페이지 입니다.</p>

                        <div class="row social-states">
                           <!-- 현재 회원가입 되어 있는 회원수(관리자 제외) -->
                           <div class="col-6 text-right">
                              <a href="#" class="link text-white"><i
                                 class="ion ion-ios-people-outline"></i> ${minusCnt}</a>
                           </div>
                        </div>

                        <div class="row">
                           <div class="col-12">
                              <div class="profile-user-info">
                                 <p>
                                    <i class="fa fa-envelope pr-15"></i>${vo.username}</p>
                                 <p>
                                    <i class="fa fa-phone pr-15"></i>${vo.hp}</p>
                                 <div class="user-social-acount"></div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <!-- /.box-body -->
                  </div>
                  <!-- /.box -->
               </div>
               <!-- /.col -->
               <div class="col-lg-9 col-12">
                  <div class="nav-tabs-custom">
                     <ul class="nav nav-tabs">

                        <li><a class="active" href="#timeline" data-toggle="tab">회원명단</a></li>
                        <li><a href="#activity" data-toggle="tab">1대1문의</a></li>
                        <li><a href="#settings" data-toggle="tab">Settings</a></li>
                     </ul>

                     <div class="tab-content">

                        <div class="active tab-pane" id="timeline">
                           <!-- The timeline -->
                           <!-- 회명 명단 -->
                           <!-- Main content -->
                           <section class="content">
                              <div class="row">
                                 <div class="col-12">
                                    <div class="box">
                                       <div class="box-body">
                                          <div class="table-responsive">
                                             <table id="example5" class="table table-hover">
                                                <thead class="d-none">
                                                   <tr>
                                                      <th>&nbsp;</th>
                                                      <th>&nbsp;</th>
                                                      <th>&nbsp;</th>
                                                      <th>&nbsp;</th>
                                                      <th>&nbsp;</th>
                                                   </tr>
                                                </thead>
                                                <tbody>
                                                   <tr>
                                                      <td></td>
                                                      <td></td>
                                                      <td></td>
                                                      <td align="center">아이디</td>
                                                      <td align="center">고객명</td>
                                                      <td align="center">인증여부</td>
                                                      <td align="center">연락처</td>
                                                      <td align="center">가입일</td>
                                                   </tr>
                                                   <c:forEach var="dto" items="${dto}">
                                                      <tr>
                                                         <td class="w-20"><i class="fa fa-square-o pt-15"></i></td>
                                                         <td class="w-20"><i
                                                            class="fa fa-star text-yellow pt-15"></i></td>
                                                         <td class="w-60"><a
                                                            class="avatar avatar-lg status-success" href="#">
                                                               <img src="${project}images/avatar/1.jpg" alt="...">
                                                         </a></td>
                                                         <td align="center">${dto.username}</td>
                                                         <td align="center">${dto.name}</td>
                                                         <td align="center">${dto.hold}</td>
                                                         <td align="center">${dto.hp}</td>
                                                         <td align="center"><fmt:formatDate type="both"
                                                               pattern="yyyy-MM-dd HH:mm" value="${dto.join_date}" />
                                                         </td>
                                                      </tr>
                                                   </c:forEach>
                                                </tbody>
                                             </table>
                                          </div>
                                       </div>
                                       <!-- /.box-body -->
                                    </div>
                                    <!-- /.box -->
                                 </div>
                              </div>
                           </section>

                        </div>
                        <!-- /.tab-pane -->

                        <div class="tab-pane" id="activity">
                           <!-- 회명 명단 -->
                           <!-- Main content -->
                           <section class="content">
                              <div class="row">
                                 <div class="col-12">
                                    <div class="box">
                                       <div class="box-body">
                                          <div class="table-responsive">
                                             <table id="example5" class="table table-hover">
                                                <thead class="d-none">
                                                   <tr>
                                                      <th>&nbsp;</th>
                                                      <th>&nbsp;</th>
                                                      <th>&nbsp;</th>
                                                      <th>&nbsp;</th>
                                                      <th>&nbsp;</th>
                                                   </tr>
                                                </thead>
                                                <tbody>
                                                   <tr>
                                                      <td align="center">작성자</td>
                                                      <td align="center">고객명</td>
                                                      <td align="center">작성글</td>
                                                      <td align="center">답변글</td>
                                                   </tr>
                                                   <c:forEach var="dto1" items="${dto1}">
                                                      <tr>
                                                         <td align="center"><a
                                                            href="${path}/user/userInquiry?writer=${dto1.username}">${dto1.username}</a>
                                                         </td>
                                                         <td align="center">${dto1.name}</td>
                                                         <td align="center">${dto1.board_cnt}</td>
                                                         <td align="center">${dto1.board_rp_cnt}</td>
                                                      </tr>
                                                   </c:forEach>
                                                </tbody>
                                             </table>
                                          </div>
                                       </div>
                                       <!-- /.box-body -->
                                    </div>
                                    <!-- /.box -->
                                 </div>
                              </div>
                           </section>
                        </div>
                        <!-- /.post -->




                        <div class="tab-pane" id="settings">
                           <form class="form-horizontal form-element col-12">
                              <div class="form-group row">
                                 <label for="inputName" class="col-sm-2 control-label">Name</label>

                                 <div class="col-sm-10">
                                    <input type="email" class="form-control" id="inputName"
                                       placeholder="">
                                 </div>
                              </div>
                              <div class="form-group row">
                                 <label for="inputEmail" class="col-sm-2 control-label">Email</label>

                                 <div class="col-sm-10">
                                    <input type="email" class="form-control" id="inputEmail"
                                       placeholder="">
                                 </div>
                              </div>
                              <div class="form-group row">
                                 <label for="inputPhone" class="col-sm-2 control-label">Phone</label>

                                 <div class="col-sm-10">
                                    <input type="tel" class="form-control" id="inputPhone"
                                       placeholder="">
                                 </div>
                              </div>
                              <div class="form-group row">
                                 <label for="inputExperience" class="col-sm-2 control-label">Experience</label>

                                 <div class="col-sm-10">
                                    <textarea class="form-control" id="inputExperience"
                                       placeholder=""></textarea>
                                 </div>
                              </div>
                              <div class="form-group row">
                                 <label for="inputSkills" class="col-sm-2 control-label">Skills</label>

                                 <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputSkills"
                                       placeholder="">
                                 </div>
                              </div>
                              <div class="form-group row">
                                 <div class="ml-auto col-sm-10">
                                    <div class="checkbox">
                                       <input type="checkbox" id="basic_checkbox_1" checked="">
                                       <label for="basic_checkbox_1"> I agree to the</label>
                                       &nbsp;&nbsp;&nbsp;&nbsp;<a href="#">Terms and
                                          Conditions</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="form-group row">
                                 <div class="ml-auto col-sm-10">
                                    <button type="submit" class="btn btn-success">Submit</button>
                                 </div>
                              </div>
                           </form>
                        </div>
                        <!-- /.tab-pane -->
                     </div>
                     <!-- /.tab-content -->
                  </div>
                  <!-- /.nav-tabs-custom -->
               </div>
               <!-- /.col -->
            </div>
            <!-- /.row -->

         </section>
         <!-- /.content -->
      </div>
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
</c:if>
<c:if test="${pageContext.request.userPrincipal.name != 'host'}">
	<script type="text/javascript">
		alert("해당 페이지는 관리자만 가능한 페이지 입니다.");
		location.href = "${path}/user/stock_board";
	</script>
</c:if>

   <!-- jQuery 3 -->
   <script
      src="${project}assets/vendor_components/jquery/dist/jquery.min.js"></script>

   <!-- popper -->
   <script
      src="${project}assets/vendor_components/popper/dist/popper.min.js"></script>

   <!-- Bootstrap 4.0-->
   <script
      src="${project}assets/vendor_components/bootstrap/dist/js/bootstrap.min.js"></script>

   <!-- DataTables -->
   <script
      src="${project}assets/vendor_components/datatables.net/js/jquery.dataTables.min.js"></script>
   <script
      src="${project}assets/vendor_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

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

   <!-- This is data table -->
   <script
      src="${project}assets/vendor_plugins/DataTables-1.10.15/media/js/jquery.dataTables.min.js"></script>

   <!-- start - This is for export functionality only -->
   <script
      src="${project}assets/vendor_plugins/DataTables-1.10.15/extensions/Buttons/js/dataTables.buttons.min.js"></script>
   <script
      src="${project}assets/vendor_plugins/DataTables-1.10.15/extensions/Buttons/js/buttons.flash.min.js"></script>
   <script
      src="${project}assets/vendor_plugins/DataTables-1.10.15/ex-js/jszip.min.js"></script>
   <script
      src="${project}assets/vendor_plugins/DataTables-1.10.15/ex-js/pdfmake.min.js"></script>
   <script
      src="${project}assets/vendor_plugins/DataTables-1.10.15/ex-js/vfs_fonts.js"></script>
   <script
      src="${project}assets/vendor_plugins/DataTables-1.10.15/extensions/Buttons/js/buttons.html5.min.js"></script>
   <script
      src="${project}assets/vendor_plugins/DataTables-1.10.15/extensions/Buttons/js/buttons.print.min.js"></script>
   <!-- end - This is for export functionality only -->

   <!-- Crypto_Admin for Data Table -->
   <script src="${project}js/pages/data-table.js"></script>

</body>
</html>