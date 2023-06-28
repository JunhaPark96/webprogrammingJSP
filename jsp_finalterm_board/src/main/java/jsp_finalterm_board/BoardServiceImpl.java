package jsp_finalterm_board;

import java.util.ArrayList;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardServiceImpl implements BoardService{
	BoardDAO bDAO = BoardDAO.getInstance();
	@Override
	public ArrayList<BoardDTO> listAll(HttpServletRequest request, HttpServletResponse response) {
		return bDAO.listAll();
	}
	@Override
	public boolean write(HttpServletRequest request, HttpServletResponse response) {
		return false;
	}

}
