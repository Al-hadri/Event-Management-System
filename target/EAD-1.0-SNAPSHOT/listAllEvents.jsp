<%@ page import="java.util.List" %>
<%@ page import="com.e.ad.Event" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List All Events</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            padding-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="mb-4">List of Events</h2>
        <table class="table table-bordered table-striped">
            <thead class="thead-light">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Date</th>
                    <th>Location</th>
                    <th>Type</th>
                    <th>Description</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Event> events = (List<Event>) request.getAttribute("events");
                    if (events != null && !events.isEmpty()) {
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
                        <a href="editEvent.jsp?id=<%= event.getId() %>" class="btn btn-warning btn-sm">Edit</a>
                        <a href="deleteEventServlet?id=<%= event.getId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this event?');">Delete</a>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="7" class="text-center">No events found.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <a href="addEvent.jsp" class="btn btn-primary">Add New Event</a>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
