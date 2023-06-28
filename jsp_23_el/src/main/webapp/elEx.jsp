<%@page import="jsp_23_el.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <%-- 변수 선언 --%>
    <%
        int num1 = 10;
        int num2 = 5;
        String str = "Hello";

        pageContext.setAttribute("num1", num1);
        request.setAttribute("num2", num2);
        session.setAttribute("str", str);
    %>

    <%-- 산술 연산 --%>
    <p>덧셈 연산: ${num1 + num2}</p>
    <p>뺄셈 연산: ${num1 - num2}</p>
    <p>곱셈 연산: ${num1 * num2}</p>
    <p>나눗셈 연산: ${num1 / num2}</p>

    <%-- 논리 연산 --%>
    <p>AND 연산: ${true && false}</p>
    <p>OR 연산: ${true || false}</p>
    <p>NOT 연산: ${!true}</p>

    <%-- 비교 연산 --%>
    <p>크기 비교: ${num1 > num2}</p>
    <p>같음 비교: ${num1 == num2}</p>
    <p>부정 비교: ${str != "Hello"}</p>

    <%-- 조건식 --%>
    <p>삼항 연산자: ${num1 > num2 ? "num1이 큽니다." : "num2가 큽니다."}</p>

</body>
</html>
