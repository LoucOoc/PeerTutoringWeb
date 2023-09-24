<%--
  Created by IntelliJ IDEA.
  User: lgqoh
  Date: 2022/6/28
  Time: 21:04
  To change this template use File | Settings | File Templates.
--%>

<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" type="text/css" href="./css/format.css" />
<head>
    <title>登录</title>

</head>
<script src="js/find.js"></script>


<body>
<%@include file="frontier.jsp"%>
<div class="cont">
<%@include file="up.jsp"%>
<div align="center" style="width: 65%;margin-left: 15%;margin-top: 10%">
    <img src="images/portrait.png">
<form action="login" method="post" name="login">
    账号：<input type="text" name="account" id="ac"  class="form-control" >

    密码：<input type="password" name="password" id="pw" class="form-control">
    <br>
    <button type="submit" class="form-control" value="登陆" style="width: 30%; display:block;margin:0 auto">登陆</button>

    <button class="btn btn-link" onclick="find()"style="float: right">找回密码</button>
    <a href="register.jsp" style="float: left">注册</a>

    <%
        String warn= (String) session.getAttribute("warn");
    %>
    <p class="warning" id="warning" style="margin-right: 10%">${warn}</p>
</form>
</div>
</div>



</body>
<%@include file="nav.jsp"%>
</html>
