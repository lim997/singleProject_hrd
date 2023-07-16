<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생, 훈련기관 목록 관리</title>
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
	.check {
		padding: 5px 10px;
	}
</style>
</head>
</head>
<body>
	<%@ include file="mySqlDB.jsp"%>
	<% request.setCharacterEncoding("UTF-8"); %>

	<%
	String stat = request.getParameter("statFlg");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT * FROM JYR_TBL_USER WHERE STATUS = '"+stat+"' ORDER BY U_ID ASC");		
	%>
		<form action="userStatus.jsp" name="list" method="post">
			<input name="stat" value="<%= stat %>" hidden>
			<table>
				<caption>일반회원</caption>
				<thead>
					<tr>
						<th></th>
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
						<th>이벤트수신설정</th>
						<th>계정정지여부</th>
						<th>계정정지설정</th>
						<th>로그인제한</th>
					</tr>
				</thead>
				<tbody>
					<tr>
	<%			
					boolean check = true; //첫 번째 라디오 박스에 자동으로 체크하기 위한 변수
					while (rs.next()) {
						String eventYN = rs.getString("EVENTYN").equals("Y") ? "수신허용" : "수신거부";
						String eYN = rs.getString("EVENTYN").equals("Y") ? "거부" : "허용";
						String banYN = rs.getString("BANYN").equals("Y") ? "정지" : "";
						String bYN = rs.getString("BANYN").equals("Y") ? "정지해제" : "정지";
		%>		
					<tr>
						<td class="check">
							<input type="radio" name="userId" value="<%= rs.getString("U_ID") %>" <% if(check){ %> checked <% check=false; } %>>
						</td>
						<td><%= rs.getString("U_ID") %></td>
						<td><%= rs.getString("U_NAME") %></td>
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
						<td name="eventYN" value="<%= rs.getString("EVENTYN") %>"><%= eventYN %></td>
						<td>
							<input type="button" name="eYNChange" onclick="change(this.form,'<%= rs.getString("EVENTYN") %>','<%= rs.getString("U_ID") %>','EVENTYN')" value="<%= eYN %>"/>
						</td>
						<td style="color:red;" name="banYN" value="<%= rs.getString("BANYN") %>"><%= banYN %></td>
						<td>
							<input type="button" name="bYNChange" onclick="change(this.form,'<%= rs.getString("BANYN") %>','<%= rs.getString("U_ID") %>','BANYN')" value="<%= bYN %>"/>
						</td>
						<td>
						<% if(rs.getInt("LOGIN_CNT")>=5){ %>
							<input type="button" name="cnChange" onclick="cntReset(this.form,'<%= rs.getString("U_ID") %>')" value="초기화"/>
						<% } %>
						</td>
					</tr>
				<% } %>
				</tbody>
			</table>
			<input type="button" onclick="update(this.form);" value="회원정보수정">
			<input type="button" onclick="del(this.form);" value="회원탈퇴">
			<input type="button" onclick="back()" value="뒤로가기">
		</form>
</body>
</html>
<script>
	function update(frm){
		$("input:radio[name=userId]:checked").each(function(i,val){
			window.open("userUpdate1.jsp?uId="+val.value+"&stat="+frm.stat.value+"&kind=A","update_popup", "width=500, height=300");
		});
	}
	
	function del(frm){
		$("input:radio[name=userId]:checked").each(function(i,val){
			if(confirm("해당 회원을 영구적으로 탈퇴시키시겠습니까?")){
				frm.action="userDelete.jsp?uId="+val.value;
				frm.submit();
				return;
			} else {
			  	alert("취소되었습니다.");
			}
		});
	}

	function change(frm, kind, uId, str){
		if(confirm("해당 회원의 정지 상태를 변경시키시겠습니까?")){
			if(kind == "N"){
				kind = "Y";
			} else {
				kind = "N";
			}
			frm.action="userYN.jsp?uId="+uId+"&kind="+kind+"&str="+str;
			frm.submit();
			return;
		} else {
		  	alert("취소되었습니다.");
		}
	}
	
	function cntReset(frm, uId){
		frm.action="userCnt.jsp?uId="+uId;
		frm.submit();
		return;
	}
	
	function back(){
		location.href="userStatus.jsp";
	}
</script>
