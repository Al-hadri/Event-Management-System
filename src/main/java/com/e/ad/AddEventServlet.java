package com.e.ad;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddEventServlet")
public class AddEventServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String eventName = request.getParameter("eventName");
        String eventDate = request.getParameter("eventDate");
        String eventLocation = request.getParameter("eventLocation");
        String eventType = request.getParameter("eventType");
        String eventDescription = request.getParameter("eventDescription");

        // Database connection and insertion logic
        try {
            // Load the SQLite JDBC driver
            Class.forName("org.sqlite.JDBC");
            // Connect to the SQLite database
            Connection con = DriverManager.getConnection("jdbc:sqlite:/Users/saifr/Documents/Database/Users.db");

            // Prepare SQL query for insertion
            String query = "INSERT INTO events (event_name, event_date, event_location, event_type, event_description) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, eventName);
            pst.setString(2, eventDate);
            pst.setString(3, eventLocation);
            pst.setString(4, eventType);
            pst.setString(5, eventDescription);

            // Execute the query
            int rowCount = pst.executeUpdate();
            if (rowCount > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failure");
            }

            // Forward to the result page
            RequestDispatcher dispatcher = request.getRequestDispatcher("addEvent.jsp");
            dispatcher.forward(request, response);

            // Close resources
            pst.close();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("status", "error");
            RequestDispatcher dispatcher = request.getRequestDispatcher("addEvent.jsp");
            dispatcher.forward(request, response);
        }
    }
}
