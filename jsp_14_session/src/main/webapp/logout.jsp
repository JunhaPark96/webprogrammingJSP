<%@page import="java.util.Enumeration"%>
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
	Enumeration<String> enumeration = session.getAttributeNames();
	while(enumeration.hasMoreElements()) {
		String attributeName = enumeration.nextElement();
		out.println("Session Name : " + attributeName + "<br/> Value : " + session.getAttribute(attributeName) + "<br/>");
	}
	
	session.removeAttribute("Session1");
	session.invalidate();
	
	%>
</body>
</html>