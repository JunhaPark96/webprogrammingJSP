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
	Cookie[] cookies = request.getCookies();

	out.println("현재 쿠키 수 => " + cookies.length + "<br/>");

	for (int i = 1; i < cookies.length; i++) {
		String cookie = cookies[i].getName();
		if (cookie.equals("cookieName1")) {
			cookies[i].setMaxAge(0);
			response.addCookie(cookies[i]);
			out.println("삭제된 쿠키의 속성이름(name) " + i + ": " + cookies[i].getName() + "<br/>");
			out.println("삭제된 쿠키의 속성값(value) " + i + ": " + cookies[i].getValue() + "<br/>");
		}
	}

	out.println("현재 쿠키 수 => " + cookies.length + "<br/>");
	%>
</body>
</html>