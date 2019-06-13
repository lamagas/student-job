<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
</head>
<body>
<div style="width: 793px ;margin:0 auto">
    <table class="layui-table" lay-size="lg">
        <colgroup>
            <col width="150">
            <col width="150">
            <col width="350">
            <col width="150">
        </colgroup>
        <thead>
        <tr>
            <th>昵称</th>
            <th>时间</th>
            <th>标题</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach varStatus="s" items="${informations}" var="item" >
            <tr class="layui-nav-item">
                <td>${item.student.name}</td>
                <td>${item.time}</td>
                <td>${item.title}</td>

                <td>
                    <button class="layui-btn layui-btn-normal layui-btn-sm huifu"
                            iid="${item.inforid}">恢复</button>&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
<script src="/static/js/jquery-3.3.1.min.js"></script>
<script src="/static/layui/layui.js"></script>
<script>
    layui.use('layer',function () {
        var layer = layui.layer;
    $(".huifu").click(function () {
         var id=new Number($(this).attr("iid"));
         var th=$(this);
        $.ajax({
            type : 'POST',
            data:{
                id:id
            },
            url : "huifu",
            error : function() {
                layer.msg('恢复失败', {
                    icon: 2
                    ,area: ['45px', '65px']
                    ,anim:4
                })
            },
            success : function() {
                layer.alert('已恢复到草稿', {
                    skin: 'layui-layer-lan'
                    ,icon: 1
                    ,anim:4
                    ,end: function(){
                        th.parent().parent().remove();
                    }
                })
            }
        })
    })
    })
</script>
</html>
