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
<title>회원 가입</title>
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
        // 비밀번호 체크
        if (pw.length < 4 || !pw.match(/^[A-Za-z0-9]+$/)) {
            alert("비밀번호는 4자 이상의 영문자와 숫자로만 구성되어야 합니다.");
            return false;
        }
        // 전화번호 형식 체크
        var phone = document.getElementById("phone").value;
        if (!phone.match(/^010-\d{4}-\d{4}$/)) {
            alert("전화번호는 '010-xxxx-xxxx' 형식이어야 합니다.");
            return false;
        }
        // 이메일 형식 체크
        var email = document.getElementById("email").value;
        if (!email.includes("@")) {
            alert("이메일은 '@'를 포함해야 합니다.");
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
                <label for="name">이름:</label>
                <input type="text" id="name" name="name">
            </div>
            <div class="form-group">
                <label for="id">아이디:</label>
                <input type="text" id="id" name="id">
            </div>
            <div class="form-group">
                <label for="pw">비밀번호:</label>
                <input type="password" id="pw" name="pw">
                <div class="error-message">비밀번호는 4자 이상의 영문자와 숫자를 포함해야 합니다.</div>
            </div>
            <div class="form-group">
                <label for="phone">전화번호:</label>
                <input type="text" id="phone" name="phone">
                <div class="error-message">전화번호는 '010-xxxx-xxxx' 형식이어야 합니다.</div>
            </div>
            <div class="form-group">
                <label for="email">이메일:</label>
                <input type="text" id="email" name="email">
                <div class="error-message">이메일은 '@'를 포함해야 합니다.</div>
            </div>
            <div class="form-group">
                <input type="submit" value="회원가입">
            </div>
        </form>
    </div>
</body>
</html>
