<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.demo1.user" %>
<%@ page import="com.example.demo1.cla" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: lgqoh
  Date: 2022/8/29
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<script src="https://how2j.cn/study/js/jquery/2.0.0/jquery.min.js"></script>
<link href="https://how2j.cn/study/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="https://how2j.cn/study/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<html>
<head>
    <title>Title</title>
</head>



<script >
    function copy(i)
    {

        var ori= document.getElementById(i);

        var j=i+"c";
        var cop=document.getElementById(j);

        cop.value=ori.value;
    }

</script>


<body>

<%
    HttpSession s = (HttpSession) request.getSession();
    user u= (user) s.getAttribute("user");

    if(u==null)
    {

        response.sendRedirect("facePage.html");
    }
    String ac = (String)s.getAttribute("account");
    u=user.setUserByAccount(ac);
    ArrayList<cla> ct=u.getClassTeach();
    ArrayList<cla> cc = u.getClassChose();

    s.setAttribute("claChose",cc);
    s.setAttribute("claTeach",ct);
%>

<ul  class="nav nav-tabs">
    <li class="active">
        <a href="#check" data-toggle="tab">查询作业</a>
    </li >
<%
    String identity = (String) session.getAttribute("identity");
%>
<c:set var="teacher" value="teacher" scope="page"/>
<c:if test="${identity=='teacher'}">
    <li>
        <a href="#assign" data-toggle="tab" >布置作业</a>
    </li>
</c:if>
</ul>



<div  class="tab-content">
<div class="tab-pane fade in active" id="check">

<c:forEach items="${claChose}" var="clas" varStatus="status">
    <div  class="col-xs-4" class="it" style="margin: 5%;"><div class="it">

    <center>
    <img src="images/evelop.png" style="width: 50%;">
    <p>来自：${clas.teacher.name}</p>



    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal${status.index}">
    查看
    </button>
    <div class="modal fade" id="myModal${status.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
    <div class="modal-content">
    <div class="modal-header">
    <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
    <h4 class="modal-title">作业：</h4>
    </div>
    <div class="modal-body">
    <p>作业内容：${clas.getHW()}</p>
    <p>截止至：${clas.getDDL()}</p>
          </div>
          <div class="modal-footer">
            <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>

        </div>
        </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
        </div>



                </center>
                </div>
        </div>

        </c:forEach>



        </div>

        <div class="tab-pane fade " id="assign">


        <c:forEach items="${claTeach}" var="clas" varStatus="status">
        <div  class="col-xs-4" >
        <center style="margin: 10%; background-color: gainsboro; ">
        <br>
        <p>科目：${clas.type}</p>
        <p>教师：${clas.teacher.name}</p>
        <p>时间：${clas.time}</p>
        <p>about：${clas.intro}</p>

        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal1">
        选择
        </button>

        <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog">
        <div class="modal-content">
        <div class="modal-header">
        <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">布置作业</h4>
        </div>
        <div class="modal-body">
        作业内容：<input type="text" id="ct${status.index}" name="content" class="form-control" onkeyup="copy('ct${status.index}')">
        截止日期：<input type="date" id="ddl${status.index}" name="ddl" class="form-control" onkeyup="copy('ddl${status.index}')">
        </div>
        <div class="modal-footer">
        <form  action="hksubmit" method="post" onsubmit="return s('ct${status.index} ddl${status.index}')">



        <input name="1" id="ct${status.index}c"  value="" hidden >
        <input name="2" type="date" id="ddl${status.index}c"  value=""  hidden>
        <input name="3"  hidden value="${clas.id}">

        <button class="btn btn-primary" type="submit">提交</button>
        <button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
        </form>


        </div>
                </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
        </div>


        <br>
        <br>
        </center>
        </div>
        </c:forEach>




        </body>
        </html>
