<%@page import="jsp_midterm_memberManagement.MemberDAO"%>
<%@page import="jsp_midterm_memberManagement.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� Ż��</title>
</head>
<body>
	<%
	// session ����
	MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
	// ���� id ����
	if (loginUser != null) {
    // ���� id ����
    String id = loginUser.getId();
    MemberDAO memberDAO = new MemberDAO();
    System.out.println("user ���´� " + loginUser.getMemberStatus());
    // memberStatus�� null�� �ƴϸ鼭 "normal" ������ ���� ȸ�� Ż�� ��û ����
    if (loginUser.getMemberStatus() != null && loginUser.getMemberStatus().equals("normal")){
        memberDAO.memberQuit(id);
        out.println("<script>alert('Ż���û �Ϸ�Ǿ����ϴ�');</script>");
        // ���� ���� �� main ������ �̵�
        session.invalidate();
        response.sendRedirect("../common/main.jsp");
    } else {
        // Ż�� ó�� ���� �޽��� ���
        out.println("ȸ�� Ż�� ó�� ����!");
    }
} else {
    out.println("�α��� ����� ������ �����ϴ�.");
}
	%>
</body>
</html>