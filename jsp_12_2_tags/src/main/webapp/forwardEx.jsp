<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%!
		String id;
		String passwd;
	%>
	<%
		id = request.getParameter("id");
		passwd = request.getParameter("passwd");
	%>

	<h1>Forward ������ �Դϴ�</h1>
	���̵� : <%= id %> �Դϴ�<br/> 
	��й�ȣ : <%= passwd %> �Դϴ�<br/> 
</body>
</html>