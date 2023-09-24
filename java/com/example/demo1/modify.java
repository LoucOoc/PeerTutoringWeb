package com.example.demo1;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "modify", value = "/modify")
public class modify extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type= (String)req.getParameter("1");
        String week= (String)req.getParameter("2");
        String begin= (String)req.getParameter("3");
        String end= (String)req.getParameter("4");
        String room= (String)req.getParameter("5");
        String about= (String)req.getParameter("6");


        String id= (String)req.getParameter("7");

        cla clas=cla.getClaById(id);

        if (!(type == null)&&!type.trim().equals("")) {


            clas.modify(type, "type");
        }
        if (!(room == null)&&!room.trim().equals("")) {
            clas.modify(room, "room");
        }
        if (!(about == null)&&!about.trim().equals("")) {
            clas.modify(about, "intro");


        }
        else
            clas.modify("暂无", "about");
        if (!(begin == null)&&!(end == null)&&!(week == null)&&!(begin.trim().equals(""))&&!(end.trim().equals(""))&&!(week.trim().equals(""))) {

            //clas.modify("a"+begin+"/"+end+"/"+week, "intro");
            span i = new span(begin, end, week);

            clas.modifyTime(i);
        }

        //String k = "aaa";

       resp.sendRedirect("contentA.jsp");

//resp.setContentType("text/html;charset=utf-8");PrintWriter out = resp.getWriter();out.print("<script type='text/javascript'>alert("+type+" "+week+" "+begin+" "+end+" "+room+" "+about+" "+id+")</script");

    }
}
