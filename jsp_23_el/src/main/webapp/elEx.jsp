<%@page import="jsp_23_el.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <%-- ���� ���� --%>
    <%
        int num1 = 10;
        int num2 = 5;
        String str = "Hello";

        pageContext.setAttribute("num1", num1);
        request.setAttribute("num2", num2);
        session.setAttribute("str", str);
    %>

    <%-- ��� ���� --%>
    <p>���� ����: ${num1 + num2}</p>
    <p>���� ����: ${num1 - num2}</p>
    <p>���� ����: ${num1 * num2}</p>
    <p>������ ����: ${num1 / num2}</p>

    <%-- �� ���� --%>
    <p>AND ����: ${true && false}</p>
    <p>OR ����: ${true || false}</p>
    <p>NOT ����: ${!true}</p>

    <%-- �� ���� --%>
    <p>ũ�� ��: ${num1 > num2}</p>
    <p>���� ��: ${num1 == num2}</p>
    <p>���� ��: ${str != "Hello"}</p>

    <%-- ���ǽ� --%>
    <p>���� ������: ${num1 > num2 ? "num1�� Ů�ϴ�." : "num2�� Ů�ϴ�."}</p>

</body>
</html>
