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
	���̵�: <jsp:getProperty property="id" name="member"/>
	��й�ȣ: <jsp:getProperty property="passwd" name="member"/>
	�̸�: <jsp:getProperty property="name" name="member"/>
	�̸���: <jsp:getProperty property="email" name="member"/>
</body>
</html>