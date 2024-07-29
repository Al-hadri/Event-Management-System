<!DOCTYPE html>
<html>
<head>
    <title>Add Event</title>
</head>
<body>
    <h1>Add New Event</h1>
    <form action="addEvent" method="post">
        <label for="name">Event Name:</label>
        <input type="text" id="name" name="name"><br>

        <label for="date">Date:</label>
        <input type="text" id="date" name="date"><br>

        <label for="location">Location:</label>
        <input type="text" id="location" name="location"><br>

        <label for="type">Type:</label>
        <input type="text" id="type" name="type"><br>

        <input type="submit" value="Add Event">
    </form>
</body>
</html>
