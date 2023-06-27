<%@page import="jsp_midterm_memberManagement.MemberDAO"%>
<%@page import="jsp_midterm_memberManagement.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ȭ��</title>
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
// �α��ε� ����� ���� ��������
MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">ȸ�� ����</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <% if (loginUser != null) { %>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <%=loginUser.getName() + "���� �޴�"%>
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
              <% if (loginUser.getMemberRole() != null && loginUser.getMemberRole().equals("admin")) { // �������� ���%>
                <a class="dropdown-item" href="../admin/memberManagement.jsp">ȸ�� ����</a>
              <% } else { %>
                <a class="dropdown-item" href="../user/modify.jsp">ȸ������ ����</a>
                <a class="dropdown-item" href="../user/delete.jsp">ȸ��Ż��</a>
              <% } %>
              <a class="dropdown-item" href="../common/logout.jsp">�α׾ƿ�</a>
            </div>
          </li>
      <% } else { // ������� ���%>
          <li class="nav-item">
            <a class="nav-link" href="../common/login.jsp">�α���</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../user/join.jsp">ȸ������</a>
          </li>
      <% } %>
    </ul>
  </div>
</nav>
<h1 class="main-title"><%=loginUser != null ? loginUser.getName() + "��, �������. ȯ���մϴ�." : "ȯ���մϴ�. �α������ּ���" %></h1>
</body>
</html>
