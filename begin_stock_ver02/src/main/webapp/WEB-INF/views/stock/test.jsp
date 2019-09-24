<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${project}js/request.js"></script>
  <!-- 검색 ajax -->
  <script type="text/javascript">
	var checkFirst = true;
	var loopSendKeyword = false;
	var lastKeyword = null;
	
	function findCodeNCom(){
		if(checkFirst == true){
			loopSendKeyword = true;
			setTimeout(searchKeyword(), 500);
		}
		function searchKeyword(){
			if(loopSendKeyword == false) return false;
			var keyword = document.search.keyword.value;
			
			if(keyword == null){
				hide("result");
				lastKeyword = "";
			}else if(keyword != lastKeyword){
				lastKeyword= keyword;
				var params = "keyword=" + keyword;
				
				sendRequest(search_callback,"searchCode","GET",params);
			}
			setTimeout(searchKeyword(),500);
		}
		function search_callback(){
			var searchList = document.getElementById("searchList");
			
			if(httpRequest.readyState == 4){
				if(httpRequest.status == 200){
					
					searchList.innerHTML = "검색 결과가 없습니다";
					
					var codes= "";
					var data = httpRequest.responseText;
					var datalist = data.split("|");
					var count = datalist[0];
					
					if(count >0){
						var codelist = datalist[1].split(",");
						for(var i=0;i<count;i++){
							codes += codelist[i];
						}
						show("result");
						searchList.innerHTML = codes;
					}else{
						hide("result");
					}
				}else{
					searchList.innerHTML = "에러발생";
				}
			}else{
				searchList.innerHTML = "상태" + httpRequest.readyState;
			}
		}
	}
	
	//출력 div를 show
	function show(str){
		var element = document.getElementById(str);
		if(element){
			element.style.display="";
		}
	}
	//출력 div를 hide
	function hide(str){
		var element = document.getElementById(str);
		if(element){
			element.style.display= "none;"
		}
	}
  </script>   
</head>
<body>
<form name="search"> <!-- style="display: none;" --> 
	<input type="text" placeholder="Search &amp; enter" name="keyword" onkeyup="findCodeNCom();">
</form>

<table >
	<tr id ="result">
		<td id ="searchList"></td>
	</tr>
</table>		
</body>
</html>