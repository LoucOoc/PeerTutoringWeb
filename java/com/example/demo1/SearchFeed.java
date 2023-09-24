package com.example.demo1;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "SearchFeed", value = "/SearchFeed")
public class SearchFeed extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String inp= (String) req.getParameter("inp");

        //resp.sendRedirect(inp);
        if(inp==null||inp.trim().equals(""))
        {
            resp.sendRedirect("feedback.jsp");
            return;
        }

        HttpSession s = req.getSession();
        String ac = (String)s.getAttribute("account");
        user u = user.setUserByAccount(ac);


        if(u.getType().equals("teacher"))
        {
            ArrayList<String> stu=u.getStudents();

            ArrayList<String> sname= new ArrayList<>();
            ArrayList<String> cname= new ArrayList<>();
            ArrayList<String> sAc= new ArrayList<>();

            for(int i=0;i<stu.size();i++)
            {
                String[] temp = stu.get(i).split("#");
                sname.add(temp[0]);
                cname.add(temp[2]);
                sAc.add(temp[1]);
            }

            for(int i=0;i<stu.size();i++) {
                if (sname.get(i).indexOf(inp) != -1) {
                    stu.add(0, stu.remove(i));
                    sname.add(0, stu.remove(i));
                }

                if (cname.get(i).indexOf(inp) != -1) {
                    stu.add(0, stu.remove(i));
                    cname.add(0, stu.remove(i));
                }

                if (sAc.get(i).indexOf(inp) != -1) {
                    stu.add(0, stu.remove(i));
                    sAc.add(0, stu.remove(i));
                }

            }

                for(int j=0;j<stu.size();j++)
                {
                    s.setAttribute("sPeer"+j,stu.get(j));

                }
            s.setAttribute("peerSearched","yes");
        }


        ArrayList<FD> f=u.getFeedback();

        ArrayList<String> fr= new ArrayList<>();
        ArrayList<String> da= new ArrayList<>();


        for(int i=0;i<f.size();i++)
        {
           fr.add(f.get(i).getFrom());
           da.add((f.get(i).getTim()));
        }

        for(int i=0;i<f.size();i++) {
            if (fr.get(i).indexOf(inp) != -1) {
                f.add(0, f.remove(i));
                fr.add(0, fr.remove(i));
            }

            if (da.get(i).indexOf(inp) != -1) {
                f.add(0, f.remove(i));
                da.add(0, da.remove(i));
            }

        }

        for(int j=0;j<f.size();j++)
        {
            s.setAttribute("sFd"+j,f.get(j));

        }
        s.setAttribute("fdSearched","yes");






        resp.sendRedirect("feedback.jsp");
        return;
    }
}
