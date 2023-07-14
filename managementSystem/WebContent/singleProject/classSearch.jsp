<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>훈련 목록</title>
</head>
<body>
	<%@ include file="mySqlDB.jsp"%>

	<div>CLASS_LIST 테이블의 훈련기관명(U_NAME), 훈련명(C_NAME), 훈련지역(C_AREA), 훈련분야(C_KIND) 출력</div>
	<div>모든 사람들이 전체 훈련 목록을 열람할 수 있는 페이지</div>
	<div>한 페이지당 10개의 목록 출력</div>
	<div>훈련기관/훈련명 검색하면 해당 데이터를 페이지에 출력한다.</div>
	<div>옵션 셀렉트를 이용하여 각각의 분야에 맞는 페이지를 출력한다.</div>
</body>
</html>