<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>ȸ�� ���� ���� �Ϸ�</h1>
	<p>������ ���̵�: <%=session.getAttribute("loginId")%></p>
	<p>������ �̸�: <%=session.getAttribute("loginName")%></p>
	<p>������ ��й�ȣ: <%=session.getAttribute("loginPw")%></p>
	<p>������ ��ȭ��ȣ: <%=session.getAttribute("loginPhone")%></p>
	<p>������ ����: <%=session.getAttribute("loginGender")%></p>
	<h2><a href="modify.jsp">ȸ������ ����</a></h2>
	<h2><a href="logout.jsp">�α׾ƿ�</a></h2>
</body>
</html>