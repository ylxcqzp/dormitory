<%--
  Created by IntelliJ IDEA.
  User: 22962
  Date: 2019/9/17
  Time: 19:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>学生宿舍后台管理面板</title>
    <link rel="stylesheet" href="../.././layui/css/layui.css" media="all">
    <style type="text/css">
        .rightmenu{font-size:12px; padding:5px 10px; border-radius: 2px;}
        .rightmenu li{line-height:20px; cursor: pointer;}
        ul.layui-tab-title li:first-child i{display:none;}
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">后台管理面板</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item">
                <a href="javascript:;">公告</a>
                <dl class="layui-nav-child">
                    <dd><a href="">最新公告</a></dd>
                    <dd><a href="">所有公告</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    <shiro:principal property="managerName"/>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="/logout">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">宿舍管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" class="site-url" data-title="考勤管理" data-id="1" data-url="/dormManager/score">考勤管理</a></dd>
                        <dd><a href="javascript:;" class="site-url" data-title="请假审批" data-id="2" data-url="/dormManager/leaveInfo">请假申请</a></dd>
                        <dd><a href="javascript:;" class="site-url" data-title="宿舍调整" data-id="3" data-url="/dormManager/exchange">宿舍调整</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">学生宿舍信息库</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" class="site-url" data-title="学籍信息" data-id="4" data-url="/stu_dorm_lib/student">学籍信息</a></dd>
                        <dd><a href="javascript:;" class="site-url" data-title="宿舍信息" data-id="5" data-url="http://www.tmall.com">宿舍信息</a></dd>
                        <dd><a href="javascript:;" class="site-url" data-title="管理人员" data-id="6" data-url="/stu_dorm_lib/manager">管理人员</a></dd>
                    </dl>
                </li>d
                <li class="layui-nav-item"><a href="javascript:;" class="site-url" data-title="报修处理" data-id="7" data-url="/repaired">报修处理</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-tab layui-tab-brief" lay-filter="contentnav" lay-allowClose="true" style="margin-left:200px;margin-top:0;">
        <ul class="layui-tab-title">
            <li class="layui-this">首页</li>
        </ul>
        <ul class="layui-bg-green rightmenu" style="display: none;position: absolute;">
            <li data-type="closethis">关闭当前</li>
            <li data-type="closeall">关闭所有</li>
        </ul>
        <div class="layui-tab-content" style="padding:0;">
            <div class="layui-tab-item layui-show">首页内容...</div>
        </div>
    </div>

</div>
<script src="../.././layui/layui.js"></script>
<script src="../.././layui/js/index.js"></script>
</body>
</html>
