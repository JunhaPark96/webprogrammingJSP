

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

/**
 * Servlet implementation class CharacterSetEx
 */
public class CharacterSetEx extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CharacterSetEx() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("doGet");
        request.setCharacterEncoding("EUC-KR");

        String name = request.getParameter("name");
        String id = request.getParameter("id");
        String passWord = request.getParameter("passWord");
        String[] hobby = request.getParameterValues("hobby");

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter pw = response.getWriter();
        
        pw.println("<html>");
        pw.println("<head>");
        pw.println("</head>");
        pw.println("<body>");
        
        pw.println("이름 : " + name + "<br/>");
        pw.println("아이디 : " + id + "<br/>");
        pw.println("비밀번호 : " + passWord + "<br/>");
        pw.print("취미 : ");

        for (int i = 0; i < hobby.length; i++) {
            pw.print(hobby[i] + " ");
        }
        
        pw.println("</body>");
        pw.println("</html>");
        pw.close();

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.setCharacterEncoding("EUC-KR");

        String name = request.getParameter("name");
        String id = request.getParameter("id");
        String passWord = request.getParameter("passWord");
        String[] hobby = request.getParameterValues("hobby");

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter pw = response.getWriter();
        
        pw.println("<html>");
        pw.println("<head>");
        pw.println("</head>");
        pw.println("<body>");
        
        pw.println("이름 : " + name + "<br/>");
        pw.println("아이디 : " + id + "<br/>");
        pw.println("비밀번호 : " + passWord + "<br/>");
        pw.print("취미 : ");

        for (int i = 0; i < hobby.length; i++) {
            pw.print(hobby[i] + " ");
        }
        
        pw.println("</body>");
        pw.println("</html>");
        pw.close();

	}

}
