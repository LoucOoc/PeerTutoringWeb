
<script src="https://how2j.cn/study/js/jquery/2.0.0/jquery.min.js"></script>
<link href="https://how2j.cn/study/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="https://how2j.cn/study/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="com.example.demo1.user" %>
<html>
<head>

  <script src="js/find.js"></script>
  <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
  <title>排课</title>

</head>
<body>
<%
  HttpSession s = request.getSession();
  user u= (user) s.getAttribute("user");

  if(u==null)
  {

    response.sendRedirect("facePage.html");
  }
%>
<style>

  #right{
    width: 85%;
    position: absolute;
    height: 100%;
    left: 15%;
    background-color: whitesmoke;
  }

  #up{
    width: 100%;
    height: 20%;
    background-color: lightgray;

  }

  a{
    font-size:200%;
    color: black;
  }

  #down{
    width: 100%;
    height: 80%;
  }

</style>

<script src="js/find.js"></script>

<jsp:include page="frontierL.jsp"></jsp:include>

<div id="right">

  <div id="up">


    <div style="float: right; margin-top: 4%;" class="btn-group">
      <button type="button" class="btn btn-default dropdown-toggle btn btn-link"  data-toggle="dropdown" id="info" >
        Hello ${name}  <img src="images/portrait.png"/>
        <span class="caret"></span>
      </button>
      <ul class="dropdown-menu" role="menu">
        <li>
          <a href="info.jsp">个人信息 </a>
        </li>
        <li role="presentation">
          <a  onclick="clear()" href="facePage.html">登出</a>
        </li>
      </ul>
    </div>
  </div>

  <iframe id="down" src="contentA.jsp"></iframe>
</div>


</body>
</html>
