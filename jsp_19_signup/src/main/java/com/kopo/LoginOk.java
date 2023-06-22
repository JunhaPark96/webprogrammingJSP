package com.kopo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Servlet implementation class LoginOk
 */
public class LoginOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String name;
	private String id;
	private String pw;
	private String phone;
	private String gender;

	private String query;
	private Connection conn;
	private Statement stmt;
	private int rs;
	
    public LoginOk() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		name = request.getParameter("name");
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		phone = request.getParameter("phone");
		gender = request.getParameter("gender");
		query = "insert into member values ('" + id + "', '" + pw + "', '" + name + "', '" + phone + "', '" + gender
				+ "')";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@192.168.119.119:1521/dink09.dbsvr";
			String user = "scott";
			String password = "tiger";
			conn = DriverManager.getConnection(url, user, password);
			conn.setAutoCommit(false);
			stmt = conn.createStatement();
			int rs = stmt.executeUpdate(query);

			if (rs == 1) {
				System.out.println("insert success");
				conn.commit();
				response.sendRedirect("joinResult.jsp");
			} else {
				System.out.println("insert failed");
				response.sendRedirect("join.html");
			}
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
	}
}
