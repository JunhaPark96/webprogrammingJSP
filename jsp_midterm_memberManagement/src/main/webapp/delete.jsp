<%@page import="jsp_midterm_memberManagement.MemberDAO"%>
<%@page import="jsp_midterm_memberManagement.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원 탈퇴</title>
</head>
<body>
	<%
	MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
	MemberDAO memberDAO = new MemberDAO();
	
	if (loginUser.getMemberRole().equals("normal")){
		memberDAO.memberQuit(loginUser.getId());
		// 세션 종료 후 main 페이지 이동
		session.invalidate();
		response.sendRedirect("main.jsp");
	}
	%>
</body>
</html>