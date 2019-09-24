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
<%@ include file = "../include/top-header-non.jsp" %>

<header class="page-title pt-large pt-light pt-parallax pt-plax-lg-light">
          <div class="container">
            <div class="row">
              <h1 class="col-sm-6">1대1 문의</h1>
              <ol class="col-sm-6 text-right breadcrumb">
                <li><a href="#">1대1 문의</a></li>
                <li><a href="#">문의하기</a></li>
              </ol>
            </div>
          </div>
        </header>

<div class="content" style="max-width: 1265px;">
    <!-- Tab content -->
    <div id="classic" class="tabcontent" style="display: block; width:1265px;">
    <form action="${path}/user/writePro" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
   	<input type="hidden" name="num" value="${num}">
	<input type="hidden" name="ref" value="${ref}">
	<input type="hidden" name="ref_step" value="${ref_step}">
	<input type="hidden" name="ref_level" value="${ref_level}">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<input type="hidden" name="writer" value="${pageContext.request.userPrincipal.name}">
	<input type="hidden" name="username" value="${pageContext.request.userPrincipal.name}">
   <!-- 아래 3줄 지우지 마세요 -->
   　
   <input type = "text" class = "form-control" name = "notice_subject" placeholder="1대1문의 제목을 입력하세요" required>
   　
   <!-- 위에 3줄 지우지 마세요 -->
      <div class="inline-margin"></div>
        <div class="box-body">
               <textarea id="editor1" name="notice_content" rows="10" cols="80">
                  1대1 문의 내용을 작성해주세요 (이미지 가로 최대 길이는 1250입니다.)
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

<%@ include file="../include/footer.jsp" %>

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

</body>
</html>