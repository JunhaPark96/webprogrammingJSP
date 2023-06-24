<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인창</title>
</head>
<body>
	<h1>환영합니다! 로그인 해주십시오</h1>
	<form action="loginOk.jsp" method="post">
		아이디: 	<input type="text" name="id"> <br>
		비밀번호: 	<input type="password" name="pw"> <br>
		<input type="submit" value="로그인">
	</form>
	
	<a href="memberManagement.jsp">멤버 리스트</a>
</body>
</html>