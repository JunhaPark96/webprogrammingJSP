<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>welcome page</title>
</head>
<body>
	<h1>어서오세용</h1>
	<%
	Cookie[] cookies = request.getCookies();
	out.println("현재 쿠키 수 => " + cookies.length + "<br/>");

	for (int i = 0; i < cookies.length; i++) {
		out.println("설정된 쿠키의 속성이름(name) " + i + ": " + cookies[i].getName() + "<br/>");
		out.println("설정된 쿠키의 속성값(value) " + i + ": " + cookies[i].getValue() + "<br/>");
		out.println("----------------------------------------------------------" + "<br/>");
	}
	%>

	<a href="logout.jsp">로그아웃</a>
</body>
</html>