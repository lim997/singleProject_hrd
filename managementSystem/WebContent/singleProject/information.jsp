<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보열람</title>
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
</head>
<body>
	<%@ include file="mySqlDB.jsp"%>
	<% request.setCharacterEncoding("UTF-8"); %>

	<%
		String uId = (String) session.getAttribute("u_id");
		String stat = (String) session.getAttribute("status");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM JYR_TBL_USER WHERE U_ID = '"+uId+"' AND STATUS = '"+stat +"'");		
	%>
		<form action="main.jsp" name="userInfo" method="post">
			<input name="stat" id="stat" value="<%= stat %>" hidden />
			<table>
				<caption>일반회원</caption>
				<thead>
					<tr>
						<% if(stat.equals("U")){%>
							<th>아이디</th>
						<% } else if(stat.equals("T")){ %>
							<th>사업자등록번호</th>
						<% } %>
						<th>이름</th>
						<th>핸드폰번호</th>
						<% if(stat.equals("T")){%>
							<th>팩스번호</th>
						<% } %>
						<th>이메일</th>
						<th>주소</th>
						<% if(stat.equals("U")){%>
							<th>생년월일</th>
							<th>최종학력</th>
						<% } %>
						<th>이벤트수신여부</th>
					</tr>
				</thead>
				<tbody>
					<tr>
				<% while (rs.next()) {	%>				
					<tr>
						<td><%= uId %></td>
						<td><%=rs.getString("U_NAME") %></td>
						<td><%= rs.getString("PHONE") %></td>
						<% if(stat.equals("T")){ %>
							<td><%= rs.getString("FAX") %></td>
						<% } %>
						<td><%= rs.getString("EMAIL") %></td>
						<td><%= rs.getString("ADDR") %></td>
						<% if(stat.equals("U")){
								String education="";
								if(rs.getString("EDUCATION").equals("M")){
									education = "중학교졸업";
								} else if(rs.getString("EDUCATION").equals("H")){
									education = "고등학교졸업";
								} else if(rs.getString("EDUCATION").equals("U")){
									education = "대학교졸업";
								} %>
								<td><%= rs.getString("BIRTH") %></td>
								<td><%= education %></td>
						<% } %>
						<td name="eventYN" value="<%= rs.getString("EVENTYN") %>"><%= rs.getString("EVENTYN").equals("Y") ? "수신허용" : "수신거부" %></td>
					</tr>
				<% } %>
				</tbody>
			</table>
			<input type="button" onclick="update('<%= uId %>','<%= stat %>');" value="회원정보수정">
			<input type="button" onclick="del(this.form);" value="회원탈퇴">
			<input type="button" onclick="back()" value="뒤로가기">
		</form>
</body>
</html>
<script>
	function update(uId, stat){
		console.log(uId+"/"+stat);
		window.open("userUpdate1.jsp?uId="+uId+"&stat="+stat+"&kind=U","update_popup", "width=500, height=300");
		return;
	}
	
	function del(frm){
		if(confirm("영구적으로 탈퇴하시겠습니까?")){
			frm.action="userWithdraw.jsp";
			frm.submit();
			return;
		} else {
		  	alert("취소 되었습니다.");
		}
	}
	
	function back(){
		location.href="main.jsp";
	}
</script>
