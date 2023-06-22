<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%!
		Connection conn;
		Statement stmt;
		ResultSet rs;
	%>
	
	<%
		conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@192.168.119.119:1521/dink09.dbsvr";
			String user = "scott";
			String password = "tiger";
			conn = DriverManager.getConnection(url, user, password);
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from member");
	%>
	
	<table border="1">
        <tr>
            <th>id</th>
            <th>password</th>
            <th>name</th>
            <th>phone_number</th>
        </tr>
        <% while (rs.next()) { %>
            <tr>
                <td><%= rs.getString("id") %></td>
                <td><%= rs.getString("password") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("phone_number") %></td>
            </tr>
        <% } %>
    </table>
	
	<%
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    %>
	
</body>
</html>