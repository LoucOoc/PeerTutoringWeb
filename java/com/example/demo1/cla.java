package com.example.demo1;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;


public class cla {

    public cla() {
    }
    private String type;
    private int id;
    private String intro;//less than 100 words
    private teacher Teacher;


    private String room;
    private span time;

    private HW homework;

    public HW getHomework() {
        return homework;
    }

    public void setHomework(HW homework) {
        this.homework = homework;
    }

    public static void createClass(String ty, String about, user u, String r, String w, String start, String end)
   {
       try {
           Class.forName("com.mysql.jdbc.Driver");
       }
       catch (ClassNotFoundException e)
       {
           e.printStackTrace();
       }

       try (Connection c= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/louco?characterEncoding=UTF-8","root","czukq040");
            Statement s = c.createStatement())
       {

           String sql2 = "select * from teacher where userAc = '"+u.getAccount()+"'";
           ResultSet rs = s.executeQuery(sql2);
           if(!rs.next()) {
               String sql1 = "insert into teacher(userAc) values('" + u.getAccount() + "')";
               s.execute(sql1);
           }
           rs=s.executeQuery(sql2);
           int tid=0;
           while(rs.next()) {
                tid = rs.getInt("id");
           }
           String sql3 = "insert into cla(type,intro,teacher_id,room) values ('"+ty+"','"+about+"','"+tid+"','"+r+"')";
           s.execute(sql3);

           String sql4 = "select * from cla where type = '"+ty+"' and intro = '"+about+"' and teacher_id = '"+tid+"' and room = '"+r+"'";
           rs = s.executeQuery(sql4);

           int cid=0;
           while(rs.next()) {
            cid=   rs.getInt("id");
           }
           String sql5= "insert into span(startTime,endTime,day,cla_id) values ('"+start+"','"+end+"','"+w+"',"+cid+")";
           s.execute(sql5);

            sql2= "insert into hw(cla_id) values ('"+cid+"')";
            s.execute(sql2);
       }
       catch (SQLException e)
       {
           e.printStackTrace();
       }
   }

    // 获得所有课程
    public static cla[] getALL(){

        ArrayList<cla> classes=new ArrayList<cla>();

        try{
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
        }

        try(Connection c = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/louco?characterEncoding=UTF-8","root", "czukq040");
            Statement s=c.createStatement()
        )
        {
            String sql="select * from cla";
            ResultSet rs = s.executeQuery(sql);
            while(rs.next())
            {
                String id = rs.getInt("id")+"";
                cla i=cla.getClaById(id);
                classes.add(i);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

        cla[] result = classes.toArray(new cla[classes.size()]);
        return result;

        /* cla iii= new cla();
       //测试用
       iii.setId(1);
        iii.setIntro("haha");
        iii.setRoom("999");
        teacher w=new teacher();
        w.setName("w");
        iii.setTeacher(w);
        span t= new span("1:00","4:00","周二");
        iii.setTime(t);
        iii.setType("ACT");

         cla[] a= new cla[1];
         a[0]=iii;

        return a;
        */
    }

    public void modify(String o,String t)
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
            String sql = "update cla set "+t+" = '"+o+"' where id = "+id+"";
            s.execute(sql);
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

    }

    public void modifyTime(span ts)
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
            String sql = "select * from span where cla_id = '"+id+"'";
            ResultSet rs = s.executeQuery(sql);
        if (rs.next()) {
            int sid = rs.getInt("span_id");
            String s1 = ts.getStartTime();
            String s2 = ts.getEndTime();
            String s3 = ts.getDay();
            String sql1 = "update span set startTime = '" + s1 + "' where span_id = " + sid;
            s.execute(sql1);
            sql1 = "update span set endTime = '" + s2 + "' where span_id = " + sid;
            s.execute(sql1);
            sql1 = "update span set day = '" + s3 + "' where span_id = " + sid;
            s.execute(sql1);
        }

        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

    }


