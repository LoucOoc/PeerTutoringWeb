<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<script src="https://how2j.cn/study/js/jquery/2.0.0/jquery.min.js"></script>
<link href="https://how2j.cn/study/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="https://how2j.cn/study/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.example.demo1.cla" %>
<%@ page import="com.example.demo1.user" %>
<%@ page import="com.example.demo1.teacher" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<html>







<head>
    <script src="js/find.js"></script>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <title>info</title>
    <title>jjj</title>
</head>

<style>
    .it{
        margin: 10%;
        background-color: gainsboro;
        height: 40%;

    }
</style>





<script type="text/javascript">

    var amendBtn = document.getElementById("amend");
    var inp= document.getElementsByClassName("info");



    function a (){

        for( var i=0;i<inp.length;i++)
        {
            inp[i].removeAttribute("readonly");
        }

    }
    function del(me,formid)
    {
        var d = confirm(me);
        var form= document.getElementById(formid)
        if(d)
        {
            form.submit();
        }
    }

</script>





<body>
<%
    HttpSession s = request.getSession();
    user u= (user) s.getAttribute("user");

    if(u==null)
    {

        response.sendRedirect("facePage.html");
    }
%>

<style type="text/css">

    .panelDown{

        height: 120%;
        width: 55%;
        margin: 5%;
        background-color: ghostwhite;
    }

    .panelUp{


        height: 95%;
        width: 95%;

        background-color: whitesmoke;

    }

    textarea{
        resize: none;
    }

</style>












<ul  class="nav nav-tabs">
    <li class="active">
        <a href="#choose" data-toggle="tab">课程管理</a>
    </li >

    <li >
        <a href="#manage" data-toggle="tab" >新增课程</a>
    </li>
</ul>













<div  class="tab-content">









    <div class="tab-pane fade in active" id="choose">

        <%
            String account= (String) session.getAttribute("account");
             u = user.setUserByAccount(account);
            ArrayList<cla> classs= u.getClassTeach();
            request.setAttribute("classs", classs);

        %>


        <div class="container">



            <div class="row">




                <c:forEach items="${classs}" var="clas" varStatus="status">



                    <div  class="col-xs-4" class="it" >
<div class="it">
                        <center>
