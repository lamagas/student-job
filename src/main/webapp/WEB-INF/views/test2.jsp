<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/layui/layui.js"></script>
</head>
<body >
<table class="layui-hide" id="titleList" lay-filter="get" lay-data="{skin:'line', even:true, size:'sm'}"></table>

</body>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
</script>
<script>
    layui.use('table', function(){
        var table = layui.table;
        table.render({
            elem: '#titleList'
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
                {field:'title', width:80, title: '标题', sort: true}
                ,{field:'username', width:80, title: '发布者'}
                ,{field:'time', width:80, title: '发布时间', sort: true}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:80}
            ]]
        });

        //监听行工具事件
        table.on('tool(get)', function(obj){
            var data = obj.data;
            console.log(data.title);
        });
    });
</script>
</html>