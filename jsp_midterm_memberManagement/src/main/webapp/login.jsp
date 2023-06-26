<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	// 로그인한 상태로 로그인 페이지 접속시 메인페이지로 이동
	if (session.getAttribute("loginUser") != null){
		response.sendRedirect("main.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 창</title>

</head>
<body>
	<h1>환영합니다! 로그인 해주십시오</h1>
	<form action="loginOk.jsp" method="post">
		아이디: 	<input type="text" name="id"> <br>
		비밀번호: 	<input type="password" name="pw"> <br>
		<input type="submit" value="로그인">
	</form>
	<!--  TODO: 회원 상태가 'pending'이거나 'pause' 상태면 로그인 불가. 'normal' 상태일때만 로그인 가능
				'pending' 상태라면 자바스크립트로 '회원 심사 중입니다' alert, 
				'pause' 상태라면 '계정이 임시 보호 조치 되었습니다' alert
		--> 
</body>
</html>