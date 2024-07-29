/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.lab9;

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

/**
 * Servlet implementation class EditEventServlet
 */
@WebServlet("/EditEventServlet")
public class EditEventServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int eventId = Integer.parseInt(request.getParameter("eventId"));
        String eventName = request.getParameter("eventName");
        String eventDate = request.getParameter("eventDate");
        String eventLocation = request.getParameter("eventLocation");
        String eventType = request.getParameter("eventType");
        String eventDescription = request.getParameter("eventDescription");

        // Database connection and update logic
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql:C:\\Users\\TOSHIBA\\Events.db", "root", "password");

            String query = "UPDATE Events SET event_name = ?, event_date = ?, event_location = ?, event_type = ?, event_description = ? WHERE event_id = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, eventName);
            pst.setString(2, eventDate);
            pst.setString(3, eventLocation);
            pst.setString(4, eventType);
            pst.setString(5, eventDescription);
            pst.setInt(6, eventId);

            int rowCount = pst.executeUpdate();
            if (rowCount > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failure");
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("editEvent.jsp");
            dispatcher.forward(request, response);

            pst.close();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("status", "error");
            RequestDispatcher dispatcher = request.getRequestDispatcher("editEvent.jsp");
            dispatcher.forward(request, response);
        }
    }
}
