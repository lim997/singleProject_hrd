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
	
	<form action="tClassStuList.jsp" name="chan" method="post">
	
		<%
			request.setCharacterEncoding("UTF-8");
			String uId = request.getParameter("uId");
			String cNumber = request.getParameter("cNum");
			String cState = request.getParameter("cState");
			String stat = (String) session.getAttribute("status");

			Statement stmt1 = null;
			Statement stmt2 = null;
			ResultSet rs = null;
			try {
				stmt1 = conn.createStatement();
				String del = "DELETE FROM JYR_COURSE_LIST WHERE C_NUMBER = '"+cNumber+"' AND U_ID = '"+uId+"'";
				stmt1.executeUpdate(del);
				
				if(cState.equals("A")){
					stmt2 = conn.createStatement();
					String update = "UPDATE JYR_CLASS_LIST SET STU_CNT = STU_CNT - 1 WHERE C_NUMBER = '"+cNumber+"'";
					stmt2.executeUpdate(update);
				}
			} catch(SQLException e){
				out.println(e.getMessage());
			}
		%>
		<input name="cNum" value="<%= cNumber %>" hidden>
	</form>
</body>
</html>
<script>
	var form = document.chan;
	if(<%= stat.equals("U") %>){
		alert("해당 강의의 수강 신청이 취소되었습니다.");
		form.action = "uClassList.jsp";
	} else if(<%= stat.equals("T") %>){
		alert("해당 회원의 수강 신청이 취소되었습니다.");
		form.action = "tClassStuList.jsp";
	}
	form.submit();
</script>