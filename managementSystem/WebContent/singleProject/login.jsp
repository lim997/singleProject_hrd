<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
html,
body {
  padding: 0%;
  margin: 0%;
}


/* 1. tab 영역 css 설정 */
.tab-area {
  width: 500px;
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
}


/* 2. tab 메뉴 부분 디자인 */
.tab-area #student, #training, #admin {
  display: none;
}  

.tab-area label {
  margin-left: auto;
  margin-right: auto;
}
  
/* label에 마우스 올렸을 때 */
.tab-area label:hover {
  cursor: pointer; /*마우스 모양 변경*/
}
  
/* tab-area 안에 존재하는 input 태그가 체크되었을 때, 
체크된 input 태그 다음에 등장하는 label의 css 값 */
.tab-area input:checked + label {
  /* 해당 메뉴가 선택된 상태인지 아닌지를 사용자에게 알려줄 수 있음 */
  font-weight: bold;
}
  

/* 3. tab 내용 부분 디자인 */
.tab-content {
  width: 100%; /*부모 div width와 같은 width를 가진다.*/
  height: 80px;
  display: none; /*기본 값일땐 화면에 표시하지 않음. 체크 상태일 때, 화면에 표시되어야 함 */
  border-top: 2px solid #ccc;/*탭 메뉴와 내용구분선*/
}

/* input 태그가 체크 상태일떼, 이에 대응하는 content?를 display에 표시하도록 설정 */
#student:checked ~ #contentU,
#training:checked ~ #contentT,
#admin:checked ~ #contentA {
  display: grid;
}
</style>
</head>
<body>
	<%@ include file="mySqlDB.jsp"%>

	<form action="loginCheck.jsp" name="login" method="post">
		<div class="tab-area">
		    <input type="radio" name="stat" id="student" value="U" checked>
	        <label for="student">학생</label>
	        <input type="radio" name="stat" id="training" value="T">
	        <label for="training">훈련기관</label>
	        <input type="radio" name="stat" id="admin" value="A"/>
	        <label for="admin">관리자</label>
	        
	        
			<div id="contentU" class="tab-content">
		        <input type="text" maxlength="10" name="uIdU" placeholder="아이디"/>
				<input type="password" maxlength="20" name="uPwdU" placeholder="비밀번호"/>
	        </div>
	       	<div id="contentT" class="tab-content">
		        <input type="text" maxlength="10" name="uIdT" placeholder="아이디"/>
				<input type="password" maxlength="20" name="uPwdT" placeholder="비밀번호"/>
	        </div>
	        <div id="contentA" class="tab-content">
		        <input type="text" maxlength="10" name="uIdA" placeholder="아이디"/>
				<input type="password" maxlength="20" name="uPwdA" placeholder="비밀번호"/>
	        </div>
        </div>
		<div>
			<input type="button" onclick="userLogin(this.form)" value="로그인">
			<input type="button" onclick="back()" value="뒤로가기">
		</div>
	</form>
</body>
</html>
<script>
	function userLogin(frm) {
		frm.submit();
		return true;
	}

	function back() {
		history.back();
	}
</script>