<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <%
        String insertUrl = request.getContextPath() + "/insert.do";
        String updateUrl = request.getContextPath() + "/update.do";
        String selectUrl = request.getContextPath() + "/select.do";
        String deleteUrl = request.getContextPath() + "/delete.do";
    %>

    <form action="FrontCon" method="POST">
        <input type="submit" value="Insert">
    </form>

    <form action="<%= updateUrl %>" method="POST">
        <input type="submit" value="Update">
    </form>

    <form action="<%= selectUrl %>" method="POST">
        <input type="submit" value="Select">
    </form>

    <form action="<%= deleteUrl %>" method="POST">
        <input type="submit" value="Delete">
    </form> 
</body>
</html>