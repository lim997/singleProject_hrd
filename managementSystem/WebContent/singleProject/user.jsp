<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생, 훈련기관 목록 관리</title>
<script src="../js/code.jquery.com_jquery-3.7.0.min.js"></script>
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
		ResultSet rs = stmt.executeQuery("SELECT * FROM JYR_TBL_USER WHERE STATUS = '"+stat+"'");
	%>
		<form action="user_update.jsp" name="list" method="post">
			<input name="stuNo" hidden/>
			<table>
				<caption>일반회원</caption>
				<thead>
					<tr>
						<th></th>
						<th>아이디</th>
						<th>이름</th>
						<th>핸드폰번호</th>
						<th>이메일</th>
						<th>주소</th>
						<th>생년월일</th>
						<th>최종학력</th>
						<th>이벤트수신여부</th>
						<th>이벤트수신설정</th>
						<th>계정정지여부</th>
						<th>계정정지해제</th>
						<th>로그인제한</th>
					</tr>
				</thead>
				<tbody>
					<tr>
	<%			
					boolean check = true;
					while (rs.next()) {
						String uId = rs.getString("U_ID");
						String uName = rs.getString("U_NAME");
						String phone = rs.getString("PHONE");
						String email = rs.getString("EMAIL");
						String addr = rs.getString("ADDR");
						
						String eventYN = rs.getString("EVENTYN").equals("Y") ? "수신허용" : "수신거부";
						String eYN = rs.getString("EVENTYN").equals("Y") ? "거부" : "허용";
						String banYN = rs.getString("BANYN").equals("Y") ? "정지" : "";
						String bYN = rs.getString("BANYN").equals("Y") ? "정지해제" : "정지";
						
						if(stat.equals("U")){
							String birth = rs.getString("BIRTH");
							String education="";
							if(rs.getString("EDUCATION").equals("M")){
								education = "중학교졸업";
							} else if(rs.getString("EDUCATION").equals("H")){
								education = "고등학교졸업";
							} else if(rs.getString("EDUCATION").equals("U")){
								education = "대학교졸업";
							}
						}
	%>				
					<tr>
						<td class="check">
							<input type="radio" name="userId" value="<%= uId %>" <% if(check){ %> checked <% check=false; } %>>
						</td>
						<td><%= uId %></td>
						<td><%= uName %></td>
						<td><%= phone %></td>
						<td><%= email %></td>
						<td><%= addr %></td>
						<%
						if(stat.equals("U")){
							String birth = rs.getString("BIRTH");
							String education="";
							if(rs.getString("EDUCATION").equals("M")){
								education = "중학교졸업";
							} else if(rs.getString("EDUCATION").equals("H")){
								education = "고등학교졸업";
							} else if(rs.getString("EDUCATION").equals("U")){
								education = "대학교졸업";
							}
						%>
						<td><%= birth %></td>
						<td><%= education %></td>
						<% } %>
						<td name="eventYN" value="<%= rs.getString("EVENTYN") %>"><%= eventYN %></td>
						<td>
							<input type="button" name="eYNChange" onclick="eventChange('<%= rs.getString("EVENTYN") %>','<%= uId %>')" value="<%= eYN %>"/>
						</td>
						<td style="color:red;" name="banYN" value="<%= rs.getString("BANYN") %>"><%= banYN %></td>
						<td>
							<input type="button" name="bYNChange" onclick="banChange('<%= rs.getString("BANYN") %>','<%= uId %>')" value="<%= bYN %>"/>
						</td>
						<td>
						<% if(rs.getInt("LOGIN_CNT")>=5){	%>
							<input type="button" name="cnChange" onclick="cntReset('<%= uId %>')" value="초기화"/>
						<% } %>
						</td>
					</tr>
	<%
					}
	%>
				</tbody>
			</table>
			<input type="button" onclick="update();" value="수정">
			<input type="button" onclick="del(this.form);" value="삭제">
		</form>
</body>
</html>
<script>
	function update(){
		var form = document.list;
		$("input:radio[name=userId]:checked").each(function(i,val){
			form.stuNo.value = val.value;
			window.open("user_update1.jsp?uId="+val.value,"update_popup", "width=500, height=300");
		});
		/* frm.submit();
		return; */
	}
	
	function del(frm){
		if(confirm("해당 회원을 삭제하시겠습니까?")){
			frm.action="user_del.jsp";
			frm.submit();
			return;
	    } else {
	    	alert("취소 되었습니다.");
	    }
	}
	
	function eventChange(kind, uId){
		
	}
	
	function banChange(kind, uId){
		if(kind == "N"){
			kind = "Y";
		} else {
			kind = "N";
		}
		window.open("user_ban.jsp?uId="+uId+"&kind="+kind,"ban_popup", "width=500, height=300");
	}
	
	function cntReset(uId){
		window.open("user_cnt.jsp?uId="+uId,"cnt_popup", "width=500, height=300");
	}
	
	function getReturn(){
		location.reload();
	}
</script>
