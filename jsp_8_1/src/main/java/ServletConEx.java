

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class ServletConEx
 */
//@WebServlet(urlPatterns= {"/ServletConEx"}, initParams= {@WebInitParam(name="dbName", value="oracle"), @WebInitParam(name="dbPwd", value="1234")})
@WebServlet(name = "servletConEx", urlPatterns = "/ServletConEx", initParams = {@WebInitParam(name="dbName", value="1234")})
public class ServletConEx extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletConEx() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		String dbName = getInitParameter("dbName");
		String dbPwd = getInitParameter("dbPwd");
		System.out.println("dbName : " + dbName + " dbPwd : " + dbPwd);
		String sn = getServletName();
		System.out.println("sn: " + sn);
		
		System.out.println();
		PrintWriter pw = response.getWriter();
		pw.println("<html>");
		pw.println("<head>");
		pw.println("</head>");
		pw.println("<body>");
		
		pw.println("init db 이름 : " + dbName);
		pw.println("<br/>");
		pw.println("init db 패스워드 : " + dbPwd);
		
		pw.println("</body>");
		pw.println("</html>");
		
		pw.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
