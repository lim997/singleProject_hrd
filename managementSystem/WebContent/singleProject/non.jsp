<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="backLogMain.js"></script>
</head>
<body>
	<form>
		<%
			out.println("정보가 없는 아이디입니다. 회원가입 하시겠습니까?");
		%>
		<input type="button" name="login" value="뒤로가기" onclick="back()" />
		<input type="button" name="join" value="회원가입" onclick="goJoin()" />
		<input type="button" name="main" value="홈페이지" onclick="goMain()" />
	</form>
</body>
</html>
