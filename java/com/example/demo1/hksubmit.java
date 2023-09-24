package com.example.demo1;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "hksubmit", value = "/hksubmit")
public class hksubmit extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String content = req.getParameter("1");
        String ddl = req.getParameter("2");
        String cid=req.getParameter("3");

        HW.createHW(content,ddl,cid);
        resp.sendRedirect("contentB.jsp");
    }
}
