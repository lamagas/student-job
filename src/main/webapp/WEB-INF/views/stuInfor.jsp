<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
    <title>Title</title>
</head>
<body class="layui-bg-gray">
<div style="width: 510px ;margin:0 auto;height: 700px;position: relative;top: 50px;" class="layui-anim layui-anim-fadein">
        <table class="layui-table" lay-size="lg" lay-even lay-skin="nob" >
            <tr>
                <th  width="100"height="68" bgcolor="#d2d2d2" style="color: #009688">
                    姓名
                </th>
                <td width="233">
                    ${student.name}
                </td>
                <td width="120" rowspan="3">
                    <img src="/static/layui/images/face/0.jpg" width="100" height="100" />
                </td>
            </tr>
            <tr>
                <th bgcolor="#c2c2c2" height="68" style="color: #009688">
                    性别
                </th>
                <td>
                    <c:if test="${student.sex=='1'}">男</c:if>
                    <c:if test="${student.sex=='0'}">女</c:if>
                </td>
            </tr>
            <tr>
                <th bgcolor="#d2d2d2" height="68" style="color: #009688">
                    年龄
                </th>
                <td>
                    ${student.age}
                </td>
            </tr>
            <tr>
                <th bgcolor="#c2c2c2" height="68" style="color: #009688">
                    学校
                </th>
                <td colspan="2">
                    ${student.schoolOJ.name}
                </td>
            </tr>
            <tr>
                <th bgcolor="#d2d2d2" height="68" style="color: #009688">
                    电话
                </th>
                <td colspan="2">
                    ${student.phone}
                </td>
            </tr>
            <tr>
                <th bgcolor="#c2c2c2" height="68" style="color: #009688" >
                    QQ
                </th>
                <td colspan="2">
                    ${student.qq}
                </td>
            </tr>
            <tr>
                <th bgcolor="#d2d2d2" height="68" style="color: #009688">
                    简介
                </th>
                <td colspan="2">
                    ${student.summary}
                </td>
            </tr>
        </table>
</div>

</body>
</html>
