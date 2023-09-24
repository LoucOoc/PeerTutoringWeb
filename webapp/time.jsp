<%@ page import="com.example.demo1.*"%><%--
  Created by IntelliJ IDEA.
  User: lgqoh
  Date: 2022/7/1
  Time: 12:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>

    .iii{
        font-size: 30px;
        margin-top: 40%;
    }

</style>
<%--
change from time to inform
--%>


<%
    user s = (user) session.getAttribute("user");

    String ty="";
    String name="";
    span time;
    if(s.getType()==null||s.getType().equals(""))
    {
        student stu=s.studentify();
        ty="上课";
        cla c=stu.getClassChose();
        name=c.getType();
        time=c.getTime();

    }
    else {
        teacher tea=s.teacherify();
        ty="授课";
        cla c= tea.findClassTeached();
        name=c.getType();
        time=c.getTime();
    }

%>

<div class="iii">课程安排：${ty}</div>

<div class="iii">名称：${name}</div>
<div class="iii">时间：${time}</div>
