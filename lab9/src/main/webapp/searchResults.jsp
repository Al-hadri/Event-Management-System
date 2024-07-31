<%-- 
    Document   : filterEvents
    Created on : ٢٩‏/٠٧‏/٢٠٢٤, ٢:٣٤:٣٤ م
    Author     : TOSHIBA
--%>

<%@page import="com.mycompany.lab9.Event"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Search Results</title>
</head>
<body>
    <h1>Search Results</h1>
    <ul>
        <c:forEach var="event" items="${events}">
            <li>${event.name} - ${event.date} - ${event.location}</li>
        </c:forEach>
    </ul>
</body>
</html>
