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
        background-color: #4CAF50;
        color: white;
        cursor: pointer;
    }

    .form-group input[type="submit"]:hover {
        background-color: #45a049;
    }

    .form-group .radio-group {
        display: flex;
        justify-content: center;
    }

    .form-group .radio-group label {
        margin-right: 10px;
        border: 1px solid #ccc;
        padding: 4px 8px;
        border-radius: 4px;
        cursor: pointer;
    }

    .form-group .radio-group input[type="radio"] {
        margin-right: 5px;
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
    String id = request.getParameter("id");
    // session의 정보로 로그인 한 유정보 받아오기
    MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
    MemberDAO memberDAO = new MemberDAO();
    MemberDTO member = memberDAO.memberFind(id);
    
    // 전화번호 마스킹 처리
    String phone = member.getPhone();
    String maskedPhone = phone.substring(0, 4) + "XXXX" + phone.substring(8, 9) + "XXXX";
    %>
    <div class="form-container">
        <h1>회원 정보 수정</h1>
        <form action="modifyOkAdmin.jsp" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                아이디: <%=member.getId()%>
            </div>
            <div class="form-group">
                <label for="pw">비밀번호</label>
                <input type="password" id="pw" name="pw">
            </div>
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" placeholder="<%=member.getName()%>">
            </div>
            <div class="form-group">
                <label for="phone">전화번호</label>
                <input type="text" id="phone" name="phone" value="<%=maskedPhone%>" readonly>
            </div>
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="text" id="email" name="email" placeholder="<%=member.getEmail()%>">
            </div>
            <div class="form-group">
                <label>회원상태:</label>
                <div class="radio-group">
                    <label><input type="radio" name="memberStatus" value="pending" <%=member.getMemberStatus().equals("pending") ? "checked" : ""%>>가입승인 대기</label>
                    <label><input type="radio" name="memberStatus" value="normal" <%=member.getMemberStatus().equals("normal") ? "checked" : ""%>>정상</label>
                    <label><input type="radio" name="memberStatus" value="pause" <%=member.getMemberStatus().equals("pause") ? "checked" : ""%>>정지</label>
                </div>
            </div>
            <div class="form-group">
                <label>회원권한:</label>
                <div class="radio-group">
                    <label><input type="radio" name="memberRole" value="user" <%=member.getMemberRole().equals("user") ? "checked" : ""%>>유저</label>
                    <label><input type="radio" name="memberRole" value="admin" <%=member.getMemberRole().equals("admin") ? "checked" : ""%>>관리자</label>
                </div>
            </div>
            <!--  관리자가 아닌 유저의 정보를 보내기 위함 -->
            <input type="hidden" name="id" value="<%=member.getId()%>">
            <input type="hidden" name="userPw" value="<%=member.getPw()%>">
            <input type="hidden" name="userName" value="<%=member.getName()%>">
            <input type="hidden" name="userPhone" value="<%=member.getPhone()%>">
            <input type="hidden" name="userEmail" value="<%=member.getEmail()%>">
            <input type="hidden" name="userMemberStatus" value="<%=member.getMemberStatus()%>">
            <input type="hidden" name="userMemberRole" value="<%=member.getMemberRole()%>">
            
            <div class="form-group">
                <input type="submit" value="수정하기">
            </div>
        </form>
    </div>
</body>
</html>
