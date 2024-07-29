<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search Results</title>
</head>
<body>
    <h1>Search Results</h1>
    <ul>
        <c:forEach var="event" items="${events}">
            <li>${event.name} - ${event.date} - ${event.location}</li>
        </c:forEach>
    </ul>
</body>
</html>
