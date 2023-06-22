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
	//Cookie[] cookies = request.getCookies();
	
	//out.println("현재 쿠키 수 => " + cookies.length + "<br/>");
	
	/*
	for (int i = 0; i< cookies.length; i++){
		out.println("설정된 쿠키의 속성이름(name) " + i + ": " + cookies[i].getName() + "<br/>");
		out.println("설정된 쿠키의 속성값(value) " + i + ": " + cookies[i].getValue() + "<br/>");
	}*/
	if (request.getCookies() != null){
		for (Cookie cookie : request.getCookies()){
			out.println(cookie.getName() + " : " + cookie.getValue() + "<br/>");
		}
		
	}
	
	
	%>
	
	
	
	<a href="cookieDel.jsp">cookie Del</a>
</body>
</html>