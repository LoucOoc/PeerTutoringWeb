<%@ page import="com.example.demo1.cla" %>
<script src="D://web/jquery.min.js"></script>
<link href="D://web/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="D://web/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<script src="https://how2j.cn/study/js/jquery/2.0.0/jquery.min.js"></script>
<link href="https://how2j.cn/study/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="https://how2j.cn/study/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="com.example.demo1.user" %>
<%@ page import="com.example.demo1.teacher" %>
<%@ page import="com.example.demo1.span" %>
<html><head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"></head>
<body>

<style type="text/css">

    .it{
        margin: 10%;
        background-color: gainsboro;
        height: 40%;

    }

    center{
        padding: 3%;
        font-size: 10px;
    }
</style>



<%
    HttpSession s= request.getSession();

    user u= (user) s.getAttribute("user");

    if(u==null)
    {

        response.sendRedirect("facePage.html");
    }

    String ac = (String)s.getAttribute("account");
     u= user.setUserByAccount(ac);
     int l =cla.getALL().length;
     cla[] clas=new cla[l];
     String te=(String)s.getAttribute("sear");
     if(te==null)
     {
         clas=cla.getALL();

     }
     else {
         for(int i=0;i<l;i++)
         {
             clas[i]=cla.getClaById(""+s.getAttribute("searchedR"+i));
         }
     }


        request.setAttribute("classes", clas);


%>

<ul  class="nav nav-tabs">
    <li class="active">
        <a href="#choose" data-toggle="tab">选课</a>
    </li >

    <li>
        <a href="#manage" data-toggle="tab" >选课管理</a>
    </li>
</ul>

<div  class="tab-content">
    <div class="tab-pane fade in active" id="choose">

<c:forEach items="${classes}" var="clas" varStatus="status">
<div  class="col-xs-4" class="it"><div class="it">

    <center>
        <p>科目：${clas.type}</p>
        <p>教师：${clas.teacher.getName()}</p>
        <p>时间：${clas.time}</p>
        <p>教室：${clas.room}</p>
        <p>about：${clas.intro}</p>

        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal${status.index}">选择</button>
        <div class="modal fade" id="myModal${status.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title">是否选择</h4>
                    </div>
                    <div class="modal-body">
                        <p>课程信息</p>
                        <p>科目：${clas.type}</p>
                        <p>教师：${clas.teacher.getName()}</p>
                        <p>时间：${clas.time}</p>
                        <p>教室：${clas.room}</p>
                        <p>about：${clas.intro}</p>

                    </div>
                    <div class="modal-footer">
                        <form action="book" method="post">
                            <input value="${clas.id}"  name="idc" readonly hidden>
                            <input value="${account}"  name="ids" readonly hidden>
                            <button class="btn btn-primary" type="submit">是</button>
                            <button data-dismiss="modal" class="btn btn-default" type="button">否</button>
                        </form>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div>

    </center>
</div>
</div>

</c:forEach>
    </div>

    <div class="tab-pane fade " id="manage">
        <%


            ArrayList<cla> classesS = u.getClassChose();
            request.setAttribute("clC",classesS);
        %>
      <p> 总课程数：${clC.size()}</p>
        <c:forEach items="${clC}" var="clas" varStatus="cla">
            <div  class="col-xs-4" class="it"><div class="it">

                <center>
                    <p>科目：${clas.type}</p>
                    <p>教师：${clas.teacher.getName()}</p>
                    <p>时间：${clas.time}</p>
                    <p>教室：${clas.room}</p>
                    <p>简介：${clas.intro}</p>

                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#mana${status.index}">取消</button>
                    <div class="modal fade" id="mana${status.index}" tabindex="-1" role="dialog" a>
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                                    <h4 class="modal-title">是否取消</h4>
                                </div>
                                <div class="modal-body">
                                    <p>课程信息</p>
                                    <p>科目：${clas.type}</p>
                                    <p>教师：${clas.teacher}</p>
                                    <p>时间：${clas.time}</p>
                                    <p>教室：${clas.room}</p>
                                    <p>about：${clas.intro}</p>

                                </div>
                                <div class="modal-footer">
                                    <form action="delete" method="post">
                                        <input value="${clas.id}"  name="idc" readonly hidden>
                                        <input value="${account}"  name="ids" readonly hidden>
                                        <button class="btn btn-primary" type="submit">是</button>
                                        <button data-dismiss="modal" class="btn btn-default" type="button">否</button>
                                    </form>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div>

                </center>
            </div>
            </div>

        </c:forEach>
    </div>
</div>


</body></html>