<br>
                            <br>

                            <p>科目：${clas.type}</p>
                            <p>教师：${clas.teacher.name}</p>
                            <p>时间：${clas.time}</p>
                            <p>about：${clas.intro}</p>








                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal${status.index}">修改</button>






                            <div class="modal fade" id="myModal${status.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">


                                <div class="modal-dialog">
                                    <div class="modal-content">

                                        <div class="modal-header">
                                            <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                                            <h4 class="modal-title">课程管理</h4>
                                        </div>

                                        <div class="modal-body">
                                            <p>课程信息</p>

                                            科目：<input type="text" name="type" placeholder="科目" value="${clas.type}" readonly  class="info form-control" id="type1${status.index}" form="f" onkeyup="copy('type1${status.index}')">
                                            <br>
                                            上课时间：



                                            <div class="input-group">


                                                <div class="input-group-btn">





                                                    <button onclick="copy('week1${status.index}')" onfocus="copy('week1${status.index}')" type="button" class="info btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false" readonly>星期<span class="caret"></span></button>






                                                    <ul class="dropdown-menu" role="menu">

                                                        <li><button  type="button" class="form-control" id="wa1"  onclick="select('wa1','week1${status.index}');copy('week1${status.index}')" >周一</button></li>
                                                        <li><button type="button" class="form-control" id="wb1"   onclick="select('wb1','week1${status.index}');copy('week1${status.index}')">周二</button></li>
                                                        <li><button type="button" class="form-control" id="wfd2"  onclick="select('wfd2','week1${status.index}');copy('week1${status.index}')">周三</button></li>
                                                        <li><button type="button" class="form-control" id="wfa1"  onclick="select('wfa1','week1${status.index}');copy('week1${status.index}')">周四</button></li>
                                                        <li><button type="button" class="form-control" id="wfb1"  onclick="select('wfb1','week1${status.index}');copy('week1${status.index}')">周五</button></li>
                                                        <li><button type="button" class="form-control" id="wfc1"  onclick="select('wfc1','week1${status.index}');copy('week1${status.index}')">周六</button></li>
                                                        <li><button type="button" class="form-control" id="wfd1"  onclick="select('wfd1','week1${status.index}');copy('week1${status.index}')">周日</button></li>

                                                    </ul>





                                                </div>


                                                <input onkeyup="copy('week1${status.index}')" form="f" type="text" class="form-control" id="week1${status.index}" name="week1" aria-label="..." readonly placeholder="星期几" value="${clas.time.day}">
                                            </div>





                                            <div class="input-group">
                                                <div class="input-group-btn">
                                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false" readonly>开始时间</button>

                                                </div>
                                                <input onblur="copy('tb${status.index}')" onkeyup="copy('tb${status.index}')" form="f" type="time" name="timeB1" class="info form-control" id="tb${status.index}" readonly value="${clas.time.startTime}">
                                            </div>




                                            <div class="input-group">
                                                <div class="input-group-btn">
                                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false" readonly>结束时间</button>

                                                </div>
                                                <input onblur="copy('te${status.index}')" onkeyup="copy('te${status.index}')" form="f" type="time" name="timeE1" class="info form-control" id="te${status.index}" readonly value="${clas.time.endTime}">
                                            </div>


                                            <br>
                                            教室：<input onkeyup="copy('room${status.index}')" form="f" type="text" name="room" placeholder="教室" value="${clas.room}" readonly  class="info form-control" id="room${status.index}">
                                            <br>
                                            简介：<input onkeyup="copy('about${status.index}')" form="f" type="text" name="about" placeholder="简介" value="${clas.intro}" readonly  class="info form-control" id="about${status.index}">

                                            <br>


                                            <button id="amend" onclick="a()"> 修改</button>
                                            <br>
                                            <input form="f" value="${clas.id}" readonly name="idc" hidden>
                                            <input form="f" value="${account}" readonly name="ids" hidden>


                                            <div class="modal-footer">
                                                <div style="float: left">
                                                    <button  onclick="del('是否删除课程','del${status.index}')">
                                                        删除课程
                                                    </button>
                                                <form id="del${status.index}" action="delC" method="post">
                                                    <input name="1"  hidden value="${clas.id}">
                                                </form>
                                                </div>

                                                <form id="f" action="modify" method="post" onsubmit="return s('type1${status.index} week1${status.index} tb${status.index} te${status.index} room${status.index} about${status.index}')">


                                                    <input name="1" id="type1${status.index}c"  value="" hidden>
                                                    <input name="2" id="week1${status.index}c"  value="" hidden>
                                                    <input name="3" id="tb${status.index}c"  value="" type="time" hidden>
                                                    <input name="4" id="te${status.index}c"  value="" type="time" hidden>
                                                    <input name="5" id="room${status.index}c"  value="" hidden>
                                                    <input name="6" id="about${status.index}c"  value="" hidden>
                                                    <input name="7"  hidden value="${clas.id}">

                                                    <button class="btn btn-primary" type="submit">是</button>
                                                    <button data-dismiss="modal" class="btn btn-default" type="button">否</button>
                                                </form>


                                            </div>
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





    </div>





























    <div class="tab-pane fade " id="manage">

        <center>

            <div class="panelDown">
                <br>
                <div class="panelUp">
                    <br>
                    <p>新增课程</p>
                    <br>

                    <form action="add" method="post" onsubmit="return s('type2 detail week bii e r abouttt')">

                        <div class="input-group">
                            <div class="input-group-btn">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">课程类型<span class="caret"></span></button>
                                <ul class="dropdown-menu" role="menu">

                                    <li><button  type="button" class="form-control" id="a" onclick="select('a','type2')" >托福</button></li>
                                    <li><button type="button" class="form-control" id="b" onclick="select('b','type2')">雅思</button></li>
                                    <li><button type="button" class="form-control" id="c"onclick="select('c','type2')">AP</button></li>
                                    <li><button type="button" class="form-control" id="fa" onclick="select('fa','type2')">ACT</button></li>
                                    <li><button type="button" class="form-control" id="fb" onclick="select('fb','type2')">体育</button></li>
                                    <li><button type="button" class="form-control" id="fc" onclick="select('fc','type2')">其他</button></li>

                                </ul>
                            </div>
                            <input type="text" class="form-control" id="type2" name="type2" aria-label="..." readonly placeholder="课程类型">
                        </div>



                        <br>
                        具体课程 (阅读、写作等) :<input type="text" name="detail"  class="form-control" placeholder="课程细节(不能使用#）" id="detail" οnkeyup="value=value.replace('#','')">

                        <br>
                        上课时间：
                        <div class="input-group">
                            <div class="input-group-btn">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">星期<span class="caret"></span></button>
                                <ul class="dropdown-menu" role="menu">

                                    <li><button  type="button" class="form-control" id="wa" onclick="select('wa','week')" >周一</button></li>
                                    <li><button type="button" class="form-control" id="wb" onclick="select('wb','week')">周二</button></li>
                                    <li><button type="button" class="form-control" id="wc"onclick="select('wc','week')">周三</button></li>
                                    <li><button type="button" class="form-control" id="wfa" onclick="select('wfa','week')">周四</button></li>
                                    <li><button type="button" class="form-control" id="wfb" onclick="select('wfb','week')">周五</button></li>
                                    <li><button type="button" class="form-control" id="wfc" onclick="select('wfc','week')">周六</button></li>
                                    <li><button type="button" class="form-control" id="wfd" onclick="select('wfd','week')">周日</button></li>

                                </ul>
                            </div>
                            <input type="text" class="form-control" id="week" name="week" aria-label="..." readonly  placeholder="星期几">
                        </div>

                            <div class="input-group">
                                <div class="input-group-btn">
                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false" readonly>开始时间</button>

                                </div>
                                <input type="time" name="timeB" class="form-control" id="bii">
                            </div>






                            <div class="input-group">
                                <div class="input-group-btn">
                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false" readonly>结束时间</button>

                                </div>
                                <input type="time" name="timeE" class="form-control" id="e">
                            </div>

                            <br>


                            地点：
                            <input type="text" name="room1" class="form-control" placeholder="可填暂无" id="r">
                            <br>
                            <br>
                            简介(100字以内）：<textarea class="form-control" placeholder="简介(100字以内）" name="about1" maxlength="100" id="abouttt"></textarea>

                            <button type="submit" class="form-control">提交课程</button>
                    </form>
                </div>


            </div>





        </center>
    </div>












</div>


</body>


</html>