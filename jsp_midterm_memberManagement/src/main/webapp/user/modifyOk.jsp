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
<title>회원 수정 검증</title>
</head>
<body>
	<%
	// 데이터 받기
	MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
	String id = loginUser.getId();

    // 회원정보가 비어 있거나 null인 경우 기존 사용자 정보 사용
    String pw = (request.getParameter("pw") == null || request.getParameter("pw").equals("")) ? loginUser.getPw() : request.getParameter("pw");
    String name = (request.getParameter("name") == null || request.getParameter("name").equals("")) ? loginUser.getName() : request.getParameter("name");
    String phone = (request.getParameter("phone") == null || request.getParameter("phone").equals("")) ? loginUser.getPhone() : request.getParameter("phone");
    String email = (request.getParameter("email") == null || request.getParameter("email").equals("")) ? loginUser.getEmail() : request.getParameter("email");

	// DAO 객체 생성
	MemberDAO memberDAO = new MemberDAO();
	
	// DTO 객체 생성
	MemberDTO dto = new MemberDTO(name, id, pw, phone, email);
	
	// 성공 여부를 확인할 변수 선언
	boolean result = false;

	// 사용자인 경우 일반 정보만 수정 가능
	result = memberDAO.memberModify(dto);
	// 수정된 유저에 맞게 dto 수정
	session.setAttribute("loginUser", dto);

	if (result) {
		// 수정 성공 메시지 출력
		out.println("<script>alert('회원정보가 성공적으로 수정되었습니다.'); location.href='../common/main.jsp';</script>");
	} else {
		// 수정 실패 메시지 출력
		out.println("<script>alert('회원정보 수정에 실패하였습니다.'); history.back();</script>");
	}
	%>
</body>
</html>