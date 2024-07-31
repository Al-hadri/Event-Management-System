<%-- 
    Document   : welcome
    Created on : ٢٩‏/٠٧‏/٢٠٢٤, ٢:٢٩:٢٦ م
    Author     : TOSHIBA
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Events</title>
</head>
<body>
    <h1>Search Events</h1>
    <form action="searchEvents" method="get">
        <label for="date">Date:</label>
        <input type="text" id="date" name="date"><br>

        <label for="location">Location:</label>
        <input type="text" id="location" name="location"><br>

        <label for="type">Type:</label>
        <input type="text" id="type" name="type"><br>

        <input type="submit" value="Search">
    </form>
    <c:forEach var="event" items="${events}">
        <p>
            <strong>${event.name}</strong><br>
            Date: ${event.date}<br>
            Location: ${event.location}<br>
            Type: ${event.type}<br>
        </p>
    </c:forEach>
</body>
</html>
