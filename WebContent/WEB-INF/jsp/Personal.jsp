<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>
        个人信息
    </title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="resource/css/main.css" media="all">
    <style>
        .imgs{display: none;}
        input[type="file"]{
            width: 50px;
            height:50px;
            border-radius: 100%;
            opacity:0;
            cursor:pointer;
            border: 1px solid red;
            position: absolute;
        }
    </style>

</head>
<body>

<div class="x-body">
    <form class="layui-form layui-form-pane" action="" id="add">
        <blockquote class="layui-elem-quote">
            <input type="hidden" name="id" value="8">
            <div >
                <input class="layui-upload " type="file" accept="undefined" id="previewImg" name="images"  onchange="upload(this,8)">
                <img src="./images/tx.jpg" class="layui-circle" style="width:50px;height:50px;float:left" id="pimages" name="pimages"   alt="个人头像" >
                <input id="avatar"   name="image" required="" type="hidden" value="./images/tx.jpg" >
                <dl style="margin-left:80px; color:#019688">
                    <dt><span >${name }</span> <span ></span></dt>
                    <dd style="margin-left:0">这家伙很懒，什么也没有留下</dd>
                </dl>
            </div>
        </blockquote>

        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">


            <div class="layui-tab-content" >
                <div class="layui-tab-item layui-show">


                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            <span class='x-red'>*</span>用户名
                        </label>
                        <div class="layui-input-block">
                            <input type="text" name="name" autocomplete="off" placeholder=""
                                   class="layui-input" value="${name }">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            <span class='x-red'>*</span>账号
                        </label>
                        <div class="layui-input-block">
                            <input type="text" name="stu_code"  autocomplete="off" placeholder=""
                                   class="layui-input" value="${stu_code }">
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            <span class='x-red'>*</span>密码
                        </label>
                        <div class="layui-input-block">
                            <input type="type" name="passWord" value="${PassWord }" autocomplete="off" placeholder=""
                                   class="layui-input">
                        </div>
                    </div>

                    <!--</form>-->
                    <div style="height:100px;"></div>
                </div>



            </div>

        </div>
    </form>
</div>
<script src="resource/lib/layui/layui.js" charset="utf-8"></script>
<script src="resource/js/x-layui.js" charset="utf-8"></script>

<script>
    layui.use(['element','layer','form'], function(){
        $ = layui.jquery;//jquery
        lement = layui.element();//面包导航
        layer = layui.layer;//弹出层
        form = layui.form()



        //图片上传接口
        /*layui.upload({
          url: './upload.json' //上传接口
          ,success: function(res){ //上传成功后的回调
              console.log(res);
            $('#LAY_demo_upload').attr('src',res.url);
          }
        });*/


        //监听提交
        form.on('submit(add)', function(data){
            var name=$("input[name='name']").val();

            if(name==""){
                layer.msg('用户名不能为空',{icon:5,time:2000});return false;
            }

            var data=data.field;
            $.ajax({
                type:"post",
                url:"xxx",
                data:data,
                dataType:"json",
                success:function(data)
                {
                    //alert(1);
                    if(data.status==1)
                    {
                        layer.msg(data.info, {icon: 6,time:2000},function () {
                            window.parent.location.reload();
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(index);
                        });
                        return false;

                    }
                    else{
                        layer.msg(data.info,{icon:5,time:2000});return false;
                    }
                }

            });

        });

    })
</script>


</body>
</html>