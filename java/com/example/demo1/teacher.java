package com.example.demo1;

import java.sql.*;
import java.util.ArrayList;

public class teacher extends user {
    private String id;

    public teacher() {

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }


    public static teacher getTeacherById(int idt)
    {
        teacher t = new teacher();
        try{
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
        }

        try (Connection c= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/louco?characterEncoding=UTF-8","root","czukq040");
             Statement s = c.createStatement();
             Statement s1 = c.createStatement();
        )
        {
            String sql1 = "select * from teacher where id = "+idt;
            ResultSet rs = s.executeQuery(sql1);
            if(rs.next())
            {
                int uac = rs.getInt("userAc");
                String sql2= "select * from user where account = "+uac;
                ResultSet rs1=s1.executeQuery(sql2);
                if(rs1.next())
                {
                    t.setId(idt+"");

                  //user u = user.setUserByAccount(uac+"");

                    t.setName(rs1.getString("name"));
                    t.setAccount(rs1.getInt("account"));
                    t.setType(rs1.getString("type"));
                    t.setGrade(rs1.getString("grade"));
                    t.setPassword(rs1.getString("password"));
                    t.setClassName(rs1.getString("class_name"));
                }
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
return t;
    }

    public static teacher getTeacherByaccount(String idt)
    {
        teacher t = new teacher();
        try{
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
        }

        try (Connection c= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/louco?characterEncoding=UTF-8","root","czukq040");
             Statement s = c.createStatement();
             Statement s1 = c.createStatement();
        )
        {
            String sql1 = "select * from teacher where userAc = "+idt;
            ResultSet rs = s.executeQuery(sql1);
            if(rs.next())
            {
                int uac = rs.getInt("id");
                String sql2= "select * from user where account = "+idt;
                ResultSet rs1=s1.executeQuery(sql2);
                if(rs1.next())
                {
                    t.setId(uac+"");

                    //user u = user.setUserByAccount(uac+"");

                    t.setName(rs1.getString("name"));
                    t.setAccount(rs1.getInt("account"));
                    t.setType(rs1.getString("type"));
                    t.setGrade(rs1.getString("grade"));
                    t.setPassword(rs1.getString("password"));
                    t.setClassName(rs1.getString("class_name"));
                }
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return t;
    }
    /*
    used in TIME; abolished
    public cla findClassTeached()//用id找到所教授的课程
    {
        return new cla();
    }

     */
}
