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
	<h1>�������</h1>
	<%
	String id = (String)session.getAttribute("id");
	out.println("���� ���� => " + session.getId() + "<br/>");
	out.println("========================================" + "<br/>");

	Enumeration<String> enumeration = session.getAttributeNames();
	while(enumeration.hasMoreElements()) {
		String attributeName = enumeration.nextElement();
		out.println("Session Name : " + attributeName + "<br/> Value : " + session.getAttribute(attributeName) + "<br/>");
	}
	
	%>

	<a href="logout.jsp">�α׾ƿ�</a>
</body>
</html>
