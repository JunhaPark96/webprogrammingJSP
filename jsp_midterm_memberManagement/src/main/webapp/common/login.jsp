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
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
    <div class="container">
        <h1 class="text-center mt-4">환영합니다! 로그인 해주십시오</h1>
        <div class="row justify-content-center">
            <div class="col-4">
                <form name="loginForm" action="loginOk.jsp" method="post" onsubmit="return validateForm()">
                    <div class="form-group">
                        <label for="id">아이디:</label>
                        <input type="text" class="form-control" id="id" name="id">
                    </div>
                    <div class="form-group">
                        <label for="pw">비밀번호:</label>
                        <input type="password" class="form-control" id="pw" name="pw">
                    </div>
                    <button type="submit" class="btn btn-primary">로그인</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
