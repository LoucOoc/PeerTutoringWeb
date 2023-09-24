<%@ page import="com.example.demo1.user" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.demo1.cla" %><%--
  Created by IntelliJ IDEA.
  User: lgqoh
  Date: 2022/7/22
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://how2j.cn/study/js/jquery/2.0.0/jquery.min.js"></script>
<link href="https://how2j.cn/study/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="https://how2j.cn/study/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <script src="js/find.js">
var count =0;

    </script>
    <style type="text/css">
        .background{

            margin: auto;
            text-align: center;
            background-color: whitesmoke;
            width: 60%;
            height: 200%;
        }

        td
        {
            text-align: center;
        }
    </style>
</head>
<body>

<%
    HttpSession s = (HttpSession) request.getSession();
    String ac =(String) s.getAttribute("account");
    user u= user.setUserByAccount(ac);

    if(u==null||u.getName()==null)
    {


        response.sendRedirect("facePage.html");
    }
%>


<div class="background">
    <div style="height: 5%;"></div>
    <img src="images/name.jpg" style="height: 30%;">
    <br>
    <br>
    <p>姓名：${user.name}</p>
    <p>账号：${user.account}</p>
    <p>年级：${user.grade}</p>
    <p>班级：${user.className}</p>
    <br>
    <hr>
    <hr>
    <p>所选课程：</p>

    <table border="1" width="100%" style="margin: auto;">
        <tr>
            <td>课程名称</td>
            <td>时间</td>
            <td>老师</td>
            <td>地点</td>
            <td>学生 </td>
        </tr>
        <c:forEach items="${user.classChose}" var="clas" varStatus="status">

        <tr>
            <td>${clas.getType()}</td>
            <td>${clas.getTime()}</td>
            <td>${clas.getTeacher().getName()}</td>
            <td>${clas.getRoom()}</td>
            <td>

                <button  type="button" class="btn btn-primary form-control"  data-toggle="modal" data-target="#myModal${status.index}">查看学生</button>

            <td>
        </tr>


        <div class="modal fade" id="myModal${status.index}" tabindex="-1" role="dialog">


            <div class="modal-dialog">
            <div class="modal-content">
            <div class="modal-header">
                <button  data-dismiss="modal" class="close form-control" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
            <p> 查看学生</p>
            </div>




        <div class="modal-body">






            <c:forEach items="${clas.peer()}" var="st" varStatus="stat">
            <p>${st}</p>
            </c:forEach>


        </div>
            </div>
            </div>
        </div>
        </c:forEach>
    </table>

    <br>
    <br>
    <p>教授课程：</p>
    <table border="1" width="100%" style="margin: auto;">
        <tr>
            <td>课程名称</td>
            <td>时间</td>
            <td>老师</td>
            <td>地点</td>
            <td>学生 </td>
        </tr>

        <c:forEach items="${user.classTeach}" var="clas" varStatus="status">

            <tr>
                <td>${clas.getType()}</td>
                <td>${clas.getTime()}</td>
                <td>${clas.getTeacher().getName()}</td>
                <td>${clas.getRoom()}</td>
                <td>

                    <button  type="button" class="btn btn-primary form-control"  data-toggle="modal" data-target="#myModal1${status.index}">查看学生</button>

                <td>
            </tr>


            <div class="modal fade" id="myModal1${status.index}" tabindex="-1" role="dialog">


                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button  data-dismiss="modal" class="close form-control" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                            <p> 查看学生</p>
                        </div>




                        <div class="modal-body">






                            <c:forEach items="${clas.peer()}" var="st" varStatus="stat">
                                <p>${st}</p>
                            </c:forEach>


                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </table>

    <a href="fpStu.jsp">返回主页</a>
    <br>
    <br>
    <br>
    <a href="facePage.html" onclick="clear()">登出</a>
</div>


</body>
</html>
