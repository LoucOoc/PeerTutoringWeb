<%@ page import="com.example.demo1.user" %><%--
  Created by IntelliJ IDEA.
  User: lgqoh
  Date: 2022/6/30
  Time: 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://how2j.cn/study/js/jquery/2.0.0/jquery.min.js"></script>
<link href="https://how2j.cn/study/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="https://how2j.cn/study/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="js/find.js"></script>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/format.css">
    <title>Title</title>
    <style>
        #frontier
        {
            position: absolute;
            width: 15%;
            height: 100%;
            background-color: gray;
            float: left;
        }

        #inFace
        {
            padding-top: 0px;
            position: absolute;
            width: 85%;
            height: 100%;
            left: 15%;

        }



        ol{
            width: 100%;
            height: 90px;
        }
        li {

            font-size: 20px;

            /* style */
        }
        li.ac{
            float: right;
        }

        li.ab{
            margin-top: 20px;
        }

        span#cou{
            font-size: 20px;
        }

        .title{
            text-align: center;
            border-bottom-style:solid ;
        }

        #club{
            font-size: 80px;
        }

        #school{
            font-size: 40px;
        }

        #t1{
            font-size: 45px;
        }

        #s1{
            font-size: 30px;
        }

    </style>
</head>
<body>
<%
    HttpSession s = (HttpSession) request.getSession();
    user u= (user) s.getAttribute("user");

    if(u==null||u.getName()==null)
    {


        response.sendRedirect("facePage.html");
    }
%>




<div id="frontier">
    <div>LOGO waited
        <a href="fpStu.jsp"><img src="logo.jpg"></a>
    </div>

 <%--  <%@include file="time.jsp"%>
 --%>

    <div style="margin-top: 20%;">

        <p style="font-size: 300%;">通知:</p>
        <%--
        等做管理员页面再说
        --%>

    </div>

</div>

<div id="inFace">
    <div>
        <ol class="breadcrumb">
            <li class="ab">
                <div class="dropdown"> <button class="btn btn-link" class="btn dropdown-toggle" data-toggle="dropdown" >
                    <span id="cou">课程</span> <span class="caret"></span>
                </button>

                    <ul class="dropdown-menu" role="menu">
                        <li>
                            <a href="booking.jsp">选课</a>
                        </li>


                        <%
                            String identity = (String) session.getAttribute("identity");
                        %>
                        <c:set var="teacher" value="teacher" scope="page"/>
                        <c:if test="${identity=='teacher'}">
                        <li role="presentation">
                            <a href="arranging.jsp" >排课</a>
                        </li>
                        </c:if>


                    </ul>
                </div>
            </li>
            <li class="ab"> <a href="assignment.jsp">作业</a></li>
            <li class="ab"> <a href="feedback.jsp">反馈</a></li>
            <li class="ab"> <a href="document.jsp">资料</a></li>
            <li class="ac"> <div class="btn-group">
                <button type="button" class="btn btn-default dropdown-toggle btn btn-link"  data-toggle="dropdown">
                    Hello ${name}  <img src="images/portrait.png"/>
                    <span class="caret"></span>
                </button>

                <ul class="dropdown-menu" role="menu">
                    <li>
                        <a href="info.jsp">个人信息 </a>
                    </li>
                    <li role="presentation">
                        <a href="facePage.html" onclick="clear()">登出</a>
                    </li>
                </ul>
            </div> </li>
        </ol>
    </div>

    <div>
        <span class="title" >
        <p id="club">Peer Tutoring Platform<p>
        <i id="school">21st CIS</i></p>
        <hr>
        </span>

        <span class="title">
            <p id="t1"><b>About Us</b></p>
            <p id="s1"><ins>blablabla</ins></p>
        </span>
    </div>


</div>



<%@include file="nav.jsp"%>

</body>
</html>
