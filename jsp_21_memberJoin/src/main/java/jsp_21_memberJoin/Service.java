package jsp_21_memberJoin;

import java.util.ArrayList;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface Service {
	// 작업 지시용 인터페이스
	public ArrayList<MemberDTO> execute(HttpServletRequest request, HttpServletResponse response);
	
	
	public MemberDTO login(HttpServletRequest request, HttpServletResponse response);
}
