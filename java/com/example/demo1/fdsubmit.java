package com.example.demo1;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "fdsubmit", value = "/fdsubmit")
public class fdsubmit extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession s = req.getSession();
        String ac= (String)s.getAttribute("account");

        String content = req.getParameter("1");
        String stt= req.getParameter("2");

        teacher t = teacher.getTeacherByaccount(ac);

        String[] sttt=stt.split("#");

        user st =user.setUserByAccount(sttt[1]);

        Date ds = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String d = sdf.format(ds);
        st.addFeedback(content,t.getId(),d);

        resp.sendRedirect("contentC.jsp");

    }
}
