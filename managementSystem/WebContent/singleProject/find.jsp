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
	<% request.setCharacterEncoding("UTF-8"); %>
	<form>
		<%
			out.println("아이디와 또는 비밀번호를 잘못 입력하셨습니다. 입력하신 내용을 다시 확인해주세요.");
		%>
		<input type="button" name="login" value="뒤로가기" onclick="back()" />
		<input type="button" name="main" value="홈페이지" onclick="goMain()" />
	</form>
</body>
</html>