<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	 	String id = request.getParameter("id");
	 	String passwd = request.getParameter("passwd");
	 	String name = request.getParameter("name");
	 	String email = request.getParameter("email");
	%>

	<jsp:useBean id="member" class="jsp_16_bean.MemberBean" scope="session"></jsp:useBean>
	
	<jsp:setProperty property="id" name="member" value="<%=id%>"/>
	<jsp:setProperty property="passwd" name="member" value="<%=passwd%>"/>
	<jsp:setProperty property="name" name="member" value="<%=name%>"/>
	<jsp:setProperty property="email" name="member" value="<%=email%>"/>
	
	<%
	response.sendRedirect("memberConfirm.jsp");
	%>
</body>
</html>