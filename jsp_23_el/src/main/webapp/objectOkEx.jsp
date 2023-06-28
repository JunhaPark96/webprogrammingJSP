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
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	%>
	pageScope:
	<%=pageContext.getAttribute("id", PageContext.PAGE_SCOPE)%><br />
	requestScope:
	<%=request.getAttribute("id")%><br /> sessionScope:
	<%=session.getAttribute("id")%><br /> applicationScope:
	<%=application.getAttribute("id")%><br /> param:
	<%=request.getParameter("id")%><br />


	<%
	// Set variables for different scopes
	pageContext.setAttribute("scope", "pageScope");
	request.setAttribute("scope", "requestScope");
	session.setAttribute("scope", "sessionScope");
	application.setAttribute("scope", "applicationScope");

	// Set a parameter for demonstration
	String paramName = "paramName";
	String paramValue = "paramValue";
	request.setAttribute(paramName, paramValue);
	%>

	<p>pageScope: ${pageScope.scope}</p>
	<p>requestScope: ${requestScope.scope}</p>
	<p>sessionScope: ${sessionScope.scope}</p>
	<p>applicationScope: ${applicationScope.scope}</p>
	<p>param: ${param[paramName]}</p>
</body>
</html>
