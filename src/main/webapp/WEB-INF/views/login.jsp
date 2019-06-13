<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <%--<link rel="stylesheet" href="/static/layui/css/styles.css">--%>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <%--<title>大学生兼职网</title>--%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<div class="wrapper">
    <div class="container">
        <%--<h1>Welcome</h1>--%>
        <form class="form1" action="check" method="post">
            <input type="text" name="name" id="name" placeholder="用户名">
            <input type="password"  name="password" id="password" placeholder="密码">
            <button id="login-button" >登录</button>
<%--            <a style="color: #009688">还没有账号？点击
                <a href="/register">
                注册
            </a></a>--%>
        </form>
        <h5 class="text-center" style="color:red">${error}</h5>
    </div>
    <ul class="bg-bubbles">
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
<%--    <ul class="bg-zt">
        <li>大学生兼职网</li>
        <li>大学生兼职网</li>
    </ul>--%>
</div>
<script type="text/javascript">
        $('#login-button').click(function(event){
            event.preventDefault();
            $("h5").fadeOut(100);
            $('.form1').fadeOut(500);
            $('.wrapper').addClass('form-success');
            setTimeout(function () { $('.form1').submit(); }, 1500);
        });
</script>
</body>
</html>