<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%!
		String id;
		String passwd;
	%>
	<%
		id = request.getParameter("id");
		passwd = request.getParameter("passwd");
	%>

	<h1>Forward 페이지 입니다</h1>
	아이디 : <%= id %> 입니다<br/> 
	비밀번호 : <%= passwd %> 입니다<br/> 
</body>
</html>