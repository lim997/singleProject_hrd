<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
	<%@ include file="mySqlDB.jsp"%>
	<form action="main.jsp" name="del" method="post">
		<%
			String uId = (String) session.getAttribute("u_id");
			String stat = (String) session.getAttribute("status");
			Statement stmt1 = null;
			Statement stmt2 = null;
			ResultSet rs = null;
			try {
				stmt1 = conn.createStatement();
				rs = stmt1.executeQuery("SELECT * FROM JYR_TBL_USER WHERE U_ID = '"+uId+"' AND STATUS = '"+stat+"'");
				if(rs.next()) {
					stmt2 = conn.createStatement();
					String sql = "DELETE FROM JYR_TBL_USER WHERE U_ID = '"+uId+"' AND STATUS = '"+stat+"'";
					stmt2.executeUpdate(sql);
				}
				if(request.isRequestedSessionIdValid()){
					session.invalidate();
				} 
			} catch(SQLException e) {
				out.println(e.getMessage());
			} 
		%>
	</form>
</body>
</html>
<script>
	alert("영구적으로 탈퇴 되었습니다.");
	var form = document.del;
	form.submit();
</script>