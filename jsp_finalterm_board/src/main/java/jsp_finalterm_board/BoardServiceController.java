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
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());

		System.out.println("uri : " + uri);
		System.out.println("conPath : " + conPath);
		System.out.println("command : " + command);

		// 전체 리스트 표시 메인 페이지
		if (command.equals("/mainPage.do")) {
			ArrayList<BoardDTO> boardList = service.listAll(request, response);
			request.setAttribute("boardList", boardList);
			request.getRequestDispatcher("/mainPage.jsp").forward(request, response);
		} else if (command.equals("/contentPage.do")) {
			// 상세 페이지 이동
			System.out.println("Requested id: " + request.getParameter("id"));
			BoardDTO board = service.getBoard(request, response);
			System.out.println("Retrieved board: " + board);
			request.setAttribute("board", board);
			request.getRequestDispatcher("/contentPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		
		System.out.println("-----------------------");
		System.out.println("uri : " + uri);
		System.out.println("conPath : " + conPath);
		System.out.println("command : " + command);
		System.out.println("-----------------------");

		if (command.equals("/newWriting.do")) {
			System.out.println("새글작성");
			ArrayList<BoardDTO> boardList = service.writeAndListAll(request, response);
			request.setAttribute("boardList", boardList);
			request.getRequestDispatcher("/mainPage.jsp").forward(request, response);
		} else if (command.equals("/updateBoard.do")) {
			// 글 업데이트
			System.out.println("보드 업데이트-------------------");
			BoardDTO board = service.updateBoard(request, response);
			request.setAttribute("board", board);
			request.getRequestDispatcher("/mainPage.jsp").forward(request, response);
		} else if (command.equals("/deleteBoard.do")) {
			// 글 삭제
			System.out.println("보드 삭제-------------------");
			BoardDTO board = service.deleteBoard(request, response);
			request.setAttribute("board", board);
			request.getRequestDispatcher("/mainPage.jsp").forward(request, response);
		}
	}

}
