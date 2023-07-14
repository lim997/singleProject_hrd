<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 열람 및 수정</title>
</head>
<body>
	<%@ include file="mySqlDB.jsp"%>

	<div>수정 버튼을 누르면 JYR_TBL_USER // UPDATE</div>
	<div>본인이 입력한 정보에 대한 열람 및 수정 페이지</div>
	<div>STATUS에 따라 다른 input 값을 보여준다.</div>
	<div>학생 - U_ID, U_PWD,PWDCHECK, BIRTH, PHONE, EMAIL, ADDR, EDUCATION,EVENTYN</div>
	<div>학원 - U_ID, U_PWD,PWDCHECK, PHONE, FAX, EMAIL, ADDR,EVENTYN</div>
	
</body>
</html>