<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ���� ����</title>
</head>
<body>
	<h1>ȸ�� ���� ����</h1>
	<form action="ModifyResult" method="post">
		���̵�: <%=session.getAttribute("loginId")%> <br>
		��й�ȣ: <input type="password" name="pw"> <br>
		�̸�: <input type="text" name="name" value="<%=session.getAttribute("loginName")%>"> <br> 
		��ȭ��ȣ: <input type="text" name="phone"> <br>
		����: <input type="text" name="gender"> <br>
		<input type="submit" value="�����ϱ�">
	</form>
</body>
</html>
