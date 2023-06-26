<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그아웃</title>
</head>
<body>
	<%
		session.invalidate();
		response.sendRedirect("main.jsp");
		System.out.println("로그아웃 성공");
	%>
</body>
</html>