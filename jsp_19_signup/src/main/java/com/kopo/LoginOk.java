package com.kopo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class LoginOk
 */
public class LoginOk extends HttpServlet {
	private static final long serialVersionUID = 1L;

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
	
    public LoginOk() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String query = "SELECT * FROM member WHERE id = ? AND pw = ?"; 

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@192.168.119.119:1521/dink09.dbsvr";
			String user = "scott";
			String password = "tiger";
			conn = DriverManager.getConnection(url, user, password);

			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();

			if (rs.next()) { // if user exists
				String name = rs.getString("name"); // assuming the column name for the name is 'name'
				HttpSession session = request.getSession();
				session.setAttribute("loginId", id); // set id to session attribute
				session.setAttribute("loginName", name); // set name to session attribute
				System.out.println("login success");
				response.sendRedirect("loginResult.jsp");
			} else {
				System.out.println("login failed");
				response.sendRedirect("login.html");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
