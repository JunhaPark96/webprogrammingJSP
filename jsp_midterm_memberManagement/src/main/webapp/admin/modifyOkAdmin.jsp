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
	// ���� �α��� �����(������)�� ID�� �ƴ�, ���� ����� �Ǵ� ȸ���� ID�� ��������
	String id = request.getParameter("id");
	String userPw = request.getParameter("userPw");
	String userName = request.getParameter("userName");
	String userPhone = request.getParameter("userPhone");
	String userEmail = request.getParameter("userEmail");
	String userMemberStatus = request.getParameter("userMemberStatus");
	String userMemberRole = request.getParameter("userMemberRole");

	
    // ȸ�������� ��� �ְų� null�� ��� ���� ȸ�� ���� ���
	String pw = (request.getParameter("pw") == null || request.getParameter("pw").equals("")) ? userPw : request.getParameter("pw");
	String name = (request.getParameter("name") == null || request.getParameter("name").equals("")) ? userName : request.getParameter("name");
	String phone = (request.getParameter("phone") == null || request.getParameter("phone").equals("")) ? userPhone : request.getParameter("phone");
	String email = (request.getParameter("email") == null || request.getParameter("email").equals("")) ? userEmail : request.getParameter("email");
	String memberStatus = (request.getParameter("memberStatus") == null || request.getParameter("memberStatus").equals("")) ? userMemberStatus : request.getParameter("memberStatus");
	String memberRole = (request.getParameter("memberRole") == null || request.getParameter("memberRole").equals("")) ? userMemberRole : request.getParameter("memberRole");
	// DAO ��ü ����
	MemberDAO memberDAO = new MemberDAO();
	
	// DTO ��ü ����
	MemberDTO dto = new MemberDTO(name, id, pw, phone, email, memberStatus, memberRole);
	
	// ���� ���θ� Ȯ���� ���� ����
	boolean result = false;

	if(loginUser.getMemberRole().equals("admin")) {
		// �������� ��� ȸ�� ���¿� ���ѵ� ���� ����
		result = memberDAO.adminModify(dto);
	} 

	if (result) {
		// ���� ���� �޽��� ���
		out.println("<script>alert('ȸ�������� ���������� �����Ǿ����ϴ�.'); location.href='memberManagement.jsp';</script>");
	} else {
		// ���� ���� �޽��� ���
		out.println("<script>alert('ȸ������ ������ �����Ͽ����ϴ�.'); history.back();</script>");
	}
	%>
</body>
</html>