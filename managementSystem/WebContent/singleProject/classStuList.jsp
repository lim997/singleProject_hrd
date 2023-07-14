<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강학생 리스트</title>
</head>
<body>
	<%@ include file="mySqlDB.jsp"%>

	<div>훈련기관만 접근 가능</div>
	<div>훈련 별 수강학생 리스트</div>
	<div>받아온 C_NUMBER(훈련코드)가 일치하는 JYR_COURSE_LIST의 학생 목록 출력</div>
	<div>보류 상태인 학생은 승인/거절 버튼이 나타난다.</div>
	<div>정원을 넘기지 않는다면 승인 상태로 변경된다.</div>
	<div>수강학생을 제적할 수 있다. 해당 학생을 재적하시겠습니까? 정원 -1</div>
</body>
</html>