package jsp_finalterm_board;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class BoardServiceController
 */
@WebServlet("*.do")
public class BoardServiceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BoardService service = new BoardServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardServiceController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		System.out.println("uri : " + uri);

		String conPath = request.getContextPath();
		System.out.println("conPath : " + conPath);

		String command = uri.substring(conPath.length());
		System.out.println("command : " + command);
		// 전체 리스트 표시
		if (command.equals("/mainPage.do")) {
			ArrayList<BoardDTO> boardList = service.listAll(request, response);
			request.setAttribute("boardList", boardList);
			request.getRequestDispatcher("/mainPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		System.out.println("uri : " + uri);

		String conPath = request.getContextPath();
		System.out.println("conPath : " + conPath);

		String command = uri.substring(conPath.length());
		System.out.println("command : " + command);

		if (command.equals("/newWriting.do")) {
			
//			request.setAttribute("boardList", boardList);
			request.getRequestDispatcher("/mainPage.jsp").forward(request, response);
		}
	}

}
