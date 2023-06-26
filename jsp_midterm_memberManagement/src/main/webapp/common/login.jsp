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
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
    <div class="container">
        <h1 class="text-center mt-4">ȯ���մϴ�! �α��� ���ֽʽÿ�</h1>
        <div class="row justify-content-center">
            <div class="col-4">
                <form name="loginForm" action="loginOk.jsp" method="post" onsubmit="return validateForm()">
                    <div class="form-group">
                        <label for="id">���̵�:</label>
                        <input type="text" class="form-control" id="id" name="id">
                    </div>
                    <div class="form-group">
                        <label for="pw">��й�ȣ:</label>
                        <input type="password" class="form-control" id="pw" name="pw">
                    </div>
                    <button type="submit" class="btn btn-primary">�α���</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
