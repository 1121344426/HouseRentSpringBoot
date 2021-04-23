<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"/>
    <title>欢迎来到房屋租赁网</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
<style>
    .recommend a img{
        width: 280px;
        height: 280px;
    }
</style>
<body>
<!--轮播图-->
<div class="layui-carousel" id="bg-item">
    <div class="layui-header title">
        <div>
            <img class="find" src="${pageContext.request.contextPath}/img/logo.png" alt="蜗壳">
        </div>
        <div class="add">
            <button  class="logo layui-btn layui-btn-radius layui-btn-warm" id="address" >
                <i class="layui-icon layui-icon-website" style="font-size: 20px;margin-top: 38px">
                </i>衢州
            </button>
        </div>
        <div class="layui-container">

            <div class="layui-breadcrumb  navigation" lay-separator="|">
                  <a href="${pageContext.request.contextPath}/homePage" >首页</a>
                  <a href="${pageContext.request.contextPath}/DefaultHouses?page=1" >寻找房源</a>
                  <a href="${pageContext.request.contextPath}/PublishHouses" >发布房源</a>
                  <a href="${pageContext.request.contextPath}/findFriend" >寻找室友</a>
            </div>
            <c:if test="${not empty loginUser}">
                <ul class="layui-nav layui-pull-right single" >
                    <li class="layui-nav-item">
                        <button class="personal" ><img src="${pageContext.request.contextPath}/img/normal.jpg" class="layui-nav-img"></button>
                        <dl class="layui-nav-child">
                            <dd><button class="layui-btn layui-btn-xs"><a href="${pageContext.request.contextPath}/personalCenter" style="padding:  0px;color: white">个人中心</a></button></dd>
                            <dd><button class="layui-btn layui-btn-xs layui-btn-danger"><a href="${pageContext.request.contextPath}/exit" style="padding:  0px;color: white">退&#12288&#12288出</a></button></dd>
                        </dl>
                    </li>
                </ul>
            </c:if>
            <c:if test="${empty loginUser}">
                <button class="operation layui-pull-right layui-btn layui-btn-primary layui-btn-radius" >
                    <i class="layui-icon layui-icon-friends" style="font-size: 20px"></i> 登录/注册
                </button>
            </c:if>

        </div>
    </div>

    <!--搜索框-->
    <div class="layui-container">
        <div class="search-input">
            <form class="search-form layui-form" method="post" action="${pageContext.request.contextPath}/DefaultHouses?page=1">
                <div class="layui-pull-left input">
                    <input type="text" placeholder="请输入房源特征、房型、小区名..." name="keywords" class="search layui-input"
                           lay-verify="">
                </div>
                <div class="layui-pull-left button">
                    <button class="btn search-btn" lay-submit>
                        <i class="layui-icon layui-icon-search" style="font-size: 24px;"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>
    <div carousel-item class="back">
        <div><img
                src="${pageContext.request.contextPath}/img/banner-1.jpg" alt=""></div>
        <div><img
                src="${pageContext.request.contextPath}/img/banner-2.jpg" alt=""></div>
        <div><img
                src="${pageContext.request.contextPath}/img/banner-3.jpg" alt=""></div>
        <div><img
                src="${pageContext.request.contextPath}/img/banner-4.jpg" alt=""></div>
    </div>
</div>

<div class="layui-container"></div>

