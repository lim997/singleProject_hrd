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
	<%@ include file="mySqlDB.jsp"%>

	<form action="login.jsp" name="lgn" method="post">
		<%
			String uId = "";
			String uPwd = "";
			String stat = request.getParameter("stat");
			if(stat.equals("U")){
				uId = request.getParameter("uIdU");
				uPwd = request.getParameter("uPwdU");
			} else if(stat.equals("T")){
				uId = request.getParameter("uIdT");
				uPwd = request.getParameter("uPwdT");
			} else if(stat.equals("A")){
				uId = request.getParameter("uIdA");
				uPwd = request.getParameter("uPwdA");
			}
			
			ResultSet rs = null; // 검색 결과를 담기 위한 객체
			Statement stmt = null; // 쿼리 호출을 위한 객체
			
			try{
				stmt = conn.createStatement();
				String sql = "SELECT * FROM JYR_TBL_USER WHERE U_ID = '" + uId + "' AND U_PWD = '" + uPwd + "' AND STATUS = '" + stat + "'";
				rs = stmt.executeQuery(sql);
				if(rs.next()){
					if(rs.getString("BANYN").equals("Y")){
						response.sendRedirect("stop.jsp");
					} else if(rs.getInt("LOGIN_CNT") >= 5){
						response.sendRedirect("cntOver.jsp");
					} else{
						session.setAttribute("u_id", rs.getString("U_ID"));
						session.setAttribute("u_name", rs.getString("U_NAME"));
						session.setAttribute("status", rs.getString("STATUS"));
						if(stat.equals("U") || stat.equals("T")){
							sql = "UPDATE JYR_TBL_USER SET LOGIN_CNT = 0 WHERE U_ID = '"+uId+"'";
							stmt.executeUpdate(sql);
						}
						response.sendRedirect("main.jsp");
					}
				} else {
					sql = "SELECT * FROM JYR_TBL_USER WHERE U_ID = '" + uId + "' AND STATUS = '" + stat + "'";
					rs = stmt.executeQuery(sql);
					
					if(rs.next()){
						if(rs.getString("BANYN").equals("Y")){
							response.sendRedirect("stop.jsp");
						}else if(rs.getInt("LOGIN_CNT") >= 5){
							response.sendRedirect("cntOver.jsp");
							return;
						} else {
							response.sendRedirect("find.jsp");
							String update = "UPDATE JYR_TBL_USER SET LOGIN_CNT = LOGIN_CNT + 1 WHERE U_ID = '"+uId+"'";
							stmt.executeUpdate(update);
						}
					} else{
						response.sendRedirect("non.jsp");
					}
				}
			}catch(SQLException e){
				out.println(e.getMessage());
			}
		%>
	</form>
	<input type="button" onclick="back()" value="뒤로가기">
</body>
</html>