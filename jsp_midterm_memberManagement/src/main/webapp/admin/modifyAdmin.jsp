<%@page import="jsp_midterm_memberManagement.MemberDAO"%>
<%@page import="jsp_midterm_memberManagement.MemberDTO"%>
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
<title>ȸ������ ����</title>
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
	<%
	String id = request.getParameter("id");
	// session�� ������ �α��� �� ������ ���� ���� �޾ƿ���
	MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
	MemberDAO memberDAO = new MemberDAO();
	MemberDTO member = memberDAO.memberFind(id);
	%>
	<h1>ȸ�� ���� ����</h1>
	<form action="modifyOkAdmin.jsp" method="post" onsubmit="return validateForm()">
		���̵�: <%=member.getId()%> <br>
		��й�ȣ: <input type="password" name="pw"> <br>
		�̸�: <input type="text" name="name" placeholder="<%=member.getName()%>"> <br> 
		��ȭ��ȣ: <%=member.getPhone()%> <br>
		�̸���: <input type="text" name="email" placeholder="<%=member.getEmail()%>"> <br>
		 ȸ������:
            <label><input type="radio" name="memberStatus" value="pending" <%=member.getMemberStatus().equals("pending") ? "checked" : ""%>>���Խ��� ���</label>
            <label><input type="radio" name="memberStatus" value="normal" <%=member.getMemberStatus().equals("normal") ? "checked" : ""%>>����</label>
            <label><input type="radio" name="memberStatus" value="pause" <%=member.getMemberStatus().equals("pause") ? "checked" : ""%>>����</label><br>
         ȸ������:
            <label><input type="radio" name="memberRole" value="user" <%=member.getMemberRole().equals("user") ? "checked" : ""%>>����</label>
            <label><input type="radio" name="memberRole" value="admin" <%=member.getMemberRole().equals("admin") ? "checked" : ""%>>������</label><br>
         <!--  �����ڰ� �ƴ� ������ ������ ������ ���� -->
		<input type="hidden" name="id" value="<%=member.getId()%>">
		<input type="hidden" name="userPw" value="<%=member.getPw()%>">
		<input type="hidden" name="userName" value="<%=member.getName()%>">
		<input type="hidden" name="userPhone" value="<%=member.getPhone()%>">
		<input type="hidden" name="userEmail" value="<%=member.getEmail()%>">
		<input type="hidden" name="userMemberStatus" value="<%=member.getMemberStatus()%>">
		<input type="hidden" name="userMemberRole" value="<%=member.getMemberRole()%>">
		
		<input type="submit" value="�����ϱ�">
	</form>
</body>
</html>
