package com.e.event;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class EventServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Event> events = new ArrayList<>();

        Event event = new Event();
        event.setName("Sample Event");
        event.setDate("2024-07-26");
        event.setLocation("Sample Location");
        events.add(event);

        request.setAttribute("events", events);
        request.getRequestDispatcher("/WEB-INF/eventList.jsp").forward(request, response);
    }
}
