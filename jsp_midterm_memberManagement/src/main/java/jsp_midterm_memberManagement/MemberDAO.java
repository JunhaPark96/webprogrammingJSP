package jsp_midterm_memberManagement;

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
	
	public ArrayList<MemberDTO> memberSelectAll() {
		ArrayList<MemberDTO> dtos = new ArrayList<MemberDTO>();
		String query = "SELECT * FROM members";

		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String name = rs.getString("name");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				String memberStatus = rs.getString("memberStatus");
				String memberRole = rs.getString("memberRole");
				
				MemberDTO dto = new MemberDTO(name, id, pw, phone, email, memberStatus, memberRole);
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
		String query = "insert into members VALUES (?, ?, ?, ?, ?, ?, ?)";
		boolean result = false;

		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPw());
			pstmt.setString(4, dto.getPhone());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getMemberStatus());
			pstmt.setString(7, dto.getMemberRole());

			int memberJoin = pstmt.executeUpdate();
			if (memberJoin > 0) {
				result = true;
				conn.commit();
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
		String query = "SELECT * FROM members WHERE id = ?";
		MemberDTO dto = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String name = rs.getString("name");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				String memberStatus = rs.getString("memberStatus");
				String memberRole = rs.getString("memberRole");
				
				dto = new MemberDTO(name, id, pw, phone, email, memberStatus, memberRole);
			}
		} catch (SQLException e) {
			e.printStackTrace();
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
		return dto;
	}
	
	public boolean memberModify(MemberDTO dto) {
		String query = "update members SET pw = ?, name = ?, phone = ?, email = ?, memberStatus = ?, memberRole = ? WHERE id = ?";
		boolean result = false;
		
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPhone());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getMemberStatus());
			pstmt.setString(6, dto.getMemberRole());
			pstmt.setString(7, dto.getId());
			
			int updateCount = pstmt.executeUpdate();
			if (updateCount > 0) {
				result = true;
				conn.commit();
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
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public boolean isIdExist(String memId) {
		String query = "select * from members where id = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
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
		return false;
	}
	
	public boolean isPhoneExist(String phone) {
		String query = "select * from members where phone = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, phone);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
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
		return false;
	}
	// 관리자 - 멤버 승인
	public boolean approveMember(String memId) {
	    String query = "update members SET memberStatus = 'approved' WHERE id = ?";
	    boolean result = false;

	    try {
	        conn.setAutoCommit(false);
	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, memId);
	        pstmt.executeUpdate();

	        conn.commit();
	        result = true;
	    } catch (SQLException e) {
	        try {
	            conn.rollback();
	        } catch (SQLException e1) {
	            e1.printStackTrace();
	        }
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null)
	                rs.close();
	            if (pstmt != null)
	                pstmt.close();
	            if (conn != null)
	                conn.close();
	        } catch (Exception e2) {
	            e2.printStackTrace();
	        }
	    }

	    return result;
	}

}
