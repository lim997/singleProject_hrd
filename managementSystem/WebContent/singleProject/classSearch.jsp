<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>훈련 목록</title>
<script src="backLogMain.js"></script>
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

	<div>모든 사람들이 전체 훈련 목록을 열람할 수 있는 페이지</div>
	<div>훈련기관/훈련명 검색하면 해당 데이터를 페이지에 출력?</div>
	<div>옵션 셀렉트를 이용하여 각각의 분야에 맞는 페이지를 출력?</div>

	<%
		Statement stmt = conn.createStatement();
		String sql = "SELECT * FROM JYR_CLASS_LIST CL"
				+" INNER JOIN JYR_TBL_USER U ON CL.U_ID = U.U_ID"
				+" INNER JOIN JYR_PART P ON CL.P_NO = P.P_NO"
				+" ORDER BY CL.C_SDAY ASC";
		ResultSet rs = stmt.executeQuery(sql);
	%>
	
		<form action="classSelect.jsp" name="tClass" method="post">
			<table>
				<caption>수강 신청 목록</caption>
				<thead>
					<tr>
						<th>훈련명</th>
						<th>훈련기간</th>
						<th>분야</th>
						<th>위치</th>
						<th>수강비용</th>
						<th>수강인원</th>
					</tr>
				</thead>
				<tbody>
					<tr>
			<%
				while (rs.next()) { %>				
					<tr>
						<td><a href="classSelect.jsp?cNum=<%= rs.getString("CL.C_NUMBER") %>" target="_blank"><%= rs.getString("CL.C_NAME") %></a></td>
						<td><%= rs.getString("CL.C_SDAY") %> ~ <%= rs.getString("CL.C_FDAY")%></td>
						<td><%= rs.getString("P.P_NAME") %></td>
						<td><%= rs.getString("CL.C_AREA") %></td>
						<td><%= rs.getString("CL.C_EXPENSE") %></td>
						<td><%= rs.getString("CL.STU_CNT") %> / <%= rs.getString("CL.C_LIMIT") %></td>
					</tr>
				<% } %>
				</tbody>
			</table>
			<input type="button" onclick="goMain()" value="뒤로가기">
		</form>
</body>
</html>