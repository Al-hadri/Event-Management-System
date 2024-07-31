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
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/editEvent")
public class EditEventServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:sqlite:C:\\Users\\TOSHIBA\\Events.db";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("eventId"));
        String name = request.getParameter("name");
        String date = request.getParameter("date");
        String location = request.getParameter("location");
        String type = request.getParameter("type");

        try (Connection conn = DriverManager.getConnection(DB_URL);
             PreparedStatement ps = conn.prepareStatement("UPDATE Events SET name = ?, date = ?, location = ?, type = ? WHERE id = ?")) {
            ps.setString(1, name);
            ps.setString(2, date);
            ps.setString(3, location);
            ps.setString(4, type);
            ps.setInt(5, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("events.jsp");
    }
}
