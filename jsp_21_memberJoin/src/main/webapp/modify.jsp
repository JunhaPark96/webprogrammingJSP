<%@page import="jsp_21_memberJoin.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������ ����</title>
</head>
<body>
	<%
		MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
	%>
	<h1>ȸ�� ���� ����</h1>
	<form action="modifyOk.jsp" method="post">
		���̵�: <%=loginUser.getId()%> <br>
		��й�ȣ: <input type="password" name="pw"> <br>
		�̸�: <input type="text" name="name" placeholder="<%=loginUser.getName()%>"> <br> 
		��ȭ��ȣ: <input type="text" name="phone" placeholder="<%=loginUser.getPhone()%>"> <br>
		����: <input type="text" name="gender" placeholder="<%=loginUser.getGender()%>"> <br>
		<input type="submit" value="�����ϱ�">
	</form>
</body>
</html>
