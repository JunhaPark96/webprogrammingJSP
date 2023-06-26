<%@page import="jsp_midterm_memberManagement.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
	%>
	<%
		// 유저일 경우
	 	if (loginUser.getMemberRole().equals("user")){
	 		
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
		// 관리자일 경우
	 	} else {
	 		
	%>
		<form action="modifyOk.jsp" method="post" onsubmit="return validateForm()">
		아이디: <%=loginUser.getId()%> <br>
		비밀번호: <input type="password" name="pw"> <br>
		이름: <input type="text" name="name" placeholder="<%=loginUser.getName()%>"> <br> 
		전화번호: <%=loginUser.getPhone()%> <br>
		이메일: <input type="text" name="email" placeholder="<%=loginUser.getEmail()%>"> <br>
		<input type="submit" value="수정하기">
	</form>
	<%
	 	}
	%>
	
</body>
</html>