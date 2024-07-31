<%-- 
    Document   : listAllEvents
    Created on : ٢٩‏/٠٧‏/٢٠٢٤, ٢:٣٢:٥٣ م
    Author     : TOSHIBA
--%>

<%@page import="com.mycompany.lab9.Event"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Event List</title>
</head>
<body>
    <h1>Event List</h1>
    <ul>
        <c:forEach var="event" items="${events}">
            <li>${event.name} - ${event.date} - ${event.location}</li>
        </c:forEach>
    </ul>
</body>
</html>
