<%@page import="jsp_midterm_memberManagement.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 가입</title>
</head>
<body>
	<form action="joinOk.jsp" method="post">
		아이디: 	<input type="text" name="id"> <br>
		비밀번호: 	<input type="password" name="pw"> <br>
		이름: 	<input type="text" name="name"> <br> 
		전화번호: 	<input type="text" name="phone"> <br>
		성별: 	<input type="radio" name="gender" value="M"> M
		<input type="radio" name="gender" value="F"> F<br>
		<input type="submit" value="회원가입">
	</form>
	
</body>
</html>