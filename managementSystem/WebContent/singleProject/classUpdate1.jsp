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
	
	<%
		String cNumber = request.getParameter("cNum");
		ResultSet rs = null; 
		Statement stmt = null; 
		ResultSet rs2 = null; 
		Statement stmt2 = null;
		stmt = conn.createStatement();
		String sql = "SELECT * FROM JYR_CLASS_LIST C"
				+" INNER JOIN JYR_PART P ON C.P_NO = P.P_NO"
				+" WHERE C_NUMBER = '"+cNumber+"'";
		rs = stmt.executeQuery(sql);
		
		try {
			if(rs.next()) {
				if ((rs.getString("C_NUMBER")).equals(cNumber)){
	%>
				<form action="classUpdate2.jsp" name="userForm" method="post">
					<input type="text" name="cNumValue" value="<%= rs.getString("C.C_NUMBER") %>" hidden/>
					<div>훈련코드 
						<input type="text" name="cNum" value="<%= rs.getString("C.C_NUMBER") %>" disabled/>
					</div>
					<div>훈련명 
						<input type="text" name="cName" value="<%= rs.getString("C.C_NAME") %>"/>
					</div>
					<div>훈련시작기간 
						<input type="date" name="cSday" value="<%= rs.getString("C.C_SDAY") %>"/>
					</div>
					<div>훈련종료기간 
						<input type="date" name="cFday" value="<%= rs.getString("C.C_FDAY") %>"/>
					</div>
					<div>분야 
						<select id="pName" name="pNo" >
						<%
							stmt2 = conn.createStatement();
							String sql2 = "SELECT * FROM JYR_PART";
							rs2 = stmt2.executeQuery(sql2);
							while(rs2.next()){ %>
								<option value="<%= rs2.getInt("P_NO") %>"<%if((rs.getString("P.P_NO")).equals(rs2.getString("P_NO"))){%> selected<%} %>><%=  rs2.getString("P_NAME") %></option>
						<% } %>
		              	</select>
					</div>
					<div>위치 
						<input type="text" name="cArea" value="<%= rs.getString("C.C_AREA") %>"/>
					</div>
					<div>수강비용 
						<input type="text" name="cExpense" value="<%= rs.getString("C.C_EXPENSE") %>"/>
					</div>
					<div>모집정원 
						<input type="text" name="cLimit" value="<%= rs.getString("C.C_LIMIT") %>"/>
					</div>
						
					<input type="button" onclick="uUpdate('<%= rs.getInt("C.STU_CNT") %>')" value="변경하기">
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
	function uUpdate(stuCnt){
		var form = document.userForm;
		if(form.cLimit.value < stuCnt){
			alert("현재수강인원보다 적은 수의 인원을 모집할 수 없습니다.");
			return;
		}
		form.submit();
	}
	
	function windowClose(){
		window.close();
	}
</script>