    //通过id找到课程其他属性并创造对象
    public static cla getClaById(String cId)
    {
        cla result = new cla();
        try{
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
        }

        try (Connection c= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/louco?characterEncoding=UTF-8","root","czukq040");
             Statement s = c.createStatement();
             Statement s1=c.createStatement())
        {
            String sql = "select * from cla where id = '"+cId+"'";
            ResultSet rs = s.executeQuery(sql);
            if(rs.next())
            {
                result.setType(rs.getString("type"));
                result.setId(rs.getInt("id"));
                result.setIntro(rs.getString("intro"));

                int tid= rs.getInt("teacher_id");

                 teacher t = teacher.getTeacherById(tid);
                result.setTeacher(t);
                result.setRoom(rs.getString("room"));



                String sql3="select * from span where cla_id = "+cId;
                ResultSet rs1=s1.executeQuery(sql3);
                while(rs1.next()) {
                    span time = new span(rs1.getString("startTime"), rs1.getString("endTime"), rs1.getString("day"));

                    result.setTime(time);
                }

                HW h =HW.getHWbyClaId(cId+"");
                result.setHomework(h);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

return result;
    }

    private void setTeacher(teacher t) {
       Teacher=t;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }
/*
    public com.example.demo1.teacher getTeacher() {
        return Teacher;
    }

    public void setTeacher(com.example.demo1.teacher teacher) {
        this.Teacher = teacher;
    }

 */

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public span getTime() {
        return time;
    }

    public void setTime(span time) {
        this.time = time;
    }


    public user getTeacher() {
        return Teacher;
    }


    public static ArrayList<String> getPeers(String cid)
    {
        ArrayList<String> result = new ArrayList<>();

        try{
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        String p = "jdbc:mysql://%s:%d/%s?characterEncoding=UTF-8";
        // p.formatted();
            try(Connection c= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/louco?characterEncoding=UTF-8","root","czukq040");
                Statement s = c.createStatement();
                )
        {
            ArrayList<Integer> mem=new ArrayList<>();

            for(int i=1;i<=5;i++) {
                String sql = "select * from clachose where cla_id" + i + " = '" + cid + "'";
                ResultSet rs = s.executeQuery(sql);
                while (rs.next()) {
                    mem.add(rs.getInt("studentAc"));
                }
            }

            for(int m :mem)
            {
               user u = user.setUserByAccount(m+"");
               result.add(u.getName()+"#"+u.getAccount());



            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return result;
    }

    public ArrayList<String> peer(){
       return getPeers(this.id+"");
    }

    public String getHW()
    {
        HW h = HW.getHWbyClaId(id+"");
        return h.getContent();
    }

    public String getDDL()
    {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(homework.getDdl());
    }

    public static void removeClass(String cid)
    {

        try{
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
        }

        try (Connection c= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/louco?characterEncoding=UTF-8","root","czukq040");
             Statement s = c.createStatement();
             Statement s1=c.createStatement();
        )
        { String sqld = "set foreign_key_checks = 0";
            String sqlE = "set foreign_key_checks = 1";
            s.execute(sqld);
            String sql;
            HW.delete(cid);
            span.delete(cid);

            ResultSet rs;
            for(int i=1;i<=5;i++) {
                sql = "select * from clachose where cla_id"+i+" = '"+cid+"'";
                rs=s.executeQuery(sql);
                if(rs.next())
                {




                    int dw=rs.getInt("id");
                    String sql1= "update clachose set cla_id"+i+" = 0 where id = "+dw;
                    s1.execute(sql1);
                    String l=rs.getInt("cla_id5")+"";
                    for(int q=4;q>=i;q--)
                    {


                        String sql2 = "update clachose set cla_id" + q + " = " + l;

                        l=rs.getInt("cla_id"+q)+"";;
                    }
                }
            }
            String sql1 = "delete from cla where id = "+cid+"";
            s.execute(sql1);

            s.execute(sqlE);
        }
        catch (SQLException e)
        {
e.printStackTrace();
        }
    }
/*
    public static cla[][] TimeSort()
    {
        cla[] c = cla.getALL();
        ArrayList <cla[]> j = new ArrayList<>();

        for(int i =0 ;i<c.length;i++)
        {
            String t1= c[i].getTime().getStartTime();
            String t2= c[i].getTime().getEndTime();
            String t3= c[i].getTime().getDay();


        }


    }

 */

}
