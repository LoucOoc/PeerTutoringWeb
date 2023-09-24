<%--
  Created by IntelliJ IDEA.
  User: lgqoh
  Date: 2022/7/6
  Time: 18:18
  To change this template use File | Settings | File Templates.
--%>
<script src="D://web/jquery.min.js"></script>
<link href="D://web/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="D://web/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<script src="https://how2j.cn/study/js/jquery/2.0.0/jquery.min.js"></script>
<link href="https://how2j.cn/study/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="https://how2j.cn/study/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>success</title>
</head>
<body>
<style type="text/css">
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

  .logi{
    position: absolute;
    width: 60%;
    top: 40%;
    left: 20%;
    border-style: double;
    border-color: black;
    border-width: 3px;

  }

  .up{

    background-color: #E0E0E0;
    width: 100%;
    height: 15%;


  }


</style>


<div id="frontier">
  <div>LOGO waited
    <a href="facePage.html"><img src="logo.jpg"></a>
  </div>
  <div>Hi Guest</div>
</div>

<div id="inFace">
  <div class="up" >
    <p id=right><Strong> </Strong></p>

  </div>

  <br>
  <br>
<%
  String account=(String) session.getAttribute("account");
  String password=(String) session.getAttribute("password");
%>
  <div  class="logi" >
    <div style="padding-left: 5%; padding-top: 5%;padding-bottom: 5%;">
      <p>注册成功</p>
      <p>账号：${account}</p>
      <p>密码：${password}</p>
      <p>建议记事本或备忘录</p>
    </div>
    <a href="login.jsp" class="form-control">返回登陆</a>
  </div>
</div>
<%@include file="nav.jsp"%>
</body>
</html>
