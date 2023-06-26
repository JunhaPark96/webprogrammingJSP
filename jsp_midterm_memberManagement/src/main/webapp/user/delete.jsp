<%@page import="jsp_midterm_memberManagement.MemberDAO"%>
<%@page import="jsp_midterm_memberManagement.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 탈퇴</title>
</head>
<body>
	<%
	// session 정보
	MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
	// 유저 id 정보
	if (loginUser != null) {
    // 유저 id 정보
    String id = loginUser.getId();
    MemberDAO memberDAO = new MemberDAO();
    System.out.println("user 상태는 " + loginUser.getMemberStatus());
    // memberStatus가 null이 아니면서 "normal" 상태일 때만 회원 탈퇴 신청 가능
    if (loginUser.getMemberStatus() != null && loginUser.getMemberStatus().equals("normal")){
        memberDAO.memberQuit(id);
        // 세션 종료 후 main 페이지 이동
        session.invalidate();
        response.sendRedirect("../common/main.jsp");
    } else {
        // 탈퇴 처리 실패 메시지 출력
        out.println("회원 탈퇴 처리 실패!");
    }
} else {
    out.println("로그인 사용자 정보가 없습니다.");
}
	%>
</body>
</html>