/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.lab9;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FilterEventServlet
 */
@WebServlet("/FilterEventServlet")
public class FilterEventServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String date = request.getParameter("date");
        String location = request.getParameter("location");
        String type = request.getParameter("type");

        List<Event> events = new ArrayList<>();

        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql:C:\\Users\\TOSHIBA\\Events.db", "root", "password");

            StringBuilder queryBuilder = new StringBuilder("SELECT * FROM Events WHERE 1=1");
            if (date != null && !date.isEmpty()) {
                queryBuilder.append(" AND event_date = ?");
            }
            if (location != null && !location.isEmpty()) {
                queryBuilder.append(" AND event_location = ?");
            }
            if (type != null && !type.isEmpty()) {
                queryBuilder.append(" AND event_type = ?");
            }

            String query = queryBuilder.toString();
            pst = con.prepareStatement(query);

            int index = 1;
            if (date != null && !date.isEmpty()) {
                pst.setString(index++, date);
            }
            if (location != null && !location.isEmpty()) {
                pst.setString(index++, location);
            }
            if (type != null && !type.isEmpty()) {
                pst.setString(index++, type);
            }

            rs = pst.executeQuery();

            while (rs.next()) {
                Event event = new Event(
                    rs.getInt("event_id"),
                    rs.getString("event_name"),
                    rs.getString("event_date"),
                    rs.getString("event_location"),
                    rs.getString("event_type"),
                    rs.getString("event_description")
                );
                events.add(event);
            }

            request.setAttribute("events", events);
            RequestDispatcher dispatcher = request.getRequestDispatcher("filterEvents.jsp");
            dispatcher.forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while filtering the events.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
            dispatcher.forward(request, response);
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
    }
}
