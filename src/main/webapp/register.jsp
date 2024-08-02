<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <style>
        body, html {
            height: 100%;
        }
        .gradient-custom {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            height: 100%;
        }
        .card {
            border-radius: 1rem;
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
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card bg-dark text-white animate__animated animate__zoomIn" style="border-radius: 1rem;">
          <div class="card-body p-5 text-center">

            <div class="mb-md-5 mt-md-4 pb-5">

              <h2 class="fw-bold mb-2 text-uppercase animate__animated animate__fadeInDown">Register</h2>
              <p class="text-white-50 mb-5 animate__animated animate__fadeIn">Please enter your registration details!</p>

              <form action="RegisterServlet" method="post">
                <div class="form-outline form-white mb-4">
                  <input type="text" id="username" name="username" class="form-control form-control-lg animate__animated animate__fadeInLeft" required />
                  <label class="form-label" for="username">Username</label>
                </div>

                <div class="form-outline form-white mb-4">
                  <input type="password" id="password" name="password" class="form-control form-control-lg animate__animated animate__fadeInRight" required />
                  <label class="form-label" for="password">Password</label>
                </div>

                <button class="btn btn-outline-light btn-lg px-5 animate__animated animate__fadeInUp" type="submit">Register</button>

                <c:if test="${requestScope.status == 'success'}">
                    <p style="color: green;" class="mt-3 animate__animated animate__fadeIn">Registration successful. You can now <a href="login.jsp" class="text-white-50 fw-bold">login</a>.</p>
                </c:if>
                <c:if test="${requestScope.status == 'duplicate'}">
                    <p style="color: red;" class="mt-3 animate__animated animate__shakeX">Registration failed. Username might already be taken.</p>
                </c:if>
                <c:if test="${requestScope.status == 'error'}">
                    <p style="color: red;" class="mt-3 animate__animated animate__shakeX">Registration failed. An error occurred. Please try again later.</p>
                </c:if>
              </form>

            </div>

            <div>
              <p class="mb-0 animate__animated animate__fadeIn">Already have an account? <a href="login.jsp" class="text-white-50 fw-bold">Login here</a></p>
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.amazonaws.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
