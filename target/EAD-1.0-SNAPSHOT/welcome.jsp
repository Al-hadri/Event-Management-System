
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
</head>
<body>
    <h1>Welcome</h1>
    <c:choose>
        <c:when test="${not empty sessionScope.username}">
            <p>Welcome, ${sessionScope.username}!</p>
            <a href="LogoutServlet">Logout</a>
        </c:when>
        <c:otherwise>
            <a href="login.jsp">Login</a>
        </c:otherwise>
    </c:choose>
</body>
</html>
