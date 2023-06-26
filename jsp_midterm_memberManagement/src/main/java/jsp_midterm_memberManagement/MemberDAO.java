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
		String query = "insert into members (name, id, pw, phone, email) values (?, ?, ?, ?, ?)";
		boolean result = false;

		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPw());
			pstmt.setString(4, dto.getPhone());
			pstmt.setString(5, dto.getEmail());

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
		String query = "update members set pw = ?, name = ?, phone = ?, email = ? where id = ?";
		boolean result = false;
		
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPhone());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getId());
			rs = pstmt.executeQuery();
			int updateCount = pstmt.executeUpdate();
//			System.out.println(updateCount);
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
	    String query = "update members set memberStatus = 'normal' where id = ?";
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
	
	// 회원 가입과 정보 수정 시 조건
	public String validateForm(String pw, String phone, String email) {
        // 비밀번호 체크
        if (pw.length() < 4 || !pw.matches("^[A-Za-z0-9]+$")) {
            return "비밀번호는 4자 이상의 영문자와 숫자로만 구성되어야 합니다.";
        }
        // 전화번호 형식 체크
        if (!phone.matches("^010-\\d{4}-\\d{4}$")) {
            return "전화번호는 '010-xxxx-xxxx' 형식이어야 합니다.";
        }
        // 이메일 형식 체크
        if (!email.contains("@")) {
            return "이메일은 '@'를 포함해야 합니다.";
        }
        return null;
    }
	
	public boolean memberQuit(String memId) {
		String query = "update members set memberStatus = 'pause' where id = ?";
	    boolean result = false;

	    try {
	        conn.setAutoCommit(false);
	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, memId);
	        pstmt.executeUpdate();
	        System.out.println("회원 탈퇴 신청 성공");
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
	
	public boolean memberDelete(String memId) {
		
		String query = "delete from members where id = ?";
	    boolean result = false;

	    try {
	        conn.setAutoCommit(false);
	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, memId);
	        pstmt.executeUpdate();
	        System.out.println("회원 탈퇴 성공");
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
