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
	<%!Connection conn;
	Statement stmt;
	ResultSet rs;%>
	<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String phone_number = request.getParameter("phone_number");
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
		String sql = "INSERT INTO member (id, password, name, phone_number) VALUES ('" + id + "', '" + password + "', '"
		+ name + "', '" + phone_number + "')";

		stmt.executeUpdate(sql);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {

		if (stmt != null) {
			try {
		stmt.close();
			} catch (SQLException e) {
		e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
		conn.close();
			} catch (SQLException e) {
		e.printStackTrace();
			}
		}
	}
	%>
	<%
	response.sendRedirect("jdbcEx.jsp");
	%>

</body>
</html>