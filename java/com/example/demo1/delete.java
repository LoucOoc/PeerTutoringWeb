package com.example.demo1;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "delete", value = "/delete")
public class delete extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String classID=req.getParameter("idc");
        HttpSession s= req.getSession();
        String ac=(String) s.getAttribute("account");
        user u= user.setUserByAccount(ac);
        u.deleteCC(classID);
        resp.sendRedirect("content.jsp");

    }
}
