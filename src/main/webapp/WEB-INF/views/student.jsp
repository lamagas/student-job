<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
    <title>Title</title>
</head>
<body class="layui-bg-gray">
<div style="width: 510px ;margin:0 auto;height: 700px;position: relative;top: 50px;" class="layui-anim layui-anim-fadein">
    <form method="post" action="">
        <table class="layui-table" lay-size="lg" lay-even lay-skin="nob" >
            <tr>
                <th  width="100"height="68" bgcolor="#d2d2d2" style="color: #009688">
                    姓名
                </th>
                <td width="233" class="dbt xt" id="sn">
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
                <td  class="dbt xt" id="ss">
                    <c:if test="${student.sex=='1'}">男</c:if>
                    <c:if test="${student.sex=='0'}">女</c:if>
                </td>
            </tr>
            <tr>
                <th bgcolor="#d2d2d2" height="68" style="color: #009688">
                    年龄
                </th>
                <td class="dbt" id="sa">
                    ${student.age}
                </td>
            </tr>
            <tr>
                <th bgcolor="#c2c2c2" height="68" style="color: #009688">
                    学校
                </th>
                <td colspan="2" class="xtb">
                    ${student.schoolOJ.name}
                </td>
            </tr>
            <tr>
                <th bgcolor="#d2d2d2" height="68" style="color: #009688">
                    电话
                </th>
                <td colspan="2" class="dbt" id="sp">
                    ${student.phone}
                </td>
            </tr>
            <tr>
                <th bgcolor="#c2c2c2" height="68" style="color: #009688" >
                    QQ
                </th>
                <td colspan="2" class="dbt" id="sq">
                    ${student.qq}
                </td>
            </tr>
            <tr>
                <th bgcolor="#d2d2d2" height="68" style="color: #009688">
                    简介
                </th>
                <td colspan="2" class="dbt" id="sum">
                    ${student.summary}
                </td>
            </tr>
        </table>
    </form>
    <button class="layui-btn layui-btn-lg layui-btn-radius" onclick="doEdit(${student.id})" style="position: absolute;
bottom: 100px; left: 200px">保存</button>
</div>

</body>
<script src="/static/layui/layui.js"></script>
<script type="text/javascript">
    //双击变文本框
        $(document).ready(function () {
            $(".dbt").dblclick(function(){
                var d=$(this);

                d.html("<input class=\"layui-input\" type=\"text\" value='"+$(d).text().replace(/\ +/g,"")+"'/>");
            })
                .mouseleave(function(){
                        var d=$(this);
                        d.html($(d).children(0).val());
                    }
                );
        });
    //鼠标悬停提示特效
    layui.use('layer', function(){
        var layer = layui.layer;
        $(".xt").hover(function() {
            subtips = layer.tips('双击修改','.xt',{tips:[1,'#85b8a9'],time: 30000});
        }, function() {
            layer.close(subtips);
        });

        $(".xtb").hover(function() {
            subtipsb = layer.tips('不能修改','.xtb',{tips:[1,'#b86852'],time:
                    30000});
        }, function() {
            layer.close(subtipsb);
        });
    });
    //END 鼠标悬停提示特效
    //提交
    function doEdit(id) {
        layui.use('layer', function(){
            var em=/(\r\n)|(\n)|\s+/g;
        var layer = layui.layer;
        var agew=$("#ss").text().replace(em,"");
        var  sex;
        if(agew=='男'){sex=1;}
        else {sex=0;}
        var name=$("#sn").text().replace(em,"");var qq=$("#sq").text().replace(em,"");var phone=$("#sp").text().replace(em,"");var summary=$("#sum").text().replace(em,"");var age=$("#sa").text().replace(em,"");
        var data={"id":id,"sex":sex,"name":name,"age":age,"qq":qq,"phone":phone,"summary":summary};
        $.ajax({
            url:'update',
            dataType:'json',
            data:JSON.stringify(data),
            type:'post',
            contentType :"application/json;charset=utf-8",
            success: function(){
                    layer.msg('修改成功！', {
                        icon: 1
                        ,area: ['45px', '65px']
                        ,anim:4
                    });
            },
            error: function(){
                layer.msg('修改失败！', {
                    icon: 2
                    ,area: ['45px', '65px']
                    ,anim:4
                });
            }
        });
        });
    }
</script>
</html>