<%--登录注册窗口--%>
<div class="layui-container">
    <div class="layui-tab layui-tab-brief" id="sign" lay-filter="" style="display: none;">
        <ul class="layui-tab-title">
            <li class="layui-this">登录</li>
            <li>注册</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <div class="" style="margin: 40px 20px;">
                    <form class="layui-form layui-form-pane" id="login" action="${pageContext.request.contextPath}/login">
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-block">
                                <input type="text" name="username" required lay-verify="required" placeholder="请输入用户名"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <br>
                        <div class="layui-form-item">
                            <label class="layui-form-label">密码</label>
                            <div class="layui-input-block">
                                <input type="password" name="password" required lay-verify="required"
                                       placeholder="请输入密码" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <br>
                        <div class="layui-form-item">
                            <button class="layui-btn layui-btn-fluid layui-btn-normal layui-btn-radius" lay-submit
                                    lay-filter="login">立即登录
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="layui-tab-item">
                <div class="" style="margin: 30px 20px;">
                    <form class="layui-form layui-form-pane form" method="post">
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-block">
                                <input type="text" name="userName" required lay-verify="required" placeholder="请输入用户名"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">密码</label>
                            <div class="layui-input-block">
                                <input type="password" name="userPassword" required lay-verify="required"
                                       placeholder="请输入密码"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">邮箱</label>
                            <div class="layui-input-block">
                                <input type="text" name="email" required lay-verify="required|email"
                                       placeholder="注册后不能修改" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layuit-inline">
                                <label class="layui-form-label">验证码</label>
                                <div class="layui-input-inline" style="width: 150px">
                                    <input type="text" name="check" lay-verify="required" placeholder="请输入验证码" class="layui-input" />
                                </div>
                                <div class="layui-input-inline" style="width: 44px;margin-top: 5px">
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
                            <label class="layui-form-label">昵称</label>
                            <div class="layui-input-block">
                                <input type="text" name="name" required lay-verify="required"
                                       placeholder="注册后不能修改"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <button
                                    class="layui-btn layui-btn-fluid layui-btn-radius layui-btn-normal regist-btn" lay-submit lay-filter="register">
                                立即注册
                            </button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
<%--城市h选择--%>
<div class="layui-container">
    <div class="" id="address_select" lay-filter="" style="display: none">
        <div class="add_title">
            <h2>请选择城市</h2>
            <ul>
                <li>热门城市:</li>
                <li><button class="layui-btn  layui-btn-xs layui-btn-normal">杭州</button></li>
                <li><button class="layui-btn  layui-btn-xs layui-btn-normal">北京</button></li>
                <li><button class="layui-btn  layui-btn-xs layui-btn-normal">上海</button></li>
                <li><button class="layui-btn  layui-btn-xs layui-btn-normal">深证</button></li>
            </ul>
        </div>
        <div class="add_body">
            <ul>
                <li>
                    <span>B</span>
                    <button class="layui-btn layui-btn-primary layui-btn-xs">北京</button>
                </li>
                <li>
                    <span>C</span>
                    <button class="layui-btn layui-btn-primary layui-btn-xs ">成都</button>
                    <button class="layui-btn layui-btn-primary layui-btn-xs ">重庆</button>
                </li>
                <li>
                    <span>D</span>
                    <button class="layui-btn layui-btn-primary layui-btn-xs ">大连</button>
                </li>
                <li>
                    <span>G</span>
                    <button class="layui-btn layui-btn-primary layui-btn-xs ">广州</button>
                </li>
                <li>
                    <span>H</span>
                    <button class="layui-btn layui-btn-primary layui-btn-xs ">杭州</button>
                </li>
                <li>
                    <span>N</span>
                    <button class="layui-btn layui-btn-primary layui-btn-xs ">南京</button>
                </li>
            </ul>
            <ul class="add_right">
                <li>
                    <span>S</span>
                    <button class="layui-btn layui-btn-primary layui-btn-xs ">上海</button>
                    <button class="layui-btn layui-btn-primary layui-btn-xs ">深圳</button>
                    <button class="layui-btn layui-btn-primary layui-btn-xs ">苏州</button>
                </li>
                <li>
                    <span>T</span>
                    <button class="layui-btn layui-btn-primary layui-btn-xs ">天津</button>
                </li>
                <li>
                    <span>W</span>
                    <button class="layui-btn layui-btn-primary layui-btn-xs ">武汉</button>
                </li>
                <li>
                    <span>X</span>
                    <button class="layui-btn layui-btn-primary layui-btn-xs ">西安</button>
                </li>
                <li>
                    <span>Z</span>
                    <button class="layui-btn layui-btn-primary layui-btn-xs ">郑州</button>
                </li>
            </ul>
        </div>
    </div>
