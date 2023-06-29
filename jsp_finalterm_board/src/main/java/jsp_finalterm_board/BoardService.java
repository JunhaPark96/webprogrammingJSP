package jsp_finalterm_board;

import java.util.ArrayList;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface BoardService {
	// 모든 글 목록 조회
	ArrayList<BoardDTO> listAll(HttpServletRequest request, HttpServletResponse response);
	
	ArrayList<BoardDTO> sortedListAll(HttpServletRequest request, HttpServletResponse response);
	// 새 글 작성
	public void contentWrite(HttpServletRequest request, HttpServletResponse response);
	// 글 작성 후 다시 목록 조회
	public ArrayList<BoardDTO> writeAndListAll(HttpServletRequest request, HttpServletResponse response);
	// 상세 페이지 조회
	BoardDTO getBoard(HttpServletRequest request, HttpServletResponse response);
	// 상세 페이지 업데이트
	public BoardDTO updateBoard(HttpServletRequest request, HttpServletResponse response);
	// 상세 페이지 삭제
	public BoardDTO deleteBoard(HttpServletRequest request, HttpServletResponse response);
	// 답글 생성
	public BoardDTO writeReply(HttpServletRequest request, HttpServletResponse response);
	// 답글 생성 후 목록 조회
	public ArrayList<BoardDTO> replyAndListAll(HttpServletRequest request, HttpServletResponse response);
	
	public void deleteBoardAll(HttpServletRequest request, HttpServletResponse response);
}
