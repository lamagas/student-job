<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    Date date = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd  HH:mm");
    String nowDate = sdf.format(date);
%>
<html>
<head>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
</head>
<body>
<div style="margin:0 auto;position: relative;top: 50px;">
    <div class="layui-col-md12 layui-anim layui-anim-upbit">
        <div class="layui-card">
            <div class="layui-card-header dbt">${information.title}</div>
            <div class="layui-card-body dbm" style="height: 100%;">
                ${information.message}
            </div>
        </div>
        <button class="layui-btn layui-btn-normal" id="bt1" style="position: absolute; bottom: 120px; left: 50px">编辑</button>
        <button class="layui-btn layui-btn-normal" id="bt2" style="position: absolute; bottom: 120px; left: 45px">保存</button>
        <button class="layui-btn layui-btn-normal" id="bt4" style="position: absolute; bottom: 120px; left: 150px">发布</button>
        <i class="layui-icon layui-icon-delete delete" iid="${information.inforid}" style="color: #ff0300;font-size: 30px;position: absolute; bottom: 120px; left: 300px"></i>
    </div>
    <div style="width: 600px;margin:0 auto;">
        <table class="layui-table" id="tab">
        </table>
    </div>
</div>
</body>
<script src="/static/js/jquery-3.3.1.min.js"></script>
<script src="/static/layui/layui.js"></script>
<script type="text/javascript">
    $(function () {
        $("#bt2").hide();
    });

    layui.use(['layer','layedit'], function(){
        var w,mid,rname;
        var layer = layui.layer;

        //编辑和保存
        $("#bt1").click(function () {
            var t = $(".dbt");
            var m = $(".dbm");
            t.html("<input style='height: 100%;width: 500px;' class='layui-input' type='text' value='" + $(t).text() + "'/> ");
            m.html("<textarea id='demo' style='display: none;'>" + $(m).text() + "</textarea>");
            var layedit = layui.layedit;
            var index=layedit.build('demo'); //建立编辑器
            $("#bt2").show();
            $("#bt1").hide();
            $("#bt2").click(function () {
                var message=layedit.getContent(index);
                var title=t.children(0).val().replace(/\ +/g,"");
                var inforid=${information.inforid};
                var layer = layui.layer;
                $.ajax({
                    url:'updateInfor',
                    type:'post',
                    data:{
                        title:title,
                        inforid:inforid,
                        message:message
                    },
                    success: function(){
                        layer.msg('保存成功！', {
                            icon: 1
                            ,area: ['45px', '65px']
                            ,anim:4
                        });
                    },
                    error: function(){
                        layer.msg('保存失败！', {
                            icon: 2
                            ,area: ['45px', '65px']
                            ,anim:4
                        })
                    }
                })
            })
        });
        //草稿发布
        $("#bt4").click(function () {
            $.ajax({
                type : 'POST',
                data:{
                    id:${information.inforid}
                },
                url : "fabu",
                error : function() {
                    layer.msg('发布失败！', {
                        icon: 2
                        ,area: ['45px', '65px']
                        ,anim:4
                    })
                },
                success : function(data) {
                    layer.alert('发布成功！', {
                        skin: 'layui-layer-lan'
                        ,icon: 1
                        ,anim:4
                        ,end: function(){
                            window.parent.tabDel("-1");
                            window.parent.tabDel("${information.inforid}");
                        }
                    })
                }

            })
        })
        //删除
        $(".delete").click(function () {
            var id = new Number($(this).attr("iid"));
            var th = $(this);
            layer.alert('确定删除？', {
                skin: 'layui-layer-lan'
                ,btn: ['删除', '取消']
                , icon: 1
                , anim: 4
                , yes: function(index, layero){
                    $.ajax({
                        type: 'POST',
                        data: {
                            id: id
                        },
                        url: "delete",
                        error: function () {
                            layer.msg('删除失败', {
                                icon: 2
                                , area: ['45px', '65px']
                                , anim: 4
                            })
                        },
                        success: function () {
                            layer.alert('已删除', {
                                skin: 'layui-layer-lan'
                                , icon: 1
                                , anim: 4
                                , end: function () {
                                    window.parent.tabDel("${information.inforid}");
                                }
                            })
                        }
                    })
                }
                ,no: function () {
                }
                ,cancel: function(){
                    return false
                }
            })
        })
    });

</script>
</html>
