<%@page import="jsp_midterm_memberManagement.MemberDAO"%>
<%@page import="jsp_midterm_memberManagement.MemberDTO"%>
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
<title>ȸ�� ���� ����</title>
</head>
<body>
	<%
	// ������ �ޱ�
	MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
	String id = loginUser.getId();

    // ȸ�������� ��� �ְų� null�� ��� ���� ����� ���� ���
    String pw = (request.getParameter("pw") == null || request.getParameter("pw").equals("")) ? loginUser.getPw() : request.getParameter("pw");
    String name = (request.getParameter("name") == null || request.getParameter("name").equals("")) ? loginUser.getName() : request.getParameter("name");
    String phone = (request.getParameter("phone") == null || request.getParameter("phone").equals("")) ? loginUser.getPhone() : request.getParameter("phone");
    String email = (request.getParameter("email") == null || request.getParameter("email").equals("")) ? loginUser.getEmail() : request.getParameter("email");

	// DAO ��ü ����
	MemberDAO memberDAO = new MemberDAO();
	
	// DTO ��ü ����
	MemberDTO dto = new MemberDTO(name, id, pw, phone, email);
	
	// ���� ���θ� Ȯ���� ���� ����
	boolean result = false;

	// ������� ��� �Ϲ� ������ ���� ����
	result = memberDAO.memberModify(dto);
	// ������ ������ �°� dto ����
	session.setAttribute("loginUser", dto);

	if (result) {
		// ���� ���� �޽��� ���
		out.println("<script>alert('ȸ�������� ���������� �����Ǿ����ϴ�.'); location.href='../common/main.jsp';</script>");
	} else {
		// ���� ���� �޽��� ���
		out.println("<script>alert('ȸ������ ������ �����Ͽ����ϴ�.'); history.back();</script>");
	}
	%>
</body>
</html>