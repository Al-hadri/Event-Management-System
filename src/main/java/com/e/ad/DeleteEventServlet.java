
package com.e.ad;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteEventServlet")
public class DeleteEventServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int eventId = Integer.parseInt(request.getParameter("id"));

        // Database connection and deletion logic
        try {
            Class.forName("org.sqlite.JDBC");
            try (Connection con = DriverManager.getConnection("jdbc:sqlite:/Users/saifr/Documents/Database/Users.db")) {
                String query = "DELETE FROM events WHERE event_id = ?";
                try (PreparedStatement pst = con.prepareStatement(query)) {
                    pst.setInt(1, eventId);
                    
                    int rowCount = pst.executeUpdate();
                    if (rowCount > 0) {
                        response.sendRedirect("EventListServlet");
                    } else {
                        request.setAttribute("status", "failure");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("listAllEvents.jsp");
                        dispatcher.forward(request, response);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
