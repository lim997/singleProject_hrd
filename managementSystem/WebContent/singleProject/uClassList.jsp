<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강 신청 목록</title>
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
		String stat = (String) session.getAttribute("status");
		Statement stmt = conn.createStatement();
		String sql = "SELECT * FROM JYR_CLASS_LIST CL"
				+" INNER JOIN JYR_COURSE_LIST CO ON CL.C_NUMBER = CO.C_NUMBER"
				+" INNER JOIN JYR_PART P ON CL.P_NO = P.P_NO"
				+" WHERE CO.U_ID = '"+uId+"' ORDER BY CL.C_SDAY ASC";
		ResultSet rs = stmt.executeQuery(sql);		
	%>
	
			<form action="main.jsp" name="userClass" method="post">
			<input name="stat" id="stat" value="<%= stat %>" hidden />
			<table>
				<caption>수강 신청 목록</caption>
				<thead>
					<tr>
						<th>훈련명</th>
						<th>훈련기관명</th>
						<th>훈련기간</th>
						<th>위치</th>
						<th>분야</th>
						<th>비용</th>
						<th>수강신청상태</th>
						<th>수강신청취소</th>
					</tr>
				</thead>
				<tbody>
					<tr>
			<%	while (rs.next()) { %>				
					<tr>
						<td><%= rs.getString("CL.C_NAME") %></td>
						<td><%= rs.getString("CL.U_NAME") %></td>		
						<td><%= rs.getString("CL.C_SDAY") %> ~ <%= rs.getString("CL.C_FDAY")%></td>
						<td><%= rs.getString("CL.C_AREA") %></td>
						<td><%= rs.getString("P.P_NAME") %></td>
						<td><%= rs.getString("CL.C_EXPENSE") %></td>
						<td><%= rs.getString("CO.STATE").equals("A") ? "승인" : "보류" %></td>
						<td>
						<% if(rs.getString("CO.STATE").equals("A")){ %>
							<div>보류 상태에서만 취소가 가능합니다.</div><div>훈련 기관에 문의해주세요.</div>
						<% } else if(rs.getString("CO.STATE").equals("W")){ %>
							<input type="button" name="chan" value="수강취소" onclick="cCancle(this.form,'<%= uId %>', '<%= rs.getString("CL.C_NUMBER") %>', '<%= rs.getString("CO.STATE") %>')" />
						<% } %>
						</td>
					</tr>
				<% } %>
				</tbody>
			</table>
			<input type="button" onclick="back()" value="뒤로가기">
		</form>
</body>
</html>
<script>
	function cCancle(frm, uId, cNum, cState){
		if(confirm("해당 강의의 수강 신청을 취소하시겠습니까?")){
			frm.action="classCancel.jsp?uId="+uId+"&cNum="+cNum+"&cState="+cState;
			frm.submit();
			return;
		} else {
		  	alert("취소되었습니다.");
		}
	}

	function back(){
		location.href="main.jsp";
	}
</script>