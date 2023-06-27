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
    function toggleActiveStatus(event, status) {
        // 모든 상태 상자의 active 클래스 제거
        document.querySelectorAll('.status-box').forEach(function(box) {
            box.classList.remove('active');
        });
        // 클릭한 상태 상자에 active 클래스 추가
        event.target.classList.add('active');

        // hidden input의 값을 업데이트
        document.getElementById('userMemberStatus').value = status;
    }

    function toggleActiveRole(event, role) {
        // 모든 역할 상자의 active 클래스 제거
        document.querySelectorAll('.role-box').forEach(function(box) {
            box.classList.remove('active');
        });
        // 클릭한 역할 상자에 active 클래스 추가
        event.target.classList.add('active');

        // hidden input의 값을 업데이트
        document.getElementById('userMemberRole').value = role;
    }
</script>
</head>
<body>
    <%
    String id = request.getParameter("id");
    // session의 정보로 로그인한 유저정보 받아오기
    MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
    MemberDAO memberDAO = new MemberDAO();
    MemberDTO member = memberDAO.memberFind(id);
    /*
    if(member == null) {
        out.println(member.getPhone());
        return;
    }*/
    
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
   				 <input type="text" id="name" name="name" value="<%=member.getName()%>">
			</div>
            <div class="form-group">
                <label for="phone">전화번호</label>
                <input type="text" id="phone" name="phone" value="<%=member.getPhone()%>" readonly>
            </div>
            <div class="form-group">
    			<label for="email">이메일</label>
    			<input type="text" id="email" name="email" value="<%=member.getEmail()%>">
			</div>
            <div class="form-group">
        		<label>회원상태</label>
        			<div class="status-group">
            			<div class="status-box <%=member.getMemberStatus().equals("pending") ? "active" : ""%>"
                 			onclick="toggleActiveStatus(event, 'pending')">가입승인 대기</div>
            		<div class="status-box <%=member.getMemberStatus().equals("normal") ? "active" : ""%>"
                 			onclick="toggleActiveStatus(event, 'normal')">정상</div>
            		<div class="status-box <%=member.getMemberStatus().equals("pause") ? "active" : ""%>"
                 			onclick="toggleActiveStatus(event, 'pause')">정지</div>
        			</div>
    		</div>
            <input type="hidden" id="userMemberStatus" name="userMemberStatus" value="<%=member.getMemberStatus()%>">
            <div class="form-group">
        		<label>회원권한</label>
        		<div class="role-group">
            		<div class="role-box <%=member.getMemberRole().equals("user") ? "active" : ""%>"
                 		onclick="toggleActiveRole(event, 'user')">유저</div>
            		<div class="role-box <%=member.getMemberRole().equals("admin") ? "active" : ""%>"
                 		onclick="toggleActiveRole(event, 'admin')">관리자</div>
        		</div>
    		</div>
   			 <input type="hidden" id="userMemberRole" name="userMemberRole" value="<%=member.getMemberRole()%>">
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
    <%System.out.println(member);
    %>
</body>
</html>
