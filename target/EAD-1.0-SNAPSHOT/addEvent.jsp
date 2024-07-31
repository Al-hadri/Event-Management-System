<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Event</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            padding-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="mb-4">Add New Event</h1>
        <form action="AddEventServlet" method="post">
            <div class="form-group">
                <label for="eventName">Event Name:</label>
                <input type="text" id="eventName" name="eventName" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="eventDate">Event Date:</label>
                <input type="date" id="eventDate" name="eventDate" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="eventLocation">Event Location:</label>
                <input type="text" id="eventLocation" name="eventLocation" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="eventType">Event Type:</label>
                <input type="text" id="eventType" name="eventType" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="eventDescription">Event Description:</label>
                <textarea id="eventDescription" name="eventDescription" class="form-control" rows="3" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Add Event</button>
        </form>
        <div class="mt-3">
            <p class="text-success">${status}</p>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
