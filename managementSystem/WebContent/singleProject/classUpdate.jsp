<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학원별 훈련 목록 관리</title>
</head>
<body>
	<%@ include file="mySqlDB.jsp"%>

	<div>학원만 접근 가능</div>
	<div>classUpdate.jsp 파일과 코드가 중복된다면 파일을 합칠 것.</div>
	<div>본인 학원의 훈련 목록을 출력하여 관리(수정)한다.</div>
	<div>
		JYR_TBL_USER 테이블의 STATUS가 T일 때 U_ID를 받아오고,
		JYR_CLASS_LIST 테이블의 U_ID와 일치하는 목록을 받아온다. 
	</div>
	<div>수강학생 관리 및 수정</div>
</body>
</html>