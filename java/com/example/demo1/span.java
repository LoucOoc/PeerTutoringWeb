package com.example.demo1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class span {
    private String startTime;
    private String endTime;
    private String day;

    public span(String startTime, String endTime, String day) {
        this.startTime = startTime;
        this.endTime = endTime;
        this.day = day;
    }

    @Override
    public String toString() {
        return day+startTime+"到"+endTime;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public static void delete(String cid)
    {
        try{
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
        }

        try (Connection c= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/louco?characterEncoding=UTF-8","root","czukq040");
             Statement s = c.createStatement())
        {
            String sql = "delete from span where cla_id = "+cid+"";
            s.execute(sql);
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }
}
