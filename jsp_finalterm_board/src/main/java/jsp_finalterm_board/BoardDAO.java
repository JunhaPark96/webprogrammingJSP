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

	public ArrayList<BoardDTO> listAll() {
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

				BoardDTO dto = new BoardDTO(id, writer, title, content, writtenDate, views, category, boardLevel,
						replyDepth);
				dtos.add(dto);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
					System.out.println("리스트 rs 종료");
				}
				if (pstmt != null) {
					pstmt.close();
					System.out.println("리스트 pstmt 종료");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dtos;
	}

	// 새 글 작성
	public void insertNewContent(BoardDTO dto) {
		try {
			conn.setAutoCommit(false);
			// default를 제외한 새 글 작성 내용 insert
			String insertQuery = "insert into mvc_board(writer, title, content) values(?, ?, ?)";
			pstmt = conn.prepareStatement(insertQuery, new String[] { "ID" });
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.executeUpdate();

			rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				int id = rs.getInt(1);
				dto.setId(id);
			}
			// category를 id와 동일하게 변경
			String updateQuery = "update mvc_board set category = ? where id = ?";
			pstmt = conn.prepareStatement(updateQuery);
			pstmt.setInt(1, dto.getId());
			pstmt.setInt(2, dto.getId());
			pstmt.executeUpdate();
			System.out.println("----------------------------------------");
			System.out.println("글 게시 성공");
			conn.commit();

		} catch (SQLException e) {
			try {
				System.out.println("글 게시 실패");
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// 게시물 ID를 사용하여 해당 게시물의 정보를 DB에서 추출
	// 가져온 게시물 정보를 BoardDTO 객체에 저장하고 반환
	public BoardDTO fetchBoardById(int id) {
		BoardDTO board = null;
		String query = "select * from mvc_board where id = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();

			System.out.println("Query executed: " + query);
			System.out.println("Query parameter: " + id);

			if (rs.next()) {
				board = new BoardDTO();
				board.setId(rs.getInt("id"));
				board.setWriter(rs.getString("writer"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setWrittenDate(rs.getDate("writtenDate"));
				board.setViews(rs.getInt("views"));
				board.setCategory(rs.getInt("category"));
				board.setBoardLevel(rs.getInt("boardLevel"));
				board.setReplyDepth(rs.getInt("replyDepth"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
					System.out.println("상세 rs 종료");
				}
				if (pstmt != null) {
					pstmt.close();
					System.out.println("상세 pstmt 종료");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return board;
	}

	public void increaseCount(int id) {
		String query = "update mvc_board set views = views + 1 where id = ?";

		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();

//			System.out.println("Query executed: " + query); // 추가
//			System.out.println("Query parameter: " + id); // 추가

			conn.commit();
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// 글 수정
	public void updateContent(BoardDTO dto) {
		try {
			conn.setAutoCommit(false);
			String query = "update mvc_board set writer = ?, title = ?, content = ? where id = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getId());
			pstmt.executeUpdate();
			System.out.println("-------------------------------");
			System.out.println("글 업데이트 성공");
			conn.commit();

		} catch (SQLException e) {
			try {
				System.out.println("-------------------------------");
				System.out.println("글 업데이트 실패");
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// 글 삭제
	public void deleteContent(BoardDTO dto) {
		try {
			conn.setAutoCommit(false);
			String query = "delete from mvc_board where id = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, dto.getId());
			pstmt.executeUpdate();
			System.out.println("삭제 성공");
			conn.commit();

		} catch (SQLException e) {
			try {
				System.out.println("삭제 실패");
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
