package com.example.demo1;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "book", value = "/book")
public class book extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String classID=req.getParameter("idc");
        HttpSession s= req.getSession();
        String ac = (String) s.getAttribute("account");
        user u = user.setUserByAccount(ac);
        u.addCC(classID);
        if(u.getTempLog()!=null)
        {
            resp.getWriter().write("<script language='javascript'> alert('超过选课上限（5)');"+
                    "window.location.href='/content.jsp';</script>");
        }
        resp.sendRedirect("content.jsp");
    }
}
