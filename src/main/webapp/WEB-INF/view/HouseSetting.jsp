<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="utf-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"/>
    <title>查看房子</title>
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
        .feather li{
            display: inline;
            margin-left: 20px;
            background: #f6f6f6;
            color: #9b9b9b;
        }
        .feather li input{
            width: 15%;
        }
        .houseStyle li{
            display: inline;
            margin-left: 20px;
        }
        .other1{
            width: 50%;
            float: left;
        }
        .other2{
            width: 50%;
            float: right;
        }
        .other1 li{
             margin: 15px 0px 0px 30px;
         }
        .other2 li{
            margin: 15px 0px 0px 30px;
        }
        .other1 li input{
            width: 30%;
        }
        .other2 li input{
            width: 30%;
        }
        .price1 li input{
            width: 15%;
        }
        .price2 li input{
            width: 15%;
        }
        .personalFacilities li{
            margin-left: 20px;
            display: inline;
        }
        .personalFacilities li img{
            height: 92px;
            width: 76px;
        }
        .personalFacilities2 li{
            margin-left: 20px;
            display: inline;
        }
        .personalFacilities2 li img{
            height: 92px;
            width: 76px;
        }
        .allFacilities li{
             display: inline;
             margin-left: 5px;
         }
        .allFacilities li img{
            height: 92px;
            width: 76px;
        }
        .publicFacilities li{
            display: inline;
            margin-left: 5px;
        }
        .publicFacilities li img{
            height: 92px;
            width: 76px;
        }
        .price1{
            width: 50%;
            float: left;
        }
        .price2{
            width: 50%;
            float: right;
        }
        .price1 li{
            margin-top: 20px;
        }
        .price2 li{
            margin-top: 20px;
        }
        .houseImformation li{
            margin: 10px 0 0 20px
        }
        #imageList img{
            height: 100px;
            width: 75px;
            margin-left: 5px;;
        }
    </style>
</head>
<body style="background: #ece5f6">
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
                    <dd><button class="layui-btn layui-btn-xs" style="width: 66px"><a href="${pageContext.request.contextPath}/personalCenter" style="padding:  0px;color: white">个人中心</a></button></dd>
                    <dd style="margin-top: 10px"><button class="layui-btn layui-btn-xs layui-btn-danger"><a href="${pageContext.request.contextPath}/exit" style="padding:  0px;color: white">退&#12288&#12288出</a></button></dd>
                </dl>
            </li>
        </ul>
    </div>
</div>

