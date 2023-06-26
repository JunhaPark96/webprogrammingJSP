<%@page import="jsp_midterm_memberManagement.MemberDAO"%>
<%@page import="jsp_midterm_memberManagement.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>메인 화면</title>
</head>
<body>
	<%
	// 로그인된 사용자 정보 가져오기
	MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
	if (loginUser != null) {
		// 관리자인 경우
		if (loginUser.getMemberRole().equals("admin")){
			%>
		<h1><%=loginUser.getName()%> 님, 어서오세요. 환영합니다. </h1>
			<h3> <a href="../admin/memberManagement.jsp">회원 관리</a> </h3>
			<h3> <a href="../common/logout.jsp">로그아웃</a></h3>
		
		<%
		// 사용자인 경우
		} else{ %>
			<h1><%=loginUser.getName()%> 님, 어서오세요. 환영합니다. </h1>
			<h3> <a href="../user/modify.jsp">회원정보 수정</a> </h3>
			<h3> <a href="../common/logout.jsp">로그아웃</a></h3>
			<h3> <a href="../user/delete.jsp">회원탈퇴</a></h3>
			<!-- 
			TODO: 회원 탈퇴 요청 보내기
			 -->
		
		<%	
		}
	%>
	<%
	// 로그인 하지 않은 경우
	} else {
	%>
	<h1>환영합니다. 로그인해주세요</h1>
	<h3><a href="../common/login.jsp">로그인</a></h3>
	<h3><a href="../user/join.jsp">회원가입</a></h3>
	<%
	}
	%>

</body>
</html>
