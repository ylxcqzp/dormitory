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
        alert("hello");
        $.ajax({
            url:'/student/getUser',
            dataType:'JSON',
            type:'post',
            success:function (data) {
                console.log(data);
                if(data){
                    $("#userName").innerText = data.stuName;
                }else {
                    $("#userName").innerText = '未知用户';
                }
            }
        });
    })
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
            欢迎你，<span id="userName"></span>
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
            <a href="product.html">
                <span><img src="../.././layui/images/productimg.png" class="grayscale"></span>
                <strong>
                    宿舍信息<br />
                    <i>Dormitory information</i>
                </strong>
            </a>
            <div class="musics"><embed src=mp3/m1_clip.mp3 autostart=true loop=true width=0 height=0></div>
        </li>
        <li class="nav-News">
            <a href="shopping.html">
                <span><img src="../.././layui/images/shopimg.png" class="grayscale"></span>
                <strong>
                    请假申请<br />
                    <i>Leave request </i>
                </strong>
            </a>
            <div class="musics"><embed src=mp3/m1_clip.mp3 autostart=true loop=true width=0 height=0></div>
        </li>
        <li class="nav-shopping">
            <a href="new.html">
                <span><img src="../.././layui/images/newimg.png" class="grayscale"></span>
                <strong>
                    调换申请<br />
                    <i>Exchange application </i>
                </strong>
            </a>
            <div class="musics"><embed src=mp3/m1_clip.mp3 autostart=true loop=true width=0 height=0></div>
        </li>
        <li class="nav-Contact">
            <a href="contact.html">
                <span><img src="../.././layui/images/contactimg.png" class="grayscale"></span>
                <strong>
                    其他<br />
                    <i>Others</i>
                </strong>
            </a>
            <div class="musics"><embed src=mp3/m1_clip.mp3 autostart=true loop=true width=0 height=0></div>
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
