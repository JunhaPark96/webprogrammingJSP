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

	    try {
	        bDAO.insertNewContent(dto);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	public ArrayList<BoardDTO> writeAndListAll(HttpServletRequest request, HttpServletResponse response) {
	    contentWrite(request, response);
	    return listAll(request, response);
	}



}
