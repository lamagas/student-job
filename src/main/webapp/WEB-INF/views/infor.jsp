<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    Date date = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd  HH:mm");
    String nowDate = sdf.format(date);
%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>大学生兼职网</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
    <script src="/static/js/jquery-3.3.1.min.js"></script>
</head>
<body>
<div>
<!--导航栏开始-->
<div class="Navigation">
    <div class="layui-header">
        <div class="layui-logo"><span style="font-size: 18px;position: absolute; left: 10px; top: 18px;color: #e2e2e2">大学生兼职网</span>
        </div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="/index">主页</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它操作</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;" class="infortab" data-url="enrolment" mytitle="已报名" iid="0">已报名</a></dd>
                    <dd><a href="javascript:;" class="infortab" data-url="CollectInfor" mytitle="已收藏" iid="-1">已收藏</a></dd>
                </dl>
            </li>
            <button class="layui-btn layui-btn-lg layui-btn-radius shousuo"style="width: 180px">收缩列表</button>
        </ul>
        <div><span style="font-size: 18px;position: absolute; left: 600px; top: 18px;color: #e2e2e2" id="slow"></span>
        </div>
        <ul class="layui-nav layui-layout-right"style="right: 38px">
            <li class="layui-nav-item">
                <a href="javascript:">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    <strong><shiro:principal property="name"/></strong>
                </a>
                <dl class="layui-nav-child">
                    <dd><a class="infortab" data-url="person" mytitle="基本资料" iid="-2">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="/logout">注销</a></li>
        </ul>
    </div>
</div>

<div class="layui-row">
    <div class="layui-col-xs5" id="admin-yi">
        <div class="grid-demo grid-demo-bg1 lanmuyi">
            <div style="width: 85% ;float:right">
                <table class="layui-hide" id="titleList" lay-filter="get"></table>
<%--            <table class="layui-table" lay-size="lg">
                <colgroup>
                    <col width="150">
                    <col width="150">
                    <col width="493">
                </colgroup>
                <thead>
                <tr>
                    <th>昵称</th>
                    <th>时间</th>
                    <th>标题</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach varStatus="s" items="${informations}" var="item" >
                    <tr class="layui-nav-item infortab" data-url="message?id=${item.inforid}" mytitle="${item.title} " iid="${item.inforid}"
                        onmouseover="this.style.backgroundColor='#5fb878'" onmouseout="this.style.backgroundColor='#FFFFFF'">
                        <td>${item.student.name}</td>
                        <td>${item.time}</td>
                        <td>${item.title}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>--%>
            </div>
        </div>
    </div>
    <div class="layui-col-xs7" id="admin-san">
        <div class="grid-demo lanmusan" >
            <div class="layui-tab layui-tab-brief " lay-filter="demo" lay-allowclose="true" style=" border-left:2px solid #F0F0F0">
                <ul class="layui-tab-title">
                    <li class="layui-this" lay-id="11">公告</li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">公告</div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--内容结束-->
<!--底部开始-->
<div class="footer1 ">
    <p style="position: absolute;top: 8px;left: 10px">2018©大学生兼职网&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
    <p style="position: absolute;top: 7px;right: 0px">当前时间：<%=nowDate%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
</div>
</div>
<!--底部结束-->
</body>
<style type="text/css">
    /*导航栏*/
    .Navigation{ background: #393D49; width:100%; height:65px; margin:0 auto}
    /*栏目一*/
    .lanmuyi{ background:#ffffff; width:100%; height:10px; float:left;}
    /*栏目三*/
    .lanmusan{ background:#ffffff; width:100%; height:80%; float:left;}
    /*底部*/
    .footer1{
        height: 36px;
        width: 100%;
        background-color: #eeeeee;
        position: fixed;
        bottom:0;
        display: table-cell;
        vertical-align:middle
    }
</style>
<script src="/static/layui/layui.js"></script>
<script type="text/html" id="barDemo">
    <a class="layui-btn" lay-event="detail">查看</a>
</script>
<script>
    layui.use(['element','table'], function() {
        var $ = layui.jquery
            , element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

        var active = {
            tabAdd : function (title, url, id)
        {
            //新增一个Tab项
            element.tabAdd('demo', {
                title: title
                , content: '<iframe style="width: 100%;height: 100%" scrolling="yes" src=' + url + ' ></iframe>'
                , id: id
            });
            element.tabChange('demo', id);
        },
            tabDel:function (id) {
                element.tabDelete('demo', id);
            }
    }
    layui.data.active=active;

        var table = layui.table;
        table.render({
            //skin: 'line' 行边框风格
            even: true //开启隔行背景
            ,size: 'lg' //小尺寸的表格
            ,elem: '#titleList'
            ,url:'/stuTitle'
            ,page: {
                layout: [ 'count', 'prev', 'page', 'next'] //自定义分页布局
                ,limit:5
                ,groups: 3 //只显示 个连续页码
            }
            ,response: {
                dataName: 'list' //规定数据列表的字段名称，默认：data
            }
            ,cols: [[
                {field:'username', width:120, title: '发布者'}
                ,{field:'title', width:300, title: '标题', sort: true}
                ,{field:'time', width:160, title: '发布时间', sort: true}
                ,{fixed: 'right', title:'查看', toolbar: '#barDemo', width:100}
            ]]
        });

        //监听行工具事件
        table.on('tool(get)', function(obj){
            var data = obj.data;
            tabAdd(data.title,'message?id='+data.titleId,data.titleId);
        });
    })

    $(".infortab").click(function(){
        tabAdd($(this).attr('mytitle'),$(this).attr('data-url'),$(this).attr('iid'));
    });
    function tabAdd(m,u,i){
        var active=layui.data.active;
        active.tabAdd(m,u,i);
    }
    function tabDel(id){
        var active=layui.data.active;
        active.tabDel(id);
    }
//伸缩
    $('.shousuo').on('click', function () {
        var sideWidth = $('#admin-yi').width();
        var a=(5/12)*100
        var b=(7/12)*100
        if (sideWidth > 0) {

            $('#admin-yi').animate({
                width: '0'
            },1);
            $('#admin-san').animate({
                left: '0',
                width:'100%'
            },1);
            $(this).text('展开列表');
        } else {

            $('#admin-yi').animate({
                width: a+'%'
            },180);
            $('#admin-san').animate({
                //left: a+'%',
                width:b+'%'
            },170);
            $(this).text('收缩列表')
        }
    });
    // 自适应主页面大小
  $(window).on('resize', function () {
        var screenHeight = $(window).height();// 窗口高度
        var contentHeight = screenHeight -180;// 内容区域高度
        $(".layui-tab .layui-tab-content").height(contentHeight);// 设置内容区域高度
   }).resize();
    //获取school的cookie
    $(function () {
        function getCookie() {
            var strCookie = document.cookie;
            var arrCookie = strCookie.split("; ");
            for(var i = 0; i < arrCookie.length; i++){
                var arr = arrCookie[i].split("=");
                if("schoolname" == arr[0]){
                    return arr[1];
                }
            }
            return "";
        }
        $("#slow").html("学校："+getCookie());
    });
</script>
</html>
