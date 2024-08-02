<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Event</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
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

        <div class="mb-md-5 mt-md-4 pb-5">

          <h2 class="fw-bold mb-2 text-uppercase animate__animated animate__fadeInDown">Add New Event</h2>
          <p class="text-white-50 mb-5 animate__animated animate__fadeIn">Fill in the details below to add a new event.</p>

          <form action="AddEventServlet" method="post" class="animate__animated animate__fadeInUp">
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
            <button type="submit" class="btn btn-primary btn-lg px-5">Add Event</button>
          </form>

        </div>

        <div>
          <a href="index.jsp" class="btn btn-secondary mt-3 animate__animated animate__fadeIn">Back to Home</a>
        </div>

      </div>
    </div>
  </div>
</section>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
