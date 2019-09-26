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
</head>
<body>
<h1>登入页面</h1>
<form action="/studentLogin" method="post">
    用户名：<input type="text" name="stuName">
    密 码：<input type="text" name="password">
    <input type="submit">
</form>
</body>
</html>
