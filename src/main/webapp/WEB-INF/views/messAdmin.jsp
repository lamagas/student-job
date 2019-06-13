<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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
<div style="margin:0 auto;position: relative;top: 50px;width: 700px ;">
<div class="layui-col-md12 layui-anim layui-anim-upbit">
    <div class="layui-card">
        <div class="layui-card-header dbt">${information.title}</div>
        <div class="layui-card-body dbm" style="height: 100%;">
            ${information.message}
        </div>
    </div>
    <button class="layui-btn layui-btn-normal" id="bt1" style="position: absolute; bottom: 120px; left: 50px">编辑</button>
    <button class="layui-btn layui-btn-normal" id="bt2" style="position: absolute; bottom: 120px; left: 45px">保存</button>
    <button class="layui-btn layui-btn-normal" id="bt3" style="position: absolute; bottom: 120px; left: 150px">查看报名人员</button>
    <input type="button" class="layui-btn  layui-btn-normal" id="mess" value="留言" style="position: absolute; bottom: 120px; left: 300px"/>
    <i class="layui-icon layui-icon-delete delete" iid="${information.inforid}" style="color: #ff0300;font-size: 30px;position: absolute; bottom: 120px; left: 400px"></i>
</div>
    <div style="width: 600px;margin:0 auto;">
    <table class="layui-table" id="tab">
    </table>
    </div>
    <div style="width: 80% ;margin:0 4% 0 10%;" id="liuyan">
        <c:forEach items="${messages}" var="mess">
            <!-- 如果留言信息是在本文章下的才显示 -->
            <li style="border-top: 1px dotted #01AAED"></li>
            <br/>
            <div style="text-align: left;color:#444">
                <div>
                    <span style="color:#01AAED">${mess.student.name}</span>
                </div>
                <div>${mess.message}</div>
            </div>

            <div style="text-align:left;margin-top:7px;color:#444">
                <span>${mess.m_time}</span>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <a href="javascript:" style="text-decoration: none;" class="replyx" name="${mess.student.name}" mid="${mess.id}">回复</a>
                <hr style="margin-top: 7px;"/>
            </div>
            <!-- 回复表单默认隐藏 -->
            <div id="c${mess.id}">
                <!-- 以下是回复信息 -->
                <c:forEach items="${mreplys}" var="reply" varStatus="s">
                    <!-- 每次遍历出来的留言下存在回复信息才展示（本条回复信息是本条留言下的就显示在当前留言下） -->

                    <c:if test="${mess.id eq reply.messid}">

                        <div style="text-align: left;margin-left:61px;color: #444">
                            <div>
                                <span style="color:#5FB878">${reply.student.name}&nbsp;&nbsp;</span>
                            </div>
                            <div>@${reply.for_name}:&nbsp;&nbsp; ${reply.r_message}</div>
                        </div>

                        <div style="text-align:left;margin-top:7px;margin-left:61px;color:#444">
                            <span>${reply.r_time}</span>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="javascript:" style="text-decoration: none;" class="replyx" name="${reply.student.name}" mid="${mess.id}">回复</a>
                            <hr style="margin-top: 7px;"/>
                        </div>

                    </c:if>

                </c:forEach>
            </div>
        </c:forEach>
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
        var active = {
            prompt: function () {
                layer.prompt({
                    formType: 2,
                    value: '请输入',
                    title: '回复',
                    offset: '100px',
                    shadeClose: true,
                    shade: false,
                    maxmin: true, //开启最大化最小化按钮
                    area: ['320px', '120px'] //自定义文本域宽高
                }, function(value, index){
                    tijaio(value);
                    layer.close(index);
                });
            }
        }
        $("#mess").click(function () {
            w=1;
            active.prompt();
        });
        $(".replyx").click(function () {
            w=0,mid=$(this).attr("mid"),rname=$(this).attr("name");
            active.prompt();
        });
        function tijaio(value) {
            if(w==1){
                $.ajax({
                    url:'messinsert',
                    type:'post',
                    data:{
                        m_inforid:${information.inforid},
                        message:value
                    },
                    success: function(){
                        layer.msg('留言成功', {
                            icon: 1
                            ,area: ['45px', '65px']
                            ,anim:4
                        })
                    },
                    error: function(){
                        layer.msg('error', {
                            icon: 2
                            ,area: ['45px', '65px']
                            ,anim:4
                        })
                    }
                })
                $("#liuyan").append("<li style=\"border-top: 1px dotted #01AAED\"></li>\n" +
                    "            <br/>\n" +
                    "            <div style=\"text-align: left;color:#444\">\n" +
                    "                <div>\n" +
                    "                    <span style=\"color:#01AAED\"><shiro:principal property="name"/></span>\n" +
                    "                </div>\n" +
                    "                <div>"+value+"</div>\n" +
                    "            </div>\n" +
                    "        \n" +
                    "                <div style=\"text-align:left;margin-top:7px;color:#444\">\n" +
                    "                    <span><%=nowDate%></span>\n" +
                    "                    &nbsp;&nbsp;&nbsp;&nbsp;\n" +
                    "                    <hr style=\"margin-top: 7px;\"/>\n" +
                    "                </div>");

            }else {
                $.ajax({
                    url:'replyinsert',
                    type:'post',
                    data:{
                        messid:mid,
                        r_message:value,
                        r_inforid:${information.inforid},
                        for_name:rname
                    },
                    success: function(){
                        layer.msg('留言成功', {
                            icon: 1
                            ,area: ['45px', '65px']
                            ,anim:4
                        })
                    },
                    error: function(){
                        layer.msg('error', {
                            icon: 2
                            ,area: ['45px', '65px']
                            ,anim:4
                        })
                    }
                })
                $("#"+"c"+mid+"").append("                    <div style=\"text-align: left;margin-left:61px;color: #444\">\n" +
                    "                        <div>\n" +
                    "                            <span style=\"color:#5FB878\"><shiro:principal property="name"/>&nbsp;&nbsp;</span>\n" +
                    "                        </div>\n" +
                    "                        <div>@"+rname+":&nbsp;&nbsp; "+value+"</div>\n" +
                    "                    </div>\n" +
                    "\n" +
                    "                        <div style=\"text-align:left;margin-top:7px;margin-left:61px;color:#444\">\n" +
                    "                            <span><%=nowDate%></span>\n" +
                    "                            &nbsp;&nbsp;&nbsp;&nbsp;\n" +
                    "                            <hr style=\"margin-top: 7px;\"/>\n" +
                    "                        </div>");
            }
        }

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
        //显示报名信息
        $("#bt3").click(function () {
            $.ajax({
                //async : false,
                cache : false,
                type : 'POST',
                dataType:"json",
                data:{
                    id:${information.inforid}
                },
                url : "SignUp",
                error : function() {
                    layer.msg('查询失败！', {
                        icon: 2
                        ,area: ['45px', '65px']
                        ,anim:4
                    })
                },
                success : function(data) {
                    $("#tab").append("<thead><tr><th>名字</th><th>性别</th><th>电话</th></tr></thead>");
                    for (var i = 0; i < data.length; i++) {
                        var u = "\""+data[i].name+"\",\"personAdmin?id=" + data[i].id+"\""+",\""+data[i].id+"\"";
                        $("#tab").append(
                            "<tr>"+
                            "<td>"+data[i].name+"</td>"+"<td>"+data[i].sex+"</td>"+
                            "<td>"+data[i].phone+"<button class=\"layui-btn layui-btn-normal layui-btn-sm\" style='position: absolute;right:0; bottom:5px ;' onclick= 'aaa("+u+")'>查看</button></td>"
                            +"<tr/>"
                            );
                    }
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
                , yes: function(){
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
    function aaa(m,u,i){
        window.parent.tabAdd(m,u,i);
    }

</script>
</html>
