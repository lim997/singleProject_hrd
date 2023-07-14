<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="joinScript.js"></script>
<script src="../js/code.jquery.com_jquery-3.7.0.min.js"></script>
</head>
<body>
	<%
		String stat = request.getParameter("statFlg");
	%>
	
	<div>훈련기관 회원가입</div>
	<form action="joinInsert.jsp" name="userForm" method="post">
		<fieldset>
			<legend>사용자 정보</legend>
				<input name="stat" value="<%= stat %>" hidden>
				<ul>
		            <li>
		            	<label class="li_label" for="uId">사업자등록번호</label>
		            	<input class="txt_input" type="text" maxlength="10" id="uId" name="uId" placeholder="'-'을 제외한 10자리 숫자를 입력해주세요." required autofocus>
		            	<input type="button" onclick="idCheck();" value="중복체크"> 
		            </li>
		            <li>
		            	<label class="li_label" for="uPwd">비밀번호</label>
		            	<input class="txt_input" type="password" maxlength="20" id="uPwd" name="uPwd" placeholder="20자 이하로 입력해주세요." required> 
		            </li>        
		            <li>
		            	<label class="li_label" for="pwdCheck">비밀번호 확인</label>
		            	<input class="txt_input" type="password" maxlength="20" id="pwdCheck" name="pwdCheck" required> 
		            </li>
		            <li>
		            	<label class="li_label" for="uName">훈련기관명</label>
		            	<input class="txt_input" type="text" maxlength="20" id="uName" name="uName" required> 
		            </li>
		            <li>
		            	<label class="li_label" for="phone">전화번호</label>
		            	<input class="txt_input" type="text" maxlength="11" id="phone" name="phone" placeholder="'-'을 제외한 숫자를 입력해주세요." required>
		            	<input type="button" onclick="phCheck();" value="전화번호 중복체크">  
		            </li>
		            <li>
		            	<label class="li_label" for="fax">팩스번호</label>
		            	<input class="txt_input" type="text" maxlength="11" id="fax" name="fax" placeholder="'-'을 제외한 숫자를 입력해주세요." required> 
		            </li>
		            <li>
              			<label class="li_label" for="uEmail">이메일</label>
              			<input class="txt_input" type="email" maxlength="30" id="uEmail" name="uEmail"required>
              			<input type="button" onclick="emCheck();" value="이메일 중복체크">  
            		</li>
		            <li>
		            	<label class="li_label" for="addr">주소</label>
		            	<input class="txt_input" type="text" id="addr" name="addr" required> 
		            </li>
		            <li>
						<input type="radio" id="eventY" name="eventYN" value="Y">
						<label for="eventY">이벤트 수신 동의</label>
						<input type="radio" id="eventN" name="eventYN" value="N" checked>
						<label for="eventN">이벤트 수신 동의 안 함</label>
		            </li>
				</ul>
			</fieldset>
			<fieldset>
				<legend>정보 이용 약관(필수)</legend>
				<input type="radio" id="serviceY" name="serviceYN" value="Y">
				<label for="serviceY">정보 이용 동의</label>
				<input type="radio" id="serviceN" name="serviceYN" value="N" checked>
				<label for="serviceN">정보 이용 동의 안 함</label>
			</fieldset>
			<div id="buttons">
				<input type="button" onclick="userJoin()" value="회원가입">
				<input type="button" onclick="back()" value="회원가입취소">
			</div>
	</form>
</body>
</html>
