<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 20px;
        }
        .welcome-container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: 0 auto;
            text-align: center;
        }
        .welcome-container h1 {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="welcome-container">
            <h1 class="display-4">Welcome</h1>
            <c:choose>
                <c:when test="${not empty sessionScope.username}">
                    <p class="lead">Welcome, ${sessionScope.username}!</p>
                    <a href="LogoutServlet" class="btn btn-danger btn-lg">Logout</a>
                </c:when>
                <c:otherwise>
                    <p class="lead">You are not logged in. Please log in to continue.</p>
                    <a href="login.jsp" class="btn btn-primary btn-lg">Login</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
