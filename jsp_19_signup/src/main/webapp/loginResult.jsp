<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		session = request.getSession();
		String id = request.getParameter("id");
		
		if(id != null && !id.isEmpty()) {
			session.setAttribute("loginId", id);
		}
		
		out.println("���� ���� => " + session.getId() + "<br/>");
		out.println("���� ��ȿ �ð� => " + session.getMaxInactiveInterval() + "<br/>");
		out.println("========================================" + "<br/>");
		/*
		Enumeration<String> enumeration = session.getAttributeNames();
		while(enumeration.hasMoreElements()) {
			String attributeName = enumeration.nextElement();
			out.println("Session Name : " + attributeName + "<br/> Value : " + session.getAttribute(attributeName) + "<br/>");
		}
		*/
	%>
	
	<h1>�α��ο� �����Ͽ����ϴ�, <%= session.getAttribute("loginName") %>�� </h1>
	
	<h2><a href="modify.jsp">ȸ������ ����</a></h2>
	<h2><a href="logout.jsp">�α׾ƿ�</a></h2>
	<h2><a href="memberSelect.jsp">��� Ȯ��</a></h2>
</body>
</html>