<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
//회원탈퇴 확인창 
function c_deleteConfirm(){
	var confirmfig = confirm("회원탈퇴를 하시면 정보가 모두 사라집니다. \n 정말로 탈퇴하시겠습니까?");
	
	if(confirmfig){ // "네" 선택시  삭제페이지로 이동 
		window.location="c_deletePro";
	}else{
		window.location="mypage";
	}
}

// 취소
function mypage(){
	window.location="mypage";
}


// HP 확인 
function confirmHp2(){        
	
	  //id값 미입력 후 중복확인 버튼클릭시 
	  if(!document.joinForm.hp.value){
		  alert("전화번호를 입력해주세요!");
	      document.joinForm.hp.focus();
	      return false;
	  }
	  
	  //get방식으로 id값 가져오기 
	  var url = "confirmHp?hp=" + document.joinForm.hp.value;
	  
	  /*
	   * window.open("파일명"(url),"윈도우명","창속성");
	   * url = "주소?속성=" + 속성값;   -> get 방식
	   */
	  window.open(url, "confirmHp", "menubar=no, width=500, height=500");
	   
	  // -> confirmId.do 서블릿 지정     
	}
	
	

//비밀번호 일치 확인	
function pwdChk(){
	if(document.joinForm.pwd.value == ""){
		alert("비밀번호를 입력해주세요!");
		document.joinForm.pwd.focus();
		return false;
	}
	
	if(document.joinForm.re_pwd.value == ""){
		alert("비밀번호를 재입력해주세요!");
		document.joinForm.re_pwd.focus();
		return false;
	}
	
	
	if(document.joinForm.pwd.value != document.joinForm.re_pwd.value){
		alert("비밀번호가 일치하지 않습니다.\n 다시확인해주세요!");
		document.joinForm.pwd.focus();
		return false;
	}
}
	

// 계좌 한도 
function updateALimit(limit){
	//alert(limit);
	document.getElementById("accountLimit").value = limit;
}	

 //주식한도
function updateSLimit(limit){
	//alert(limit);
	document.getElementById("stockLimit").value = limit;
} 
 
 
function parentGo(){
	account = document.getElementById("accountLimit").value;
	stock = document.getElementById("stockLimit").value;
	
	if(account =="" && stock ==""){
		alert("변경할 값이 없습니다.");
	}else{
		// 변경할 값이 있으면 
		var chk = confirm("주식 한도 :" + stock + "\n계좌 한도 :" + account + " 로 수정하겠습니까?");
		
		if(chk) {
			// 부모창에 값 넣기 
			document.getElementById("accountLimit2").value = account;
			document.getElementById("stockLimit2").value = stock;	
		}
	}
	
	
}
	
</script>

