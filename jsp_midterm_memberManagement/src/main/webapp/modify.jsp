<%@page import="jsp_midterm_memberManagement.MemberDAO"%>
<%@page import="jsp_midterm_memberManagement.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%
request.setCharacterEncoding("EUC-KR");
response.setCharacterEncoding("EUC-KR");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보 수정</title>
<script>
	function validateForm() {
		var pw = document.getElementById("pw").value;
		// 비밀번호 체크
		if (pw.length < 4 || !pw.match(/^[A-Za-z0-9]+$/)) {
			alert("비밀번호는 4자 이상의 영문자와 숫자로만 구성되어야 합니다.");
			return false;
		}
		// 전화번호 형식 체크
		var phone = document.getElementById("phone").value;
		if (!phone.match(/^010-\d{4}-\d{4}$/)) {
			alert("전화번호는 '010-xxxx-xxxx' 형식이어야 합니다.");
			return false;
		}
		// 이메일 형식 체크
		var email = document.getElementById("email").value;
		if (!email.includes("@")) {
			alert("이메일은 '@'를 포함해야 합니다.");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<%
	String id = request.getParameter("id");
	// session의 정보로 로그인 한 유저에 대한 정보 받아오기
	MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
	MemberDAO memberDAO = new MemberDAO();
	MemberDTO member = memberDAO.memberFind(id);
	
	// 관리자와 일반 사용자로 나누어서 화면을 보여줌
	if (loginUser.getMemberRole().equals("admin")) {
		// 관리자일 경우
	%>
	<h1>회원 정보 수정</h1>
	<form action="modifyOk.jsp" method="post" onsubmit="return validateForm()">
		아이디: <%=member.getId()%> <br>
		비밀번호: <input type="password" name="pw"> <br>
		이름: <input type="text" name="name" placeholder="<%=member.getName()%>"> <br> 
		전화번호: <%=member.getPhone()%> <br>
		이메일: <input type="text" name="email" placeholder="<%=member.getEmail()%>"> <br>
		 회원상태:
            <label><input type="radio" name="memberStatus" value="pending" <%=member.getMemberStatus().equals("pending") ? "checked" : ""%>>가입승인 대기</label>
            <label><input type="radio" name="memberStatus" value="normal" <%=member.getMemberStatus().equals("normal") ? "checked" : ""%>>정상</label>
            <label><input type="radio" name="memberStatus" value="pause" <%=member.getMemberStatus().equals("pause") ? "checked" : ""%>>정지</label><br>
         회원권한:
            <label><input type="radio" name="memberRole" value="user" <%=member.getMemberRole().equals("user") ? "checked" : ""%>>유저</label>
            <label><input type="radio" name="memberRole" value="admin" <%=member.getMemberRole().equals("admin") ? "checked" : ""%>>관리자</label><br>
		<input type="hidden" name="id" value="<%=member.getId()%>">
		<input type="submit" value="수정하기">
	</form>
	<%
	} else {
		// 사용자일 경우
	%>
	<h1>회원 정보 수정</h1>
	<form action="modifyOk.jsp" method="post" onsubmit="return validateForm()">
		아이디: <%=loginUser.getId()%> <br>
		비밀번호: <input type="password" name="pw"> <br>
		이름: <input type="text" name="name" placeholder="<%=loginUser.getName()%>"> <br> 
		전화번호: <input type="text" name="phone" placeholder="<%=loginUser.getPhone()%>"> <br>
		이메일: <input type="text" name="email" placeholder="<%=loginUser.getEmail()%>"> <br>
		<input type="submit" value="수정하기">
	</form>
	<%
	}
	%>
</body>
</html>
