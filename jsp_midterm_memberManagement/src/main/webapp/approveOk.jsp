<%@page import="jsp_midterm_memberManagement.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
// memberManagement에서 받은 id에 대해 승인 처리
String userId = request.getParameter("id");
MemberDAO memberDAO = new MemberDAO();
boolean result = memberDAO.approveMember(userId);
if (result) {
	out.print("success");
} else {
	out.print("fail");
}
%>