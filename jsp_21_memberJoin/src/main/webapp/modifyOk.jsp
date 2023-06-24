<%@page import="jsp_21_memberJoin.MemberDAO"%>
<%@page import="jsp_21_memberJoin.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보 수정 완료</title>
</head>
<body>
	<%
	// 1. 데이터 받기
	MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
	String id = loginUser.getId();
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String gender = request.getParameter("gender");

	// DAO 객체 생성
	MemberDAO memberDAO = new MemberDAO();
	// DTO 객체 생성
	MemberDTO dto = new MemberDTO(id, pw, name, phone, gender);
	// 회원 정보 수정 메소드 호출
	boolean result = memberDAO.memberModify(dto);

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
