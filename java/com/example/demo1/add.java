package com.example.demo1;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "add", value = "/add")
public class add extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type= (String)req.getParameter("type2")+" - "+req.getParameter("detail");
        String week= (String)req.getParameter("week");
        String begin= (String)req.getParameter("timeB");
        String end= (String)req.getParameter("timeE");
        String room= (String)req.getParameter("room1");
        String about= (String)req.getParameter("about1");


        HttpSession s = req.getSession();
        user u =(user) s.getAttribute("user");


        //用以上信息添加课程
        cla.createClass(type,about,u,room,week,begin,end);

        resp.sendRedirect("contentA.jsp");
    }
}
