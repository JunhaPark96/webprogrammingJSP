<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%!String id;
	String passwd;%>
	<h1>로그인 중</h1>

	<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");

	if (id.length() > 4 || passwd.length() > 4) {
		response.sendRedirect("login.jsp");
	} else {
		session.setAttribute("Session1", "user1");
		session.setMaxInactiveInterval(30); // 유효시간 설정 default: 30분
		response.sendRedirect("welcome.jsp");
	}
	%>
</body>
</html>