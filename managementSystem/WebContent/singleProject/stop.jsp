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
			out.println("정지된 회원입니다. 매너를 지켜주세요.");
		%>
		<input type="button" name="main" value="홈페이지" onclick="goMain()" />
	</form>
</body>
</html>
