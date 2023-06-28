package jsp_finalterm_board;

import java.util.ArrayList;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface BoardService {
	// 모든 글 목록 조회
	public ArrayList<BoardDTO> listAll(HttpServletRequest request, HttpServletResponse response);
	// 새 글 작성
	public void contentWrite(HttpServletRequest request, HttpServletResponse response);
	// 글 작성 후 다시 목록 조회
	public ArrayList<BoardDTO> writeAndListAll(HttpServletRequest request, HttpServletResponse response);
	// 상세 페이지 조회
	BoardDTO getBoard(HttpServletRequest request, HttpServletResponse response);
}
