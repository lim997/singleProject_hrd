<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="code.jquery.com_jquery-3.7.0.min.js"></script>
</head>
<body>
	<%@ include file="mySqlDB.jsp"%>
	
	<form action="user.jsp" name="chan" method="post">
		<%
			request.setCharacterEncoding("UTF-8");
			String uId = request.getParameter("uId");
			String kind = request.getParameter("kind");
			String str = request.getParameter("str");
			Statement stmt = null;
	
			try {
				stmt = conn.createStatement();
				String update = "UPDATE JYR_TBL_USER SET "+ str +" = '" + kind + "' WHERE U_ID = '" + uId + "'";
				stmt.executeUpdate(update);
				String prin = "";
				if(str.equals("EVENTYN") && kind.equals("Y")){ %>
					<script>alert("해당 회원의 이벤트 수신이 허용되었습니다.");</script>
				<% } else if(str.equals("EVENTYN") && kind.equals("N")){ %>
					<script>alert("해당 회원의 이벤트 수신이 해제되었습니다.");</script>
				<% } else if(str.equals("BANYN") && kind.equals("Y")){ %>
					<script>alert("해당 회원이 정지되었습니다.");</script>
				<% } else if(str.equals("BANYN") && kind.equals("N")){ %>
					<script>alert("해당 회원의 정지 상태가 해제되었습니다.");</script>
				<% }
			} catch(SQLException e) {
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