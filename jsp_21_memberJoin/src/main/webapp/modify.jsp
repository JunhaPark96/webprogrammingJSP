<%@page import="jsp_21_memberJoin.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보 수정</title>
</head>
<body>
	<%
		MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
	%>
	<h1>회원 정보 수정</h1>
	<form action="modifyOk.jsp" method="post">
		아이디: <%=loginUser.getId()%> <br>
		비밀번호: <input type="password" name="pw"> <br>
		이름: <input type="text" name="name" placeholder="<%=loginUser.getName()%>"> <br> 
		전화번호: <input type="text" name="phone" placeholder="<%=loginUser.getPhone()%>"> <br>
		성별: <input type="text" name="gender" placeholder="<%=loginUser.getGender()%>"> <br>
		<input type="submit" value="수정하기">
	</form>
</body>
</html>
