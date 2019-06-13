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
<div style="width: 700px ;margin:0 auto;position: relative;top: 50px;">
    <div class="layui-form" style="margin:0 auto;width: 600px">
        <label class="layui-form-label">标题</label>
        <div class="layui-input-block">
            <input type="text" id="title" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
        </div>
    </div><br/>
    <div>
        <textarea id="write" style="display: none;"></textarea>
    </div>
    <div style="width: 60%;margin:0 auto;">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
        <legend>兼职人数</legend>
    </fieldset>
    <div class="demo-slider" id="sli"></div>
    </div>
    <div class="layui-form" style="margin:0 auto;">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
            <legend>选择要发布的学校</legend>
        </fieldset>
        <div class="layui-input-block">
            <c:forEach varStatus="s" items="${schools}" var="item">
                <input title=${item.name} value=${item.id} name="school" type="checkbox">
            </c:forEach>
        </div>
    </div>
    <div style="margin: 0 auto;">
        <div style=" margin-top: 50px;margin-left: 400px;">
            <button  class="layui-btn layui-btn-normal layui-btn-radius fabu" iid="0">发布</button>
            <button  class="layui-btn layui-btn-normal layui-btn-radius fabu" iid="1">存入草稿</button>
        </div>
    </div>

</div>
</body>
<script src="/static/js/jquery-3.3.1.min.js"></script>
<script src="/static/layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['layedit','slider','form','layer'], function(){
        var layedit = layui.layedit,slider = layui.slider,form=layui.form,layer = layui.layer;
        var index=layedit.build('write'); //建立编辑器
        var people;//人数
        slider.render({
            elem: '#sli'
            ,input: true //滑块输入框
            ,value:5
            ,change: function(value){
                people=value;
            }
        });
        $(".fabu").click(function () {
            if($(this).attr("iid")=="0"){
                var infor="发布成功！";
                var type=0;
            }else {
                var infor="保存成功！";
                var type=2;
            }
            var v="";
            $(":checkbox[name='school']:checked").each(function(){
                v+=$(this).val()+",";//获取多选框的值
            });
            var date="<%=nowDate%>";
            var title=$("#title").val();
            var message=layedit.getContent(index);//获取编辑器内容
            $.ajax({
                data:{
                    time:date,
                    title:title,
                    message:message,
                    people:people,
                    sc:v,
                    draft:type
                },
                type : 'POST',
                url : "towrite",
                success: function(){
                    layer.alert(infor, {
                        skin: 'layui-layer-lan'
                        ,icon: 1
                        ,anim:4
                        ,end: function(){
                            window.parent.tabDel("0");
                        }
                    })
                },
                error: function(){
                    layer.alert('发布/保存失败！', {
                        skin: 'layui-layer-lan'
                        ,icon: 2
                        ,anim:4
                    })
                }
            })
        })
    });

</script>
</html>