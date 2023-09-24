<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.demo1.cla" %><%--
  Created by IntelliJ IDEA.
  User: lgqoh
  Date: 2022/7/7
  Time: 12:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="D:\web/jquery.min.js"></script>
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="https://how2j.cn/study/js/jquery/2.0.0/jquery.min.js"></script>
<link href="https://how2j.cn/study/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="https://how2j.cn/study/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<html><head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8"></head>
<body>
<style type="text/css">

  .it{
    margin: 10%;
    background-color: gainsboro;
    height: 30%;
    width: 100%;

  }

  center{
    padding: 3%;
    font-size: 10px;
  }

  .cata{
    position: absolute;
    width: 15%;
    height: 97%;
    background-color: gray;
    float: left;
  }

  .cata-btn{
    width: 100%;

  }

  .timetable{
    padding-top: 0px;
    position: absolute;
    width: 80%;
    height: 97%;
    left: 20%;
  }

  table{
    height: 100%;
    width: 100%;
  }

  .odd{
    background-color: F7F9F6;
  }
</style>

<div class="cata">
  <button class="cata-btn">托福</button>
  <button class="cata-btn">ACT</button>
  <button class="cata-btn">雅思</button>
  <button class="cata-btn">AP</button>
  <button class="cata-btn">体育</button>
  <button class="cata-btn">其他</button>
</div>

<%
    List<String> list = new ArrayList<String>();
    list.add("周一");
    list.add("周二");
    list.add("周三");
    list.add("周四");
    list.add("周五");
    list.add("周六");
    list.add("周日");
    request.setAttribute("list", list);

  cla[][] c = cla.TimeSort();


   %>

