<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="mySqlDB.jsp"%>
	<% request.setCharacterEncoding("UTF-8"); %>
	<%
	Statement stmt1 = null;
	Statement stmt2 = null;
	try {
		String cNumber = request.getParameter("cNumValue");
		String cName = request.getParameter("cName");
		String cSday = request.getParameter("cSday");
		String cFday = request.getParameter("cFday");
		String cArea = request.getParameter("cArea");
		String cLimit = request.getParameter("cLimit");
		String pNo = request.getParameter("pNo");
		String cExpense = request.getParameter("cExpense");
	
		stmt1 = conn.createStatement();
		ResultSet rs = stmt1.executeQuery("SELECT * FROM JYR_CLASS_LIST WHERE C_NUMBER = '"+cNumber+"'");
		if(rs.next()) {
			String sql ="UPDATE JYR_CLASS_LIST SET C_NAME = '"+cName+"', C_SDAY = '"+cSday
						+"', C_Fday = '"+cFday+"', C_AREA = '"+cArea+"', C_LIMIT = '"+cLimit
						+"', P_NO = '"+pNo+"', C_EXPENSE = '"+cExpense
						+"' WHERE C_NUMBER = '"+cNumber+"'";
			
			stmt2 = conn.createStatement();
			stmt2.executeUpdate(sql);
		} 
	} catch(SQLException e){
		out.println(e.getMessage());
	}
	%>
</body>
</html>
<script>
 	alert("해당 강의의 정보가 수정되었습니다.");
	window.close();
	window.opener.getReturn();
</script>