<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/layui/layui.js"></script>
    <title>注册</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body class="layui-anim layui-anim-scaleSpring">
<div>
<div class="wrapper">
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
</div>
    <div style="position: absolute;top: 26%; width: 100%;left: -4%;">
<div class="formdw">
    <form class="layui-form" action="sign_up" id="register">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="name" required  lay-verify="username" placeholder="请输入用户名" id="name" onblur="checkname()" class="layui-input">
                <span id="info" style="position: absolute;right:-95px; bottom:11px ;"></span>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="password" name="password" lay-verify="pass" placeholder="请输入6到12位密码" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" title="男"  value="1" />
                <input type="radio" name="sex" title="女"  value="0" checked/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">注册类型</label>
            <div class="layui-input-block">
                <input type="radio" name="lease" title="公司"  value="1" lay-filter="jinyong"/>
                <input type="radio" name="lease" title="求职"  value="2" lay-filter="jinyong" checked/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">电话</label>
            <div class="layui-input-block">
                <input type="text" name="phone"  lay-verify="phone" placeholder="电话" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item del">
            <label class="layui-form-label">学校</label>
            <div class="layui-input-block">
                <select name="school" lay-verify="required" id="del">
                    <option value=""></option>
                    <c:forEach varStatus="s" items="${schools}" var="item">
                        <option value=${item.id}>${item.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item layui-inline">
            <label class="layui-form-label">验证码</label>
            <div class="layui-input-inline" style="width: 23%;">
                <input type="text" id="check" lay-verify="yzm" class="layui-input"placeholder="验证码"/>
            </div>
            <div class="layui-input-inline">
                <input id="code" onclick="createCode()" type="button" style="background:none;border: none;margin-left:330px;
                margin-top:-14%;color: #7200fe;font-size: x-small;font-style: italic;letter-spacing: 2px;"/>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                <a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                <a style="color: #009688" href="/login">返回登陆</a>
            </div>
        </div>
    </form>

</div>
    </div>
</div>
<script type="text/javascript">
    var a="1";
    layui.use(['layer','form'], function(){
        var layer = layui.layer;
        var form = layui.form;
        form.on('radio(jinyong)', function(data){
            console.log(data.value);
            if(data.value=="1"){
                $("#del").val("1");
                $(".del").hide();
            }
            else {
                $(".del").show();
            }
        });
        form.verify({
            yzm: function (value) {
                if(value == 0){
                    return '请输入验证码';
                }if(value != code){
                    createCode();
                    return '验证码不正确';
                }
            }
            ,username: function(value){ //value：表单的值、item：表单的DOM对象
                if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
                    return '用户名不能有特殊字符';
                }
                if(/(^\_)|(\__)|(\_+$)/.test(value)){
                    return '用户名首尾不能出现下划线\'_\'';
                }
                if(/^\d+\d+\d$/.test(value)){
                    return '用户名不能全为数字';
                }
                if(a=="1"){
                    return '该用户名已注册';
                }
            }
            ,pass: [
                /^[\S]{6,12}$/
                ,'密码必须6到12位，且不能出现空格'
            ]
        });
    });
    function checkname(){
        var name=$("#name").val();
        if(name!=''){
            $.ajax({
                url: 'checkname',
                type: 'post',
                data:{name: name},
                success: function(data){
                    if(data=="0"){
                        $("#info").text("可以注册").css({'color':'green','font-size':'1px'});
                    }
                    if(data=="1"){
                        $("#info").text("该用户名已注册").css({'color':'red','font-size':'1px'});
                    }
                    a=data;
                },
                error: function(){
                    a=1;
                    alert("error");
                }
            })
        }
    }
    //设置一个全局的变量，便于保存验证码
    var code;
    function createCode(){
        //首先默认code为空字符串
        code = '';
        //设置长度，这里看需求，我这里设置了4
        var codeLength = 6;
        var codeV = document.getElementById('code');
        //设置随机字符
        var random = new Array(0,1,2,3,4,5,6,7,8,9);
        //循环codeLength 我设置的4就是循环4次
        for(var i = 0; i < codeLength; i++){
            //设置随机数范围,这设置为0 ~ 36
            var index = Math.floor(Math.random()*10);
            //字符串拼接 将每次随机的字符 进行拼接
            code += random[index];
        }
        //将拼接好的字符串赋值给展示的Value
        codeV.value = code;
    }

    //设置此处的原因是每次进入界面展示一个随机的验证码，不设置则为空
    window.onload = function (){
        createCode();
    }

