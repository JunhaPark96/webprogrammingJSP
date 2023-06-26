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
<title>회원 가입</title>
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
	<form action="joinOk.jsp" method="post" onsubmit="return validateForm()">
		이름: 	<input type="text" name="name"> <br>
		아이디: 	<input type="text" name="id"> <br>
		비밀번호: 	<input type="password" id="pw" name="pw"> 
        <div>비밀번호는 4자 이상의 영문자와 숫자를 포함해야 합니다.</div>
		전화번호: 	<input type="text" id="phone" name="phone"> 
		<div>전화번호는 '010-xxxx-xxxx' 형식이어야 합니다.</div>
		이메일: 	<input type="text" id="email" name="email"> 
		<div>이메일은 '@'를 포함해야 합니다.</div> <br>
		<input type="submit" value="회원가입">
	</form>
</body>
</html>
