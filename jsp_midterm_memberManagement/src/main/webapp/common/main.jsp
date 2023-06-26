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
      <% if (loginUser != null) {
            if (loginUser.getMemberRole() != null && loginUser.getMemberRole().equals("admin")) { %>
              <li class="nav-item active">
                <a class="nav-link" href="../admin/memberManagement.jsp">ȸ�� ����</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="../common/logout.jsp">�α׾ƿ�</a>
              </li>
          <% } else { %>
              <li class="nav-item">
                <a class="nav-link" href="../user/modify.jsp">ȸ������ ����</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="../common/logout.jsp">�α׾ƿ�</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="../user/delete.jsp">ȸ��Ż��</a>
              </li>
          <% } 
        } else { %>
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
<h1 class="text-center mt-4"><%=loginUser != null ? loginUser.getName() + "��, �������. ȯ���մϴ�." : "ȯ���մϴ�. �α������ּ���" %></h1>
</body>
</html>
