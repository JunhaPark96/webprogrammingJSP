<%@page import="jsp_midterm_memberManagement.MemberDAO"%>
<%@page import="jsp_midterm_memberManagement.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%
request.setCharacterEncoding("EUC-KR");
response.setCharacterEncoding("EUC-KR");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보 수정</title>
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
    <%
    // session의 정보로 로그인 한 유저에 대한 정보 받아오기
    MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
    String id = loginUser.getId();
    MemberDAO memberDAO = new MemberDAO();
    MemberDTO member = memberDAO.memberFind(id);
    %>
    <div class="form-container">
        <h1>회원 정보 수정</h1>
        <form action="modifyOk.jsp" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                아이디: <%=loginUser.getId()%>
            </div>
            <div class="form-group">
                <label for="pw">비밀번호</label>
                <input type="password" id="pw" name="pw">
            </div>
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" placeholder="<%=loginUser.getName()%>">
            </div>
            <div class="form-group">
                <label for="phone">전화번호</label>
                <input type="text" id="phone" name="phone" placeholder="<%=loginUser.getPhone()%>">
            </div>
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="text" id="email" name="email" placeholder="<%=loginUser.getEmail()%>">
            </div>
            <div class="form-group">
                <input type="submit" value="수정하기">
            </div>
        </form>
    </div>
</body>
</html>
