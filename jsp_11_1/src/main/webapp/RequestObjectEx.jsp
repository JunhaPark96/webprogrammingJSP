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
	out.println("����: " + request.getServerName() + "<br/>");
	out.println("��Ʈ��ȣ: " + request.getServerPort() + "<br/>");
	out.println("��û���: " + request.getMethod() +  "<br/>");
	out.println("Context Path: " + request.getContextPath() + "<br/>");
	out.println("URL: " + request.getRequestURL() +  "<br/>");
	out.println("URI: " + request.getRequestURI() + "<br/>");
	out.println("���� ��Ʈ��: " + request.getQueryString() + "<br/>");
	%>
	
</body>
</html>