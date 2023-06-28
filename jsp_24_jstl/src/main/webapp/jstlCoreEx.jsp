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
	<!-- 변수 설정 -->
	<c:set var="varname" value="홍길동"/>
	varName : <c:out value="${varname }"></c:out>
	
	<!-- 변수 제거 -->
	<br/>
	<c:remove var="varname"/>
	varName 제거 : <c:out value="${varname }"></c:out>
	
	<br/>
	<!-- 예외처리 -->
	<c:catch var="error">
		<% int a = 1;
			int b = 0;
			int c = a / b;
			%>
	</c:catch>
	예외처리: <c:out value="${error}"></c:out>
	
	<br/>
	
	<!-- if태그 -->
	<c:if test="${1 + 2 == 3 }">
		1 + 2 = 3	
	</c:if>
	<br/>
	<c:if test="${1 + 2 != 3 }">
		1 + 2 != 3	
	</c:if>
	<hr>
	
	<!-- choose 사용 예 -->
	<c:set var="chooVar" value="정수"></c:set>
	<c:choose>
		<c:when test="${chooVar == '정수영' }">when: 정수영</c:when>
		<c:otherwise>when: 다른 사람</c:otherwise>
	</c:choose>
	<hr>
	
	<c:forEach var="each" begin="1" end="10" step="2">
		${each }
	</c:forEach>
	
	<hr>
	<%
		List<String> people = new ArrayList<String>();
		people.add("박경덕");
		people.add("박준하짱");
		people.add("태현팍");
		people.add("관종");
		people.add("리정민");
		pageContext.setAttribute("peoples", people);
	%>
	<ol>
		<c:forEach var="result" items="${peoples }">
			<li>${result }</li>
		</c:forEach>
	</ol>
	<hr>
	
	<%
		pageContext.setAttribute("forE", "하나, 둘, 셋");
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