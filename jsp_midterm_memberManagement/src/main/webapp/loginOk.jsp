<%@page import="jsp_midterm_memberManagement.MemberDTO"%>
<%@page import="jsp_midterm_memberManagement.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α��� ����</title>
</head>
<body>

	<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	MemberDAO memberDAO = new MemberDAO();
	MemberDTO dto = memberDAO.memberFind(id);
	// ����
	
	if (dto.getMemberStatus().equals("pending")) {
		// ȸ�� ���� ��� ��
		out.println("<script>alert('ȸ�� ���� ������Դϴ�.'); location.href='main.jsp';</script>");
	} else if (dto.getMemberStatus().equals("pause")) {
		// ȸ�� �Ͻ� ���� ����
		out.println("<script>alert('�ӽ� ��ȣ���� �����Դϴ�.'); location.href='main.jsp';</script>");
	} else {
		// ȸ�� ���� normal
		if (dto != null && dto.getPw().equals(pw)) {
			// �α��� ����
			System.out.println("�α��� ����");
			session.setAttribute("loginUser", dto);
			response.sendRedirect("main.jsp");
		} else {
			// �α��� ����
			System.out.println("�α��� ����");
			response.sendRedirect("login.jsp");

		}
	}
	%>

</body>
</html>