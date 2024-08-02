<%@ page import="com.e.ad.EventUtil" %>
<%@ page import="com.e.ad.Event" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Event</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2>Edit Event</h2>
        <%
            String idStr = request.getParameter("id");
            Event event = null;

            if (idStr != null && !idStr.trim().isEmpty()) {
                try {
                    int eventId = Integer.parseInt(idStr);
                    event = EventUtil.getEventById(eventId);
                } catch (NumberFormatException e) {
                    out.println("<p>Error: Invalid event ID format.</p>");
                }
            } else {
                out.println("<p>Error: Event ID is missing.</p>");
            }
        %>
        <form action="updateEventServlet" method="post">
            <input type="hidden" name="id" value="<%= event != null ? event.getId() : "" %>">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" class="form-control" value="<%= event != null ? event.getName() : "" %>">
            </div>
            <div class="form-group">
                <label for="date">Date</label>
                <input type="text" id="date" name="date" class="form-control" value="<%= event != null ? event.getDate() : "" %>">
            </div>
            <div class="form-group">
                <label for="location">Location</label>
                <input type="text" id="location" name="location" class="form-control" value="<%= event != null ? event.getLocation() : "" %>">
            </div>
            <div class="form-group">
                <label for="type">Type</label>
                <input type="text" id="type" name="type" class="form-control" value="<%= event != null ? event.getType() : "" %>">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <input type="text" id="description" name="description" class="form-control" value="<%= event != null ? event.getDescription() : "" %>">
            </div>
            <button type="submit" class="btn btn-primary">Update Event</button>
        </form>
    </div>
</body>
</html>
