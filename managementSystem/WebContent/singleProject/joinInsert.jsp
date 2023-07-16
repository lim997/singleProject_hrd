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
	<form>
		<%
			request.setCharacterEncoding("UTF-8");
			String uId = request.getParameter("uId");
			String uPwd = request.getParameter("uPwd");
			String uName = request.getParameter("uName");
			String phone = request.getParameter("phone");
			String email = request.getParameter("uEmail");
			String addr = request.getParameter("addr");
			String evnt = request.getParameter("eventYN");
			String service = request.getParameter("serviceYN");
			String stat = request.getParameter("stat");
			
			ResultSet rs = null; // 검색 결과를 담기 위한 객체
			Statement stmt = null; // 쿼리 호출을 위한 객체
			try{
				stmt = conn.createStatement();
				String sql="";
				if(stat.equals("U")){
					String birth = request.getParameter("birth");
					String education = request.getParameter("education");
					sql = "INSERT INTO JYR_TBL_USER(U_ID, U_PWD, U_NAME, BIRTH, PHONE, EMAIL, ADDR, EDUCATION, EVENTYN, SERVICEYN, STATUS) VALUES('"
							+ uId +"', '" + uPwd + "', '" + uName + "', '" + birth + "', '" + phone + "', '" + email + "', '" + addr +"', '" + education + "', '" + evnt + "', '" + service+"', '" + stat + "')";
				} else if(stat.equals("T")){
					String fax = request.getParameter("fax");
					sql = "INSERT INTO JYR_TBL_USER(U_ID, U_PWD, U_NAME, PHONE, FAX, EMAIL, ADDR, EVENTYN, SERVICEYN, STATUS) VALUES('"
							+ uId +"', '" + uPwd + "', '" + uName + "', '" + phone + "', '"  + fax + "', '"+ email + "', '" + addr +"', '" + evnt + "', '" + service+"', '" + stat + "')";
				}
				stmt.executeUpdate(sql);
				out.println(uName + "님 가입을 축하드립니다!");
			} catch(SQLException e){
				out.println(e.getMessage());
			}
		%>
		<input type="button" name="login" value="로그인" onclick="goLogin()" />
		<input type="button" name="main" value="홈페이지" onclick="goMain()" />
	</form>
</body>
</html>