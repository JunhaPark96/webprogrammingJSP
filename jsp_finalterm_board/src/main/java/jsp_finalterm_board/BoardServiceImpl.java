package jsp_finalterm_board;

import java.sql.Date;
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

	public BoardDTO updateBoard(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		BoardDTO dto = new BoardDTO();
		dto.setId(id);
		dto.setWriter(writer);
		dto.setTitle(title);
		dto.setContent(content);
		bDAO.updateContent(dto);
		return bDAO.fetchBoardById(id);
	}

	// 글 삭제
	public BoardDTO deleteBoard(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		BoardDTO dto = new BoardDTO();
		dto.setId(id);

		bDAO.deleteContent(dto);
		return dto;
	}

	// 답글 생성
	public BoardDTO writeReply(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		BoardDTO newDto = new BoardDTO();
		newDto.setWriter(writer);
		newDto.setTitle(title);
		newDto.setContent(content);

		BoardDTO oldDto = bDAO.fetchBoardById(id); // 원본 게시물 가져오기

		bDAO.insertReplyContent(newDto, oldDto);
		return bDAO.fetchBoardById(newDto.getId()); // 답글 반환
	}
	
	@Override
	public ArrayList<BoardDTO> replyAndListAll(HttpServletRequest request, HttpServletResponse response) {
		writeReply(request, response);
		return listAll(request, response);
	}

}
