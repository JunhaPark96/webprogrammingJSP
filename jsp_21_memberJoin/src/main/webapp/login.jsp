<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	if (session.getAttribute("loginUser") != null){
%>
	<jsp:forward page="main.jsp"></jsp:forward>	
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α���â</title>
</head>
<body>
	<h1>ȯ���մϴ�! �α��� ���ֽʽÿ�</h1>
	<form action="loginOk.jsp" method="post">
		���̵�: 	<input type="text" name="id"> <br>
		��й�ȣ: 	<input type="password" name="pw"> <br>
		<input type="submit" value="�α���">
	</form>
	
	<a href="memberManagement.jsp">��� ����Ʈ</a>
</body>
</html>