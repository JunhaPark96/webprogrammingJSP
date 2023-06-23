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
import java.sql.SQLException;

public class ModifyResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection conn;
    private PreparedStatement pstmt;
    
    public ModifyResult() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        service(request, response);
    }

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String id = (String) request.getSession().getAttribute("loginId");
        String pw = request.getParameter("pw");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");

        String query = "UPDATE member SET pw = ?, name = ?, phone = ?, gender = ? WHERE id = ?"; 

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url = "jdbc:oracle:thin:@192.168.119.119:1521/dink09.dbsvr";
            String user = "scott";
            String password = "tiger";
            conn = DriverManager.getConnection(url, user, password);

            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, pw);
            pstmt.setString(2, name);
            pstmt.setString(3, phone);
            pstmt.setString(4, gender);
            pstmt.setString(5, id);
            pstmt.executeUpdate();

            HttpSession session = request.getSession();
            session.setAttribute("loginName", name); 
            System.out.println("update success");
            response.sendRedirect("modifyResult.jsp");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
