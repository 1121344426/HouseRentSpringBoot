
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"/>
    <title>发布房源</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <style>
        footer {
            width: 100%;
            height: 60px;
            margin-top: 20px;
            text-align: center;
            font-size: 16px;
            line-height: 60px;
        }
    </style>
</head>
<body>
<%--导航栏--%>
<div class="layui-fluid" style="background: #2F4056;height: 80px">
    <div style="float: left">
        <img class="find" src="${pageContext.request.contextPath}/img/logo.png" alt="蜗壳" style="height: 50px;width: 100px;margin-left: 100px;margin: 10px">
    </div>
    <div class=" select" style="position:absolute;margin: 20px">
        <span class="layui-breadcrumb" lay-separator="|" style="visibility: visible;margin-left: 600px">
          <a href="${pageContext.request.contextPath}/homePage">首页</a>
          <a href="${pageContext.request.contextPath}/DefaultHouses?page=1">寻找房源</a>
          <a href="${pageContext.request.contextPath}/PublishHouses">发布房源</a>
          <a href="${pageContext.request.contextPath}/findFriend">寻找室友</a>
        </span>
    </div>

    <div class="" style="float: right;margin:17px 86px">
            <ul class="layui-nav " style="background: none">

                <li class="layui-nav-item">
                    <button class="" style="background: none;border: none"><img src="${pageContext.request.contextPath}/img/normal.jpg" class="layui-nav-img"></button>
                    <dl class="layui-nav-child">
                        <dd><button class="layui-btn layui-btn-xs"><a href="${pageContext.request.contextPath}/personalCenter" style="padding:  0px;color: white">个人中心</a></button></dd>
                        <dd><button class="layui-btn layui-btn-xs layui-btn-danger"><a href="${pageContext.request.contextPath}/exit" style="padding:  0px;color: white">退&#12288&#12288出</a></button></dd>
                    </dl>
                </li>
            </ul>
    </div>
</div>
<%--房屋信息输入--%>
<div class="layui-container" style="border: 1px solid grey;margin-top: 20px">

    <form method="post" class="layui-form form" id="codeForm" enctype="multipart/form-data" style="margin-top: 20px">
        <div class="layui-form-item">
            <label class="layui-form-label" style="margin-top: 30px">选择照片</label>
            <div class="layui-input-block">
                <button class="layui-btn" id="replace"><i class="layui-icon">&#xe67c;</i></button>
                <input type="file" name="img" required style="visibility: hidden" id="replaced">
                <img id="img" height="100" src="">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">描述信息</label>
            <div class="layui-input-block">
                <input type="text" name="descr" lay-verify="title"  placeholder="请输入标题" class="layui-input" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">小区名字</label>
            <div class="layui-input-block">
                <input type="text" name="village" lay-verify="required"  placeholder="请输入小区名字" class="layui-input" >
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">验证邮箱</label>
                <div class="layui-input-inline">
                    <input type="text" name="email"  lay-verify="email" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">价格</label>
                <div class="layui-input-inline">
                    <input type="text" name="price"  lay-verify="number" placeholder="请输入价格" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">房子朝向</label>
                <div class="layui-input-inline">
                    <input type="text" name="direction"   placeholder="请输入房子朝向" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">楼层</label>
                <div class="layui-input-inline">
                    <input type="text" name="storey"  lay-verify="number" placeholder="请输入楼层" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">选择地址</label>
            <div class="layui-input-inline">
                <select name="city">
                    <option value="">请选择城市</option>
                    <option value="杭州">杭州</option>
                    <option value="宁波">宁波</option>
                    <option value="温州">温州</option>
                    <option value="温州">台州</option>
                    <option value="温州">绍兴</option>
                </select>
            </div>
            <div class="layui-input-inline">
                <select name="area">
                    <option value="">请选择县/区</option>
                    <option value="西湖区">西湖区</option>
                    <option value="余杭区">余杭区</option>
                    <option value="拱墅区">临安市</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">房屋面积</label>
                <div class="layui-input-inline">
                    <input type="text" name="square"  lay-verify="number" placeholder="请输入面积" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">房屋类型</label>
            <div class="layui-input-inline">
                <select name="style">
                    <option value="">请选择类型</option>
                    <option value="一室">一室</option>
                    <option value="二室">二室</option>
                    <option value="三室">三室</option>
                    <option value="四室">四室</option>
                    <option value="五室">五室</option>
                    <option value="五室以上">五室以上</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <div class="layuit-inline">
                <label class="layui-form-label">验证码</label>
                <div class="layui-input-inline">
                    <input type="text" name="check" lay-verify="required" placeholder="请输入验证码" class="layui-input" />
                </div>
                <div class="layui-input-inline" style="margin-top: 5px">
                    <button id="checkBtn" class="layui-btn layui-btn-sm" >发送</button><br>
                </div>
                <div class="layui-input-inline" style="margin-top: 10px">
                    <span id="time" style="color: red;" ></span><br>
                    <span id="error" style="color:red;"></span>
                    <span id="success" style="color: green;"></span>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit lay-filter="publishHouse" style="margin: 50px 10px 50px 350px">确认发布</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>

    </form>
