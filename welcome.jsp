<!-- welcome.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
</head>
<body>
    <h1>Welcome, ${cookie.username.value}!</h1>
    <p><a href="logout.jsp">Logout</a></p>
</body>
</html>