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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style>
    .login-container {
        max-width: 400px;
        margin: 0 auto;
        padding: 20px;
        background-color: #f8f8f8;
        border: 1px solid #eaeaea;
        border-radius: 4px;
    }

    .login-title {
        text-align: center;
        margin-bottom: 20px;
        font-size: 1.5rem;
        font-weight: bold;
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
</style>
<script type="text/javascript">
    function validateForm() {
        var id = document.forms["loginForm"]["id"].value;
        var pw = document.forms["loginForm"]["pw"].value;
        if (id == "" || pw == "") {
            alert("���̵�� ��й�ȣ�� �ʼ��Դϴ�.");
            return false;
        }
    }
</script>
</head>
<body>
    <div class="login-container">
        <h1 class="login-title">ȯ���մϴ�! �α��� ���ֽʽÿ�</h1>
        <form name="loginForm" action="/LoginOk" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="id">���̵�:</label>
                <input type="text" class="form-control" id="id" name="id">
            </div>
            <div class="form-group">
                <label for="pw">��й�ȣ:</label>
                <input type="password" class="form-control" id="pw" name="pw">
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">�α���</button>
            </div>
        </form>
    </div>
</body>
</html>
