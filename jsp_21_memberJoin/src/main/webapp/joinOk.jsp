<%@page import="java.util.ArrayList"%>
<%@page import="jsp_21_memberJoin.MemberDAO"%>
<%@page import="jsp_21_memberJoin.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String gender = request.getParameter("gender");

	MemberDAO memberDAO = new MemberDAO();
	if(memberDAO.isIdExist(id)) {
		out.println("이미 존재하는 아이디입니다.");
	} else if(memberDAO.isPhoneExist(phone)) {
		out.println("이미 존재하는 전화번호입니다.");
	} else {
		MemberDTO dto = new MemberDTO(id, pw, name, phone, gender);
		boolean result = memberDAO.memberJoin(dto);

		if (result) {
			response.sendRedirect("login.jsp");
		} else {
			response.sendRedirect("main.jsp");
			System.out.println("회원 가입 실패");
		}
	}
	%>
</body>
</html>
