<%@page import="jsp_21_memberJoin.MemberDAO"%>
<%@page import="jsp_21_memberJoin.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������ ���� �Ϸ�</title>
</head>
<body>
	<%
	// 1. ������ �ޱ�
	MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
	String id = loginUser.getId();
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String gender = request.getParameter("gender");

	// DAO ��ü ����
	MemberDAO memberDAO = new MemberDAO();
	// DTO ��ü ����
	MemberDTO dto = new MemberDTO(id, pw, name, phone, gender);
	// ȸ�� ���� ���� �޼ҵ� ȣ��
	boolean result = memberDAO.memberModify(dto);

	if (result) {
		// ������ ������ �°� dto ����
		session.setAttribute("loginUser", dto);
		// ���� ���� �޽��� ���
		out.println("<script>alert('ȸ�������� ���������� �����Ǿ����ϴ�.'); location.href='main.jsp';</script>");
	} else {
		// ���� ���� �޽��� ���
		out.println("<script>alert('ȸ������ ������ �����Ͽ����ϴ�.'); history.back();</script>");
	}
	%>
</body>
</html>
