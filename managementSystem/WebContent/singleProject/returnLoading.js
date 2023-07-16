function getReturn(){
	location.reload();
}

function loadback(){
	window.opener.getReturn();
	window.close();
}

function checking(str){
	window.opener.getReturn(document.checked.flg.value, str);
	window.close();
}