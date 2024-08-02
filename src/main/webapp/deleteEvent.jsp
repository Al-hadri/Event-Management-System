<%@ page import="java.util.List" %>
<%@ page import="com.e.ad.Event" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Event</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            padding-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="mt-5">Confirm Deletion</h2>
       <form action="deleteEventServlet" method="post">
    <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
    <div class="alert alert-warning">
        <p>Are you sure you want to delete this event?</p>
        <ul>
            <li>ID: <%= request.getParameter("id") %></li>
        </ul>
    </div>
    <button type="submit" class="btn btn-danger">Delete</button>
    <a href="EventListServlet" class="btn btn-secondary">Cancel</a>
</form>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
