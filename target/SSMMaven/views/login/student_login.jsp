<%--
  Created by IntelliJ IDEA.
  User: 22962
  Date: 2019/9/17
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生登入页面</title>
    <link rel="stylesheet" href="../.././layui/css/layui.css">
    <link rel="stylesheet" href="../.././layui/css/style.css">
</head>
<body>
<div class="login-main">
<header class="layui-elip">学生登录</header>
<form class="layui-form">
    <div class="layui-input-inline">
        <input type="text" name="stuId" required lay-verify="required" placeholder="用户名" autocomplete="off"
               class="layui-input">
    </div>
    <div class="layui-input-inline">
        <input type="password" name="password" required lay-verify="required" placeholder="密码" autocomplete="off"
               class="layui-input">
    </div>
    <div class="layui-input-inline login-btn">
        <button lay-submit lay-filter="login" class="layui-btn">登录</button>
    </div>
    <hr/>
</form>
</div>

<script src="../.././layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['form','layer','jquery'], function () {

        // 操作对象
        var form = layui.form;
        var $ = layui.jquery;
        form.on('submit(login)',function (data) {
            $.ajax({
                url:'/student/studentLogin',
                data:data.field,
                dataType:'JSON',
                type:'post',
                success:function (data) {
                    if (data.success){
                        location.href = "../index/student_index.jsp";
                    }else{
                        layer.msg(data.msg);
                    }
                }
            });
            return false;
        })

    });
</script>
</body>
</html>
