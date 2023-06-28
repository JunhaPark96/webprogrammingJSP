package jsp_finalterm_board;

import java.util.ArrayList;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface BoardService {
	public ArrayList<BoardDTO> listAll(HttpServletRequest request, HttpServletResponse response);
	
	public boolean write(HttpServletRequest request, HttpServletResponse response);
	
}