<div class="timetable">



  <table>

    <tr class="odd">
      <td></td>
      <td>周一</td>
      <td>周二</td>
      <td>周三</td>
      <td>周四</td>
      <td>周五</td>
      <td>周六</td>
      <td>周日</td>
    </tr>

    <tr >
      <td>第一节</td>

      <c:forEach items= "${requestScope.list}" var="day" varstatus="vs">

        <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#1myModal${vs.index}">
          查看课程
        </button>

          <div class="modal fade" id="1myModal${vs.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                  <h4 class="modal-title">查看课程</h4>
                </div>
                <div class="modal-body">

                  <c:forEach items= "${twoMons}" var="clas" varstatus="status">
                    <div  class="col-xs-4" class="it"><div class="it">

                      <center>
                        <p>科目：${clas.type}</p>
                        <p>教师：${clas.teacher.getName()}</p>
                        <p>时间：${clas.time}</p>
                        <p>教室：${clas.room}</p>
                        <p>about：${clas.intro}</p>

                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#1mmyModal${status.index}">选择</button>
                        <div class="modal fade" id="1mmyModal${status.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                          <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header">
                                <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                                <h4 class="modal-title">是否选择</h4>
                              </div>
                              <div class="modal-body">
                                <p>课程信息</p>
                                <p>科目：${clas.type}</p>
                                <p>教师：${clas.teacher.getName()}</p>
                                <p>时间：${clas.time}</p>
                                <p>教室：${clas.room}</p>
                                <p>about：${clas.intro}</p>

                              </div>
                              <div class="modal-footer">
                                <form action="book" method="post">
                                  <input value="${clas.id}"  name="idc" readonly hidden>
                                  <input value="${account}"  name="ids" readonly hidden>
                                  <button class="btn btn-primary" type="submit">是</button>
                                  <button data-dismiss="modal" class="btn btn-default" type="button">否</button>
                                </form>
                              </div>
                            </div><!-- /.modal-content -->
                          </div><!-- /.modal-dialog -->
                        </div>

                      </center>
                    </div>
                    </div>
                  </c:forEach>


                </div>
                <div class="modal-footer">

                </div>
              </div>
            </div>
          </div></td>



      </c:forEach>

    </tr>
    <tr class="odd">
      <td>第二节</td>
      <c:forEach items= "${requestScope.list}" var="day" varstatus="vs">
        <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal${vs.index}">
          查看课程
        </button>

          <div class="modal fade" id="myModal${vs.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                  <h4 class="modal-title">查看课程</h4>
                </div>
                <div class="modal-body">

                  <c:forEach items= "${twoMons}" var="clas" varstatus="status">
                    <div  class="col-xs-4" class="it"><div class="it">

                      <center>
                        <p>科目：${clas.type}</p>
                        <p>教师：${clas.teacher.getName()}</p>
                        <p>时间：${clas.time}</p>
                        <p>教室：${clas.room}</p>
                        <p>about：${clas.intro}</p>

                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#mmyModal${status.index}">选择</button>
                        <div class="modal fade" id="mmyModal${status.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                          <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header">
                                <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                                <h4 class="modal-title">是否选择</h4>
                              </div>
                              <div class="modal-body">
                                <p>课程信息</p>
                                <p>科目：${clas.type}</p>
                                <p>教师：${clas.teacher.getName()}</p>
                                <p>时间：${clas.time}</p>
                                <p>教室：${clas.room}</p>
                                <p>about：${clas.intro}</p>

                              </div>
                              <div class="modal-footer">
                                <form action="book" method="post">
                                  <input value="${clas.id}"  name="idc" readonly hidden>
                                  <input value="${account}"  name="ids" readonly hidden>
                                  <button class="btn btn-primary" type="submit">是</button>
                                  <button data-dismiss="modal" class="btn btn-default" type="button">否</button>
                                </form>
                              </div>
                            </div><!-- /.modal-content -->
                          </div><!-- /.modal-dialog -->
                        </div>

                      </center>
                    </div>
                    </div>
                  </c:forEach>


                </div>
                <div class="modal-footer">

                </div>
              </div>
            </div>
          </div></td>

      </c:forEach>
    </tr>
    <tr>
      <td>第三节</td>
      <c:forEach items= "${requestScope.list}" var="day" varstatus="vs">

        <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#3myModal${vs.index}">
          查看课程
        </button>

          <div class="modal fade" id="3myModal${vs.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                  <h4 class="modal-title">查看课程</h4>
                </div>
                <div class="modal-body">

                  <c:forEach items= "${twoMons}" var="clas" varstatus="status">
                    <div  class="col-xs-4" class="it"><div class="it">

                      <center>
                        <p>科目：${clas.type}</p>
                        <p>教师：${clas.teacher.getName()}</p>
                        <p>时间：${clas.time}</p>
                        <p>教室：${clas.room}</p>
                        <p>about：${clas.intro}</p>

                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#3mmyModal${status.index}">选择</button>
                        <div class="modal fade" id="3mmyModal${status.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                          <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header">
                                <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                                <h4 class="modal-title">是否选择</h4>
                              </div>
                              <div class="modal-body">
                                <p>课程信息</p>
                                <p>科目：${clas.type}</p>
                                <p>教师：${clas.teacher.getName()}</p>
                                <p>时间：${clas.time}</p>
                                <p>教室：${clas.room}</p>
                                <p>about：${clas.intro}</p>

                              </div>
                              <div class="modal-footer">
                                <form action="book" method="post">
                                  <input value="${clas.id}"  name="idc" readonly hidden>
                                  <input value="${account}"  name="ids" readonly hidden>
                                  <button class="btn btn-primary" type="submit">是</button>
                                  <button data-dismiss="modal" class="btn btn-default" type="button">否</button>
                                </form>
                              </div>
                            </div><!-- /.modal-content -->
                          </div><!-- /.modal-dialog -->
                        </div>

                      </center>
                    </div>
                    </div>
                  </c:forEach>


                </div>
                <div class="modal-footer">

                </div>
              </div>
            </div>
          </div></td>

      </td>
      </c:forEach>
    </tr>
    <tr class="odd">
      <td>第四节</td>
      <c:forEach items= "${requestScope.list}" var="day" varstatus="vs">
        <td>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#4myModal${vs.index}">
          查看课程
        </button>

          <div class="modal fade" id="4myModal${vs.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                  <h4 class="modal-title">查看课程</h4>
                </div>
                <div class="modal-body">

                  <c:forEach items= "${twoMons}" var="clas" varstatus="status">
                    <div  class="col-xs-4" class="it"><div class="it">

                      <center>
                        <p>科目：${clas.type}</p>
                        <p>教师：${clas.teacher.getName()}</p>
                        <p>时间：${clas.time}</p>
                        <p>教室：${clas.room}</p>
                        <p>about：${clas.intro}</p>

                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#4mmyModal${status.index}">选择</button>
                        <div class="modal fade" id="4mmyModal${status.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                          <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header">
                                <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                                <h4 class="modal-title">是否选择</h4>
                              </div>
                              <div class="modal-body">
                                <p>课程信息</p>
                                <p>科目：${clas.type}</p>
                                <p>教师：${clas.teacher.getName()}</p>
                                <p>时间：${clas.time}</p>
                                <p>教室：${clas.room}</p>
                                <p>about：${clas.intro}</p>

                              </div>
                              <div class="modal-footer">
                                <form action="book" method="post">
                                  <input value="${clas.id}"  name="idc" readonly hidden>
                                  <input value="${account}"  name="ids" readonly hidden>
                                  <button class="btn btn-primary" type="submit">是</button>
                                  <button data-dismiss="modal" class="btn btn-default" type="button">否</button>
                                </form>
                              </div>
                            </div><!-- /.modal-content -->
                          </div><!-- /.modal-dialog -->
                        </div>

                      </center>
                    </div>
                    </div>
                  </c:forEach>


                </div>
                <div class="modal-footer">

                </div>
              </div>
            </div>
          </div></td>

     </td>
      </c:forEach>
    </tr>
    <tr>
      <td>第五节</td>
      <c:forEach items= "${requestScope.list}" var="day" varstatus="vs">
        <td>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#5myModal${vs.index}">
          查看课程
        </button>

          <div class="modal fade" id="5myModal${vs.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                  <h4 class="modal-title">查看课程</h4>
                </div>
                <div class="modal-body">

                  <c:forEach items= "${twoMons}" var="clas" varstatus="status">
                    <div  class="col-xs-4" class="it"><div class="it">

                      <center>
                        <p>科目：${clas.type}</p>
                        <p>教师：${clas.teacher.getName()}</p>
                        <p>时间：${clas.time}</p>
                        <p>教室：${clas.room}</p>
                        <p>about：${clas.intro}</p>

                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#5mmyModal${status.index}">选择</button>
                        <div class="modal fade" id="5mmyModal${status.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                          <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header">
                                <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                                <h4 class="modal-title">是否选择</h4>
                              </div>
                              <div class="modal-body">
                                <p>课程信息</p>
                                <p>科目：${clas.type}</p>
                                <p>教师：${clas.teacher.getName()}</p>
                                <p>时间：${clas.time}</p>
                                <p>教室：${clas.room}</p>
                                <p>about：${clas.intro}</p>

                              </div>
                              <div class="modal-footer">
                                <form action="book" method="post">
                                  <input value="${clas.id}"  name="idc" readonly hidden>
                                  <input value="${account}"  name="ids" readonly hidden>
                                  <button class="btn btn-primary" type="submit">是</button>
                                  <button data-dismiss="modal" class="btn btn-default" type="button">否</button>
                                </form>
                              </div>
                            </div><!-- /.modal-content -->
                          </div><!-- /.modal-dialog -->
                        </div>

                      </center>
                    </div>
                    </div>
                  </c:forEach>


                </div>
                <div class="modal-footer">

                </div>
              </div>
            </div>
          </div></td>

      </td>
      </c:forEach>
    </tr>
    <tr class="odd">
      <td>第六节</td>
      <c:forEach items= "${requestScope.list}" var="day" varstatus="vs">
        <td>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#6myModal${vs.index}">
          查看课程
        </button>

          <div class="modal fade" id="6myModal${vs.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                  <h4 class="modal-title">查看课程</h4>
                </div>
                <div class="modal-body">

                  <c:forEach items= "${twoMons}" var="clas" varstatus="status">
                    <div  class="col-xs-4" class="it"><div class="it">

                      <center>
                        <p>科目：${clas.type}</p>
                        <p>教师：${clas.teacher.getName()}</p>
                        <p>时间：${clas.time}</p>
                        <p>教室：${clas.room}</p>
                        <p>about：${clas.intro}</p>

                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#6mmyModal${status.index}">选择</button>
                        <div class="modal fade" id="6mmyModal${status.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                          <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header">
                                <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                                <h4 class="modal-title">是否选择</h4>
                              </div>
                              <div class="modal-body">
                                <p>课程信息</p>
                                <p>科目：${clas.type}</p>
                                <p>教师：${clas.teacher.getName()}</p>
                                <p>时间：${clas.time}</p>
                                <p>教室：${clas.room}</p>
                                <p>about：${clas.intro}</p>

                              </div>
                              <div class="modal-footer">
                                <form action="book" method="post">
                                  <input value="${clas.id}"  name="idc" readonly hidden>
                                  <input value="${account}"  name="ids" readonly hidden>
                                  <button class="btn btn-primary" type="submit">是</button>
                                  <button data-dismiss="modal" class="btn btn-default" type="button">否</button>
                                </form>
                              </div>
                            </div><!-- /.modal-content -->
                          </div><!-- /.modal-dialog -->
                        </div>

                      </center>
                    </div>
                    </div>
                  </c:forEach>


                </div>
                <div class="modal-footer">

                </div>
              </div>
            </div>
          </div></td>

      </td>
      </c:forEach>
    </tr>
    <tr>
      <td>第七节</td>
      <c:forEach items= "${requestScope.list}" var="day" varstatus="vs">

        <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#7myModal${vs.index}">
          查看课程
        </button>

          <div class="modal fade" id="7myModal${vs.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                  <h4 class="modal-title">查看课程</h4>
                </div>
                <div class="modal-body">

                  <c:forEach items= "${twoMons}" var="clas" varstatus="status">
                    <div  class="col-xs-4" class="it"><div class="it">

                      <center>
                        <p>科目：${clas.type}</p>
                        <p>教师：${clas.teacher.getName()}</p>
                        <p>时间：${clas.time}</p>
                        <p>教室：${clas.room}</p>
                        <p>about：${clas.intro}</p>

                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#7mmyModal${status.index}">选择</button>
                        <div class="modal fade" id="7mmyModal${status.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                          <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header">
                                <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                                <h4 class="modal-title">是否选择</h4>
                              </div>
                              <div class="modal-body">
                                <p>课程信息</p>
                                <p>科目：${clas.type}</p>
                                <p>教师：${clas.teacher.getName()}</p>
                                <p>时间：${clas.time}</p>
                                <p>教室：${clas.room}</p>
                                <p>about：${clas.intro}</p>

                              </div>
                              <div class="modal-footer">
                                <form action="book" method="post">
                                  <input value="${clas.id}"  name="idc" readonly hidden>
                                  <input value="${account}"  name="ids" readonly hidden>
                                  <button class="btn btn-primary" type="submit">是</button>
                                  <button data-dismiss="modal" class="btn btn-default" type="button">否</button>
                                </form>
                              </div>
                            </div><!-- /.modal-content -->
                          </div><!-- /.modal-dialog -->
                        </div>

                      </center>
                    </div>
                    </div>
                  </c:forEach>


                </div>
                <div class="modal-footer">

                </div>
              </div>
            </div>
          </div></td>

   </td>
      </c:forEach>
    </tr>

  </table>

</div>

</body></html>