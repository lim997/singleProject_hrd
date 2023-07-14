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
	
	<form name="check">
	<%
		String uEmail = request.getParameter("uEmail");
		String stat = request.getParameter("stat");
		
		ResultSet rs = null; // 검색 결과를 담기 위한 객체
		Statement stmt = null; // 쿼리 호출을 위한 객체
		
		try{
			stmt = conn.createStatement();
			String sql = "SELECT * FROM JYR_TBL_USER WHERE EMAIL = '" + uEmail + "' AND STATUS = '"+stat+"'";
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				out.println("사용중인 이메일을 입력하셨습니다. 다시 입력해주세요.");
		%>
				<input name="flg" value="N" hidden>
		<%
			} else {
				out.println("사용 가능한 이메일 입니다.");
		%>
				<input name="flg" value="Y" hidden>
		<%
			}
				
		}catch(SQLException e){
			out.println(e.getMessage());
		}
	%>
		<input type="button" onclick="checking()" value="확인">
	</form>
</body>
</html>
<script>
	function checking(){
		window.opener.getReturn(document.check.flg.value, "email");
		window.close();
	}
</script>
</body>
</html>