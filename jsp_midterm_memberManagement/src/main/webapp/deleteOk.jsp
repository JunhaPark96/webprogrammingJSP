<%@page import="jsp_midterm_memberManagement.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
// memberManagement���� ���� id�� ���� Ż�� ó��
String userId = request.getParameter("id");
MemberDAO memberDAO = new MemberDAO();
boolean result = memberDAO.memberDelete(userId);
if (result) {
	out.print("success");
} else {
	out.print("fail");
}
%>
