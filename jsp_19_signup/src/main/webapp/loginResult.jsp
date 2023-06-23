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
		
		out.println("현재 세션 => " + session.getId() + "<br/>");
		out.println("세션 유효 시간 => " + session.getMaxInactiveInterval() + "<br/>");
		out.println("========================================" + "<br/>");
		/*
		Enumeration<String> enumeration = session.getAttributeNames();
		while(enumeration.hasMoreElements()) {
			String attributeName = enumeration.nextElement();
			out.println("Session Name : " + attributeName + "<br/> Value : " + session.getAttribute(attributeName) + "<br/>");
		}
		*/
	%>
	
	<h1>로그인에 성공하였습니다, <%= session.getAttribute("loginName") %>님 </h1>
	
	<h2><a href="modify.jsp">회원정보 수정</a></h2>
	<h2><a href="logout.jsp">로그아웃</a></h2>
	<h2><a href="memberSelect.jsp">멤버 확인</a></h2>
</body>
</html>