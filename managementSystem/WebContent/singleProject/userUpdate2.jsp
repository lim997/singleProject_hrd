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
		String stat = request.getParameter("stat");
		String uId = request.getParameter("uIdValue");
		String uPwd = request.getParameter("uPwd");
		String uName = request.getParameter("uName");
		String phone = request.getParameter("phone");
		String uEmail = request.getParameter("uEmail");
		String addr = request.getParameter("addr");
		String evnt = request.getParameter("eventYN");
			
		stmt1 = conn.createStatement();
		ResultSet rs = stmt1.executeQuery("SELECT * FROM JYR_TBL_USER WHERE U_ID = '"+uId+"' AND STATUS = '"+stat+"'");
		if(rs.next()) {
			String sql="";
			if(stat.equals("U")){
				String education = request.getParameter("education");
				sql = "UPDATE JYR_TBL_USER SET U_PWD = '"+uPwd+"', U_NAME = '"+uName
						+"', PHONE = '"+phone+"', EMAIL = '"+uEmail+"', ADDR = '"+addr
						+"', EVENTYN = '"+evnt+"', EDUCATION = '"+education;
			} else if(stat.equals("T")){
				String fax = request.getParameter("fax");
				sql = "UPDATE JYR_TBL_USER SET U_PWD = '"+uPwd+"', U_NAME = '"+uName
						+"', PHONE = '"+phone+"', EMAIL = '"+uEmail+"', ADDR = '"+addr
						+"', EVENTYN = '"+evnt+"', FAX = '"+fax;
			}
			
			if(((String) session.getAttribute("status")).equals("A")){
				sql += "', BANYN = '"+request.getParameter("banYN");
				if(request.getParameter("loginYN").equals("Y")){
					sql += "', LOGIN_CNT = '5";
				} else if(request.getParameter("loginYN").equals("N")){
					sql += "', LOGIN_CNT = '0";
				}	
			}
			
			sql += "' WHERE U_ID = '"+uId+"' AND STATUS = '"+stat+"'";
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
	alert("해당 회원의  정보가 수정되었습니다.");
	window.close();
	window.opener.getReturn(); 
</script>