<div class="layui-container" >


    <form action="${pageContext.request.contextPath}/moreFileUpLoad" method="post" class="layui-form">
        <div class="layui-upload"  style="float: left;margin-top: 10px">
            <button type="button" class="layui-btn" id="test2">多图片上传</button>
            <blockquote class="layui-elem-quote layui-quote-nm"  id="imageList" style="margin-top: 10px;">
                预览图：
                <div class="layui-upload-list" id="demo2"></div>
            </blockquote>
        </div>
    </form>

    <form action="" method="post" id="informationForm">
        <div style="width: 48%;float: right;height: 450px;background: white;margin-top: 10px">
            <div style="font-size: 30px;font-weight: 800;margin-left: 10px">
                中华小区
            </div>
            <div>
                <ul class="feather" style="margin-top: 20px">
                    <li><input type="text" placeholder="特征1" name="firstFashion" required="required" ></li>
                    <li><input type="text" placeholder="特征2" name="secondFashion" required="required"></li>
                    <li><input type="text" placeholder="特征3" name="thirdFashion" required="required"></li>
                    <li><input type="text" placeholder="特征4" name="forthFashion" required="required"></li>
                </ul>
            </div>
            <hr>
            <div>
                <ul class="houseStyle">
                    <li><span style="color: red;font-size: 35px">${house.price}</span>元/月</li>
                    <li><span style="font-size: 35px;color: #ede8e8">|</span></li>
                    <li><span style="font-size: 35px">${house.square}</span>m²</li>
                    <li><span style="font-size: 35px;color: #ede8e8">|</span></li>
                    <li><span style="font-size: 35px">朝${house.direction}</span></li>
                </ul>
            </div>
            <hr>
            <div>
                <ul class="other1">
                    <li><span style="color:#9b9b9b">交通：</span><input type="text" placeholder="如:1路车" name="car" required="required"></li>
                    <li><span style="color:#9b9b9b">类型：</span><input type="text" placeholder="合租/单租" name="renterStyle" required="required"></li>
                    <li><span style="color:#9b9b9b">区域：</span>${house.area}</li>
                </ul>
            </div>
            <div>
                <ul class="other2">
                    <li><span style="color:#9b9b9b">楼层：</span>${house.storey}</li>
                    <li><span style="color:#9b9b9b">付款：</span>${house.status== '0'.charAt(0)? '未付款':'已付款' }</li>
                    <li><span style="color:#9b9b9b">地址：</span>${house.city}</li>
                </ul>
            </div>
            <div style="margin-top: 150px;height: 1px">
                <hr>
            </div>
            <div>
                <div style="width: 50%;float: left"><button id="order" style="margin: 40px;background: none;border: 2px solid #8cbdef;height: 44px;width: 111px;">保存信息</button></div>
                <div style="width: 50%;float: right"><button id="account" style="margin: 40px;background: none;border: 2px solid #8cbdef;height: 44px;width: 111px;">移除房源</button></div>
            </div>

        </div>
        <hr>
        <div class="layui-tab layui-tab-brief" style="width: 100%;background: white">
            <ul class="layui-tab-title">
                <li class="layui-this">独立设施</li>
                <li>公共设施</li>
                <li>收费标准</li>
                <li>房屋信息</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    <div>
                        <ul class="personalFacilities">

                                <c:forEach items="${publics}" var="pub">
                                    <li><img src="${pageContext.request.contextPath}/img/PublicFacilities/${pub}.png" alt="${pub}"></li>
                                </c:forEach>


                        </ul>
                    </div>
                    <hr>
                    <div>
                        <p style="color: #2e8f78;font-size: 16px;margin-left: 7px;">设施选择</p>
                        <ul class="allFacilities" style="margin: 10px 0 0 0">
                            <c:forEach items="${allFacilities}" var="facilities">
                                <li><img src="${pageContext.request.contextPath}/img/PublicFacilities/${facilities}.png" alt="${facilities}"></li>
                            </c:forEach>
                        </ul>
                    </div>


                </div>
                <div class="layui-tab-item">
                    <div>
                        <ul class="personalFacilities2">

                                <c:forEach items="${personal}" var="person">
                                    <li><img src="${pageContext.request.contextPath}/img/PublicFacilities/${person}.png" alt="${person}"></li>
                                </c:forEach>


                        </ul>
                    </div>
                    <hr>
                    <div>
                        <p style="color: #2e8f78;font-size: 16px;margin-left: 7px;">设施选择</p>
                        <ul class="publicFacilities" style="margin: 10px 0 0 0">
                            <c:forEach items="${allFacilities2}" var="facilities">
                                <li><img src="${pageContext.request.contextPath}/img/PublicFacilities/${facilities}.png" alt="${facilities} "></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="layui-tab-item" style="height: 138px">

                    <ul class="price1">
                        <li><span>水&#12288;&#12288;费：</span><input type="text" placeholder="元/吨" name="waterPrice" required="required"></li>
                        <li><span>电&#12288;&#12288;费：</span><input type="text" placeholder="元/度" name="electricity" required="required"></li>
                        <li><span>公用水费：</span><input type="text" placeholder="元/吨" name="publicWaterPrice" required="required"></li>
                    </ul>

                    <ul class="price2">
                        <li><span>公用电费：</span><input type="text" placeholder="元/度" name="publicElectricity" required="required"></li>
                        <li><span>网&#12288;&#12288;费：</span><input type="text" placeholder="元/月" name="internetPrice" required="required"></li>
                        <li><span>服务费(一次性)：</span><input type="text" placeholder="元" name="servicePrice" required="required"></li>
                    </ul>

                </div>
                <div class="layui-tab-item">
                    <ul class="houseImformation">
                        <li>发布人员：<input type="text" placeholder="如:余先生" style="" name="personName" required="required" id="personName"></li>
                        <li>房屋编号：<span>${house.id}号</span></li>
                        <li>发布时间：<span>${house.publishdate}</span></li>
                        <li>投诉邮箱：<span style="color: red">1121344426@qq.com</span></li>

                    </ul>
                </div>
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
    layui.use(['element', 'carousel', 'layer', 'form','laypage','upload'], function () {
        var element = layui.element,
            carousel = layui.carousel,
            $ = layui.jquery,
            layer = layui.layer,
            form = layui.form,
            upload = layui.upload;

            upload.render({
                elem: '#test2'
                ,url: '${pageContext.request.contextPath}/moreFileUpLoad' //改成您自己的上传接口
                ,multiple: true
                ,accept: 'images'
                ,before: function(obj){
                    //预读本地文件示例，不支持ie8
                    obj.preview(function(index, file, result){
                        $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
                    });
                }
                ,done: function(res){
                    if(res == 1){
                        layer.msg('上传成功');
                    }
                }
            });


        carousel.render({
            elem: '#test01'
            ,width: '50%' //设置容器宽度
            ,height: '450px'
            ,arrow: 'always' //始终显示箭头
            ,interval: 3000
        });
        //获取公共设施的的可以添加ul标签对象
        var all = $('.allFacilities');
        //获得公共设施的已经添加的ul标签对象
        var person = $('.personalFacilities');
        //获取公共设施的的可以添加的li对象
        var data = $('.allFacilities li');
        data.click(function () {
            if($(this).parent().attr("class") == "allFacilities"){
                $(this).appendTo(person);
            }else {
                $(this).appendTo(all);
            }
        })
        //获取独立设施的的可以添加ul标签对象
        var publicAll = $('.publicFacilities');
        //获得独立设施的已经添加的ul标签对象
        var person2 = $('.personalFacilities2');
        //获取独立设施的的可以添加的li对象
        var dataAll = $('.publicFacilities li');
        dataAll.click(function () {
            if($(this).parent().attr("class") == "publicFacilities"){
                $(this).appendTo(person2);
            }else {
                $(this).appendTo(publicAll);
            }
        })
        //获取公共设施已经添加的li对象
        var dataPub = $('.personalFacilities li');
        //获取独立设施已经添加的li对象
        var dataPub2 = $('.personalFacilities2 li');
        dataPub.click(function () {
            if($(this).parent().attr("class") == "personalFacilities"){
                $(this).appendTo(all);
            }else {
                $(this).appendTo(person);
            }
        })

        dataPub2.click(function () {
            if($(this).parent().attr("class") == "personalFacilities2"){
                $(this).appendTo(publicAll);
            }else {
                $(this).appendTo(person2);
            }
        })

        $('#order').click(function (e) {
            e.preventDefault();
            var publicData = $('.personalFacilities li img');
            var personalData = $('.personalFacilities2 li img');
            var array = [];
            var array2 = [];
            var id = "${id}";
            for(var i=0;i<publicData.length;i++){
               var str = $(publicData[i]).attr("alt");
               array[i]  = str;
            }

            for(var i=0;i<personalData.length;i++){
                var str = $(personalData[i]).attr("alt");
                array2[i]  =  str;
            }

            $.get("${pageContext.request.contextPath}/saveImformation?"+$('#informationForm').serialize(),{"per":array,"pub":array2,"id":id},function (res) {
                if(res == 'ok'){
                    layer.msg('保存成功');
                }
            })


        })
    })
</script>

</html>
