<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 정보 수정 완료</h1>
	<p>수정된 아이디: <%=session.getAttribute("loginId")%></p>
	<p>수정된 이름: <%=session.getAttribute("loginName")%></p>
	<p>수정된 비밀번호: <%=session.getAttribute("loginPw")%></p>
	<p>수정된 전화번호: <%=session.getAttribute("loginPhone")%></p>
	<p>수정된 성별: <%=session.getAttribute("loginGender")%></p>
	<h2><a href="modify.jsp">회원정보 수정</a></h2>
	<h2><a href="logout.jsp">로그아웃</a></h2>
</body>
</html>