<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 정보 수정</title>
</head>
<body>
	<h1>회원 정보 수정</h1>
	<form action="ModifyResult" method="post">
		아이디: <%=session.getAttribute("loginId")%> <br>
		비밀번호: <input type="password" name="pw"> <br>
		이름: <input type="text" name="name" value="<%=session.getAttribute("loginName")%>"> <br> 
		전화번호: <input type="text" name="phone"> <br>
		성별: <input type="text" name="gender"> <br>
		<input type="submit" value="수정하기">
	</form>
</body>
</html>
