package jsp_finalterm_board;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

public class BoardDAO {
	private JDBC jdbc;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Connection conn;

	public BoardDAO() {
		this.jdbc = JDBC.getInstance();
		this.conn = jdbc.getConnection();
	}

	// 싱글톤 인스턴스
	private static final BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() {
		return instance;
	}
	
	public ArrayList<BoardDTO> listAll(){
		ArrayList<BoardDTO> dtos = new ArrayList<BoardDTO>();
		String query = "select * from MVC_BOARD";
		
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Date writtenDate = rs.getDate("writtenDate");
				int views = rs.getInt("views");
				int category = rs.getInt("category");
				int boardLevel = rs.getInt("boardLevel");
				int replyDepth = rs.getInt("replyDepth");
				
				
				BoardDTO dto = new BoardDTO(id, writer, title, content, writtenDate, views, category, boardLevel, replyDepth);
				dtos.add(dto);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
					System.out.println("rs 종료");
				}
				if (pstmt != null) {
					pstmt.close();
					System.out.println("pstmt 종료");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dtos;
	}
	
	public boolean insertNewContent(BoardDTO dto){
		pstmt = null;
		String query = "insert into mvc_board(writer, title, content, category) values (?, ?, ?, ?)";
		boolean result = false;
		try {
			while (rs.next()) {
				conn.setAutoCommit(false);
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, dto.getWriter());
				pstmt.setString(2, dto.getTitle());
				pstmt.setString(3, dto.getContent());
				pstmt.setInt(4, dto.getCategory());

				int newContent = pstmt.executeUpdate();
				if (newContent > 0) {
					result = true;
					conn.commit();
				}

			}
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
					System.out.println("rs 종료");
				}
				if (pstmt != null) {
					pstmt.close();
					System.out.println("pstmt 종료");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
}
