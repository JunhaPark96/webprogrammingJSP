<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Logout</title>
</head>
<body>
	<%
		session = request.getSession(false);
		if(session != null){
			//Remove session attributes
			//session.removeAttribute("loginId");
			//session.removeAttribute("loginName");
			//Invalidates this session and unbinds any objects bound to it.
			session.invalidate();  
		}
	%>
	<h1>�α׾ƿ� �Ǿ����ϴ�</h1>
	<a href="login.html">�ٽ� �α���</a>
</body>
</html>
