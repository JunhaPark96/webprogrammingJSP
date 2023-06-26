<%@page import="jsp_midterm_memberManagement.MemberDTO"%>
<%@page import="jsp_midterm_memberManagement.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");

	MemberDAO memberDAO = new MemberDAO();
	// id 중복 체크
	if(memberDAO.isIdExist(id)) {
		out.println("이미 존재하는 아이디입니다.");
		// 전화번호 중복 체크
	} else if(memberDAO.isPhoneExist(phone)) {
		out.println("이미 존재하는 전화번호입니다.");
		
	} else {
		// 중복이 없는 경우
		MemberDTO dto = new MemberDTO(name, id, pw, phone, email);
		boolean result = memberDAO.memberJoin(dto);

		if (result) {
			response.sendRedirect("login.jsp");
		} else {
			response.sendRedirect("join.jsp");
			System.out.println("회원 가입 실패");
		}
	}
	%>
</body>
</html>
