package com.e.ad;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/updateEventServlet")

public class UpdateEventServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        String name = request.getParameter("name");
        String date = request.getParameter("date");
        String location = request.getParameter("location");
        String type = request.getParameter("type");
        String description = request.getParameter("description");

        if (idStr == null || idStr.trim().isEmpty()) {
            response.sendRedirect("error.jsp?message=Event ID is missing");
            return;
        }

        try {
            int eventId = Integer.parseInt(idStr);

            // Update event logic
            Connection con = DriverManager.getConnection("jdbc:sqlite:/Users/saifr/Documents/Database/Users.db");
            String updateSQL = "UPDATE events SET event_name = ?, event_date = ?, event_location = ?, event_type = ?, event_description = ? WHERE event_id = ?";
            PreparedStatement pst = con.prepareStatement(updateSQL);
            pst.setString(1, name);
            pst.setString(2, date);
            pst.setString(3, location);
            pst.setString(4, type);
            pst.setString(5, description);
            pst.setInt(6, eventId);
            int rowsUpdated = pst.executeUpdate();

            if (rowsUpdated > 0) {
                response.sendRedirect("listAllEvents.jsp");  // Redirect to the list page
            } else {
                response.sendRedirect("error.jsp?message=Event not found");
            }

            pst.close();
            con.close();
        } catch (NumberFormatException e) {
            response.sendRedirect("error.jsp?message=Invalid event ID format");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?message=Database error");
        }
    }
}
