package com.example.demo1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

public class FD {
    private String content;
    private String from;

    private String tim;

    private int id;

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setTim(String tim) {
        this.tim = tim;
    }

    public String getTim() {
        return tim;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getContent() {
        return content;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getT() {
        teacher t = teacher.getTeacherById(Integer.parseInt(from));
        return t.getName();
    }

    public String toString() {
        return content + " from: " + from;
    }


    public static void delete(String fid) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try (Connection c = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/louco?characterEncoding=UTF-8", "root", "czukq040");
             Statement s = c.createStatement()) {
            String sql = "delete from feedback where id = " + fid;
            s.execute(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}