</div>

<div class=" layui-container" style="border-top: 2px solid #e4e6f0;margin-top: 350px;">
    <footer>
        <p>2021-2999 &copy; 房屋租赁网 懂您的需求 服务于心</p>
    </footer>
</div>


</body>
<script>
    layui.use(['element', 'carousel', 'layer', 'form','upload','laydate','layedit'], function () {
        var element = layui.element,
            carousel = layui.carousel,
            $ = layui.jquery,
            layer = layui.layer,
            form = layui.form,
            upload = layui.upload,
            layedit = layui.layedit,
            laydate = layui.laydate;
        
        $('#replace').click(function (e) {
            e.preventDefault();
            $('#replaced').click();
        })

        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });

        var img = document.querySelector('input[name=img]');
        imgs = document.querySelector('#img');
        if(img){
            img.addEventListener('change', function() {
                var file = this.files[0];
                var reader = new FileReader();
                // 监听reader对象的的onload事件，当图片加载完成时，把base64编码賦值给预览图片
                reader.addEventListener("load", function() {
                    imgs.src = reader.result;
                }, false);
                // 调用reader.readAsDataURL()方法，把图片转成base64
                reader.readAsDataURL(file);
                $("img").eq(1).css("display", "block");
            }, false);
        }

        var time = 120;
        var interval;
        function refer(){
            $("#time").html("请于"+time+"s之前填写验证码");
            time--;
            if(time < 0){
                clearInterval(interval);
                $("#time").text("验证码失效，请重新发送!");
            }
        }

        $("#checkBtn").click(function (e) {
            e.preventDefault();
            $.ajax({
                url:"${pageContext.request.contextPath}/checking",
                data:$(".form").serialize(),
                type:"POST",
                success:function (data) {
                    if(true == data){
                        time = 120;
                        clearInterval(interval);
                        interval = setInterval(refer,1000);
                    }
                },
                error:function(data){
                    alert(data);
                },
                dataType:"json"});
        });


        form.on("submit(publishHouse)", function () {

            $.ajax({
                type:'post',

                url:"${pageContext.request.contextPath}/publishHouse",
                data:new FormData($('#codeForm')[0]),
                cache:false,
                processData:false,
                contentType:false,
                success:function (res) {
                    if (res === "OK") {
                        clearInterval(interval);
                        $("#time").text("");
                        layer.msg("上传成功",{context:'上传成功',offset:'150px'})
                    } else {
                        layer.msg("验证码错误",{context:'验证码错误',offset:'150px'});
                    }
                },
            });
            return false;
        });
    })
</script>
</html>
