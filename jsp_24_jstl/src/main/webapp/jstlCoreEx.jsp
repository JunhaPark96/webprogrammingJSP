<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!-- ���� ���� -->
	<c:set var="varname" value="ȫ�浿"/>
	varName : <c:out value="${varname }"></c:out>
	
	<!-- ���� ���� -->
	<br/>
	<c:remove var="varname"/>
	varName ���� : <c:out value="${varname }"></c:out>
	
	<br/>
	<!-- ����ó�� -->
	<c:catch var="error">
		<% int a = 1;
			int b = 0;
			int c = a / b;
			%>
	</c:catch>
	����ó��: <c:out value="${error}"></c:out>
	
	<br/>
	
	<!-- if�±� -->
	<c:if test="${1 + 2 == 3 }">
		1 + 2 = 3	
	</c:if>
	<br/>
	<c:if test="${1 + 2 != 3 }">
		1 + 2 != 3	
	</c:if>
	<hr>
	
	<!-- choose ��� �� -->
	<c:set var="chooVar" value="����"></c:set>
	<c:choose>
		<c:when test="${chooVar == '������' }">when: ������</c:when>
		<c:otherwise>when: �ٸ� ���</c:otherwise>
	</c:choose>
	<hr>
	
	<c:forEach var="each" begin="1" end="10" step="2">
		${each }
	</c:forEach>
	
	<hr>
	<%
		List<String> people = new ArrayList<String>();
		people.add("�ڰ��");
		people.add("������¯");
		people.add("������");
		people.add("����");
		people.add("������");
		pageContext.setAttribute("peoples", people);
	%>
	<ol>
		<c:forEach var="result" items="${peoples }">
			<li>${result }</li>
		</c:forEach>
	</ol>
	<hr>
	
	<%
		pageContext.setAttribute("forE", "�ϳ�, ��, ��");
	%>
	<ul>
		<c:forEach var="result" items="${forE }">
			<li>${result }</li>
		</c:forEach>
	</ul>
	
	<c:redirect url="hello.jsp">
		<c:param name="name" value="gorgeous"></c:param>
	</c:redirect>
	
	
</body>
</html>