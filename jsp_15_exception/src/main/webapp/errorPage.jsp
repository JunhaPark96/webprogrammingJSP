<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>에러페이지</title>
</head>
<body>
    <%= exception.getClass().getName() %>
    <%= exception.getMessage() %> <br/>
    <%= exception.toString() %> <br/>
    <% exception.printStackTrace(); %>
</body>
</html>
