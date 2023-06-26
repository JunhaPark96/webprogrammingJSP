<%@page import="jsp_midterm_memberManagement.MemberDTO"%>
<%@page import="jsp_midterm_memberManagement.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인 인증</title>
</head>
<body>

	<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	MemberDAO memberDAO = new MemberDAO();
	MemberDTO dto = memberDAO.memberFind(id);
	// 검증
	
	if (dto.getMemberStatus().equals("pending")) {
		// 회원 승인 대기 중
		out.println("<script>alert('회원 승인 대기중입니다.'); location.href='main.jsp';</script>");
	} else if (dto.getMemberStatus().equals("pause")) {
		// 회원 일시 정지 상태
		out.println("<script>alert('임시 보호중인 계정입니다.'); location.href='main.jsp';</script>");
	} else {
		// 회원 상태 normal
		if (dto != null && dto.getPw().equals(pw)) {
			// 로그인 성공
			System.out.println("로그인 성공");
			session.setAttribute("loginUser", dto);
			response.sendRedirect("main.jsp");
		} else {
			// 로그인 실패
			System.out.println("로그인 실패");
			response.sendRedirect("login.jsp");

		}
	}
	%>

</body>
</html>