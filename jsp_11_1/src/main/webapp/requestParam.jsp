<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Arrays" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%!
		String name;
		String id;
		String passwd;
		String[] hobby;
	%>
	
	<%
		request.setCharacterEncoding("EUC-KR");
		
		name = request.getParameter("name");
		id = request.getParameter("id");
		passwd =request.getParameter("passwd");
		hobby = request.getParameterValues("hobby");
	%>
	
	<%
	 request.getParameterNames().asIterator()
     .forEachRemaining(paramName -> System.out.println(paramName + " = " + request.getParameter(paramName)));
	%>
	
	이름 : <%= name %> <br/>
	아이디 : <%= id %> <br/>
	비밀번호 : <%= passwd %> <br/>
	취미 : <%= Arrays.toString(hobby) %> <br/>
	
	<%
	out.println("이름 : " + name + "<br/>");
	out.println("id : " + request.getParameter("id") + "<br/>");
	out.println("비밀번호 : " + request.getParameter("passwd") + "<br/>");
	out.println("취미 : " + Arrays.toString(hobby) + "<br/>");
	%>
	
	
</body>
</html>