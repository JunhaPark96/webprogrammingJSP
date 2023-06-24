<%@page import="jsp_21_memberJoin.MemberDTO"%>
<%@page import="jsp_21_memberJoin.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 인증</title>
</head>
<body>

	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO dto = memberDAO.memberFind(id);
		
		// 검증
		if (dto != null && dto.getPw().equals(pw)){
			// 로그인 성공
			System.out.println("로그인 성공");
			session.setAttribute("loginUser", dto);
			response.sendRedirect("main.jsp");
		} else{
			// 로그인 실패
			System.out.println("로그인 실패");
			response.sendRedirect("login.jsp");
			
		}
	%>
	
</body>
</html>