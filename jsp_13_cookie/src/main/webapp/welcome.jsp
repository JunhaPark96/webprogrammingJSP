<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>welcome page</title>
</head>
<body>
	<h1>�������</h1>
	<%
	Cookie[] cookies = request.getCookies();
	out.println("���� ��Ű �� => " + cookies.length + "<br/>");

	for (int i = 0; i < cookies.length; i++) {
		out.println("������ ��Ű�� �Ӽ��̸�(name) " + i + ": " + cookies[i].getName() + "<br/>");
		out.println("������ ��Ű�� �Ӽ���(value) " + i + ": " + cookies[i].getValue() + "<br/>");
		out.println("----------------------------------------------------------" + "<br/>");
	}
	%>

	<a href="logout.jsp">�α׾ƿ�</a>
</body>
</html>