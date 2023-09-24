<%--
  Created by IntelliJ IDEA.
  User: lgqoh
  Date: 2022/8/24
  Time: 0:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="D://web/jquery.min.js"></script>
<link href="D://web/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="D://web/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<script src="https://how2j.cn/study/js/jquery/2.0.0/jquery.min.js"></script>
<link href="https://how2j.cn/study/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="https://how2j.cn/study/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="./css/format.css" />
<html><head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <script type="text/javascript" src="js/find.js">

  </script>
<title>注册</title>
</head>
<body>

<style type="text/css">

  .up{
    background-color: #E0E0E0;
    position: relative;
    width: 100%;
    height: 15%;
  }

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
    left: 20%;
  }

  .up{
    background-color: #E0E0E0;
  }



</style>


<div id="frontier">
  <div>LOGO waited
    <a href="facePage.html"><img src="logo.jpg"></a>
  </div>
  <div>Hi Guest</div>
</div>

<div id="inFace">

  <div class="up" style="font-size: 250%; ">
    <p id=right ><Strong style="margin-left: 43%;"> 注册</Strong></p>


  </div>

  <br>
  <br>

  <div align="center" class="logi" >
    <img src="images/portrait.png">

    <form action="register" method="post" onsubmit="return clarify()" >


      姓名:<input type="text" name="name" class="form-control" id="na" placeholder="仅中文姓名" onblur="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')">
      <br>
      <div class="input-group">
        <div class="input-group-btn">
          <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">年级<span class="caret"></span></button>
          <ul class="dropdown-menu" role="menu">
            <li><button  type="button" class="form-control" id="a" onclick="select('a','grade')" >高一</button></li>
            <li><button type="button" class="form-control" id="b" onclick="select('b','grade')">高二</button></li>
            <li><button type="button" class="form-control" id="c" onclick="select('c','grade')">高三</button></li>
            <li class="divider"></li>
            <li><button type="button" class="form-control" id="fa" onclick="select('fa','grade')">四高一</button></li>
            <li><button type="button" class="form-control" id="fb" onclick="select('fb','grade')">四高二</button></li>
            <li><button type="button" class="form-control" id="fc" onclick="select('fc','grade')">四高三</button></li>
            <li><button type="button" class="form-control" id="fd" onclick="select('fd','grade')">四高四</button></li>
          </ul>
        </div>
        <input type="text" class="form-control" id="grade" name="grade" aria-label="..." readonly>
      </div>

      <br>
      <div class="input-group">
        <div class="input-group-btn">
          <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">班级<span class="caret"></span></button>
          <ul class="dropdown-menu" role="menu">
            <li><button  type="button" class="form-control" id="1" onclick="select('1','class')" >一班</button></li>
            <li><button type="button" class="form-control" id="2" onclick="select('2','class')">二班</button></li>
            <li><button type="button" class="form-control" id="3"onclick="select('3','class')">三班</button></li>
            <li><button type="button" class="form-control" id="4" onclick="select('4','class')">四班</button></li>
            <li><button type="button" class="form-control" id="5" onclick="select('5','class')">五班</button></li>
            <li><button type="button" class="form-control" id="6" onclick="select('6','class')">六班</button></li>
            <li><button type="button" class="form-control" id="7" onclick="select('7','class')">七班</button></li>
          </ul>
        </div>
        <input type="text" class="form-control" id="class" name="class" aria-label="..." readonly>
      </div>

      密码：<input type="password" name="password" id="pswd" class="form-control" onkeyup="clarify()">
      确认密码：<span id="w" style="color: darkred;"></span><input type="text" name="certify" id="certify" class="form-control" onkeyup="clarify()">
      <br>
      <input type="submit" name="submit" class="form-control"  value="注册" >

      <a href="login.jsp" style="float: left;"> 返回登陆</a>


      <button class="btn btn-link" onclick="find()"style="float: right;padding-top: 1%">找回密码</button>
    </form>
    <%
      String warn= (String) session.getAttribute("warnR");
    %>
    <p class="warning" id="warning" style="margin-right: 10%">${warnR}</p>
  </div>
</div>



<nav class="navbar navbar-default navbar-fixed-bottom">
  <div style="text-align:center">
    版权所有: Peer Tutoring Platform
    <br>
    Joining Us: 微信13161681533  QQ：2678261622
  </div>
</nav>




<script type="text/javascript">


</script>

</body></html>

