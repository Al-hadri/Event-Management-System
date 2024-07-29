<%-- 
    Document   : editEvent
    Created on : ٢٩‏/٠٧‏/٢٠٢٤, ٢:٣٦:٣٢ م
    Author     : TOSHIBA
--%>
<%@ page import="com.mycompany.lab9.EventUtil" %>
<%@ page import="com.mycompany.lab9.Event" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Event</title>
</head>
<body>
    <h1>Edit Event</h1>
    <%
        String id = request.getParameter("id");
        Event event = null;

        if (id != null) {
            try {
                int eventId = Integer.parseInt(id);
                event = EventUtil.getEventById(eventId);  // Fetch event details by ID
            } catch (NumberFormatException e) {
                // Handle the case where the ID is not a valid integer
                out.println("<p>Error: Invalid event ID format.</p>");
            }
        }

        if (event != null) {
    %>
    <form action="EditEventServlet" method="post">
        <input type="hidden" name="eventId" value="<%= event.getId() %>">
        <label for="eventName">Event Name:</label>
        <input type="text" id="eventName" name="eventName" value="<%= event.getName() %>" required><br>
        <label for="eventDate">Event Date:</label>
        <input type="date" id="eventDate" name="eventDate" value="<%= event.getDate() %>" required><br>
        <label for="eventLocation">Event Location:</label>
        <input type="text" id="eventLocation" name="eventLocation" value="<%= event.getLocation() %>" required><br>
        <label for="eventType">Event Type:</label>
        <input type="text" id="eventType" name="eventType" value="<%= event.getType() %>" required><br>
        <label for="eventDescription">Event Description:</label>
        <textarea id="eventDescription" name="eventDescription" required><%= event.getDescription() %></textarea><br>
        <input type="submit" value="Update Event">
    </form>
    <%
        } else {
            // If event is null, display an error message or redirect
            out.println("<p>Error: Event not found.</p>");
        }
    %>
    <p>${status}</p>
</body>
</html>
