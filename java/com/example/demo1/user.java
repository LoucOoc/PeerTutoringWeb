package com.example.demo1;

import jakarta.servlet.ServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.UUID;

public class user {
    public user() {
    }
    private String tempLog;

    private int account;
    private String password;
    private String name;
    private String grade;
    private String className;
 //   private String email;
    private String type="student";

    private ArrayList<FD> feedback= new ArrayList<>();

    public void setFeedback(ArrayList<FD> feedback) {
        this.feedback=feedback;
    }

    public ArrayList<FD> getFeedback() {
        return feedback;
    }

    public void addF(FD d)
    {
        feedback.add(d);
    }

    public void addFeedback(String content, String from, String d)
    {
        FD f=new FD();
        f.setContent(content);
        f.setFrom(from);
        f.setTim(d);
        this.feedback.add(f);

        try {
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
        }

        try (Connection c= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/louco?characterEncoding=UTF-8","root","czukq040");
             Statement s = c.createStatement()) {
            String sql = "insert into feedback(content, teacher_id, user_account, tim) values ('" + content + "','" + from + "','" + account + "','" + d + "')";
            s.execute(sql);
            sql = "select * from feedback where content = '" + content + "' and teacher_id = '" + from + "' and user_account = '" + account + "' and tim = '" + d + "'";
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                f.setId(rs.getInt("id"));
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

    }

    private ArrayList<cla> classChose=new ArrayList<>();

    private ArrayList<cla> classTeach=new ArrayList<>();

    public ArrayList<cla> getClassTeach()
    {
        return classTeach;



/*
    //测试
        cla iii= new cla();
        iii.setId(1);
        iii.setIntro("haha");
        iii.setRoom("999");
        teacher w=new teacher();
        w.setName("w");
        iii.setTeacher(w);
        span t= new span("01:00","04:00","周二");
        iii.setTime(t);
        iii.setType("ACT");

        ArrayList<cla> a= new ArrayList<cla>();
        a.add(iii);
        return a;

 */
    }



    public void setClassTeach(ArrayList<cla> aa)

    {
        classTeach=aa;
    }

    public ArrayList<cla> getClassChose() {
        return classChose;


    }

    public void setClassChose(ArrayList<cla> aa)
    {
        classChose = aa;
    }

    public void deleteCC(String classId)
    {
        cla a=cla.getClaById(classId);
        for(int i=0;i<classChose.size();i++) {
           if(classChose.get(i).equals(a)) {
               classChose.remove(i);
               break;
           }
        }

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
            String sql1= "select * from clachose where studentAc = '"+account+"'";
            ResultSet rs = s.executeQuery(sql1);

            //get which cla_id
            int count=-1;
            if(rs.next()){
            for(int i=1;i<=5;i++)
            {
                String cid= rs.getInt("cla_id"+i)+"";
                if(cid.equals(classId))
                {
                    count=i;
                    break;
                }
            }
            }
            //update
            if(count!=-1) {
                String ccc=count+"";
                String sql2 = "update clachose set cla_id" + ccc + " = null where studentAc = " + account;
                s.execute(sql2);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

    }

    public void deleteCC(cla a)
    {
        classChose.remove(a);
    }

    //通过课程id和学生账号把学生填到课程里
    public void addCC( String classId)//已有课程超过5个会在tempLog报错
    {
        cla a=cla.getClaById(classId);
        if(!classChose.contains(a))
        {classChose.add(a);

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
            String sql1= "select * from clachose where studentAc = '"+account+"'";
            ResultSet rs = s.executeQuery(sql1);

            //get which cla_id
            int count=-1;
            if(rs.next())
                for(int i=1;i<=5;i++)
                {
                    int cid= rs.getInt("cla_id"+i);
                    int [] p = new int [5];
                    p[i-1]=cid;

                    if(cid==0)
                    {
                        count=i;
                        break;
                    }
                    if(i==5)
                    {
                         this.tempLog+="课程已满";
                    }

                    for(int k=0;k<i;k++)
                    {
                        if(p[k]==p[i])
                        {
                            i+=1000;
                            break;
                        }
                    }
                }
            //update
            String sql2= "update clachose set cla_id"+count+" ="+classId+" where studentAc = "+account;
            s.execute(sql2);
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

    }
    }

    public void addCC( cla a)
    {
        classChose.add(a);
    }

    public static user createUser(String name, String grade, String clas, String password)//账号随机生成与数据库不重复账号
    {
        user u=new user();
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

            String ss="select * from user where name = '"+name+"'";
            ResultSet rs=s.executeQuery(ss);
            if(rs.next())
            {
                return u;
            }

            //9 digits unique random number
            String regexA="[a-z|A-Z]";
            boolean doplic=true;
            String a="";
            while(doplic) {
                a = UUID.randomUUID().toString().replace("-", "");
                a = a.replaceAll(regexA, "");
                a = a.substring(0, 5) + a.substring(a.length() - 4);
                doplic= register.exist(a,"account");
            }

            String sql1="insert into clachose(studentAc) values ('"+a+"')";
            s.execute(sql1);

            String sql2="select * from clachose where studentAc = '"+a+"'";
             rs = s.executeQuery(sql2);
            int clachoseId=0;
            while(rs.next()) {
                clachoseId = rs.getInt("id");
            }
            u.setName(name);
            u.setAccount(Integer.parseInt(a));
            u.setPassword(password);
            u.setGrade(grade);
            u.setClassName(clas);

            String sql="insert into user values('"+a+"','"+password+"','"+name+"','"+grade+"','"+ clas+"','student','"+clachoseId+"')";
            s.execute(sql);


        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return u;
    }

    public static user setUserByAccount(String a) //按用户名调数据库设置属性,获得已有用户信息
    {
            user u=new user();

        try {
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
        }


        try (Connection c= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/louco?characterEncoding=UTF-8","root","czukq040");
             Statement s = c.createStatement();
             Statement s1 = c.createStatement()
             )
        {
            String sql= "select * from user where account = '"+a+"'";
           // //System.out.println(sql);
            ResultSet rs= s.executeQuery(sql);
           // //System.out.println(rs.next());
            if(rs.next())
            {

               //System.out.println(rs);
                //System.out.println("account "+rs.getInt("account"));
                //System.out.println("name "+rs.getString("name"));
                //System.out.println("pw "+rs.getString("password"));
                //System.out.println("gr "+rs.getString("grade"));
                //System.out.println("class_name "+rs.getString("class_name"));
                //System.out.println("type "+rs.getString("type"));


                u.setName(rs.getString("name"));
                u.setAccount(rs.getInt("account"));
                u.setPassword(rs.getString("password"));
                u.setGrade(rs.getString("grade"));
                u.setClassName(rs.getString("class_name"));
                u.setType(rs.getString("type"));

                String sqlC="select * from clachose where studentAc = '"+a+"'";
                ResultSet rsC=s1.executeQuery(sqlC);

                //System.out.println("rsC "+rsC.next());

                if(rsC.next())
                {
                    for(int i=1;i<=5;i++)
                    {
                        String p="cla_id"+i;
                        String idc= rsC.getInt(p)+"";
                        //System.out.println("idc :"+i+" "+idc);
                        if(idc!=null&&!idc.equals("0")) {
                                   // //System.out.println(idc);
                            cla ccc = cla.getClaById(idc);
                            u.classChose.add(ccc);
                        }
                    }
                }

                if(u.getType().equals("teacher"))
                {
                    ArrayList<cla> classes = new ArrayList<cla>();
                    sql= "select * from teacher where userAc = '"+a+"'";
                     rs=s.executeQuery(sql);

                    int tid=-1;

                   // //System.out.println("rs"+rs.next());

                    while(rs.next())
                    {
                        tid=rs.getInt("id");
                        //System.out.println("!!"+rs.getInt("id"));
                    }
                    //System.out.println(tid);
                    if(tid!=-1) {
                        String sql1 = "select * from cla where teacher_id = '"+tid+"'";
                        ResultSet rs1=s.executeQuery(sql1);
                        while(rs1.next())
                        {
                            cla i=cla.getClaById(rs1.getInt("id")+"");
                            classes.add(i);

                        }
                    }
                    u.setClassTeach(classes);
                }




            }
            sql= "select * from feedback where user_account = "+a;
            ResultSet rss= s1.executeQuery(sql);
            while(rss.next())
            {
                FD f= new  FD();

                f.setFrom(rss.getString("teacher_id"));
                f.setContent(rss.getString("content"));
                f.setId(rss.getInt("id"));

                f.setTim(rss.getString("tim"));
                u.addF(f);

            }

            return u;
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

        return u;

    }
/*
//time中应用，time已废弃
    public teacher teacherify()// 把一个用户变成老师
    {
        return new teacher();
    }

    public student studentify()//把一个用户转变为学生
    {
        return new student();
    }
*/
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    /*public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
*/
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public void setAccount(int account) {
        this.account = account;
    }

    public int getAccount() {
        return account;
    }

    public String getTempLog() {
        return tempLog;
    }

    public void setTempLog(String tempLog) {
        this.tempLog = tempLog;
    }

    //返回学生名和所属课程
    public ArrayList<String> getStudents(){
        ArrayList<String> result= new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
        }


        try (Connection c= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/louco?characterEncoding=UTF-8","root","czukq040");
             Statement s = c.createStatement()
        )
        {
            for(int i=0;i<classTeach.size();i++)
            {
                ArrayList<String> ct= classTeach.get(i).peer();

                for(String t:ct)
                {
                    result.add(t+"#"+classTeach.get(i).getType());
                }
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

        return result;
    }


}
