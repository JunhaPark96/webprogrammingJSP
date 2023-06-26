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
	// session 정보
	MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
	// 유저 id 정보
	String id = loginUser.getId();
	MemberDAO memberDAO = new MemberDAO();
	System.out.println("user 상태는 " + loginUser.getMemberStatus());
	// normal 상태일 때만 회원 탈퇴 신청 가능
	if (loginUser.getMemberStatus().equals("normal")){
		memberDAO.memberQuit(id);
		// 세션 종료 후 main 페이지 이동
		session.invalidate();
		response.sendRedirect("main.jsp");
	} else {
        // 탈퇴 처리 실패 메시지 출력
        out.println("회원 탈퇴 처리 실패!");
    }
	%>
</body>
</html>