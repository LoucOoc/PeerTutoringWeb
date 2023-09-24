<%--
  Created by IntelliJ IDEA.
  User: lgqoh
  Date: 2022/9/5
  Time: 22:19
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



<body>


<ul  class="nav nav-tabs">

    <li class="active">
        <a href="#check" data-toggle="tab">下载文件</a>
    </li >

    <li>
        <a href="#assign" data-toggle="tab" >上传文件</a>
    </li>
</ul>






<div  class="tab-content">
    <div class="tab-pane fade in active" id="check">
        <ul  class="nav nav-tabs row" >

            <li class="active col-xs-2"  class="dropdown">
                <div class="dropdown">
                    <button type="button"  class="btn dropdown-toggle form-control" data-toggle="dropdown" >托福</button>
                    <ul class="dropdown-menu" style="width: 100%;">
                        <li><a>阅读</a></li>
                        <li><a>听力</a></li>
                        <li><a>口语</a></li>
                        <li><a>写作</a></li>
                    </ul>

                </div>
            </li >

            <li class="col-xs-2">
                <div class="dropdown">
                    <button type="button"  class="btn dropdown-toggle form-control" data-toggle="dropdown" >雅思</button>
                    <ul class="dropdown-menu" style="width: 100%;">
                        <li><a>阅读</a></li>
                        <li><a>听力</a></li>
                        <li><a>口语</a></li>
                        <li><a>写作</a></li>
                    </ul>

                </div>
            </li>

            <li class="col-xs-2">
                <div class="dropdown">
                    <button type="button"  class="btn dropdown-toggle form-control" data-toggle="dropdown" >ACT</button>
                    <ul class="dropdown-menu" style="width: 100%;">
                        <li><a>阅读</a></li>
                        <li><a>文法</a></li>
                        <li><a>科推</a></li>
                        <li><a>数学</a></li>
                        <li><a>写作</a></li>
                    </ul>

                </div>
            </li>

            <li class="col-xs-2">
                <div class="dropdown">
                    <button type="button"  class="btn dropdown-toggle form-control" data-toggle="dropdown" >SAT</button>
                    <ul class="dropdown-menu" style="width: 100%;">
                        <li><a>阅读</a></li>
                        <li><a>文法</a></li>
                        <li><a>数学</a></li>
                        <li><a>写作</a></li>
                    </ul>

                </div>
            </li>

            <li class="col-xs-2">
                <button class="btn form-control">AP</button>
            </li>

            <li class="col-xs-2">
                <button class="btn form-control">其他</button>
            </li>
        </ul>





    </div>

    <div class="tab-pane fade " id="assign">

        <center style="margin-left: 10%; margin-right: 10%; background-color: whitesmoke;">

            <div class="panelDown">
                <br>
                <div class="panelUp">


                    <br>
                    <p>上传文件</p>
                    <br>

                    <form action="#" method="post" onsubmit="return s('file type2 detail week bii e r abouttt')">


                        <input type="file"  name="" id="file" class="form-control">
                        <br>
                        <br>
                        <div class="input-group">
                            <div class="input-group-btn">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">文件类型<span class="caret"></span></button>
                                <ul class="dropdown-menu" role="menu">

                                    <li><button  type="button" class="form-control" id="a" onclick="select('a','type2')" >托福</button></li>
                                    <li><button type="button" class="form-control" id="b" onclick="select('b','type2')">雅思</button></li>
                                    <li><button type="button" class="form-control" id="c"onclick="select('c','type2')">AP</button></li>
                                    <li><button type="button" class="form-control" id="fa" onclick="select('fa','type2')">ACT</button></li>
                                    <li><button type="button" class="form-control" id="fb" onclick="select('fb','type2')">SAT</button></li>
                                    <li><button type="button" class="form-control" id="fc" onclick="select('fc','type2')">其他</button></li>

                                </ul>
                            </div>
                            <input type="text" class="form-control" id="type2" name="type2" aria-label="..." readonly placeholder="文件类型">
                        </div>


                        <br>
                        <br>
                        具体类型 (阅读、写作等) :<input type="text" name="detail"  class="form-control" placeholder="细节(不能使用#）" id="detail" οnkeyup="value=value.replace('#','')">

                        <br>
                        <br>

                        简介(100字以内）：<textarea class="form-control" placeholder="简介(100字以内）" name="about1" maxlength="100" id="abouttt"></textarea>

                        <button type="submit" class="form-control">提交</button>
                    </form>
                </div>


            </div>





        </center>

    </div>

</div>

</body>
</html>
