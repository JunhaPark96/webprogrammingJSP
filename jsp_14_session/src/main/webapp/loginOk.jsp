<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%!String id;
	String passwd;%>
	<h1>�α��� ��</h1>

	<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");

	if (id.length() > 4 || passwd.length() > 4) {
		response.sendRedirect("login.jsp");
	} else {
		session.setAttribute("id", "user");
		session.setMaxInactiveInterval(1800); // ��ȿ�ð� ���� default: 30��
		response.sendRedirect("welcome.jsp");
	}
	%>
</body>
</html>