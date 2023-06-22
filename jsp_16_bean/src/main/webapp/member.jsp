<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="memberProc.jsp" method="post">
		아이디: 	<input type="text" name="id"> <br>
		비밀번호: 	<input type="password" name="passwd"> <br>
		이름: 	<input type="text" name="name"> <br> 
		이메일: 	<input type="text" name="email"> <br>
		<input type="submit" value="로그인">
	</form>
</body>
</html>