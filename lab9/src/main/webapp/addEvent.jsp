<%-- 
    Document   : addEvent
    Created on : ٢٩‏/٠٧‏/٢٠٢٤, ٢:٢٦:٥٤ م
    Author     : TOSHIBA
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Event</title>
</head>
<body>
    <h1>Add New Event</h1>
    <form action="AddEventServlet" method="post">
        <label for="eventName">Event Name:</label>
        <input type="text" id="eventName" name="eventName" required><br>
        <label for="eventDate">Event Date:</label>
        <input type="date" id="eventDate" name="eventDate" required><br>
        <label for="eventLocation">Event Location:</label>
        <input type="text" id="eventLocation" name="eventLocation" required><br>
        <label for="eventType">Event Type:</label>
        <input type="text" id="eventType" name="eventType" required><br>
        <label for="eventDescription">Event Description:</label>
        <textarea id="eventDescription" name="eventDescription" required></textarea><br>
        <input type="submit" value="Add Event">
    </form>
    <p>${status}</p>
</body>
</html>
