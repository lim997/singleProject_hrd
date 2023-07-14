<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>훈련 상세 정보</title>
</head>
<body>
	<%@ include file="mySqlDB.jsp"%>

	<div>CLASS_LIST 테이블의 훈련별 상세 정보 열람 가능</div>
	<div>로그인 없이도 열람 가능. 수강신청 버튼을 누르면 alert(로그인 후 이용이 가능합니다.)</div>
	<div>STATUS 권한이 S면 수강신청가능.</div>
	<div>권한이 S가 아니면 alert 수강신청 권한이 없습니다.</div>
</body>
</html>