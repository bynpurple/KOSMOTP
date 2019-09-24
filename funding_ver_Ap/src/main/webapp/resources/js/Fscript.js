var msg_pwdChk = "입력하신 비밀번호가 다릅니다. \n다시 입력해주세요";
var msg_cocfirmId = "ID CHECK 버튼을 클릭해서 중복확인을 해주세요";
var msg_confirmHp = "HP CHECK 버튼을 클릭해서 중복확인을 해주세요";
var msg_id = "ID를 입력 후 진행해주세요";
var msg_hp = "H.P를 입력 후 진행해주세요";

function inputCheck() {
	if(document.joinForm.password.value != document.joinForm.repassword.value) {
		alert(msg_pwdChk);
		document.joinForm.repassword.value="";
		document.joinForm.repassword.focus();
		return false;
	}
	
	if(document.joinForm.hiddenId.value == 0) {
		alert(msg_confirmId);
		document.joinForm.dupC.focus;
		return false;
	}
	
	if(document.joinForm.hiddenHp.value == 0) {
		alert(msg_confirmHp);
		document.joinForm.dupC.focus;
		return false;
	}
}

function confirmId() {
	if(!document.joinForm.username.value) {
		alert(msg_id);
		 document.joinForm.username.focus();
		 return false;
	}
	var url = "confirmId?username="+document.joinForm.username.value;
	window.open(url,"confirm", "menubar=no, width=350, height=200");
}

function confirmIdFocus() {
	document.confirmForm.username.focus();
	return false;
}

function confirmIdCheck() {
	if(!document.confirmForm.username.value) {
		alert(msg_id);
		document.confirmForm.username.focus();
		return false;
	}
}

function setId(username) {
	opener.document.joinForm.username.value = username;
	opener.document.joinForm.hiddenId.value = "1";
	self.close();
}

function confirmHp() {
	if(!document.joinForm.hp.value) {
		alert(msg_hp);
		document.joinForm.hp.focus();
		return false;
	}
	var url = "confirmHp?hp=" + document.joinForm.hp.value;
	window.open(url,"confirm", "menubar = no, width=500, height=200");
}

function confirmHpFocus() {
	document.confirmForm.hp.fucus();
	return false;
}

function confirmHpCheck() {
	if(!document.confirmForm.hp.value) {
		alert(msg_hp);
		document.confirmForm.hp.focus();
		return false;
	}
}

function setHp(hp) {
	opener.document.joinForm.hp.value = hp;
	if(document.confirmForm.checkAuth.value == 1) {
		opener.document.joinForm.hiddenHp.value = "1";
		self.close();
	} else {
		alert("인증이 처리되지 않았습니다. \n다시 시도해주세요");
	}
}

function check() {
	var authnum = document.confirmForm.auth.value;
	var hp = document.confirmForm.hp.value;
	var url = "auth?authnum=" + authnum + "&hp=" + hp;
	window.open(url, "auth", "menuvar=no, width=500, height=200");
}

function checkId() {
	var authnum = document.idHpChk.auth.value;
	var hp = document.idHpChk.hp.value;
	var url = "auth2?authnum=" + authnum + "&hp=" + hp;
	window.open(url,"auth2", "menubar=no, width=500, height=200");
}

function showId() {
	if(document.idHpChk.checkAuth.value == 1) {
		var hp = document.idHpChk.hp.value;
		location.href = "findId?hp=" + hp;
	} else {
		alert("인증이 처리되지 않았습니다.\n인증 처리 후 진행해 주세요");
	}
}

function findInfo() {
	var url = "findInfo";
	window.open(url, "findInfo", "menubar=no, width=600, height=400");
}

function findId() {
	location.href = "findId";
}

function findPwd() {
	location.href = "findPwd";
}

function hisBack() {
	window.history.go(-1);
}

function modifyPwd() {
	if(!document.findPwdChkForm.password.value) {
		alert("변경할 패스워드가 입력되지 않았습니다. \n변경할 패스워드를 입력해주세요");
		document.findPwdChkForm.password.focus();
		return false;
	} else {
		var password = document.findPwdChkForm.password.value;
		var hp = document.findPwdChkForm.hp.value;
		window.href = "modifyPwd?password="+password+"&hp="+hp;
	}
}

function showId() {
	if(document.idHpChk.checkAuth.value == 1) {
		var hp = document.idHpChk.hp.value;
		location.href = "findIdChk?hp=" + hp;
	} else {
		alert("인증이 처리되지 않았습니다. \n인증 처리 후 진행해 주세요");
	}
}

function checkPwd() {
	var authnum = document.pwdChkForm.auth.value;
	var hp = document.pwdChkForm.hp.value;
	var url = "auth3?authnum="+authnum+"&hp="+hp;
	window.open(url,"auth3", "menubar=no, width=500, height=200");
}

function showPwd() {
	if(document.pwdChkForm.checkAuth.value == 1) {
		var hp = document.pwdChkForm.hp.value;
		location.href = "findPwdChk?hp="+hp;
	} else {
		alert("인증이 처리되지 않았습니다. \n인증 처리 후 진행해 주세요");
	}
}

function closeTerms() {
	self.close();
}

function valModifyChk(){
	   var gp = document.modifyEditor.goalPrice.value;
	   var cv = document.modifyEditor.corpValTest.value;
	   
	   if(gp>=1000000000){
	      alert('목표 금액은 10억 미만입니다');
	      document.modifyEditor.goalPrice.focus();
	      return false;
	   }
	   
	   if(cv>=1000000000){
	      alert("기업 가치 금액을 확인 해주세요");
	      document.modifyEditor.corpValTest.focus();
	      return false;
	   }
	   return true;
	}

function valChk() {
   var goalPrice = document.editor.goalPrice.value;
   var corpValTest = document.editor.corpValTest.value;
   
   if(goalPrice>=1000000000){
      alert('목표 금액은 10억 미만입니다');
      document.editor.goalPrice.focus();
      return false;
   }
   
   if(corpValTest>=1000000000){
      alert("기업 가치 금액을 확인 해주세요");
      document.editor.corpValTest.focus();
      return false;
   }
   return true;
}
