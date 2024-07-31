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


@WebServlet("/EditEventServlet")
public class EditEventServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int eventId = Integer.parseInt(request.getParameter("eventId"));
        String eventName = request.getParameter("eventName");
        String eventDate = request.getParameter("eventDate");
        String eventLocation = request.getParameter("eventLocation");
        String eventType = request.getParameter("eventType");
        String eventDescription = request.getParameter("eventDescription");

        try {
            Class.forName("org.sqlite.JDBC");
            Connection con = DriverManager.getConnection("jdbc:sqlite:/Users/saifr/Documents/Database/Users.db");

   String query = "INSERT INTO Events (event_id ,event_name, event_date, event_location, event_type, event_description) VALUES (?,?, ?, ?, ?, ?)";            
   PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, eventId);
            pst.setString(2, eventName);
            pst.setString(3, eventDate);
            pst.setString(4, eventLocation);
            pst.setString(5, eventType);
            pst.setString(6, eventDescription);

            int rowCount = pst.executeUpdate();
            if (rowCount > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failure");
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("addEvent.jsp");
            dispatcher.forward(request, response);

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
