<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>
<head>
    <head>
     <meta charset="utf-8">
     <meta http-equiv="X-UA-Compatible" content="IE=Chrome">
     <meta name="description" content="">
     <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="https://github.com/JiHong88" />
    <meta name="keywords" content="wysiwyg,editor,javascript,suneditor,wysiwyg eidtor,rich text editor,html editor,contenteditable,위지위그 에디터 웹에디터">
    <meta name="description" content="Pure javascript wysiwyg web editor" />
    <title>SunEditor</title>
    <link href="${project}dist/css/suneditor.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${project}css/bootstrap.css" media="all">
    <link rel="stylesheet" href="${project}css/sample.css" media="all">
    <script src="${project}dist/suneditor.min.js"></script>
    <style>
        .tab {
            overflow: hidden;
            color: #f4b124;
            font-weight: bold;
            border-bottom: 2px solid #f4b124;
            border-radius: 2px;
        }

        /* Style the buttons that are used to open the tab content */
        .tab button {
            background-color: transparent;
            float: left;
            border: none;
            outline: none;
            cursor: pointer;
            padding: 14px 35px;
            transition: 0.3s;
            font-size: 16px;
            border-top-left-radius: 2px;
            border-top-right-radius: 2px;
            margin: 0;
        }

        /* Change background color of buttons on hover */
        .tab button:hover {
            color: #f5f5f5;
        }

        /* Create an active/current tablink class */
        .tab button.active {
            color: #fff;
            background-color: #f4b124;
        }

        /* Style the tab content */
        .tabcontent {
            display: none;
        }

        /* inline editor */
        .inline-margin {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    	<%@ include file="../include/top-header-non.jsp" %>
        <!-- ========== Page Title ========== -->

        <header class="page-title pt-large pt-light pt-parallax pt-plax-lg-light">
          <div class="container">
            <div class="row">
              <h1 class="col-sm-6">공지사항</h1>
              <ol class="col-sm-6 text-right breadcrumb">
                <li><a href="#">공지사항</a></li>
                <li><a href="#">공지사항 작성</a></li>
              </ol>
            </div>
          </div>
        </header>
<c:if test="${pageContext.request.userPrincipal.name == 'host'}">
<div class="content" style="max-width: 1265px;">
    <!-- Tab links -->
    <div class="tab">
        <button class="tablinks active" onclick="openTab(event, 'classic')">공지사항</button>
        <button class="tablinks" onclick="openTab(event, 'balloon')">이벤트</button>
    </div>
    <!-- Tab content -->
    <div id="classic" class="tabcontent" style="display: block; width:1265px;">
    <form action="${path}/user/writeNoricePro" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    <input type="hidden" name="notice_id" value = "${notice_id}">
	<!-- 아래 3줄 지우지 마세요 -->
	　
	<input type = "text" class = "form-control" name = "notice_subject" placeholder="공지사항 제목을 입력하세요" required>
	　
	<!-- 위에 3줄 지우지 마세요 -->
		<div class="inline-margin"></div>
        <div class="box-body">
	            <textarea id="editor1" name="notice_content" rows="10" cols="80">
	            	공지사항 내용을 적어주세요! (이미지 가로 최대 길이는 1250입니다.)
	            </textarea>
		</div>
	<div align="center" style="margin-top:10px;">
	    <input type="submit" class="btn" style="width:10%; height:5%; font-size:18px;" value="확인">&nbsp;&nbsp;<input type="reset" class="btn" style="width:10%; height:5%; font-size:18px;" value="취소">
    </div>
	</form>
    </div>
    

    <div id="balloon" class="tabcontent" style="width:1265px;">
   		 <form action = "${path}/user/wirteEventPro" method = "post">
		    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		    <input type="hidden" name="notice_id" value = "${notice_id}">
			　	<!-- 121행 지우지 마세요! -->
			<input type = "text" class = "form-control" name = "event_subject" placeholder="이벤트 제목을 입력하세요" required>
			　	<!-- 123행 지우지 마세요! -->
		        <div class="inline-margin"></div>
		        <div class="box-body">
			            <textarea id="editor2" name="event_content" rows="10" cols="80">
			            	이벤트 내용을 적어주세요! (이미지 가로 최대 길이는 1250입니다.)
			            </textarea>
				</div>
		        <div align="center" style="margin-top:10px;">
			    	<input type="submit" class="btn" style="width:10%; height:5%; font-size:18px;" value="확인">&nbsp;&nbsp;<input type="reset" class="btn" style="width:10%; height:5%; font-size:18px;" value="취소">
		    	</div>
    	</form>
    </div>

    <footer>
        <p><a href="${path}/user/main" target="_blank" style="color:#f4b124;">EZ FUND</a></p>
    </footer>
</div>
</c:if>
<c:if test="${pageContext.request.userPrincipal.name != 'host'}">
	<script type="text/javascript">
		alert("관리자만 접근할 수 있는 페이지 입니다.");
		window.history.go(-1);
	</script>
</c:if>
<%@ include file="../include/footer.jsp" %>

<!-- 에디더 스크립트 시작 -->
<script src="${project}assets/vendor_components/jquery/dist/jquery.min.js"></script>
<script src="${project}assets/vendor_components/popper/dist/popper.min.js"></script>
<script src="${project}assets/vendor_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${project}assets/vendor_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="${project}assets/vendor_components/fastclick/lib/fastclick.js"></script>
<script src="${project}js/template.js"></script>
<script src="${project}js/demo.js"></script>	
<script src="${project}assets/vendor_components/ckeditor/ckeditor.js"></script>
<script src="${project}assets/vendor_plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.js"></script>
<script src="${project}js/pages/editor.js"></script>
<script src="${project}js/common.js"></script>

<script type="text/javascript">
function openTab(evt, tabName) {
    var i, tabcontent, tablinks;

    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    document.getElementById(tabName).style.display = "block";
    evt.currentTarget.className += " active";
}
</script>

<!-- 에디터 스크립트 끝 -->
</body>
</html>
