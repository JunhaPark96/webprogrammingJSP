<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	// �α����� ���·� �α��� ������ ���ӽ� ������������ �̵�
	if (session.getAttribute("loginUser") != null){
		response.sendRedirect("main.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α��� â</title>

</head>
<body>
	<h1>ȯ���մϴ�! �α��� ���ֽʽÿ�</h1>
	<form action="loginOk.jsp" method="post">
		���̵�: 	<input type="text" name="id"> <br>
		��й�ȣ: 	<input type="password" name="pw"> <br>
		<input type="submit" value="�α���">
	</form>
	<!--  TODO: ȸ�� ���°� 'pending'�̰ų� 'pause' ���¸� �α��� �Ұ�. 'normal' �����϶��� �α��� ����
				'pending' ���¶�� �ڹٽ�ũ��Ʈ�� 'ȸ�� �ɻ� ���Դϴ�' alert, 
				'pause' ���¶�� '������ �ӽ� ��ȣ ��ġ �Ǿ����ϴ�' alert
		--> 
</body>
</html>