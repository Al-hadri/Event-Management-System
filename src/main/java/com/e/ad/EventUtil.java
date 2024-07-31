
package com.e.ad;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class EventUtil {

    public static Event getEventById(int eventId) {
        Event event = null;
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish a database connection
            con = DriverManager.getConnection("jdbc:sqlite:/Users/saifr/Documents/Database/Users.db");

            // Prepare the SQL query
            String query = "SELECT * FROM events WHERE event_id = ?";
            pst = con.prepareStatement(query);
            pst.setInt(1, eventId);

            // Execute the query
            rs = pst.executeQuery();
            if (rs.next()) {
                event = new Event(
                    rs.getInt("event_id"),
                    rs.getString("event_name"),
                    rs.getString("event_date"),
                    rs.getString("event_location"),
                    rs.getString("event_type"),
                    rs.getString("event_description")
                );
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return event;
    }
}
