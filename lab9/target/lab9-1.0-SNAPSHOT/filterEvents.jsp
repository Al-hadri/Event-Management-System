<%-- 
    Document   : filterEvents
    Created on : ٢٩‏/٠٧‏/٢٠٢٤, ٢:٣٤:٣٤ م
    Author     : TOSHIBA
--%>

<%@page import="com.mycompany.lab9.Event"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Events</title>
</head>
<body>
    <h1>Search Events</h1>
    <form action="FilterEventServlet" method="post">
        <label for="date">Date:</label>
        <input type="date" id="date" name="date"><br>
        <label for="location">Location:</label>
        <input type="text" id="location" name="location"><br>
        <label for="type">Type:</label>
        <input type="text" id="type" name="type"><br>
        <input type="submit" value="Search">
    </form>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Date</th>
            <th>Location</th>
            <th>Type</th>
            <th>Description</th>
        </tr>
        <%
            List<Event> events = (List<Event>) request.getAttribute("events");
            if (events != null) {
                for (Event event : events) {
        %>
        <tr>
            <td><%= event.getId() %></td>
            <td><%= event.getName() %></td>
            <td><%= event.getDate() %></td>
            <td><%= event.getLocation() %></td>
            <td><%= event.getType() %></td>
            <td><%= event.getDescription() %></td>
        </tr>
        <%
                }
            }
        %>
    </table>
</body>
</html>
