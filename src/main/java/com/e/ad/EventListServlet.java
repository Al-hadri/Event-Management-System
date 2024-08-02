package com.e.ad;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EventListServlet")
public class EventListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Event> events = new ArrayList<>();

        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("org.sqlite.JDBC");
            con = DriverManager.getConnection("jdbc:sqlite:/Users/saifr/Documents/Database/Users.db");
            stmt = con.createStatement();
            String query = "SELECT * FROM events";
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                int id = rs.getInt("event_id"); // Updated column name
                String name = rs.getString("event_name"); // Updated column name
                String date = rs.getString("event_date"); // Updated column name
                String location = rs.getString("event_location"); // Updated column name
                String type = rs.getString("event_type"); // Updated column name
                String description = rs.getString("event_description"); // Updated column name

                Event event = new Event(id, name, date, location, type, description);
                events.add(event);
            }

            if (events.isEmpty()) {
                System.out.println("No events found in the database.");
            }

            request.setAttribute("events", events);
            RequestDispatcher dispatcher = request.getRequestDispatcher("listAllEvents.jsp");
            dispatcher.forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while fetching the events.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
            dispatcher.forward(request, response);
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
