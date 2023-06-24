package jsp_21_memberJoin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {
	private JDBC jdbc;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Connection conn;

	public MemberDAO() {
		this.jdbc = JDBC.getInstance();
		this.conn = jdbc.getConnection();
	}
	// 멤버 리스트 확인
	public ArrayList<MemberDTO> memberSelectAll() {
		ArrayList<MemberDTO> dtos = new ArrayList<MemberDTO>();
		String query = "select * from member";

		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String phone = rs.getString("phone");
				String gender = rs.getString("gender");
				
				MemberDTO dto = new MemberDTO(id, pw, name, phone, gender);
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

	public boolean memberJoin(MemberDTO dto) {
		pstmt = null;
		String query = "insert into member values (?, ?, ?, ?, ?)";
		boolean result = false;

		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getPhone());
			pstmt.setString(5, dto.getGender());

			int memberJoin = pstmt.executeUpdate();
			if (memberJoin > 0) {
				result = true;
				conn.commit();
			}

		} catch (SQLException e) {
			try {
				conn.rollback(); // 실패 시 롤백
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
		return result;
	}
	
	public MemberDTO memberFind(String memId) {
		pstmt = null;
		String query = "select * from member where id = '" + memId + "'";
		MemberDTO dto = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String phone = rs.getString("phone");
				String gender = rs.getString("gender");
				
				dto = new MemberDTO(id, pw, name, phone, gender);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return dto;
	}

}
