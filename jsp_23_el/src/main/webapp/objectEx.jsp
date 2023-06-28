<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	pageContext.setAttribute("id", "pw1");
	request.setAttribute("id", "pw2");
	session.setAttribute("id", "pw3");
	application.setAttribute("id", "pw4");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="objectOkEx.jsp" method="post">
		아이디 <input type="text" id="id" name="id"><br/>
		비밀번호 <input type="text" id="pw" name="pw"><br/>
		<button type="submit">전송 </button>
	</form>
	
</body>
</html>