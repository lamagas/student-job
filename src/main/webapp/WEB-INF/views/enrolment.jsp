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
            <tr class="layui-nav-item">
                <td>${item.student.name}</td>
                <td>${item.time}</td>
                <td>${item.title}
                    <button class="layui-btn layui-btn-normal layui-btn-sm" style="position: absolute;right:0; bottom:10px ;"
                            onclick="aaa('${item.title}','message?id=${item.inforid}','${item.inforid}')">查看</button></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
<script src="/static/js/jquery-3.3.1.min.js"></script>
<script src="/static/layui/layui.js"></script>
<script>
    function aaa(m,u,i){
        window.parent.tabAdd(m,u,i);
    }
</script>
</html>