</head>
<body>
<%@ include file="../include/header.jsp"%>

	<c:if test="${loginCnt != 0 }">
        <form action="modifyPro" class="form-horizontal form-element col-12" name="joinForm" onsubmit="return pwdChk();">
        
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        
        <div class="box-header with-border">
			  <h3 class="box-title">${vo.name}님의 상세정보</h3>
		</div>
        
        
          <div class="form-group row">
            <label for="inputName" class="col-sm-2 control-label" style="padding-top:15px;">Name</label>

            <div class="col-sm-10">
              <input type="text" class="form-control" id="name" name="name" value="${vo.name}">
            </div>
          </div>
          
          <div class="form-group row">
            <label for="inputEmail" class="col-sm-2 control-label" style="padding-top:15px;">Password</label>

            <div class="col-sm-10">
              <input type="password" class="form-control" id="pwd" name="pwd" value="${currentPwd}">
            </div>
          </div>
          
          <div class="form-group row">
            <label for="inputEmail" class="col-sm-2 control-label" style="padding-top:15px;">Password 확인</label>

            <div class="col-sm-10">
              <input type="password" class="form-control" id="re_pwd" name="re_pwd" value="${currentPwd}">
            </div>
          </div>
          
          <div class="form-group row">
            <label for="inputPhone" class="col-sm-2 control-label" style="padding-top:15px;">Phone Number</label>

            <div class="col-sm-10">
              <input type="tel" class="form-control" id="hp" name="hp" value="${vo.hp}">
            </div>
          </div>
           
          <div class="form-group row">
            <div class="ml-auto col-sm-10">
            	<input type="button" class="btn btn-danger" onclick="confirmHp2();" value="HP 중복체크">
            	<input type="hidden" name="hiddenHp" value="0">
				<!-- <label for="basic_checkbox_1">이메일 중복체크</label> -->
            </div>
          </div>
            
            
           <hr> <!-- 한도 조정 -->
           
           <div class="box=body" style="margin-bottom:30px;">
           	 <div class="col-12"> 
           	
	           	<div class="ribbon-wrapper-reverse" style="border:1px solid white;">
	           	  <button type="button" class="ribbon ribbon-right bg-primary" data-toggle="modal" data-target="#modal-center">
	              		한도 설정 변경
	              </button>
					<!-- <div class="ribbon ribbon-right bg-primary">한도 설정 변경</div> -->
		           <div class="form-group row">
			            <label for="inputStock" class="col-sm-2 control-label" style="padding-top:15px;">주식 이체 한도 :</label>
			
			            <div class="col-sm-10">
			              <input type="text" class="form-control" id="stockLimit2" name="stockLimit2" value="${stock_limit}" readonly>
			            </div>
		          </div>
		          
        		 <div class="form-group row">
			            <label for="inputAccount" class="col-sm-2 control-label" style="padding-top:15px;">계좌 이체 한도 :</label>
			
			            <div class="col-sm-10">
			              <input type="text" class="form-control" id="accountLimit2" name="accountLimit2" value="${transfer_limit}" readonly>
			            </div>
		          </div>
				
				</div>
		   
            </div> 
           </div> 
             
          <!-- submit!!  -->   
          <div class="form-group row">
            <div class="ml-auto col-sm-10">
              <input type="submit" class="btn btn-yellow" value="회원정보 수정" style="margin-right:5px;">
              <input type="button" class="btn btn-success" value="취소" onclick="mypage();" style="margin-right:5px;">
              <input type="button" class="btn btn-red" value="회원 탈퇴" onclick="c_deleteConfirm();">
            </div>
          </div>
     			<!-- Modal -->
				<div class="modal center-modal fade" id="modal-center" tabindex="-1" style="display: none;" aria-hidden="true">
				  <div class="modal-dialog">
					<div class="modal-content">
					  <div class="modal-header">
						<h5 class="modal-title">한도 설정변경</h5>
						<button type="button" class="close" data-dismiss="modal">
						  <span aria-hidden="true">×</span>
						</button>
					  </div>
					  <div class="modal-body">
						<p>주식 한도 설정 변경</p>
						<button type="button" class="btn" value="50000000" onclick="updateSLimit(this.value);" style="color:black;">5000만원</button>
						<button type="button" class="btn" value="100000000" onclick="updateSLimit(this.value);" style="color:black;">1억</button>
						<button type="button" class="btn" value="1000000000" onclick="updateSLimit(this.value);" style="color:black;">10억</button>
						
						<p>계좌 이체 한도 변경</p>
						<button type="button" class="btn" value="100000" onclick="updateALimit(this.value);" style="color:black;">10만원</button>
						<button type="button" class="btn" value="500000" onclick="updateALimit(this.value);" style="color:black;">50만원</button>
						<button type="button" class="btn" value="1000000" onclick="updateALimit(this.value);" style="color:black;">100만원</button>
					  </div>
					  
					  <div class="modal-footer modal-footer-uniform">

						<!-- <input type="text" name="stockLimit" class="form-control" id="stockLimit" value="">원
						<input type="text" name="accountLimit" class="form-control" id="accountLimit" value="">원 -->
						
		          
					<!-- 찍어보자  -->
		           <div class="form-group row">
			            <label for="inputPhone" class="col-sm-4 control-label" style="padding-top:15px;">주식 이체 한도 :</label>
			
			            <div class="col-sm-6">
			            	<input type="text" name="stockLimit" class="form-control" id="stockLimit" value="">
			            </div>
			            
			            <label for="inputPhone" class="col-sm-4 control-label">계좌 이체 한도 :</label>
			
			            <div class="col-sm-6">
			              <input type="text" name="accountLimit" class="form-control" id="accountLimit" value="">
			            </div>
		          </div>
						
						<!-- <button type="button" class="btn btn-bold btn-pure btn-primary float-right" onclick="parentGo();">Save changes</button> -->
						<button type="button" class="btn btn-bold btn-pure btn-primary float-right" data-dismiss="modal" onclick="parentGo();">Save changes</button>

					  </div>
					</div>
				  </div>
				</div>
			  <!-- /.modal -->
          </form>  
	</c:if>
	<c:if test="${loginCnt == 0}">
		
		<script>
			alert("비밀번호가 일치하지 않습니다. ");	
			window.location="mypage";
		</script>
		
	</c:if>
</body>
</html>