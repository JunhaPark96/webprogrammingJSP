<%@page import="java.util.ArrayList"%>
<%@page import="jsp_21_memberJoin.MemberDAO"%>
<%@page import="jsp_21_memberJoin.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������ ����</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String gender = request.getParameter("gender");
	%>

	<%
	MemberDAO memberDAO = new MemberDAO();
	if (memberDAO.isIdExist(id)) {
		out.println("�̹� �����ϴ� ���̵� �Դϴ�");
		response.sendRedirect("join.jsp");
	} else {
		MemberDTO dto = new MemberDTO(id, pw, name, phone, gender);
		boolean result = memberDAO.memberJoin(dto);
		if (result) {
			response.sendRedirect("login.jsp");
		} else {
			response.sendRedirect("main.jsp");
			System.out.println("ȸ�� ���� ����");
		}
	}
	%>
</body>
</html>