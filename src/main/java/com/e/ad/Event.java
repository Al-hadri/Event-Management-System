package com.e.ad;

public class Event {
    private int id;
    private String name;
    private String date;
    private String location;
    private String type;
    private String description;

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
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }
    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }
    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
}
