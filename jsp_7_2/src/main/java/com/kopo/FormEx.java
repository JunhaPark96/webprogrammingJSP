package com.kopo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

/**
 * Servlet implementation class FormEx
 */
@WebServlet("/FormEx")  // <- Servlet Mapping
public class FormEx extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public FormEx() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter pw = response.getWriter();

        pw.println("<html>");
        pw.println("<head>");
        pw.println("</head>");
        pw.println("<body>");
        pw.println("<h1> GET방식으로 호출 </h1>");
        pw.println("</body>");
        pw.println("</html>");

        pw.close();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("do Post");
        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String id = request.getParameter("id");
        String password = request.getParameter("passwd");
        String[] hobby = request.getParameterValues("hobby");
        System.out.println("name : " + name + " id : " + id + " password : " + password);
        System.out.println("hobby : " + Arrays.toString(hobby));

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter pw = response.getWriter();

        pw.println("<html>");
        pw.println("<head>");
        pw.println("</head>");
        pw.println("<body>");
        pw.println("<h1> POST방식으로 호출 </h1>");
        pw.println("</body>");
        pw.println("</html>");

        pw.close();
    }
}
