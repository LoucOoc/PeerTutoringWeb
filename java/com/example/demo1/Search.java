package com.example.demo1;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "Search", value = "/Search")
public class Search extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String inp= (String) req.getParameter("inp");

        //resp.sendRedirect(inp);
        if(inp==null||inp.trim().equals(""))
        {
            resp.sendRedirect("booking.jsp");
            return;
        }

        cla[] c= cla.getALL();
        ArrayList<cla> classes= new ArrayList<>();
        for(cla oo:c)
        {
            classes.add(oo);
        }

        String[] classesTypes= new String[classes.size()];
        String[] classesTeachers= new String[classes.size()];
        String[] classesTimes= new String[classes.size()];

        for(int i=0;i<classes.size();i++)
        {
            classesTypes[i]=classes.get(i).getType();
            classesTeachers[i]=classes.get(i).getTeacher().getName();
            classesTimes[i]=classes.get(i).getTime().getDay();
        }

        for(int i=0;i<classes.size();i++)
        {
            if(classesTypes[i].indexOf(inp)!=-1)
            {

                classes.add(0,classes.remove(i));
                //i--;
            }

            if(classesTeachers[i].indexOf(inp)!=-1)
            {

                classes.add(0,classes.remove(i));
                //i--;
            }
            if(classesTimes[i].indexOf(inp)!=-1)
            {

                classes.add(0,classes.remove(i));
               // i--;
            }

        }

        HttpSession s= req.getSession();
        cla[] cl=new cla[classes.size()];
        for(int i=0;i<cl.length;i++)
        {
            cl[i]=classes.get(i);
        }

        for(int i=0;i<cl.length;i++)
        {
            s.setAttribute("searchedR"+i,cl[i].getId());

        }
        s.setAttribute("sear","1");
        resp.sendRedirect("booking.jsp");
        return;
    }
}
