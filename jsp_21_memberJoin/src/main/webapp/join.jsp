<%@page import="jsp_21_memberJoin.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ����</title>
</head>
<body>
	<form action="joinOk.jsp" method="post">
		���̵�: 	<input type="text" name="id"> <br>
		��й�ȣ: 	<input type="password" name="pw"> <br>
		�̸�: 	<input type="text" name="name"> <br> 
		��ȭ��ȣ: 	<input type="text" name="phone"> <br>
		����: 	<input type="radio" name="gender" value="M"> M
		<input type="radio" name="gender" value="F"> F<br>
		<input type="submit" value="ȸ������">
	</form>
	
</body>
</html>