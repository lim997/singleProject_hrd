<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>훈련 추가</title>
<style>
	table, th, td {
		border:1px solid black;
		border-collapse:collapse;
		padding:5px;
		text-align: center;
	}
	th, td {
		padding: 5px 25px;
	}
</style>
</head>
<body>
	<%@ include file="mySqlDB.jsp"%>
	
	<div>수강신청 버튼을 누르면 로그인 했는지(세션) 확인 후 -> 로그인 페이지</div>
	<div>STATUS='U'만 수강신청 가능 / 권한이 다르면(T,A) -> 수강신청 X</div>
	<div>COURSE_LIST에 U_ID가 있으면 -> 수강신청 X</div>
	<div>STU_CNT 가 C_LIMIT와 같으면(모집정원 꽉참) -> 수강신청 X</div>

	<%
	Statement stmt = conn.createStatement();
	String sql = "SELECT * FROM JYR_CLASS_LIST CL"
			+" INNER JOIN JYR_PART P ON P.P_NO = CL.P_NO"
			+" WHERE C_NUMBER = '"+request.getParameter("cNum")+"'";
	ResultSet rs = stmt.executeQuery(sql);		
	%>
	
		<form action="main.jsp" name="tClass" method="post">
			<table>
				<caption>수강 신청 목록</caption>
				<thead>
					<tr>
						<th>훈련코드</th>
						<th>훈련명</th>
						<th>훈련기관</th>
						<th>훈련기간</th>
						<th>분야</th>
						<th>위치</th>
						<th>수강비용</th>
						<th>모집정원</th>
						<th>수강신청</th>
					</tr>
				</thead>
				<tbody>
					<tr>
			<%
				while (rs.next()) { %>				
					<tr>
						<td><%= rs.getString("CL.C_NUMBER") %></td>
						<td><%= rs.getString("CL.C_NAME") %></td>
						<td><%= rs.getString("CL.U_NAME") %></td>	
						<td><%= rs.getString("CL.C_SDAY") %> ~ <%= rs.getString("CL.C_FDAY")%></td>
						<td><%= rs.getString("P.P_NAME") %></td>
						<td><%= rs.getString("CL.C_AREA") %></td>
						<td><%= rs.getString("CL.C_EXPENSE") %></td>
						<td><%= rs.getString("CL.STU_CNT") %> / <%= rs.getString("CL.C_LIMIT") %></td>
						<td><input type="button" name="cInfo" onclick="cApply()" value="수강신청"/></td>
					</tr>
				<% } %>
				</tbody>
			</table>
			<input type="button" onclick="winClose()" value="창닫기">
		</form>
</body>
</html>
<script>
	function winClose(){
		window.close();
	}
	function cApply(){
		location.href="main.jsp";
	}
</script>