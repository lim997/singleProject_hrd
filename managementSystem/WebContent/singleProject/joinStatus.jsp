<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입권한설정</title>
</head>
<body>
	<form action="joinStudent.jsp" name="statForm" method="post">
		<div>가입 유형을 선택하세요.</div>
		<input type="button" name="stat" value="U" onclick="loginU(this.form)" />
		<input type="button" name="stat" value="T" onclick="loginT(this.form)" />
		<input id="flg" name="statFlg" value="U" hidden>
	</form>
	<input type="button" onclick="back()" value="뒤로가기">
</body>
</html>
<script>
	function loginU(frm){
		if(confirm("학생 유형으로 가입하시겠습니까?")){
			document.getElementById('flg').value = "U";
			frm.submit();
			return;
	    } else {
	    	alert("취소 되었습니다.");
	    }
	}
	
	function loginT(frm){
		if(confirm("훈련기관 유형으로 가입하시겠습니까?")){
			document.getElementById('flg').value = "T";
			frm.action="joinTraining.jsp";
			frm.submit();
			return;
	    } else {
	    	alert("취소 되었습니다.");
	    }
	}
	function back(){
		history.back();
	}
</script>
