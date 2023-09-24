<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.demo1.user" %>
<%@ page import="com.example.demo1.cla" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.demo1.FD" %><%--
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

<script src="js/find.js"></script>

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
   if(u.getType().equals("teacher")) {
     ArrayList<String> stu = u.getStudents();
     ArrayList<String> sea= new ArrayList<>();
     if (s.getAttribute("peerSearched")!=null) {
       for(int i=0;i< stu.size();i++)
       {
        String temp = (String) s.getAttribute("sPeer"+i);
       sea.add(temp);
       }
       s.setAttribute("peer", sea);
     }
     else {

       s.setAttribute("peer", stu);
     }
   }

   ArrayList<FD> fds= u.getFeedback();


  ArrayList<FD> f= new ArrayList<>();
  if (s.getAttribute("fdSearched")!=null) {
    for(int i=0;i< fds.size();i++)
    {
      FD temp = (FD) s.getAttribute("sFd"+i);
      f.add(temp);
    }
    s.setAttribute("feedbacks", f);
  }
  else {

    s.setAttribute("feedbacks",fds);
  }

%>

<ul  class="nav nav-tabs">
  <li class="active">
    <a href="#check" data-toggle="tab">查询反馈</a>
  </li >
  <%
    String identity = (String) session.getAttribute("identity");
  %>
  <c:set var="teacher" value="teacher" scope="page"/>
  <c:if test="${identity=='teacher'}">
    <li>
      <a href="#assign" data-toggle="tab" >布置反馈</a>
    </li>
  </c:if>
</ul>



<div  class="tab-content">
  <div class="tab-pane fade in active" id="check">

    <c:forEach items="${feedbacks}" var="fd" varStatus="status">
      <div  class="col-xs-4" class="it" style="margin: 5%;"><div class="it">

        <center>
          <img src="images/evelop.png" style="width: 50%;">
          <p>来自：${fd.getT()}</p>
          <p>于：${fd.tim}</p>



          <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal${status.index}">
            查看
          </button>
          <div class="modal fade" id="myModal${status.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                  <h4 class="modal-title">反馈：</h4>
                </div>
                <div class="modal-body">
                  <p>反馈内容：${fd.content}</p>

                </div>
                <div class="modal-footer">
                  <div style="float: left">
                    <button  onclick="del('是否删除反馈','del${status.index}')">
                      删除反馈
                    </button>
                    <form id="del${status.index}" action="delF" method="post">
                      <input name="1"  hidden value="${fd.id}">
                    </form>
                  </div>

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


    <c:forEach items="${peer}" var="stu" varStatus="status">
    <div  class="col-xs-4" >
      <center style="margin: 10%; ">
        <br>
        <img src="images/evelop.png" style="width: 50%;">
        <p>给予：${stu}</p>

        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal1${status.index}">
          选择
        </button>

        <div class="modal fade" id="myModal1${status.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">写反馈</h4>
              </div>
              <div class="modal-body">
                反馈内容：<input type="text" id="ct${status.index}" name="content" class="form-control" onkeyup="copy('ct${status.index}')">

              </div>
              <div class="modal-footer">
                <form  action="fdsubmit" method="post" onsubmit="return s('ct${status.index}')">



                  <input name="1" id="ct${status.index}c"  value="" hidden >
                  <input name="2" value="${stu}" hidden>


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
