<%@ page import="com.e.ad.EventUtil" %>
<%@ page import="com.e.ad.Event" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Event</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <style>
        body, html {
            height: 100%;
            margin: 0;
        }
        .gradient-custom {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .card {
            border-radius: 1rem;
            width: 100%;
            max-width: 600px;
        }
        .form-control {
            border-radius: 0.5rem;
        }
        .btn-lg {
            border-radius: 0.5rem;
        }
        .text-white-50 {
            color: rgba(255, 255, 255, 0.5) !important;
        }
        .fw-bold {
            font-weight: 700 !important;
        }
    </style>
</head>
<body>
<section class="vh-100 gradient-custom">
  <div class="container h-100 d-flex justify-content-center align-items-center">
    <div class="card bg-dark text-white animate__animated animate__zoomIn" style="border-radius: 1rem;">
      <div class="card-body p-5 text-center">

        <h2 class="fw-bold mb-2 text-uppercase animate__animated animate__fadeInDown">Edit Event</h2>

        <%
            String idStr = request.getParameter("id");
            Event event = null;

            if (idStr != null && !idStr.trim().isEmpty()) {
                try {
                    int eventId = Integer.parseInt(idStr);
                    event = EventUtil.getEventById(eventId);
                } catch (NumberFormatException e) {
                    out.println("<p class='text-danger animate__animated animate__shakeX'>Error: Invalid event ID format.</p>");
                }
            } else {
                out.println("<p class='text-danger animate__animated animate__shakeX'>Error: Event ID is missing.</p>");
            }
        %>

        <form action="updateEventServlet" method="post" class="animate__animated animate__fadeInUp">
            <input type="hidden" name="id" value="<%= event != null ? event.getId() : "" %>">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" class="form-control" value="<%= event != null ? event.getName() : "" %>" required>
            </div>
            <div class="form-group">
                <label for="date">Date</label>
                <input type="date" id="date" name="date" class="form-control" value="<%= event != null ? event.getDate() : "" %>" required>
            </div>
            <div class="form-group">
                <label for="location">Location</label>
                <input type="text" id="location" name="location" class="form-control" value="<%= event != null ? event.getLocation() : "" %>" required>
            </div>
            <div class="form-group">
                <label for="type">Type</label>
                <input type="text" id="type" name="type" class="form-control" value="<%= event != null ? event.getType() : "" %>" required>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" rows="3" required><%= event != null ? event.getDescription() : "" %></textarea>
            </div>
            <button type="submit" class="btn btn-primary btn-lg px-5">Update Event</button>
        </form>
      </div>
    </div>
  </div>
</section>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
