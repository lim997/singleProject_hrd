<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 삭제</title>
</head>
<body>
	<%@ include file="mySqlDB.jsp"%>
	<form action="user.jsp" name="del" method="post">
		<%
			String uId = request.getParameter("uId");
			String stat = request.getParameter("stat");
			Statement stmt1 = null;
			Statement stmt2 = null;
			ResultSet rs = null;
			try {
				stmt1 = conn.createStatement();
				rs = stmt1.executeQuery("SELECT * FROM JYR_TBL_USER WHERE U_ID = '"+uId+"' AND STATUS = '"+stat+"'");
				if(rs.next()) {
					if("Y".equals(rs.getString("BANYN"))){
						stmt2 = conn.createStatement();
						String sql = "DELETE FROM JYR_TBL_USER WHERE U_ID = '"+uId+"' AND STATUS = '"+stat+"'";
						stmt2.executeUpdate(sql);
				%>
						<script>alert("해당 회원의 정보가 삭제되었습니다.");</script>
				<% } else { %>
						<script>alert("정지된 회원의 정보만 삭제할 수 있습니다.");</script>
				<% } %>
					<input id="flg" name="statFlg" value="<%= rs.getString("STATUS") %>" hidden>
				<%
				} else {
				%>
					<script>alert("해당 회원은 존재하지 않습니다.");</script>
			<% }			
			} catch(SQLException e) {
				out.println(e.getMessage());
			} 
		%>
	</form>
</body>
</html>
<script>
	var form = document.del;
	form.submit();
</script>