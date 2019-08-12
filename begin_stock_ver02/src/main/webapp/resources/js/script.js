// ------ 필수 체크
var msg_id ="ID를 입력해주세요";
var msg_hp ="H.P를 입력해주세요"
var msg_pwd ="패스워드를 입력해주세요";
var msg_repwd = "패스워드확인을 입력해주세요";
var msg_pwdChk = "패스워드를 다시 확인해주세요";
var msg_name = "이름을 입력해주세요";
var msg_confirmId = "IDCheck 버튼을 클릭해서 중복확인을 해주세요";
var msg_confirmHp = "H.PCheck 버튼을 클릭해서 중복확인을 해주세요";
var msg_confirmTerms = "약관 동의에 체크해주세요"

function errorAlert(errorMsg) {
	alert(errorMsg);
	window.history.back();	
}

function mainFocus() {
	document.mainform.username.focus();
	return false;
}

function mainCheck() {
	if (!document.mainform.username.value) {
		alert(msg_id);
		document.mainform.username.focus();
		return false;
	}
	if (!document.mainform.password.value) {
		alert(msg_pwd);
		document.mainform.password.focus();
		return false;
	}
}

function inputFocus() {
	document.joinForm.username.focus();
	return false;
}

function inputCheck() {
	if(!document.joinForm.username.value) {
		alert(msg_id);
		document.joinForm.username.focus();
		return false;
	}
	if(!document.joinForm.password.value) {
		alert(msg_pwd);
		document.joinForm.password.focus();
		return false;
	}
	if(!document.joinForm.repassword.value) {
		alert(msg_repwd);
		document.joinForm.repassword.focus();
		return false;
	}
	if(document.joinForm.password.value != document.joinForm.repassword.value) {
		alert(msg_pwdChk);
		document.joinForm.repassword.value="";
		document.joinForm.repassword.focus();
		return false;
	}
	if(!document.joinForm.name.value) {
		alert(msg_name);
		document.joinForm.name.focus();
		return false;
	}
	if(document.joinForm.hiddenId.value == 0) {
		alert(msg_confirmId);
		document.joinForm.dupC.focus;
		return false;
	}
	if(document.joinForm.hiddenHp.value == 0) {
		alert(msg_confirmHp);
		document.joinform.dupC.focus;
		return false;
	}
	var chk1 = document.joinForm.basic_checkbox_1.checked;
	if(!chk1) {
		alert(msg_confirmTerms);
		return false;
	}
}
function confirmTerms() {
	var url =  "confirmTerms";
	window.open(url,"confirm","menubar=no, width=800, height=600");
}
function confirmId() {
	if(!document.joinForm.username.value) {
		alert(msg_id);
		document.joinForm.username.focus();
		return false;
	}
	var url = "confirmId?username=" + document.joinForm.username.value;
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
	window.open(url,"confirm", "menubar=no, width=500, height=200");
}

function confirmHpFocus() {
	document.confirmForm.hp.focus();
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
	if(document.confirmForm.checkAuth.value == 1){
			opener.document.joinForm.hiddenHp.value = "1";
			self.close();
	} else{
			alert("인증이 처리되지 않았습니다.");
	}
}

function check() {
	var authnum = document.confirmForm.auth.value;
	var hp = document.confirmForm.hp.value;
	var url = "auth?authnum=" + authnum + "&hp=" + hp;
	window.open(url,"auth", "menubar=no, width=500, height=200");
}

function closeTerms() {
	self.close();
}

function findInfo() {
	var url = "findInfo";
	window.open(url, "findInfo", "menubar=no, width=600, height=600");
}

function findId() {
	location.href="findId";
}

function findPwd() {
	location.href="findPwd";
}

function hisBack() {
	window.history.go(-1);
}

function modifyPwd() {
	var username = document.findPwd.username.value;
	var password = document.findPwdChkForm.password.value;
	
}