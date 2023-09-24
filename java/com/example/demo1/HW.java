package com.example.demo1;

import javax.xml.crypto.Data;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class HW {

    private int id;
    private String content;
    private Date ddl;
    private int cId;


    public int getId() {
        return id;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }





    public void setId(int id) {
        this.id = id;
    }

    public void setDdl(Date ddl) {
        this.ddl = ddl;
    }

    public Date getDdl() {
        return ddl;
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
            String sql = "delete from hw where cla_id = "+cid+"";
            s.execute(sql);
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }

    public static HW getHWbyClaId(String cid)
    {
        HW h = new HW();
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
            String sql = "select * from hw where cla_id = '"+cid+"'";
            ResultSet rs = s.executeQuery(sql);
            if(rs.next())
            {
                h.setId(rs.getInt("id"));
                 h.setContent(rs.getString("content"));
                 Date da = rs.getDate("ddl");
                 h.setDdl(da);



            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return h;
    }

    public static void createHW(String content, String ddl, String cid)
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
            String sql = "update hw set content = '"+content+"' where cla_id = "+cid;

            String sql1 = "update hw set ddl = '"+ddl+"' where cla_id = "+cid;

            s.execute(sql);
            s.execute(sql1);


        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }
}
