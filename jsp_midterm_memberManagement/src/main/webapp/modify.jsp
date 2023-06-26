<%@page import="jsp_midterm_memberManagement.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원정보 수정</title>
</head>
<body>
	<%
		// session의 정보로 로그인 한 유저에 대한 정보 받아오기
		MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
	%>
	<h1>회원 정보 수정</h1>
	<form action="modifyOk.jsp" method="post">
		아이디: <%=loginUser.getId()%> <br>
		비밀번호: <input type="password" name="pw"> <br>
		이름: <input type="text" name="name" placeholder="<%=loginUser.getName()%>"> <br> 
		전화번호: <input type="text" name="phone" placeholder="<%=loginUser.getPhone()%>"> <br>
		이메일: <input type="text" name="email" placeholder="<%=loginUser.getEmail()%>"> <br>
		<input type="submit" value="수정하기">
	</form>
</body>
</html>