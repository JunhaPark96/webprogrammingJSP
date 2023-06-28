package jsp_finalterm_board;

import java.sql.SQLException;
import java.util.ArrayList;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardServiceImpl implements BoardService {
	BoardDAO bDAO = BoardDAO.getInstance();

	@Override
	public ArrayList<BoardDTO> listAll(HttpServletRequest request, HttpServletResponse response) {
		return bDAO.listAll();
	}

	@Override
	public void contentWrite(HttpServletRequest request, HttpServletResponse response) {
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		BoardDTO dto = new BoardDTO();
		dto.setWriter(writer);
		dto.setTitle(title);
		dto.setContent(content);

		bDAO.insertNewContent(dto);
	}

	@Override
	public ArrayList<BoardDTO> writeAndListAll(HttpServletRequest request, HttpServletResponse response) {
		contentWrite(request, response);
		return listAll(request, response);
	}

	// 상세 페이지 조회 및 조회 수 증가
	@Override
	public BoardDTO getBoard(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		BoardDTO board = null;
		System.out.println("request.getParameter(id) : " + request.getParameter("id"));
		
		board = bDAO.fetchBoardById(id);
		System.out.println("board: " + bDAO.fetchBoardById(id));
		bDAO.increaseCount(id);
		
		request.setAttribute("board", board);
		return board;
	}

}
