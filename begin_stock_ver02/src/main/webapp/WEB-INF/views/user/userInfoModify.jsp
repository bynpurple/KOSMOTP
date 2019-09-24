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

</script>


</head>
<body>
<%@ include file="../include/header.jsp"%>

	<c:if test="${loginCnt != 0 }">
        <form action="modifyPro" class="form-horizontal form-element col-12" name="joinForm">
        
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        
        <div class="box-header with-border">
			  <h3 class="box-title">${vo.name}님의 상세정보</h3>
		</div>
        
        
          <div class="form-group row">
            <label for="inputName" class="col-sm-2 control-label" style="padding-top:15px;">Name</label>

            <div class="col-sm-10">
              <input type="text" class="form-control" id="name" name="name" placeholder="" value="${vo.name}">
            </div>
          </div>
          
          <div class="form-group row">
            <label for="inputEmail" class="col-sm-2 control-label" style="padding-top:15px;">Password</label>

            <div class="col-sm-10">
              <input type="password" class="form-control" id="pwd" name="pwd" placeholder="" value="${currentPwd}">
            </div>
          </div>
          
          <div class="form-group row">
            <label for="inputEmail" class="col-sm-2 control-label" style="padding-top:15px;">Password 확인</label>

            <div class="col-sm-10">
              <input type="password" class="form-control" id="re_pwd" placeholder="" value="${currentPwd}">
            </div>
          </div>
          
          <div class="form-group row">
            <label for="inputPhone" class="col-sm-2 control-label" style="padding-top:15px;">Phone Number</label>

            <div class="col-sm-10">
              <input type="tel" class="form-control" id="hp" name="hp" placeholder="" value="${vo.hp}">
            </div>
          </div>
           
            <div class="form-group row">
              <div class="ml-auto col-sm-10">
              	<input type="button" class="btn btn-danger" onclick="confirmHp2();" value="HP 중복체크">
              	<input type="hidden" name="hiddenHp" value="0">
						<!-- <label for="basic_checkbox_1">이메일 중복체크</label> -->
              </div>
            </div>
            
            <div class="form-group row">
              <div class="ml-auto col-sm-10">
                <input type="submit" class="btn btn-yellow" value="회원정보 수정">
                <input type="button" class="btn btn-success" value="취소" onclick="mypage();">
                <input type="button" class="btn btn-red" value="회원 탈퇴" onclick="c_deleteConfirm();">
              </div>
              
            </div>
            
            
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