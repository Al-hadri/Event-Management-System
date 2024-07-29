<!DOCTYPE html>
<html>
<head>
    <title>Edit Event</title>
</head>
<body>
    <h1>Edit Event</h1>
    <form action="editEvent" method="post">
        <input type="hidden" id="eventId" name="eventId" value="${eventId}">
        <label for="name">Event Name:</label>
        <input type="text" id="name" name="name" value="${eventName}"><br>

        <label for="date">Date:</label>
        <input type="text" id="date" name="date" value="${eventDate}"><br>

        <label for="location">Location:</label>
        <input type="text" id="location" name="location" value="${eventLocation}"><br>

        <label for="type">Type:</label>
        <input type="text" id="type" name="type" value="${eventType}"><br>

        <input type="submit" value="Save Changes">
        <a href="deleteEvent?eventId=${eventId}">Delete Event</a>
    </form>
</body>
</html>
