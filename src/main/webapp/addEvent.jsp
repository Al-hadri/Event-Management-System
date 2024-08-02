<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Event</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2 class="mt-5">Add New Event</h2>
    <form action="AddEventServlet" method="post" class="mt-3">
        <div class="form-group">
            <label for="eventName">Event Name:</label>
            <input type="text" class="form-control" id="eventName" name="eventName" required>
        </div>
        <div class="form-group">
            <label for="eventDate">Event Date:</label>
            <input type="date" class="form-control" id="eventDate" name="eventDate" required>
        </div>
        <div class="form-group">
            <label for="eventLocation">Event Location:</label>
            <input type="text" class="form-control" id="eventLocation" name="eventLocation" required>
        </div>
        <div class="form-group">
            <label for="eventType">Event Type:</label>
            <input type="text" class="form-control" id="eventType" name="eventType" required>
        </div>
        <div class="form-group">
            <label for="eventDescription">Event Description:</label>
            <textarea class="form-control" id="eventDescription" name="eventDescription" rows="3" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Add Event</button>
    </form>
    <a href="index.jsp" class="btn btn-secondary mt-3">Back to Home</a>
</div>
</body>
</html>
