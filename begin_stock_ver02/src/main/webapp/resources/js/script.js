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

function fchk() {
    var chk_obj = document.getElementsByName("themes");
    var chk_leng = chk_obj.length;
    var checked = 0;
    for (i=0; i < chk_leng; i++) {
        if (chk_obj[i].checked == true) { 
            checked += 1;
        }
    }
    if (checked < 2 ) {
        alert("항목을 2개 이상 선택해주세요");
        return false;
    } 
    
    if (checked > 4 ) {
        alert("항목을 4개 이하 선택해주세요");
        return false;
    } 
} 

function transferMoney(){
	var withdraw = document.transfer.withdraw.value; //출금계좌
	var possible_price = document.transfer.possible_price.value; //이체가능금액
	var account_pwd = document.transfer.account_pwd.value;	//출금 계좌 비번
	var transfer_price = document.transfer.transfer_price.value; //이체 금액 
	var deposit_account = document.transfer.deposit_account.value; //입금 계좌 번호
	var transferMessage = document.transfer.transferMessage.value; //입금 계좌 표시
	var withdrawMessage = document.transfer.withdrawMessage.value; //출금 계좌 표시
	var sum = (possible_price)-(transfer_price);
	
	var reg1 =/^[0-9]{0,9}$/;
	var reg2 =/^[가-힣]{0,8}$/;
	
	var result1 = reg1.test(account_pwd);
	var result2 = reg1.test(transfer_price);
	var result3 = reg1.test(deposit_account);
	var result4 = reg2.test(transferMessage);
	var result5 = reg2.test(withdrawMessage);
	
	if(account_pwd == ""){
		alert("비밀번호를 입력해주세요");
	}else if(transfer_price == ""){
	    alert("이체 금액을 입력해주세요");
	}else if(deposit_account == ""){
		alert("입금 계좌 번호를 입력하세요");
	}else{
		if(!result1){
			alert("계좌 비밀번호는 숫자입니다");
			account_pwd = "";
			document.transfer.account_pwd.focus();
			return false;
		}
		if(!result2){
			alert("이체 금액이 잘못되었습니다.");
			transfer_price = "";
			document.transfer.transfer_price.focus();
			return false;
		}
		if(!result3){
			alert("입금 계좌가 잘못되었습니다.");
			deposit_account = "";
			document.transfer.deposit_account.focus();
			return false;
		}
		if(!result4){
			alert("입금 계좌 표시가 잘못되었습니다");
			transferMessage = "";
			document.transfer.transferMessage.focus();
			return false;
		}
		if(!result5){
			alert("출금 계좌 표시가 잘못되었습니다.");
			withdrawMessage = "";
			document.transfer.withdrawMessage.focus();
			return false;
		}
		
		if(document.transfer.accountChk.value==0){
			alert("비밀번호를 확인해주세요.");
			return false;
		}
		
		var url = "transferChk?transfer_price=" + transfer_price + "&deposit_account=" + deposit_account + "&withdraw=" + withdraw + "&transferMessage=" + transferMessage + "&withdrawMessage=" + withdrawMessage +"&sum=" + sum;
		window.open(url,"이체 정보 확인","menubar=no, width=500, height=300");
	}
}

function searchAccount(){
	var withdraw = document.transfer.withdraw.value; //출금 계좌 번호
	var account_pwd = document.transfer.account_pwd.value;	//출금 계좌 비번
	
	var url ="accountSearch?withdraw=" + withdraw +"&account_pwd=" + account_pwd;
	window.open(url,"accountSearch","menubar=no , width=500, height=250");
}
//테마 선택 제한
function checkChooseThemes(frm){
	var sum = 0;
	var count = frm.themes.length;
	for(var i=0; i < count; i++ ){
       if(frm.themes[i].checked == true ){
	    sum += 1;
		}
	} 
	alert("선택되어진 체크박스의 갯수는 " + sum + "개입니다." );
	return false;
}

function returnNotice() {
	window.history.go(-1);
}