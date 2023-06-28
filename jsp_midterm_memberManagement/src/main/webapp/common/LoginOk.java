
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/LoginOk")
public class LoginOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginOk() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO dto = memberDAO.memberFind(id);
		
		if (dto.getMemberStatus().equals("pending")) {
			response.getWriter().println("<script>alert('회원 승인 대기중입니다.'); location.href='main.jsp';</script>");
		} else if (dto.getMemberStatus().equals("pause")) {
			response.getWriter().println("<script>alert('임시 보호중인 계정입니다.'); location.href='main.jsp'; </script>");
		} else {
			if (dto != null && dto.getPw().equals(pw)) {
				request.getSession().setAttribute("loginUser", dto);
				response.sendRedirect("main.jsp");
			} else {
				response.sendRedirect("login.jsp");
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}
}
