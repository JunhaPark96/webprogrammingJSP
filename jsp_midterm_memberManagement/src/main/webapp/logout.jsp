<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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