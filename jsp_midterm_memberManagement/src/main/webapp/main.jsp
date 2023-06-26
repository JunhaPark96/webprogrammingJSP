<%@page import="jsp_midterm_memberManagement.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>메인 화면</title>
</head>
<body>
	<%
	// 로그인된 사용자 정보 가져오기
	MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
	if (loginUser != null) {
		// 로그인 한 경우
	%>
	<h1><%=loginUser.getName()%> 님, 어서오세요. 환영합니다. </h1>
	<h3> <a href="modify.jsp">회원정보 수정</a> </h3>
	<h3> <a href="logout.jsp">로그아웃</a></h3>
	<%
	} else {
	// 로그인 하지 않은 경우
	%>
	<h1>환영합니다. 로그인해주세요</h1>
	<h3><a href="login.jsp">로그인</a></h3>
	<h3><a href="join.jsp">회원가입</a></h3>
	<%
	}
	%>


</body>
</html>