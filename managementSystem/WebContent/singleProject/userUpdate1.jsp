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
	<% request.setCharacterEncoding("UTF-8"); %>
	
	<div>계정정지/로그인 횟수 초기화 넣기</div>
	<%
		String uId = request.getParameter("uId");
		String stat = request.getParameter("stat");
		String kind = request.getParameter("kind");
		ResultSet rs = null; //검색 결과를 담기 위한 객체
		Statement stmt = null; // 쿼리 호출을 위한 객체
	
		stmt = conn.createStatement();
		rs = stmt.executeQuery("SELECT * FROM JYR_TBL_USER WHERE U_ID = '"+uId+"' AND STATUS = '"+stat+"'");
		
		try {
			if(rs.next()) {
				if ((rs.getString("U_ID")).equals(uId)){
		%>
				<form action="userUpdate2.jsp" name="userForm" method="post">
					<input name="stat" value="<%= stat %>" hidden>
					<input type="text" name="uIdValue" value="<%= rs.getString("U_ID") %>" hidden/>
					<div>아이디 
						<input type="text" name="uId" value="<%= rs.getString("U_ID") %>" disabled/>
					</div>
					<div>비밀번호 
						<input type="password" name="uPwd" value="<%= rs.getString("U_PWD") %>" />
					</div> 
					<div>비밀번호확인
						<% if(kind.equals("U")){ %> 
							<input type="password" name="pwdCheck" value="" placeholder="비밀번호와 일치해야만 정보 수정이 가능합니다."/>
						<% } else if(kind.equals("A")){ %>
							<input type="password" name="pwdCheck" value="<%= rs.getString("U_PWD") %>"/>
						<% } %>
					</div> 
					<div>이름 
						<input type="text" name="uName" value="<%= rs.getString("U_NAME") %>" />
					</div>
					<div>
					<% if((rs.getString("STATUS")).equals("U")){ %>
						핸드폰번호 
					<% } else if((rs.getString("STATUS")).equals("T")){ %>
						전화번호 
					<% } %> 
						<input type="text" name="phone" value="<%= rs.getString("PHONE") %>" />
					</div>
					<% if((rs.getString("STATUS")).equals("T")){ %>
						<div>팩스번호 
							<input type="text" name="fax" value="<%= rs.getString("FAX") %>" />
						</div>
					<% } %> 
					<div>이메일 
						<input type="text" name="uEmail" value="<%= rs.getString("EMAIL") %>" />
					</div>
					<div>주소 
						<input type="text" name="addr" value="<%= rs.getString("ADDR") %>" />
					</div> 
					<% if((rs.getString("STATUS")).equals("U")){ %>
						<div>생년월일 
							<input type="date" name="birth" value="<%= rs.getString("BIRTH") %>" disabled />
						</div>
						<div>최종학력 
							<select id="education" name="education">
		              			<option value="M" <%if((rs.getString("EDUCATION")).equals("M")){%> selected<%} %>>중학교</option>
		                		<option value="H" <%if((rs.getString("EDUCATION")).equals("H")){%> selected<%} %>>고등학교</option>
		                		<option value="U" <%if((rs.getString("EDUCATION")).equals("U")){%> selected<%} %>>대학교</option>
		              		</select>
						</div>	
					<% } %>
					<div>
						<input type="radio" id="eventY" name="eventYN" value="Y" <% if(rs.getString("EVENTYN").equals("Y")){ %> checked <% } %>>
						<label for="eventY">이벤트 수신 동의</label>
						<input type="radio" id="eventN" name="eventYN" value="N"  <% if(rs.getString("EVENTYN").equals("N")){ %> checked <% } %>>
						<label for="eventN">이벤트 수신 동의 안 함</label>
					</div>
					<% if(((String) session.getAttribute("status")).equals("A")){ %>
						<div>
							<input type="radio" id="banY" name="banYN" value="Y" <% if(rs.getString("BANYN").equals("Y")){ %> checked <% } %>>
							<label for="banY">계정 정지</label>
							<input type="radio" id="banN" name="banYN" value="N" <% if(rs.getString("BANYN").equals("N")){ %> checked <% } %>>
							<label for="banN">계정 정지 해제</label>
						</div>
						<div>
							<input type="radio" id="loginY" name="loginYN" value="Y" <% if(rs.getInt("LOGIN_CNT")>=5){ %> checked <% } %>>
							<label for="loginY">로그인 제한</label>
							<input type="radio" id="loginN" name="loginYN" value="N" <% if(rs.getInt("LOGIN_CNT")<5){ %> checked <% } %>>
							<label for="loginN">로그인 횟수 초기화</label>
						</div>
					<% } %>
					<input type="button" onclick="uUpdate()" value="변경하기">
					<input type="button" onclick="windowClose()" value="변경종료">
				</form>
		<%
				}
			}
		} catch(SQLException e){
			out.println(e.getMessage());
		}
	%>
</body>
</html>
<script>
	function uUpdate(){
		var form = document.userForm;
		if(form.uPwd.value.length==0){
			alert("비밀번호를 입력해주세요.");
			return;
		}
		if(form.uPwd.value != form.pwdCheck.value){
			alert("비밀번호가 다릅니다. 다시 입력해주세요.");
			return;
		}
		form.submit();
	}
	
	function windowClose(){
		window.close();
	}
</script>