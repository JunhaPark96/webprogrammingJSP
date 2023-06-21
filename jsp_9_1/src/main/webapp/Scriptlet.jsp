<%@ page import="java.util.Arrays"%>
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
	int i = 0;
	while (true) {
		i++;
		out.println("2 * " + i + " = " + (2 * i) + "<br/>");
	%>
	-----------------------------------
	<br />
	<%
	if (i >= 9) {
		break;
	}
	}
	%>

	=======================================
	<br>

	<%!int i = 10;
	String str = "ABCDEF";%>

	<%!public int sum(int x, int y) {
		return x + y;
	}%>

	<%
	out.println("i = " + i + "<br/>");
	out.println("str = " + str + "<br/>");
	out.println("sum = " + sum(1, 9) + "<br/>");
	%>

	=========================================
	<br>

	<%
	int[] arr = { 10, 20, 30 };
	out.println(Arrays.toString(arr) + "<br>");
	%>
	<!-- HTML 주석입니다 -->
	=========================================
	<%-- JSP 주석입니다 --%>
	<br>
	<h1>본 jsp 페이지</h1><br>
	<%@ include file = "directiveEx.jsp" %><br>
	<h1>다시 본 페이지</h1>

</body>
</html>