</script>
</body>

<style type="text/css">
    .formdw{
        width: 400px;
        margin: 0 auto;
    }
    .wrapper {
        background: #50a3a2;
        background: -webkit-linear-gradient(top left, #50a3a2 0%, #53e3a6 100%);
        background: linear-gradient(to bottom right, #50a3a2 0%, #53e3a6 100%);
        opacity: 0.8;
        position: absolute;
        top: 39%;
        left: 0;
        width: 100%;
        height: 600px;
        margin-top: -200px;
        overflow: hidden;
    }

    .bg-bubbles {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: 1;
    }
    .bg-bubbles li {
        position: absolute;
        list-style: none;
        display: block;
        width: 40px;
        height: 40px;
        background-color: rgba(255, 255, 255, 0.15);
        bottom: -160px;
        -webkit-animation: square 25s infinite;
        animation: square 25s infinite;
        -webkit-transition-timing-function: linear;
        transition-timing-function: linear;
    }
    .bg-bubbles li:nth-child(1) {
        left: 10%;
    }
    .bg-bubbles li:nth-child(2) {
        left: 20%;
        width: 80px;
        height: 80px;
        -webkit-animation-delay: 2s;
        animation-delay: 2s;
        -webkit-animation-duration: 17s;
        animation-duration: 17s;
    }
    .bg-bubbles li:nth-child(3) {
        left: 25%;
        -webkit-animation-delay: 4s;
        animation-delay: 4s;
    }
    .bg-bubbles li:nth-child(4) {
        left: 40%;
        width: 60px;
        height: 60px;
        -webkit-animation-duration: 22s;
        animation-duration: 22s;
        background-color: rgba(255, 255, 255, 0.25);
    }
    .bg-bubbles li:nth-child(5) {
        left: 70%;
    }
    .bg-bubbles li:nth-child(6) {
        left: 80%;
        width: 120px;
        height: 120px;
        -webkit-animation-delay: 3s;
        animation-delay: 3s;
        background-color: rgba(255, 255, 255, 0.2);
    }
    .bg-bubbles li:nth-child(7) {
        left: 32%;
        width: 160px;
        height: 160px;
        -webkit-animation-delay: 7s;
        animation-delay: 7s;
    }
    .bg-bubbles li:nth-child(8) {
        left: 55%;
        width: 20px;
        height: 20px;
        -webkit-animation-delay: 15s;
        animation-delay: 15s;
        -webkit-animation-duration: 40s;
        animation-duration: 40s;
    }
    .bg-bubbles li:nth-child(9) {
        left: 25%;
        width: 10px;
        height: 10px;
        -webkit-animation-delay: 2s;
        animation-delay: 2s;
        -webkit-animation-duration: 40s;
        animation-duration: 40s;
        background-color: rgba(255, 255, 255, 0.3);
    }
    .bg-bubbles li:nth-child(10) {
        left: 90%;
        width: 160px;
        height: 160px;
        -webkit-animation-delay: 11s;
        animation-delay: 11s;
    }
    @-webkit-keyframes square {
        0% {
            -webkit-transform: translateY(0);
            transform: translateY(0);
        }
        100% {
            -webkit-transform: translateY(-1000px) rotate(600deg);
            transform: translateY(-1000px) rotate(600deg);
        }
    }
    @keyframes square {
        0% {
            -webkit-transform: translateY(0);
            transform: translateY(0);
        }
        100% {
            -webkit-transform: translateY(-1000px) rotate(600deg);
            transform: translateY(-1000px) rotate(600deg);
        }
    }
</style>
</html>