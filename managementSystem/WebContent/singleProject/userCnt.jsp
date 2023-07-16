<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="returnLoading.js"></script>
</head>
<body>
	<%@ include file="mySqlDB.jsp"%>
	
	<form action="user.jsp" name="chan" method="post">
		<%
			request.setCharacterEncoding("UTF-8");
			String uId = request.getParameter("uId");
			Statement stmt = null;
	
			try {
				stmt = conn.createStatement();
				String update = "UPDATE JYR_TBL_USER SET LOGIN_CNT = '0' WHERE U_ID = '" + uId + "'";
				stmt.executeUpdate(update);
			%>
				<script>alert("해당 회원의 로그인 시도 횟수가 초기화되었습니다.");</script>
			<%} catch(SQLException e){
				out.println(e.getMessage());
			}
		%>
		<input id="flg" name="statFlg" value="<%= request.getParameter("stat") %>" hidden>
	</form>
</body>
</html>
<script>
	var form = document.chan;
	form.submit();
</script>