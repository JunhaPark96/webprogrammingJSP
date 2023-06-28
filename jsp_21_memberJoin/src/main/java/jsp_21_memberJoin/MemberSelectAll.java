package jsp_21_memberJoin;

import java.util.ArrayList;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 회원정보를 조회처리하는 클래스
public class MemberSelectAll implements Service{
	MemberDAO mDAO = MemberDAO.getInstance();
	public MemberSelectAll() {
		
	}
	@Override
	public ArrayList<MemberDTO> execute(HttpServletRequest request, HttpServletResponse response) {
		return mDAO.memberSelectAll();
	}
	@Override
	public MemberDTO login(HttpServletRequest request, HttpServletResponse response) {
		MemberDTO dto = mDAO.memberFind(request.getParameter("id"));
		return dto;
	}
}
