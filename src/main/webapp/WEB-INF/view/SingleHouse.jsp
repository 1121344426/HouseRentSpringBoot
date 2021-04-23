<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="utf-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"/>
    <title>查看房子</title>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <style>
        img{
            height: 450px;
            width: 570px;
        }
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
        .personalFacilities li{
            margin-left: 20px;
            display: inline;
        }
        .personalFacilities li img{
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
    <div class="layui-carousel images" id="test01" style="float: left;margin-top: 10px">
        <div carousel-item>
            <div><img src="${pageContext.request.contextPath}/img/houses/1.jpg" alt=""></div>
            <div><img src="${pageContext.request.contextPath}/img/houses/2.jpg" alt=""></div>
            <div><img src="${pageContext.request.contextPath}/img/houses/3.jpg" alt=""></div>
            <div><img src="${pageContext.request.contextPath}/img/houses/4.jpg" alt=""></div>
            <div><img src="${pageContext.request.contextPath}/img/houses/10.jpg" alt=""></div>
            <div><img src="${pageContext.request.contextPath}/img/houses/2-1.jpg" alt=""></div>
        </div>
    </div>
    <div style="width: 48%;float: right;height: 450px;background: white;margin-top: 10px">
        <div style="font-size: 30px;font-weight: 800;margin-left: 10px">
            中华小区
        </div>
        <div>
            <ul class="feather" style="margin-top: 20px">
                <li>${houseOther.firstFashion}</li>
                <li>${houseOther.secondFashion}</li>
                <li>${houseOther.thirdFashion}</li>
                <li>${houseOther.forthFashion}</li>
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
                <li><span style="color:#9b9b9b">交通：</span>${houseOther.transport}</li>
                <li><span style="color:#9b9b9b">类型：</span>${houseOther.renterStyle}</li>
                <li><span style="color:#9b9b9b">区域：</span>${house.area}</li>
            </ul>
        </div>
        <div>
            <ul class="other2">
                <li><span style="color:#9b9b9b">楼层：</span>${house.storey}楼</li>
                <li><span style="color:#9b9b9b">付款：</span>${house.status == '0'.charAt(0)? '未付款':'已付款'}</li>
                <li><span style="color:#9b9b9b">地址：</span>${house.city}</li>
            </ul>
        </div>
        <div style="margin-top: 150px;height: 1px">
            <hr>
        </div>
        <div>
            <c:if test="${agree == 1}">
            <div style="width: 50%;float: left"><button id="agree" style="margin: 40px;background: none;border: 2px solid #8cbdef;height: 44px;width: 111px;">同意租房</button></div>
            </c:if>
            <c:if test="${agree == 2}">
                <div style="width: 50%;float: left"><button id="order" style="margin: 40px;background: none;border: 2px solid #8cbdef;height: 44px;width: 111px;">预约看房</button></div>
            </c:if>
            <c:if test="${remove == 1}">
                <div style="width: 50%;float: right"><button id="account" style="margin: 40px;background: none;border: 2px solid #8cbdef;height: 44px;width: 111px;">加入清单</button></div>
            </c:if>
            <c:if test="${remove==2}">
                <div  style="width: 50%;float: right"><button data-method="notice" id="remove" style="margin: 40px;background: none;border: 2px solid #8cbdef;height: 44px;width: 111px;">移除房源</button></div>
            </c:if>
            <c:if test="${remove==3}">
                <div  style="width: 50%;float: right"><button data-method="notice" id="removeSelf" style="margin: 40px;background: none;border: 2px solid #8cbdef;height: 44px;width: 111px;">移除房源</button></div>
            </c:if>
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
                <ul class="personalFacilities">
                    <c:forEach items="${publicList}" var="p">
                        <li><img src="${pageContext.request.contextPath}/img/PublicFacilities/${p}.png" alt=""></li>
                    </c:forEach>
                </ul>
            </div>
            <div class="layui-tab-item">
                <ul class="personalFacilities">
                    <c:forEach items="${personalList}" var="p">
                        <li><img src="${pageContext.request.contextPath}/img/PublicFacilities/${p}.png" alt=""></li>
                    </c:forEach>
                </ul>
            </div>
            <div class="layui-tab-item" style="height: 138px">

                    <ul class="price1">
                        <li><span>水费：</span>${houseOther.waterPrice}元/吨</li>
                        <li><span>电费：</span>${houseOther.electricity}元/度</li>
                        <li><span>公用水费：</span>${houseOther.publicWaterPrice}元/吨</li>
                    </ul>

                    <ul class="price2">
                        <li><span>公用电费：</span>${houseOther.publicElectricity}元/度</li>
                        <li><span>网费：</span>${houseOther.internetPrice}元/月</li>
                        <li><span>服务费(一次性)：</span>${houseOther.servicePrice}元</li>
                    </ul>

            </div>
            <div class="layui-tab-item">
                <ul class="houseImformation">
                    <li>发布人：<span>${houseOther.personName}</span></li>
                    <li>房屋编号：<span>${house.id}号</span></li>
                    <li>发布时间：<span>${house.publishdate}</span></li>
                    <li>投诉邮箱：<span style="color: red">1121344426@qq.com</span></li>

                </ul>
            </div>
        </div>
    </div>
</div>
<a href="${pageContext.request.contextPath}/personalCenter" id="go" ><span style="visibility:hidden">我的</span></a>
<div class=" layui-container" style="border-top: 2px solid #e4e6f0;margin-top: 350px;">
    <footer>
        <p>2021-2999 &copy; 房屋租赁网 懂您的需求 服务于心</p>
    </footer>
</div>
</body>
<script>
    layui.use(['element', 'carousel', 'layer', 'form','laypage'], function () {
        var element = layui.element,
            carousel = layui.carousel,
            $ = layui.jquery,
            layer = layui.layer,
            form = layui.form;

        carousel.render({
            elem: '#test01'
            ,width: '50%' //设置容器宽度
            ,height: '450px'
            ,arrow: 'always' //始终显示箭头
            ,interval: 3000
        });

        $('#order').click(function () {
            $.get("${pageContext.request.contextPath}/orderHouse","id=${id}",function (res) {
                if(res == "ok"){
                    layer.msg('已经提醒房东',{context:'已经提醒房东',offset:'150px'})
                }
            } )
        })

        $('#account').click(function () {
            $.get("${pageContext.request.contextPath}/addPersonalList","id=${id}",function (res) {
                if(res == "exists"){
                    layer.msg('已经在清单中',{context:'已经在清单中',offset:'150px'})
                }else{
                    layer.msg('加入清单成功',{context:'加入清单成功',offset:'150px'})
                }
            } )
        })

        function send(){
            console.log(1)
        }
        $('#remove').click(function () {
            layer.open({
                title: '移除房源'
                ,offset:'150px'
                ,btn:['残忍移除','手滑点错']
                ,yes:function(){
                    $.get("${pageContext.request.contextPath}/removePersonalList","id=${id}",function (res) {
                        if(res == "ok"){
                            layer.msg('移除成功',{context:'移除成功',offset:'150px'});
                            setTimeout(send,1000);
                            $('#go')[0].click();
                        }
                    })
                }
                ,btn2:function(){
                    console.log(2)
                }
                ,content: '确认移除房源'
            })

        })

        $('#removeSelf').click(function () {
            layer.open({
                title: '移除房源'
                ,offset:'150px'
                ,btn:['残忍移除','手滑点错']
                ,yes:function(){
                    $.get("${pageContext.request.contextPath}/removeHouse","id=${id}",function (res) {
                        if(res == "ok"){
                            layer.msg('移除成功',{context:'移除成功',offset:'150px'});
                            setTimeout(send,1000);
                            $('#go')[0].click();
                        }else{
                            layer.msg('移除失败',{context:'移除成功',offset:'150px'});
                            setTimeout(send,1000);
                            $('#go')[0].click();
                        }
                    })
                }
                ,btn2:function(){
                    console.log(2)
                }
                ,content: '确认移除房源'
            })

        })

        $('#agree').click(function () {
            layer.open({
                title: '同意租客'
                ,offset:'150px'
                ,btn:['同意租房','残忍拒绝']
                ,yes:function(){
                    $.get("${pageContext.request.contextPath}/agreeRenter","id=${id}&renterid=${renterid}",function (res) {
                        if(res == "ok"){
                            layer.msg('成功',{context:'移除成功',offset:'150px'});
                            setTimeout(send,1000);
                            $('#go')[0].click();
                        }
                    })
                }
                ,btn2:function(){
                    console.log(2)
                }
                ,content: '确认同意信息'
            })

        })
    })
</script>

</html>
