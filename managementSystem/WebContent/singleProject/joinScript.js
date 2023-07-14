var idBtnFlg = false; // 아이디 중복 확인
var idFlg = false; // DB 검색 결과, 아이디의 중복 여부를 확인(중복된 아이디가 있으면 false)
var idfixed = "";

var phBtnFlg = false; // 핸드폰 중복 확인
var phFlg = false;
var phfixed = "";

var emBtnFlg = false; // 이메일 중복 확인
var emFlg = false;
var emfixed = "";

function userJoin(){
	var form = document.userForm;
	var prin = "아이디";
	if(form.stat.value == "T"){
		prin = "사업자 번호";
	}
	
	if(form.uId.value == "" || form.uId.value == undefined){
		alert(prin+"를 입력해주세요.");
		form.uId.focus();
		return;
	}
		
	//중복을 확인한 id와 다른 id를 입력해 회원가입을 시도할 수 있기 때문에 다시 중복을 확인해야 한다.
	if(!idBtnFlg ||((idfixed != form.uId.value) && (idFlg == true))){
		alert(prin+" 중복을 확인해주세요.");
		idBtnFlg = false;
		form.uId.focus();
		return;
	}

	if(form.uPwd.value == "" || form.uPwd.value == undefined){
		alert("비밀번호를 입력해주세요.");
		form.uPwd.focus();
		return;
	}
		
	if(form.uPwd.value != form.pwdCheck.value){
		alert("비밀번호를 확인해주세요.");
		form.pwdCheck.focus();
		return;
	}
	
	if(form.uName.value == "" || form.uName.value == undefined){
		alert("이름을 입력해주세요.");
		form.uName.focus();
		return;
	}
	
	var regex = /^[0-9]+$/;
	
	if(form.phone.value == "" || form.phone.value == undefined){
		alert("연락처를 입력해주세요.");
		form.phone.focus();
		return;
	}
	if(!regex.test(form.phone.value)){
		alert("연락처는 숫자만 입력해주세요.");
		form.phone.focus();
		return;
	}
					
	if(!phBtnFlg ||((phfixed != form.phone.value) && (phFlg == true))){
		alert("연락처 중복을 확인해주세요.");
		phBtnFlg = false;
		form.phone.focus();
		return;
	}
	
	if((form.stat.value == "T")){
		if((form.fax.value == "") || (form.fax.value == undefined)){
			alert("팩스 번호를 입력해주세요.");
			form.fax.focus();
			return;
		}
		
		if(!regex.test(form.fax.value)){
			alert("팩트 번호는 숫자만 입력해주세요.");
			form.fax.focus();
			return;
		}
	}
	
	if(form.uEmail.value == "" || form.uEmail.value == undefined){
		alert("이메일를 입력해주세요.");
		form.uEmail.focus();
		return;
	}
	
	if(!emBtnFlg ||((emfixed != form.uEmail.value) && (emFlg == true))){
		alert("이메일 중복을 확인해주세요.");
		emBtnFlg = false;
		form.uEmail.focus();
		return;
	}
	
	if(form.stat.value == "U"){
		if((form.birth.value == "") || (form.birth.value == undefined)){
			alert("생년월일을 선택해주세요.");
			return;
		} else{
			var birth = document.querySelector('#birth').value;
			var age = birth.split("-");
			var now = new Date();
			var year =  now.getFullYear() - parseInt(age[0],10);
    		var month = (now.getMonth()+1) - parseInt(age[1],10);
    		var day = parseInt(age[2],10);
    		
    		if(month < 0 || (month == 0 && now.getDate() <= day)){
        		year--;
    		}
    		
			if(year < 14){
				alert("만 14세 이상만 가입이 가능합니다.");
				return;
			}
		}
	}
	
	if(form.addr.value == "" || form.addr.value == undefined){
		alert("주소를 입력해주세요.");
		form.addr.focus();
		return;
	}
	
	if(($('input[name=serviceYN]:checked').val()) == "N"){
		alert("정보 이용에 동의해야만 회원 가입이 가능합니다.");
		return;
	}
	form.submit();
}
	
function idCheck(){
	var form = document.userForm;
	var regex;
	if(form.stat.value == "U"){
		prin = "아이디";
		regex = /^[A-Za-z0-9]+$/;
	} else if(form.stat.value == "T") {
		prin = "사업자 번호";
		regex = /^[0-9]+$/;
	}
	
	if(form.uId.value =="" || form.uId.value == undefined){
		alert(prin+"를 입력해주세요.")
		form.uId.focus();
	} else if(!regex.test(form.uId.value)){
		alert(prin+" 입력 조건을 확인해주세요.");
	} else if((form.stat.value == "T") && (form.uId.value.length != 10)){
		alert("10자리의 "+prin+"를 입력해주세요.");
	} else{
		window.open("check.jsp?kind="+form.uId.value+"&stat="+form.stat.value+"&str=U_ID", "iCheck", "width=500, height=300");
	}
}

function emCheck(){
	var form = document.userForm;
	if(form.uEmail.value == "" || form.uEmail.value == undefined){
		alert("이메일 주소를 입력해주세요.");
		form.uEmail.focus();
	} else{
		window.open("check.jsp?kind="+form.uEmail.value+"&stat="+form.stat.value+"&str=EMAIL", "eCheck", "width=500, height=300");
	}
}

function phCheck(){
	var form = document.userForm;
	if(form.phone.value == "" || form.phone.value == undefined){
		alert("연락처를 입력해주세요.");
		form.phone.focus();
	} else{
		window.open("check.jsp?kind="+form.phone.value+"&stat="+form.stat.value+"&str=PHONE", "eCheck", "width=500, height=300");
	}
}

function getReturn(val, str){
	var form = document.userForm;
		
	if(val == "Y"){
		if(str == "U_ID"){
			idFlg = true;
			idBtnFlg = true;
			idfixed = form.uId.value;
		} else if(str == "EMAIL"){
			emFlg = true;
			emBtnFlg = true;
			emfixed = form.uEmail.value;
		} else if(str == "PHONE"){
			phFlg = true;
			phBtnFlg = true;
			phfixed = form.phone.value;
		}
	}
}

function back(){
	if(confirm("회원 가입을 취소하시겠습니까?")){
		history.go(-2);
		return;
    } else {
    	alert("취소 되었습니다.");
    }
}

