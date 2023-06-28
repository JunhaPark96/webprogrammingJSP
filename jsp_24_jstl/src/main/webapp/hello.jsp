<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	hello<br/>
	<%
	//String name = request.getParameter("name");
	%>
	파라미터: <c:out value="${param.name }"></c:out>
	
</body>
</html>