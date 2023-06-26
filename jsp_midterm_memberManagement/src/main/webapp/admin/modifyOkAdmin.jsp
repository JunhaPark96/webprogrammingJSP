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
	// 현재 로그인 사용자(관리자)의 ID가 아닌, 수정 대상이 되는 회원의 ID를 가져오기
	String id = request.getParameter("id");
	String userPw = request.getParameter("userPw");
	String userName = request.getParameter("userName");
	String userPhone = request.getParameter("userPhone");
	String userEmail = request.getParameter("userEmail");
	String userMemberStatus = request.getParameter("userMemberStatus");
	String userMemberRole = request.getParameter("userMemberRole");

	
    // 회원정보가 비어 있거나 null인 경우 원래 회원 정보 사용
	String pw = (request.getParameter("pw") == null || request.getParameter("pw").equals("")) ? userPw : request.getParameter("pw");
	String name = (request.getParameter("name") == null || request.getParameter("name").equals("")) ? userName : request.getParameter("name");
	String phone = (request.getParameter("phone") == null || request.getParameter("phone").equals("")) ? userPhone : request.getParameter("phone");
	String email = (request.getParameter("email") == null || request.getParameter("email").equals("")) ? userEmail : request.getParameter("email");
	String memberStatus = (request.getParameter("memberStatus") == null || request.getParameter("memberStatus").equals("")) ? userMemberStatus : request.getParameter("memberStatus");
	String memberRole = (request.getParameter("memberRole") == null || request.getParameter("memberRole").equals("")) ? userMemberRole : request.getParameter("memberRole");
	// DAO 객체 생성
	MemberDAO memberDAO = new MemberDAO();
	
	// DTO 객체 생성
	MemberDTO dto = new MemberDTO(name, id, pw, phone, email, memberStatus, memberRole);
	
	// 성공 여부를 확인할 변수 선언
	boolean result = false;

	if(loginUser.getMemberRole().equals("admin")) {
		// 관리자인 경우 회원 상태와 권한도 수정 가능
		result = memberDAO.adminModify(dto);
	} 

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