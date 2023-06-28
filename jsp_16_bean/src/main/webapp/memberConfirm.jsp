<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="member" class="jsp_16_bean.MemberBean" scope="session"></jsp:useBean>
	아이디: <jsp:getProperty property="id" name="member"/>
	비밀번호: <jsp:getProperty property="passwd" name="member"/>
	이름: <jsp:getProperty property="name" name="member"/>
	이메일: <jsp:getProperty property="email" name="member"/>
	<%
	session.invalidate();
	%>
</body>
</html>