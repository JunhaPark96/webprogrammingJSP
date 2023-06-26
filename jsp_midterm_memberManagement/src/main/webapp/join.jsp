<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
request.setCharacterEncoding("EUC-KR");
response.setCharacterEncoding("EUC-KR");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ����</title>
<script>
	function validateForm() {
		var pw = document.getElementById("pw").value;
		// ��й�ȣ üũ
		if (pw.length < 4 || !pw.match(/^[A-Za-z0-9]+$/)) {
			alert("��й�ȣ�� 4�� �̻��� �����ڿ� ���ڷθ� �����Ǿ�� �մϴ�.");
			return false;
		}
		// ��ȭ��ȣ ���� üũ
		var phone = document.getElementById("phone").value;
		if (!phone.match(/^010-\d{4}-\d{4}$/)) {
			alert("��ȭ��ȣ�� '010-xxxx-xxxx' �����̾�� �մϴ�.");
			return false;
		}
		// �̸��� ���� üũ
		var email = document.getElementById("email").value;
		if (!email.includes("@")) {
			alert("�̸����� '@'�� �����ؾ� �մϴ�.");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<form action="joinOk.jsp" method="post" onsubmit="return validateForm()">
		�̸�: 	<input type="text" name="name"> <br>
		���̵�: 	<input type="text" name="id"> <br>
		��й�ȣ: 	<input type="password" id="pw" name="pw"> 
        <div>��й�ȣ�� 4�� �̻��� �����ڿ� ���ڸ� �����ؾ� �մϴ�.</div>
		��ȭ��ȣ: 	<input type="text" id="phone" name="phone"> 
		<div>��ȭ��ȣ�� '010-xxxx-xxxx' �����̾�� �մϴ�.</div>
		�̸���: 	<input type="text" id="email" name="email"> 
		<div>�̸����� '@'�� �����ؾ� �մϴ�.</div> <br>
		<input type="submit" value="ȸ������">
	</form>
</body>
</html>
