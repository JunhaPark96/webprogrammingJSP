<%@page import="jsp_midterm_memberManagement.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jsp_midterm_memberManagement.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원 관리</title>
</head>
<body>
	<%
	MemberDAO memberDAO = new MemberDAO();
	ArrayList<MemberDTO> dtos = memberDAO.memberSelectAll();

	for (int i = 0; i < dtos.size(); i++) {
		MemberDTO dto = dtos.get(i);

		String id = dto.getId();
		String pw = dto.getPw();
		String name = dto.getName();
		String phone = dto.getPhone();
		String email = dto.getEmail();
		String memberStatus = dto.getMemberStatus();
		String memberRole = dto.getMemberRole();

		out.println(" 이름: " + name + " 아이디: " + id + " 비밀번호: " + pw + " 전화번호: " + phone + " 이메일: " + email + " 회원상태: " + memberStatus + " 회원권한: " + memberRole + "<br/>");
	}
	%>
</body>
</html>