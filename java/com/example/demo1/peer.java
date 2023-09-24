package com.example.demo1;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "peer", value = "/peer")
public class peer extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String k = req.getParameter("i");
        System.out.println(k);
        ArrayList<String> na= cla.getPeers(k);
        req.setAttribute("te",k);
        req.setAttribute("na",na);
       // resp.sendRedirect("info.jsp");
    }
}
