<!DOCTYPE html>
<html>
<head>
    <title>Events</title>
</head>
<body>
    <h1>Upcoming Events</h1>
    <c:forEach var="event" items="${events}">
        <p>
            <strong>${event.name}</strong><br>
            Date: ${event.date}<br>
            Location: ${event.location}<br>
            Type: ${event.type}<br>
            <a href="editEvent.jsp?eventId=${event.id}">Edit</a>
        </p>
    </c:forEach>
    <p><a href="addEvent.jsp">Add New Event</a></p>
    <p><a href="search.jsp">Search Events</a></p>
    <p><a href="about.jsp">About Us</a></p>
</body>
</html>
