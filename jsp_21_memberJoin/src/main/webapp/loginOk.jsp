<%@page import="jsp_21_memberJoin.MemberDTO"%>
<%@page import="jsp_21_memberJoin.MemberDAO"%>
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
		if (dto != null && dto.getPw().equals(pw)){
			// �α��� ����
			System.out.println("�α��� ����");
			session.setAttribute("loginUser", dto);
			response.sendRedirect("main.jsp");
		} else{
			// �α��� ����
			System.out.println("�α��� ����");
			response.sendRedirect("login.jsp");
			
		}
	%>
	
</body>
</html>