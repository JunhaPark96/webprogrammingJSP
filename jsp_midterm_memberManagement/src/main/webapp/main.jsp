<%@page import="jsp_midterm_memberManagement.MemberDAO"%>
<%@page import="jsp_midterm_memberManagement.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ȭ��</title>
</head>
<body>
	<%
	// �α��ε� ����� ���� ��������
	MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
	if (loginUser != null) {
		// �������� ���
		if (loginUser.getMemberRole().equals("admin")){
			%>
		<h1><%=loginUser.getName()%> ��, �������. ȯ���մϴ�. </h1>
			<h3> <a href="memberManagement.jsp">ȸ�� ����</a> </h3>
			<h3> <a href="logout.jsp">�α׾ƿ�</a></h3>
		
		<%
		// ������� ���
		} else{ %>
			<h1><%=loginUser.getName()%> ��, �������. ȯ���մϴ�. </h1>
			<h3> <a href="modify.jsp">ȸ������ ����</a> </h3>
			<h3> <a href="logout.jsp">�α׾ƿ�</a></h3>
			<h3> <a href="delete.jsp">ȸ��Ż��</a></h3>
			<!-- 
			TODO: ȸ�� Ż�� ��û ������
			 -->
		
		<%	
		}
	%>
	<%
	// �α��� ���� ���� ���
	} else {
	%>
	<h1>ȯ���մϴ�. �α������ּ���</h1>
	<h3><a href="login.jsp">�α���</a></h3>
	<h3><a href="join.jsp">ȸ������</a></h3>
	<%
	}
	%>


</body>
</html>