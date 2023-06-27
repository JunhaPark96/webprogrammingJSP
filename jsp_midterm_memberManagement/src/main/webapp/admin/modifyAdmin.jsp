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
<style>
    .form-container {
        max-width: 400px;
        margin: 0 auto;
        padding: 20px;
        background-color: #f8f8f8;
        border: 1px solid #eaeaea;
        border-radius: 4px;
    }

    .form-container h1 {
        text-align: center;
        margin-bottom: 20px;
    }

    .form-group {
        margin-bottom: 15px;
    }

    .form-group label {
        font-weight: bold;
        display: block;
    }

    .form-group input {
        width: 100%;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .form-group input[type="password"],
    .form-group input[readonly] {
        background-color: #f2f2f2;
    }

    .form-group input[type="submit"] {
        background-color: #0A82FF;
        color: white;
        cursor: pointer;
    }

    .form-group input[type="submit"]:hover {
        background-color: #64A0FF;
    }

    .form-group .radio-group {
        display: flex;
        text-align: center;
        margin-right: 15px;
    }

    .form-group .radio-group label {
        margin-right: 10px;
        border: 1px solid #ccc;
        padding: 4px 8px;
        border-radius: 4px;
        cursor: pointer;
        margin-right: 15px;
    }

    .form-group .radio-group input[type="radio"] {
        margin-right: 5px;
    }
    .status-box, .role-box {
        cursor: pointer;
        padding: 4px 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .status-box.active, .role-box.active {
        background-color: #0A82FF;
        color: white;
    }
</style>
<script>
    function validateForm() {
        var pw = document.getElementById("pw").value;
        // ��й�ȣ üũ
        if (pw.length < 4 || !pw.match(/^[A-Za-z0-9]+$/)) {
            alert("��й�ȣ�� 4�� �̻��� �����ڿ� ���ڷθ� �����Ǿ�� �մϴ�.");
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
    function toggleActiveStatus(event, status) {
        // ��� ���� ������ active Ŭ���� ����
        document.querySelectorAll('.status-box').forEach(function(box) {
            box.classList.remove('active');
        });
        // Ŭ���� ���� ���ڿ� active Ŭ���� �߰�
        event.target.classList.add('active');

        // hidden input�� ���� ������Ʈ
        document.getElementById('userMemberStatus').value = status;
    }

    function toggleActiveRole(event, role) {
        // ��� ���� ������ active Ŭ���� ����
        document.querySelectorAll('.role-box').forEach(function(box) {
            box.classList.remove('active');
        });
        // Ŭ���� ���� ���ڿ� active Ŭ���� �߰�
        event.target.classList.add('active');

        // hidden input�� ���� ������Ʈ
        document.getElementById('userMemberRole').value = role;
    }
</script>
</head>
<body>
    <%
    String id = request.getParameter("id");
    // session�� ������ �α����� �������� �޾ƿ���
    MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
    MemberDAO memberDAO = new MemberDAO();
    MemberDTO member = memberDAO.memberFind(id);
    /*
    if(member == null) {
        out.println(member.getPhone());
        return;
    }*/
    
    // ��ȭ��ȣ ����ŷ ó��
    String phone = member.getPhone();
    String maskedPhone = phone.substring(0, 4) + "XXXX" + phone.substring(8, 9) + "XXXX";
    %>
    <div class="form-container">
        <h1>ȸ�� ���� ����</h1>
        <form action="modifyOkAdmin.jsp" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                ���̵�: <%=member.getId()%>
            </div>
            <div class="form-group">
                <label for="pw">��й�ȣ</label>
                <input type="password" id="pw" name="pw">
            </div>
            <div class="form-group">
    			<label for="name">�̸�</label>
   				 <input type="text" id="name" name="name" value="<%=member.getName()%>">
			</div>
            <div class="form-group">
                <label for="phone">��ȭ��ȣ</label>
                <input type="text" id="phone" name="phone" value="<%=member.getPhone()%>" readonly>
            </div>
            <div class="form-group">
    			<label for="email">�̸���</label>
    			<input type="text" id="email" name="email" value="<%=member.getEmail()%>">
			</div>
            <div class="form-group">
        		<label>ȸ������</label>
        			<div class="status-group">
            			<div class="status-box <%=member.getMemberStatus().equals("pending") ? "active" : ""%>"
                 			onclick="toggleActiveStatus(event, 'pending')">���Խ��� ���</div>
            		<div class="status-box <%=member.getMemberStatus().equals("normal") ? "active" : ""%>"
                 			onclick="toggleActiveStatus(event, 'normal')">����</div>
            		<div class="status-box <%=member.getMemberStatus().equals("pause") ? "active" : ""%>"
                 			onclick="toggleActiveStatus(event, 'pause')">����</div>
        			</div>
    		</div>
            <input type="hidden" id="userMemberStatus" name="userMemberStatus" value="<%=member.getMemberStatus()%>">
            <div class="form-group">
        		<label>ȸ������</label>
        		<div class="role-group">
            		<div class="role-box <%=member.getMemberRole().equals("user") ? "active" : ""%>"
                 		onclick="toggleActiveRole(event, 'user')">����</div>
            		<div class="role-box <%=member.getMemberRole().equals("admin") ? "active" : ""%>"
                 		onclick="toggleActiveRole(event, 'admin')">������</div>
        		</div>
    		</div>
   			 <input type="hidden" id="userMemberRole" name="userMemberRole" value="<%=member.getMemberRole()%>">
            <!--  �����ڰ� �ƴ� ������ ������ ������ ���� -->
            <input type="hidden" name="id" value="<%=member.getId()%>">
            <input type="hidden" name="userPw" value="<%=member.getPw()%>">
            <input type="hidden" name="userName" value="<%=member.getName()%>">
            <input type="hidden" name="userPhone" value="<%=member.getPhone()%>">
            <input type="hidden" name="userEmail" value="<%=member.getEmail()%>">
            <input type="hidden" name="userMemberStatus" value="<%=member.getMemberStatus()%>">
            <input type="hidden" name="userMemberRole" value="<%=member.getMemberRole()%>">
            
            <div class="form-group">
                <input type="submit" value="�����ϱ�">
            </div>
        </form>
    </div>
    <%System.out.println(member);
    %>
</body>
</html>
