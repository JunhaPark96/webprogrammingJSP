<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α׾ƿ�</title>
</head>
<body>
	<%
		session.invalidate();
		out.println("<script>alert('�α׾ƿ� �Ǿ����ϴ�.'); location.href='main.jsp';</script>");
		System.out.println("�α׾ƿ� ����");
	%>
</body>
</html>
