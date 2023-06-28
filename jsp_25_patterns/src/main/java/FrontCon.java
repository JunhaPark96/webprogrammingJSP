

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FrontCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FrontCon() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("service");
		
		String uri = request.getRequestURI();
		System.out.println("uri : " + uri);
		
		String ctxPath = request.getContextPath();
		System.out.println("ctxPath : " + ctxPath);
		
		String command = uri.substring(ctxPath.length());
		System.out.println("command : " + command);
		
		if (command.equals("insert.do")) {
			System.out.println("/insert.do");
			System.out.println("===================");
		} else if (command.equals("udpate.do")) {
			System.out.println("/update.do");
			System.out.println("===================");
		} else if (command.equals("select.do")) {
			System.out.println("/select.do");
			System.out.println("===================");
		} else if (command.equals("delete.do")) {
			System.out.println("/delete.do");
			System.out.println("===================");
		}
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
		System.out.println("post 실행");
		service(request, response);
	}

}
