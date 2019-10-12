<%--
  Created by IntelliJ IDEA.
  User: 22962
  Date: 2019/9/17
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="../.././layui/css/layui.css" media="all">
    <title>学生管理首页</title>
    <link href="../.././layui/css/bootstrap.min.css" rel="stylesheet">
    <link href="../.././layui/css/css.css" rel="stylesheet">
    <script src="../.././layui/js/jquery.min.js"></script>
</head>
<script>
    $(function () {
        $.ajax({
            url:'/student/getUser',
            dataType:'JSON',
            type:'post',
            success:function (data) {
                if(data){
                    $("#user").text(data.stuName);
                }else {
                    location.href = "../login/student_login.jsp";
                }
            }
        });
    });

    function userLogout() {
        $.ajax({
            url:'/student/logout',
            type:'post',
            success:function (data) {
                if(data){
                    location.href = "../login/student_login.jsp";
                }else {
                    alert("失败");
                }
            }
        });
    }
</script>
<body>
<div class="bg"><img src="../.././layui/images/timg.jpg" /></div>
<!--header start-->
<div class="header">
    <div class="top">
        <h1 class="logo">

            <img src="../.././layui//logo.png" class="logo2" />
            </a>
        </h1>
        <div class="phone">
            欢迎你，<span id="user"></span>
            <span style="margin-left: 10px"><a href="javascript:userLogout()">退出</a></span>
        </div><!--phone/-->
    </div><!--top/-->
</div>
<!--headers end/-->
<!--mainCont start-->
<div class="mainCont">
    <ul class="nav" id="nav">
        <li class="nav-Index">
            <a href="index.html">
                <span><img src="../.././layui/images/timg.jpg" class="grayscale"></span>
                <strong>
                    首页<br />
                    <i>Index</i>
                </strong>
            </a>
            <div class="musics"><embed src=mp3/m1_clip.mp3 autostart=true loop=true width=0 height=0></div>
        </li>
        <li class="nav-About">
            <a href="about.html">
                <span><img src="../.././layui/images/aboutimg.png" class="grayscale"></span>
                <strong>
                    公告<br />
                    <i>Announcement</i>
                </strong>
            </a>
            <div class="musics"><embed src=mp3/m1_clip.mp3 autostart=true loop=true width=0 height=0></div>
        </li>
        <li class="nav-Products">
            <a href="/views/student/studentDorm.html">
                <span><img src="../.././layui/images/productimg.png" class="grayscale"></span>
                <strong>
                    宿舍信息<br />
                    <i>Dormitory information</i>
                </strong>
            </a>
            <div class="musics"><embed src=mp3/m1_clip.mp3 autostart=true loop=true width=0 height=0></div>
        </li>
        <li class="nav-News">
            <a href="/views/student/studentLeave.html">
                <span><img src="../.././layui/images/shopimg.png" class="grayscale"></span>
                <strong>
                    请假申请<br />
                    <i>Leave request </i>
                </strong>
            </a>
            <div class="musics"><embed src=mp3/m1_clip.mp3 autostart=true loop=true width=0 height=0></div>
        </li>
        <li class="nav-shopping">
            <a href="/views/student/studentExchange.html">
                <span><img src="../.././layui/images/newimg.png" class="grayscale"></span>
                <strong>
                    调换申请<br />
                    <i>Exchange application </i>
                </strong>
            </a>
            <div class="musics"><embed src=mp3/m1_clip.mp3 autostart=true loop=true width=0 height=0></div>
        </li>
        <li class="nav-Contact">
            <a href="/views/student/studentRepairs.html">
                <span><img src="../.././layui/images/contactimg.png" class="grayscale"></span>
                <strong>
                    报修<br />
                    <i>repair</i>
                </strong>
            </a>

        </li>
    </ul><!--nav/-->
</div>
<!--mainCont end-->
<!--footer start-->
<div class="footer">

</div>


<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../.././layui/js/bootstrap.min.js"></script>
<script src="../.././layui/js/js.js"></script>
</body>
</html>
