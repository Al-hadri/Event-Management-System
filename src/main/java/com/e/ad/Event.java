
package com.e.ad;


public class Event {
    private int id;
    private String name;
    private String date;
    private String location;
    private String type;
    private String description;

    // Constructor
    public Event(int id, String name, String date, String location, String type, String description) {
        this.id = id;
        this.name = name;
        this.date = date;
        this.location = location;
        this.type = type;
        this.description = description;
    }

    // Getters and setters
    public int getId() { return id; }
    public String getName() { return name; }
    public String getDate() { return date; }
    public String getLocation() { return location; }
    public String getType() { return type; }
    public String getDescription() { return description; }
}
