<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <title>管理员登录页</title>
    <link rel="stylesheet" href="../.././layui/css/layui.css">
    <link rel="stylesheet" href="../.././layui/css/style.css">
</head>
<body>

<div class="login-main">
    <header class="layui-elip">管理员登录</header>
    <form class="layui-form">
        <div class="layui-input-inline">
            <input type="text" name="username" required lay-verify="required" placeholder="用户名" autocomplete="off"
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
                url:'/managerLogin',
                data:data.field,
                dataType:'JSON',
                type:'post',
                success:function (data) {
                    if (data.success){
                        location.href = "../index/manager_index.jsp";
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