<%--
  Created by IntelliJ IDEA.
  User: lgqoh
  Date: 2022/7/28
  Time: 17:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <title>Title</title>
</head>
<style>
    #frontier
    {
        position: absolute;
        width: 15%;
        height: 100%;
        background-color: gray;
        float: left;


    }
    .content{
        margin-top: 25%;
    }


    a{

        font-size:170%;
        color: black;


    }




</style>
<body>
<div id="frontier">

    <div class="content">LOGO waited
        <a href="fpStu.jsp"><img src="logo.jpg"></a>
    </div>
    <div class="content">
    <a href="booking.jsp">选课</a>
    </div>
    <%
        String identity = (String) session.getAttribute("identity");
    %>
    <c:set var="teacher" value="teacher" scope="page"/>
    <c:if test="${identity=='teacher'}">
    <div class="content">
            <a href="arranging.jsp" >排课</a>
    </div>
    </c:if>
    <div class="content">
     <a href="assignment.jsp">作业</a>
    </div>
    <div class="content">
        <a href="feedback.jsp">反馈</a>
    </div>
    <div class="content">
     <a href="document.jsp">资料</a>
    </div>

</div>
</body>
</html>
