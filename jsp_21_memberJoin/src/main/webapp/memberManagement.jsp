<%@page import="jsp_21_memberJoin.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jsp_21_memberJoin.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 모두 표시</title>
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
		String gender = dto.getGender();

		out.println(" 아이디: " + id + " 비밀번호: " + pw + " 이름: " + name + " 전화번호: " + phone + " 성별: " + gender + "<br/>");
	}
	%>
</body>
</html>