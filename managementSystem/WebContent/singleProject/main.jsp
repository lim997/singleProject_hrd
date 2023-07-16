<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직업훈련포털사이트</title>
<script src="returnLoading.js"></script>
</head>
<body>
	<form action="" name="mainForm" method="post">
		<%
			String logCheck = "";
			String stat = "";
			if((request.isRequestedSessionIdValid()) && (session.getAttribute("u_name") != null)){
				String uName = (String) session.getAttribute("u_name");
				stat = (String) session.getAttribute("status");
				out.println(uName+"님 환영합니다!");
				logCheck = "로그아웃";
			} else {
				logCheck = "로그인";
			}
		%>
		<div>
			<input type="button" name="loginCheck" value="<%= logCheck %>" onclick="logInOut()" />

			<% if(logCheck.equals("로그인")){ %>
				<input type="button" name="uJoin" value="회원가입" onclick="join()" />
			<% } else if(stat.equals("A")){ %>			
				<input type="button" name="userInfo" value="회원정보확인" onclick="aInfo()" />
			<% } else { %>
				<input type="button" name="uInfo" value="개인정보확인" onclick="info(this.form)" />
			<% } 
			
			   if(stat.equals("U")){ %>		
				<input type="button" name="uClas" value="수강신청내역" onclick="uClass()" />
			<% } else if(stat.equals("T")){ %>
				<input type="button" name="tClas" value="훈련관리" onclick="tClass()" />
			<% }%>
		</div>
		<input type="button" name="claSearch" value="훈련과정찾기" onclick="search()" />
	</form>
</body>
</html>
<script>
	function logInOut(){
		var form = document.mainForm;
		if((form.loginCheck.value) == "로그인"){
			location.href="login.jsp";
			return;
		} else if((form.loginCheck.value) == "로그아웃"){
			window.open("logout.jsp");
			return;
		}
	}
	function join(){
		location.href="joinStatus.jsp";
	}

	function aInfo(){
		location.href="userStatus.jsp";
	}

	function info(frm){
		frm.action="information.jsp";
		frm.submit();
		return;
	}

	function search(){
		location.href="classSearch.jsp";
	}

	function uClass(){
		location.href="uClassList.jsp";
	}
	
	function tClass(){
		location.href="tClassList.jsp";
	}
</script>