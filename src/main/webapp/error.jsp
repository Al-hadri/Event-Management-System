<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2 class="mt-5">An Error Occurred</h2>
        <div class="alert alert-danger mt-3">
            <%
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null) {
                    out.println("<p>" + errorMessage + "</p>");
                } else {
                    out.println("<p>An unknown error occurred.</p>");
                }
            %>
        </div>
        <a href="index.jsp" class="btn btn-primary">Return to Home</a>
    </div>
</body>
</html>
