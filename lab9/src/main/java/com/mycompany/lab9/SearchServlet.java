/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.lab9;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Event> events = new ArrayList<>();

        Event event = new Event();
        event.setName("Search Event");
        event.setDate("2024-07-26");
        event.setLocation("Search Location");
        events.add(event);

        request.setAttribute("events", events);
        request.getRequestDispatcher("/WEB-INF/searchResults.jsp").forward(request, response);
    }
}
