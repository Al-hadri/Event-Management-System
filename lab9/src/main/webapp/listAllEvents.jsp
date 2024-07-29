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
<meta charset="UTF-8">
<title>All Events</title>
</head>
<body>
    <h1>All Events</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Date</th>
            <th>Location</th>
            <th>Type</th>
            <th>Description</th>
            <th>Actions</th>
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
            <td>
                <a href="editEvent.jsp?id=<%= event.getId() %>">Edit</a>
                <a href="DeleteEventServlet?id=<%= event.getId() %>">Delete</a>
            </td>
        </tr>
        <%
                }
            }
        %>
    </table>
</body>
</html>
