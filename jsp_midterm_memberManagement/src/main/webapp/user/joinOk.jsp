<%@page import="jsp_midterm_memberManagement.MemberDTO"%>
<%@page import="jsp_midterm_memberManagement.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
request.setCharacterEncoding("EUC-KR");
response.setCharacterEncoding("EUC-KR");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������ ����</title>
</head>
<body>
	<%
	
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");

	MemberDAO memberDAO = new MemberDAO();
	// id �ߺ� üũ
	if(memberDAO.isIdExist(id)) {
		out.println("�̹� �����ϴ� ���̵��Դϴ�.");
		// ��ȭ��ȣ �ߺ� üũ
	} else if(memberDAO.isPhoneExist(phone)) {
		out.println("�̹� �����ϴ� ��ȭ��ȣ�Դϴ�.");
		
	} else {
		// �ߺ��� ���� ���
		MemberDTO dto = new MemberDTO(name, id, pw, phone, email);
		boolean result = memberDAO.memberJoin(dto);

		if (result) {
			response.sendRedirect("login.jsp");
		} else {
			response.sendRedirect("join.jsp");
			System.out.println("ȸ�� ���� ����");
		}
	}
	%>
</body>
</html>
