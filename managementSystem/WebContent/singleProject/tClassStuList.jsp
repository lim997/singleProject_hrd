<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 목록</title>
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
		String cNum = request.getParameter("cNum");
		Statement stmt = conn.createStatement();
		String sql = "SELECT * FROM JYR_COURSE_LIST CO"
				+" INNER JOIN JYR_CLASS_LIST CL ON CO.C_NUMBER = CL.C_NUMBER"
				+" WHERE CL.C_NUMBER = '"+cNum+"'"
				+" ORDER BY CO.U_ID ASC";
		ResultSet rs = stmt.executeQuery(sql);		
	%>
		<form action="tClassList.jsp" name="tClass" method="post">
			<table>
				<caption>강의 수강 신청 목록</caption>
				<thead>
					<tr>
						<th>아이디</th>
						<th>성함</th>
						<th>수강신청상태</th>
						<th>수강 승인 및 취소</th>
					</tr>
				</thead>
				<tbody>
					<tr>
			<%
				boolean check = true;
				while (rs.next()) { %>
					
					<tr>
						<td><%= rs.getString("CO.U_ID") %></td>
						<td><%= rs.getString("CO.U_NAME") %></td>
						<td>
						<% if(rs.getString("CO.STATE").equals("W")){ %>
							보류상태
						<% } else if(rs.getString("CO.STATE").equals("A")){%>
							승인완료
						<% } %>
						</td>
						<td>
						<% if(rs.getString("CO.STATE").equals("W")){ %>
							<input type="button" onclick="cAccept(this.form,'<%= rs.getString("CO.U_ID") %>','<%= cNum %>','<%= rs.getInt("CL.STU_CNT") %>','<%= rs.getInt("CL.C_LIMIT") %>')" value="승인"/>
							/ <input type="button" onclick="cCancle(this.form,'<%= rs.getString("CO.U_ID") %>','<%= cNum %>', '<%= rs.getString("CO.STATE") %>')" value="취소"/>
						<% } else if(rs.getString("CO.STATE").equals("A")){%>
							<input type="button" onclick="cCancle(this.form,'<%= rs.getString("CO.U_ID") %>','<%= cNum %>', '<%= rs.getString("CO.STATE") %>')" value="제적"/>
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
	function cAccept(frm, uId, cNum, cStuCnt, cLimit){
		console.log(cStuCnt+"/"+cLimit)
		if(cStuCnt >= cLimit){
			alert("모집 정원 초과로 더 이상 수강 신청을 승인할 수 없습니다.");
		}
		else if(confirm("해당 회원의 수강 신청을 승인하시겠습니까?")){
			frm.action="classAccept.jsp?uId="+uId+"&cNum="+cNum;
			frm.submit();
			return;
		} else {
		  	alert("취소되었습니다.");
		}
	}

	function cCancle(frm, uId, cNum, cState){
		if(confirm("해당 회원의 수강 신청을 취소하시겠습니까?")){
			frm.action="classCancel.jsp?uId="+uId+"&cNum="+cNum+"&cState="+cState;
			frm.submit();
			return;
		} else {
		  	alert("취소되었습니다.");
		}
	}
	
	function back(){
		location.href="tClassList.jsp";
	}
</script>