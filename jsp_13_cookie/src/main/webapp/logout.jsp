<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>�α׾ƿ� �Ǿ����ϴ�</h1>
	<%
	Cookie[] cookies = request.getCookies();

	out.println("���� ��Ű �� => " + cookies.length + "<br/>");

	for (int i = 1; i < cookies.length; i++) {
		String cookie = cookies[i].getName();
			cookies[i].setMaxAge(0);
			response.addCookie(cookies[i]);
			out.println("������ ��Ű�� �Ӽ��̸�(name) " + i + ": " + cookies[i].getName() + "<br/>");
			out.println("������ ��Ű�� �Ӽ���(value) " + i + ": " + cookies[i].getValue() + "<br/>");
	}
	%>
</body>
</html>