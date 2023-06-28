package jsp_21_memberJoin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession session;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FrontController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		service(request, response);
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		System.out.println("uri : " + uri);

		String conPath = request.getContextPath();
		System.out.println("conPath : " + conPath);

		String command = uri.substring(conPath.length());
		System.out.println("command : " + command);

		if (command.equals("/select.do")) {
			response.setContentType("text/html; charset=UTF-8");
			Service service = new MemberSelectAll();

			ArrayList<MemberDTO> dtos = service.execute(request, response);

			for (int i = 0; i < dtos.size(); i++) {
				MemberDTO dto = dtos.get(i);

				String id = dto.getId();
				String pw = dto.getPw();
				String name = dto.getName();
				String phone = dto.getPhone();
				String gender = dto.getGender();

				System.out.println(" 아이디: " + id + " 비밀번호: " + pw + " 이름: " + name + " 전화번호: " + phone + " 성별: "
						+ gender + "<br/>");
			}
		} else if (command.equals("/login.do")) {
			response.setContentType("text/html; charset=UTF-8");
			
//			String id = request.getParameter("id");
//			String pw = request.getParameter("pw");
			
			request.setAttribute("id", "id");
			request.setAttribute("pw", "pw");
			
			Service service = new MemberSelectAll();
			MemberDTO dto = service.login(request, response);
			
//			session.setAttribute("loginUser", dto);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/main.jsp");
			dispatcher.forward(request, response);
		}

	}

}
