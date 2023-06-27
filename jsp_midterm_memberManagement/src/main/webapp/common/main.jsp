<%@page import="jsp_midterm_memberManagement.MemberDAO"%>
<%@page import="jsp_midterm_memberManagement.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>메인 화면</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
    .main-title {
        text-align: center;
        margin-top: 4rem;
        font-size: 2rem;
        font-weight: bold;
    }
</style>
</head>
<body>
<%
// 로그인된 사용자 정보 가져오기
MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">회원 관리</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <% if (loginUser != null) {
            if (loginUser.getMemberRole() != null && loginUser.getMemberRole().equals("admin")) { %>
              <li class="nav-item active">
                <a class="nav-link" href="../admin/memberManagement.jsp">회원 관리</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="../common/logout.jsp">로그아웃</a>
              </li>
          <% } else { %>
              <li class="nav-item">
                <a class="nav-link" href="../user/modify.jsp">회원정보 수정</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="../common/logout.jsp">로그아웃</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="../user/delete.jsp">회원탈퇴</a>
              </li>
          <% } 
        } else { %>
          <li class="nav-item">
            <a class="nav-link" href="../common/login.jsp">로그인</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../user/join.jsp">회원가입</a>
          </li>
      <% } %>
    </ul>
  </div>
</nav>
<h1 class="main-title"><%=loginUser != null ? loginUser.getName() + "님, 어서오세요. 환영합니다." : "환영합니다. 로그인해주세요" %></h1>
</body>
</html>
