<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����������</title>
</head>
<body>
    <%= exception.getClass().getName() %>
    <%= exception.getMessage() %> <br/>
    <%= exception.toString() %> <br/>
    <% exception.printStackTrace(); %>
</body>
</html>
