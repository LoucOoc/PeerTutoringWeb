package com.example.demo1;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.*;

@WebServlet(name = "register", value = "/register")
public class register extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
                String name = (String)req.getParameter("name");
                String grade=(String) req.getParameter("grade");
                String clas=(String) req.getParameter("class");
                String password=(String) req.getParameter("password");
                HttpSession s=req.getSession();

                if(check(name)||check(grade)||check(clas)||check(password))
                {
                    s.setAttribute("warnR","请补全信息"+name+grade+clas+password);

                   // resp.sendRedirect("register.jsp");
                    req.getRequestDispatcher("register.jsp").forward(req,resp);
                    return;

                }

                if(exist(name,"name"))
                {
                    s.setAttribute("warnR","您已注册账号，请登录");
                    resp.sendRedirect("register.jsp");
                    return;
                }

               user u= user.createUser(name,grade,clas,password);
               String account = ""+u.getAccount();
               s.setAttribute("account",account);
               s.setAttribute("password",password);
        req.getRequestDispatcher("success.jsp").forward(req,resp);
        return;

    }

    public boolean check(String pwd)
    {

        if(pwd==null||pwd.length()==0||pwd.trim().equals(""))
        {
            return true;
        }
        return false;
    }

    public static boolean exist(String name, String type)
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
        String sql= "select * from user where "+ type+" = '" + name + "'";
            ResultSet rs=s.executeQuery(sql);

            if(rs.next())
            {
                return true;
            }
            else return false;
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    return false;
    }
}
