<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>훈련 목록</title>
<script src="backLogMain.js"></script>
<script src="returnLoading.js"></script>
<script src="code.jquery.com_jquery-3.7.0.min.js"></script>
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

	<%
		String uId = (String) session.getAttribute("u_id");
		Statement stmt = conn.createStatement();
		String sql = "SELECT * FROM JYR_CLASS_LIST CL"
				+" INNER JOIN JYR_TBL_USER U ON CL.U_ID = U.U_ID"
				+" INNER JOIN JYR_PART P ON CL.P_NO = P.P_NO"
				+" WHERE CL.U_ID = '"+uId+"'"
				+" ORDER BY CL.C_NUMBER ASC";
		ResultSet rs = stmt.executeQuery(sql);		
	%>
	
		<form action="main.jsp" name="tClass" method="post">
			<table>
				<caption>수강 신청 목록</caption>
				<thead>
					<tr>
						<th></th>
						<th>훈련코드</th>
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
				boolean check = true;
				while (rs.next()) { %>				
					<tr>
						<td class="check">
							<input type="radio" name="classNum" value="<%= rs.getString("CL.C_NUMBER") %>" <% if(check){ %> checked <% check=false; } %>>
						</td>
						<td><%= rs.getString("CL.C_NUMBER") %></td>
						<td><%= rs.getString("CL.C_NAME") %></td>	
						<td><%= rs.getString("CL.C_SDAY") %> ~ <%= rs.getString("CL.C_FDAY")%></td>
						<td><%= rs.getString("P.P_NAME") %></td>
						<td><%= rs.getString("CL.C_AREA") %></td>
						<td><%= rs.getString("CL.C_EXPENSE") %></td>
						<td><%= rs.getString("CL.STU_CNT") %> / <%= rs.getString("CL.C_LIMIT") %></td>
					</tr>
				<% } %>
				</tbody>
			</table>
			<input type="button" onclick="goStuList(this.form)" value="학생관리">
			<input type="button" onclick="cUpdate(this.form)" value="훈련정보수정">
			<input type="button" onclick="insert(this.form)" value="훈련추가">
			<input type="button" onclick="goMain()" value="뒤로가기">
		</form>
</body>
</html>
<script>
	function goStuList(frm){
		$("input:radio[name=classNum]:checked").each(function(i,val){
			frm.action="tClassStuList.jsp?cNum="+val.value;
			frm.submit();
			return;
		});
	}
	
	function cUpdate(frm){
		$("input:radio[name=classNum]:checked").each(function(i,val){
			window.open("classUpdate1.jsp?cNum="+val.value,"c_update_popup", "width=800, height=300");
		});
	}
</script>