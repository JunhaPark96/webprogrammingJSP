<%@page import="jsp_midterm_memberManagement.MemberDAO"%>
<%@page import="jsp_midterm_memberManagement.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
	// session을 통해 로그인 정보가 제대로 넘어왔는지 출력 확인
	//System.out.println(id + " " + pw + " " + name + " " + phone + " " + email);
	// 회원 정보 수정 메소드 호출
	boolean result = memberDAO.memberModify(dto);
	//System.out.println(result);
	//System.out.println(loginUser);
	if (result) {
		// 수정된 유저에 맞게 dto 수정
		session.setAttribute("loginUser", dto);
		// 수정 성공 메시지 출력
		out.println("<script>alert('회원정보가 성공적으로 수정되었습니다.'); location.href='main.jsp';</script>");
	} else {
		// 수정 실패 메시지 출력
		out.println("<script>alert('회원정보 수정에 실패하였습니다.'); history.back();</script>");
	}
	%>
</body>
</html>