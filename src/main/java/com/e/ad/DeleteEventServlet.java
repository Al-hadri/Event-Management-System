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

@WebServlet("/deleteEventServlet")
public class DeleteEventServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        if (id != null && !id.trim().isEmpty()) {
            request.setAttribute("id", id);
            request.getRequestDispatcher("deleteEvent.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Event ID is missing.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        if (id != null && !id.trim().isEmpty()) {
            try {
                int eventId = Integer.parseInt(id);

                // Database connection details
                String url = "jdbc:sqlite:/Users/saifr/Documents/Database/Users.db";
                String sql = "DELETE FROM events WHERE event_id = ?";

                // Load the JDBC driver
                Class.forName("org.sqlite.JDBC");

                try (Connection con = DriverManager.getConnection(url);
                     PreparedStatement pst = con.prepareStatement(sql)) {

                    pst.setInt(1, eventId);
                    int rowsAffected = pst.executeUpdate();

                    if (rowsAffected > 0) {
                        response.sendRedirect("EventListServlet"); // Redirect to the list of events after successful deletion
                    } else {
                        request.setAttribute("errorMessage", "Event not found.");
                        request.getRequestDispatcher("error.jsp").forward(request, response);
                    }
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "An error occurred while deleting the event.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            } catch (NumberFormatException e) {
                request.setAttribute("errorMessage", "Invalid event ID format.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "Event ID is missing.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
