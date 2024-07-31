package com.e.ad;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class TestConnection {
    public static void main(String[] args) {
        try {
            Class.forName("org.sqlite.JDBC");
            Connection conn = DriverManager.getConnection("jdbc:sqlite:/Users/saifr/Documents/Database/Users.db");
            Statement stmt = conn.createStatement();
            stmt.execute("SELECT * FROM events");
            System.out.println("Database connection successful and query executed.");
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
