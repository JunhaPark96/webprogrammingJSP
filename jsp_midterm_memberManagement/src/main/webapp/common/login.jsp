<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    // 로그인한 상태로 로그인 페이지 접속시 메인페이지로 이동
    if (session.getAttribute("loginUser") != null){
        response.sendRedirect("main.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 창</title>
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
            alert("아이디와 비밀번호는 필수입니다.");
            return false;
        }
    }
</script>
</head>
<body>
    <div class="login-container">
        <h1 class="login-title">환영합니다! 로그인 해주십시오</h1>
        <form name="loginForm" action="/LoginOk" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="id">아이디:</label>
                <input type="text" class="form-control" id="id" name="id">
            </div>
            <div class="form-group">
                <label for="pw">비밀번호:</label>
                <input type="password" class="form-control" id="pw" name="pw">
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">로그인</button>
            </div>
        </form>
    </div>
</body>
</html>
