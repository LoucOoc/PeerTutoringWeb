package com.example.demo1;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/login")
public class login extends HttpServlet {


    @Override

    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String pwd=  req.getParameter("password");
        String account=req.getParameter("account");
        HttpSession s=req.getSession();

        if(pwd==null||pwd.length()==0||pwd.trim().equals(""))
        {
            resp.sendRedirect("login.jsp");
            s.setAttribute("warn","请输入账号密码");
        }
        else
        {
            //调用数据库查询账号是否存在
            if (register.exist(account,"account"))//如果存在
            {
                user u = user.setUserByAccount(account);
                //判断密码
                if(u.getPassword().equals(pwd))//如果存在
                {

                    if(u.getType().equals("teacher"))//如果是老师
                    {



                s.setAttribute("user",u);
                s.setAttribute("account",account);
                s.setAttribute("identity","teacher");
                        // resp.sendRedirect("fpStu.jsp");
                        req.getRequestDispatcher("fpStu.jsp").forward(req,resp);//前往老师主页

                    }
                   /* else if(false)//如果是管理
                    { resp.getWriter().write("bb");
                        user user= new user();
                        user.setUserByAccount();
                        s.setAttribute("user",user);
                        s.setAttribute("account", account);
                        s.setAttribute("identity","manager");
                        resp.sendRedirect("fpStu.jsp");//前往管理主页
                    }
                    */
                    else //只是学生
                    {
                        s.setAttribute("user",u);
                        s.setAttribute("account", account);
                        s.setAttribute("identity","student");
                        // resp.sendRedirect("fpStu.jsp");
                        req.getRequestDispatcher("fpStu.jsp").forward(req,resp);//前往学生主页
                    }


                }
                else {
                    resp.sendRedirect("login.jsp"); //返回
                    s.setAttribute("warn","密码错误请重试");
                }

            }
            else//不存在
            {
                resp.sendRedirect("login.jsp"); //返回
                s.setAttribute("warn","账户不存在请重试");
            }
        }
    }




    public static boolean isNumeric0(String str)
    {
for(int i=str.length();--i>=0;)
{
   int chr=str.charAt(i);
   if(chr<48 || chr>57)
    return false;
}
return true;
    }


}
