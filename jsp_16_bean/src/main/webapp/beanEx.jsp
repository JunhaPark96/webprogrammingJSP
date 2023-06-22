<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="student" class="jsp_16_bean.Student" scope="page"></jsp:useBean>
	<jsp:setProperty name="student" property="name" value="홍길동"/>
	<jsp:setProperty name="student" property="age" value="20"/>
	<jsp:setProperty name="student" property="grade" value="10"/>
	<jsp:setProperty name="student" property="studentNum" value="011"/>
	학생이름: <jsp:getProperty name="student" property="name"/><br/>
	학생나이: <jsp:getProperty name="student" property="age"/><br/>
	학생학년: <jsp:getProperty name="student" property="grade"/><br/>
	학생번호: <jsp:getProperty name="student" property="studentNum"/><br/>

</body>
</html>