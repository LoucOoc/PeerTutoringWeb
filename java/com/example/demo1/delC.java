package com.example.demo1;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "delC", value = "/delC")
public class delC extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String cl= req.getParameter("1");
        cla.removeClass(cl);
        resp.sendRedirect("contentA.jsp");
    }
}
