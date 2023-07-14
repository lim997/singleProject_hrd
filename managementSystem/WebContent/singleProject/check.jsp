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
	
	<form name="checked">
	<%
		String kind = request.getParameter("kind");
		String stat = request.getParameter("stat");
		String str = request.getParameter("str");
		
		ResultSet rs = null; // 검색 결과를 담기 위한 객체
		Statement stmt = null; // 쿼리 호출을 위한 객체
		try{
			stmt = conn.createStatement();
			String sql = "SELECT * FROM JYR_TBL_USER WHERE "+str+" = '" + kind + "' AND STATUS = '"+stat+"'";
			rs = stmt.executeQuery(sql);
			
			String prin = "";
			if(str.equals("U_ID")){
				if(stat.equals("U")){
					prin = "아이디";
				} else if(stat.equals("T")){
					prin = "사업자 번호";
				}
			} else if(str.equals("EMAIL")){
				prin = "이메일";
			} else if(str.equals("PHONE")){
				prin = "연락처";
			}
			if(rs.next()){
				out.println("사용중인 "+prin+" 입니다. 다시 입력해주세요.");
		%>
				<input name="flg" value="N" hidden>
		<%
			} else {
				out.println("사용 가능한 "+ prin +" 입니다.");
		%>
				<input name="flg" value="Y" hidden>
		<%
			}
				
		}catch(SQLException e){
			out.println(e.getMessage());
		}
	%>
		<input type="button" onclick="checking('<%= str %>')" value="확인">
	</form>
</body>
</html>
<script>
	function checking(str){
		window.opener.getReturn(document.checked.flg.value, str);
		window.close();
	}
</script>
</body>
</html>