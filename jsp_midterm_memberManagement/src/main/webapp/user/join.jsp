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
<style>
    .form-container {
        max-width: 400px;
        margin: 0 auto;
        padding: 20px;
        background-color: #f8f8f8;
        border: 1px solid #eaeaea;
        border-radius: 4px;
    }

    .form-group {
        margin-bottom: 15px;
    }

    .form-group label {
        font-weight: bold;
    }

    .form-group input {
        width: 100%;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .form-group input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        cursor: pointer;
    }

    .form-group input[type="submit"]:hover {
        background-color: #45a049;
    }

    .error-message {
        color: red;
        font-size: 14px;
        margin-top: 5px;
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
    <div class="form-container">
        <form action="joinOk.jsp" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="name">�̸�:</label>
                <input type="text" id="name" name="name">
            </div>
            <div class="form-group">
                <label for="id">���̵�:</label>
                <input type="text" id="id" name="id">
            </div>
            <div class="form-group">
                <label for="pw">��й�ȣ:</label>
                <input type="password" id="pw" name="pw">
                <div class="error-message">��й�ȣ�� 4�� �̻��� �����ڿ� ���ڸ� �����ؾ� �մϴ�.</div>
            </div>
            <div class="form-group">
                <label for="phone">��ȭ��ȣ:</label>
                <input type="text" id="phone" name="phone">
                <div class="error-message">��ȭ��ȣ�� '010-xxxx-xxxx' �����̾�� �մϴ�.</div>
            </div>
            <div class="form-group">
                <label for="email">�̸���:</label>
                <input type="text" id="email" name="email">
                <div class="error-message">�̸����� '@'�� �����ؾ� �մϴ�.</div>
            </div>
            <div class="form-group">
                <input type="submit" value="ȸ������">
            </div>
        </form>
    </div>
</body>
</html>
