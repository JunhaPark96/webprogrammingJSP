<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>param ������ �Դϴ�</h1>
	<jsp:forward page="forwardEx.jsp">
		<jsp:param value="test" name="id"/>
		<jsp:param value="1234" name="passwd"/>
	</jsp:forward>
</body>
</html>