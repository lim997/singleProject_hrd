<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
	<%
		if(request.isRequestedSessionIdValid()){
			session.invalidate();
		} 
	%>
</body>
</html>
<script>
	alert("로그아웃되셨습니다.");
	window.close();
	window.opener.getReturn();
</script>