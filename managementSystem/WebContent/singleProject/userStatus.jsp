<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입권한설정</title>
</head>
<body>
	<form action="user.jsp" name="statForm" method="post">
		<div>관리할 회원 유형을 선택하세요.</div>
		<input type="button" name="stat" value="U" onclick="selectU(this.form)" />
		<input type="button" name="stat" value="T" onclick="selectT(this.form)" />
		<input id="flg" name="statFlg" value="U" hidden>
	</form>
	<input type="button" onclick="back()" value="뒤로가기">
</body>
</html>
<script>
	function selectU(frm){
		document.getElementById('flg').value = "U";
		frm.submit();
		return;	    
	}
	
	function selectT(frm){
		document.getElementById('flg').value = "T";
		frm.submit();
		return;
	}
	function back(){
		location.href="main.jsp";
	}
</script>
