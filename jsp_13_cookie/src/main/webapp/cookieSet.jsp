<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		Cookie cookie1 = new Cookie("cookieName1", "cookie1");
		Cookie cookie2 = new Cookie("cookieName2", "cookie2");
		cookie1.setMaxAge(10); // 초단위
		cookie2.setMaxAge(10); // 초단위
		response.addCookie(cookie1);
		response.addCookie(cookie2);
	%>
	
	<a href="cookieGet.jsp">cookie get</a>
</body>
</html>