<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
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
<meta charset="utf-8">
<title>로그인창</title>
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
	<!-- TODO: main 페이지로 멤버리스트를 옮기고,
			관리자만 볼 수 있게끔 설정.
			관리자가 로그인했을 때 보이게끔 설정
	 -->
</body>
</html>