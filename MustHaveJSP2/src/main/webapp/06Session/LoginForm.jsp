<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
  </head>
<title>Session</title>
</head>
<body>
	<jsp:include page="../Common/Link.jsp"/>
		<h2>로그인 페이지</h2>
		<span style="color: red; fon-size: 1.2em;"> <%=request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg")%></span>
		<%
		if (session.getAttribute("UserId") == null) {
		%>
		<script>
			function validateForm(form) {
				if (!form.user_id.value) {
					alert("아이디를 입력하세요.");
					return false;
				}
				if (form.user_pw.value == "") {
					alert("패스워드를 입력하세요.");
					return false;
				}
			}
		</script>
		<form action="LoginProcess.jsp" method="post" name="loginFrm"
			onsubmit="return validateForm(this);">
			아이디 : <input type="text" name="user_id"><br> 패스워드 : <input
				type="password" name="user_pw"><br> <input
				class="btn btn-warning" type="submit" value="로그인하기">
		</form>
		<%
		} else {
		%>
		<%=session.getAttribute("UserName")%>회원님, 로그인하셨습니다.
	<br>
		<a href="Logout.jsp">로그아웃</a>
		<%
		}
		%>
	</body>
</html>