package com.e.ad;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/AddEventServlet")
public class AddEventServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String eventName = request.getParameter("eventName");
        String eventDate = request.getParameter("eventDate");
        String eventLocation = request.getParameter("eventLocation");
        String eventType = request.getParameter("eventType");
        String eventDescription = request.getParameter("eventDescription");

        Connection con = null;
        PreparedStatement pst = null;

        try {
            // Load the JDBC driver
            Class.forName("org.sqlite.JDBC");
            
            // Establish a database connection
            con = DriverManager.getConnection("jdbc:sqlite:/Users/saifr/Documents/Database/Users.db");

            // Prepare the SQL query
            String query = "INSERT INTO events (event_name, event_date, event_location, event_type, event_description) VALUES (?, ?, ?, ?, ?)";
            pst = con.prepareStatement(query);
            pst.setString(1, eventName);
            pst.setString(2, eventDate);
            pst.setString(3, eventLocation);
            pst.setString(4, eventType);
            pst.setString(5, eventDescription);

            // Execute the update
            pst.executeUpdate();

            // Redirect to the event list page
            response.sendRedirect("EventListServlet");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // In case of error, forward to an error page
            request.setAttribute("exception", e);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } finally {
            // Close resources
            try {
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
