
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
  <title>document</title>

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
  #frontier
  {
    position: absolute;
    width: 15%;
    height: 100%;
    background-color: gray;
    float: left;
  }
  #right{
    width: 85%;
    position: absolute;
    height: 100%;
    left: 15%;
    background-color: whitesmoke;
  }
  .content{
    margin-top: 25%;
  }

  #up{
    width: 100%;
    height: 20%;


  }

  a{
    font-size:200%;
    color: black;
  }

  #down{
    width: 100%;
    height: 80%;
  }

  @font-face {
    font-family: 'FontAwesome';
    src: url('./fontawesome-webfont.eot');
    src: url('./fontawesome-webfont.eot') format('embedded-opentype'),
    url('./fontawesome-webfont.woff2') format('woff2'), url('.fontawesome-webfont.woff') format('woff'),
    url('./fontawesome-webfont.ttf') format('truetype'),
    url('./fontawesome-webfont.svg') format('svg');
    font-weight: normal;
    font-style: normal;

  }

  .search-box {
    font-family: FontAwesome;
    position: absolute;
    top: 10%;
    left: 50%;
    transform: translate(-50%, -50%);
    background: #ffffff;
    height: 60px;
    border: 10px;
    border-radius: 40px;
    padding: 10px;
    opacity: 0;
    transition-delay: 99999999s;
    transition-duration: 1s;

  }

  .search-box:hover>.search-txt {
    width: 240px;
    padding: 0 6px;
  }

  .search-box:hover>.search-btn {
    color: white;
    background: black;
  }

  .search-btn {
    transition: 0.5s;
    font-family: FontAwesome;
    font-size: 25px;
    color: black;
    float: right;
    width: 40px;
    height: 40px;
    border: 10px;
    border-radius: 50%;
    background: #ffffff;
    display: flex;
    justify-content: center;
    align-items: center;
    text-decoration: none;
  }

  .search-txt {
    border: none;
    background: none;
    outline: none;
    float: left;
    padding: 0;
    color: black;
    font-size: 16px;
    transition: 0.6s;
    line-height: 50px;
    width: 0px;
  }

  @keyframes flash {
    50% {
      transform: scale(1.5);
    }

    80% {
      transform: rotate(-60deg);
    }

    100% {
      transform: rotate(30deg);
    }


  }
  html:hover .search-box {
    opacity: 1;
    transition-delay: 0s;
    transition-duration: 0s;
  }
</style>

<script src="js/find.js"></script>

<jsp:include page="frontierL.jsp"></jsp:include>

<div id="right">

  <div id="up">

    <form action="SearchFeed" method="post" name="search">
      <center>
        <div class="search-box" >

          <input class="search-txt" type="text" id="inp" name="inp" placeholder="搜索文件名"/>
          <input class="search-btn" type="button" id="btn" value='&#xf002' />

        </div>
      </center>
    </form>

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
          <a href="facePage.html" onclick="clear()">登出</a>
        </li>
      </ul>
    </div>
  </div>

  <iframe id="down" src="contentD.jsp"></iframe>
</div>

<script src="js/search.js"></script>

</body>
</html>