</div>
<!--内容开始-->
<div class="list_control_bar layui-container">
    <div>
        <div class="list_title layui-pull-left"><span>精品推荐</span></div>
        <div class="list_more">
            <ul class="layui-pull-right list-item">
                <li class="click-this"><a  href="${pageContext.request.contextPath}/change?action=recommend" >换一批</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="layui-container recommend">
    <c:forEach items="${recommond}" var="image">
        <a href=""><img src="${pageContext.request.contextPath}/img/houses/${image}.jpg" alt=""></a>
    </c:forEach>


</div>

<div class="layui-container" style="height: 1px;margin: 200px;color: white">
    <hr>
</div>
<%--查看--%>
<div class="list_control_bar layui-container">
    <div>
        <div class="list_title layui-pull-left"><span>精品推荐</span></div>
        <div class="list_more">
            <ul class="layui-pull-right list-item">
                <li class="click-this"><a href="${pageContext.request.contextPath}/change?action=recommend2" >换一批</a></li>
            </ul>
        </div>
    </div>
</div>
<a href="${pageContext.request.contextPath}/homePage" id="go" ><span style="visibility:hidden">我的</span></a>
<%--图片--%>
<div class="layui-container recommend">
    <c:forEach items="${recommond2}" var="image">
        <a href=""><img src="${pageContext.request.contextPath}/img/houses/${image}.jpg" alt=""></a>
    </c:forEach>
</div>
<div class="footerDes layui-container">
    <footer>
        <p>2021-2999 &copy; 房屋租赁网 懂您的需求 服务于心</p>
    </footer>
</div>


<script>
    layui.use(['element', 'carousel', 'layer', 'form'], function () {
        var element = layui.element,
            carousel = layui.carousel,
            $ = layui.jquery,
            layer = layui.layer,
            form = layui.form;

        var layer_index;
        var layer_address;
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
                url:"${pageContext.request.contextPath}/checking?action=register",
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
        carousel.render({
            elem: "#bg-item",
            width: "100%",
            height: "800px",
            anim: "fade"
        });
        $('.operation').click(function () {
            layer_index = layer.open({
                type: 1,
                content: $('#sign'),
                area: ['400px', '510px'],
                title: "房屋租赁网",
                closeBtn: 2
            });
        });
        $('#address').click(function () {
            layer_address = layer.open({
                type: 1,
                content: $('#address_select'),
                area: ['600px','400px'],
                title: "城市业务"
            });
        });
        $('.list-item li').click(function () {
            $('.list-item li').removeClass('click-this');
            $(this).addClass('click-this');
        });

        form.on("submit(register)",function () {
                $.post("${pageContext.request.contextPath}/register", $('.form').serialize(), function (res) {
                    if (res === 'OK') {
                        clearInterval(interval);
                        $("#time").text("");
                        layer.close(layer_index);
                        layer.alert("注册成功", {icon: 1, time: 2000});
                        $('.form')[0].reset();
                    }else if(res === 'outTime'){
                        layer.msg("验证码失效或者验证码错误",{context:"验证码失效或者验证码错误",offset:'150px'});
                    }
                    else {
                        layer.msg("注册失败,用户名以存在",{context:"验证码失效或者验证码错误",offset:'150px'});
                    }
                })
            return false;
        });
        $('.add_body ul li button').click(function () {
            var sel = this.innerText;
            $('#address')[0].innerHTML ="<i class='layui-icon layui-icon-website' style='font-size: 20px;margin-top: 38px'> </i>" + sel;
            layer.close(layer_address);

        });
        $('.add_title ul li button').click(function () {
            var sel = this.innerText;
            $('#address')[0].innerHTML ="<i class='layui-icon layui-icon-website' style='font-size: 20px;margin-top: 38px'> </i>" + sel;
            layer.close(layer_address);

        });

        form.on("submit(login)", function () {
            $.post("${pageContext.request.contextPath}/logonSecurity", $('#login').serialize(), function (res) {
                console.log(res)
                if (res === "OK") {
                    console.log(111)
                    $('#go')[0].click();
                    console.log(222)
                } else if(res === "NO") {
                    layer.msg("密码错误");
                }else {
                    layer.msg("用户名不存在");
                }
            });
            return false;
        });
    });
</script>
</body>
</html>
