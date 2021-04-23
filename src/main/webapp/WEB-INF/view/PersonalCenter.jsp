<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="utf-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"/>
    <title>个人中心</title>
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
        .houseOwnerPage ul li{
            display: inline;
            margin-left: 5px;
        }
        .houseRenterPage ul li{
            display: inline;
            margin-left: 5px;
        }
        .houseListPage ul li{
            display: inline;
            margin-left: 5px;
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
                    <dd><button class="layui-btn layui-btn-xs"><a href="${pageContext.request.contextPath}/personalCenter" style="padding:  0px;color: white">个人中心</a></button></dd>
                    <dd style="margin-top: 10px"><button class="layui-btn layui-btn-xs layui-btn-danger"><a href="${pageContext.request.contextPath}/exit" style="padding:  0px;color: white">退&#12288&#12288出</a></button></dd>
                </dl>
            </li>
        </ul>
    </div>
</div>
<div class="layui-container" style="border: 1px solid grey;margin-top: 20px;background: white">
    <div style="color: black;font-size: 15px;font-weight: 800">
        ${name}用户,这是您的个人中心
    </div>
    <div class="layui-tab layui-tab-brief" style="width: 100%;background: white">
        <ul class="layui-tab-title">
            <li class="layui-this">我的房子</li>
            <li>我的租房</li>
            <li>我的清单</li>
            <li>浏览记录</li>
            <li>消息查看</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <c:if test="${empty house}">
                    <img src="${pageContext.request.contextPath}/img/NoImage/no.png" alt="" style="width: 100%">
                    <div style="position: absolute;width: 1090px;margin-top: -80px;text-align: center;font-size: 1.3em;font-family: 'microsoft yahei';font-weight: 600;">暂无上传房子呦~</div>
                </c:if>
                <c:if test="${not empty house}">
                    <div class="houseOwner">
                        <ul>
                            <c:forEach items="${house.list}" var="houses">
                                <li style="padding: 35px 0px;position: relative;border-bottom:1px solid #f1f1f1;height: 280px ">
                                    <a href="${pageContext.request.contextPath}/houseSetting?id=${houses.id}&remove=1&agree=2" style="position: relative;float: left"><img src="${pageContext.request.contextPath}/img/houses/${houses.path}" alt="" style="height: 280px;width: 280px"></a>
                                    <div style="float: right;border: 1px solid #e3d2d2;height: 280px;width: 824px;">
                                        <div style="font-weight: 800;font-size: 30px;font-family: HiraginoSansGB-W6;">${houses.descr}</div>
                                        <div style="margin-top: 20px">
                                            <div style="margin-top: 30px;color: #08bce5;font-size: 20px;font-weight: 800">${houses.village} / ${houses.square}m² / 朝${houses.direction} / ${houses.style}</div>
                                            <div style="margin-top: 30px;color: #08bce5;font-size: 20px;font-weight: 800">${houses.style} / ${houses.storey}层 / ${houses.city} / ${houses.area}</div>
                                            <div style="margin-top: 40px;color: #08bce5;font-size: 20px;font-weight: 800"><fmt:formatDate value='${houses.publishdate}' pattern='yyyy-MM-dd' /></div>
                                            <div style="position: absolute;right: 0;top: 30%;font-weight: 800;font-size: 30px;color: red">${houses.price}<span style="color: red;font-size: 15px;font-weight: normal">元/月</span></div>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="houseOwnerPage" style="margin: 50px 300px">
                        <ul>
                            <li style="font-size: 10px">共${house.pages}页</li>
                            <li><button class="layui-btn layui-btn-sm" id="houseOwnerFirstBtn">首页</button></li>
                            <li><button class="layui-btn layui-btn-sm" id="houseOwnerPrevBtn"><i class="layui-icon">&#xe65a;</i></button></li>
                            <li id="houseOwnerReplaceFirstLi"></li>
                            <c:if test="${house.pageNum > 1}">
                                <li id="houseOwnerFirstLi">${house.pageNum - 1}</li>
                            </c:if>
                            <li style="color: #1E9FFF" id="houseOwnerSecondLi">${house.pageNum}</li>
                            <c:if test="${house.pageNum < house.pages}">
                                <li id="houseOwnerThirdLi">${house.pageNum + 1}</li>
                            </c:if>
                            <li id="houseOwnerReplaceSecondLi"></li>
                            <li><button class="layui-btn layui-btn-sm" id="houseOwnerNextBtn"><i class="layui-icon">&#xe65b;</i></button></li>
                            <li><button class="layui-btn layui-btn-sm" id="houseOwnerLastBtn">最后一页</button></li>
                            <li style="font-size: 10px">到第 <input type="text" id="jumpPageInput" style="height: 25px;width: 50px"> 页</li>
                            <li><button class="layui-btn layui-btn-sm" id="houseOwnerJumpBtn">跳转</button></li>
                        </ul>
                    </div>
                </c:if>

            </div>
            <div class="layui-tab-item">
                <c:if test="${empty myHouses}">
                    <img src="${pageContext.request.contextPath}/img/NoImage/no.png" alt="" style="width: 100%">
                    <div style="position: absolute;width: 1090px;margin-top: -80px;text-align: center;font-size: 1.3em;font-family: 'microsoft yahei';font-weight: 600;">暂无租房呦~</div>
                </c:if>
                <c:if test="${not empty myHouses}">
                    <div class="houseRenter">
                        <ul>
                            <c:forEach items="${myHouses.list}" var="houses">
                                <li style="padding: 35px 0px;position: relative;border-bottom:1px solid #f1f1f1;height: 280px ">
                                    <a href="${pageContext.request.contextPath}/singleHouse?id=${houses.id}&remove=1&agree=2" style="position: relative;float: left"><img src="${pageContext.request.contextPath}/img/houses/${houses.path}" alt="" style="height: 280px;width: 280px"></a>
                                    <div style="float: right;border: 1px solid #e3d2d2;height: 280px;width: 824px;">
                                        <div style="font-weight: 800;font-size: 30px;font-family: HiraginoSansGB-W6;">${houses.descr}</div>
                                        <div style="margin-top: 20px">
                                            <div style="margin-top: 30px;color: #08bce5;font-size: 20px;font-weight: 800">${houses.village} / ${houses.square}m² / 朝${houses.direction} / ${houses.style}</div>
                                            <div style="margin-top: 30px;color: #08bce5;font-size: 20px;font-weight: 800">${houses.style} / ${houses.storey}层 / ${houses.city} / ${houses.area}</div>
                                            <div style="margin-top: 40px;color: #08bce5;font-size: 20px;font-weight: 800"><fmt:formatDate value='${houses.publishdate}' pattern='yyyy-MM-dd' /></div>
                                            <div style="position: absolute;right: 0;top: 30%;font-weight: 800;font-size: 30px;color: red">${houses.price}<span style="color: red;font-size: 15px;font-weight: normal">元/月</span></div>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="houseRenterPage" style="margin: 50px 300px">
                        <ul>
                            <li style="font-size: 10px">共${myHouses.pages}页</li>
                            <li><button class="layui-btn layui-btn-sm" id="houseRenterFirstBtn">首页</button></li>
                            <li><button class="layui-btn layui-btn-sm" id="houseRenterPrevBtn"><i class="layui-icon">&#xe65a;</i></button></li>
                            <li id="houseRenterReplaceFirstLi"></li>
                            <c:if test="${myHouses.pageNum > 1}">
                                <li id="houseRenterFirstLi">${myHouses.pageNum - 1}</li>
                            </c:if>

                            <li style="color: #1E9FFF" id="houseRenterSecondLi">${myHouses.pageNum}</li>
                            <c:if test="${myHouses.pageNum < myHouses.pages}">
                                <li id="houseRenterSecondLi">${myHouses.pageNum + 1}</li>
                            </c:if>
                            <li id="houseRenterReplaceSecondLi"></li>
                            <li><button class="layui-btn layui-btn-sm" id="houseRenterNextBtn"><i class="layui-icon">&#xe65b;</i></button></li>
                            <li><button class="layui-btn layui-btn-sm" id="houseRenterLastBtn">最后一页</button></li>
                            <li style="font-size: 10px">到第 <input type="text" id="houseRenterJumpPage" style="height: 25px;width: 50px"> 页</li>
                            <li><button class="layui-btn layui-btn-sm" id="houseRenterJumpBtn">跳转</button></li>
                        </ul>
                    </div>
                </c:if>
            </div>
            <div class="layui-tab-item" >
                <c:if test="${empty personalList}">
                    <img src="${pageContext.request.contextPath}/img/NoImage/no.png" alt="" style="width: 100%">
                    <div style="position: absolute;width: 1090px;margin-top: -80px;text-align: center;font-size: 1.3em;font-family: 'microsoft yahei';font-weight: 600;">暂无清单呦~</div>
                </c:if>
                <c:if test="${not empty personalList}">
                    <div class="houseList` ">
                        <ul>
                            <c:forEach items="${personalList.list}" var="houses">
                                <li style="padding: 35px 0px;position: relative;border-bottom:1px solid #f1f1f1;height: 280px ">
                                    <a href="${pageContext.request.contextPath}/singleHouse?id=${houses.id}&remove=2&agree=2" style="position: relative;float: left"><img src="${pageContext.request.contextPath}/img/houses/${houses.path}" alt="" style="height: 280px;width: 280px"></a>
                                    <div style="float: right;border: 1px solid #e3d2d2;height: 280px;width: 824px;">
                                        <div style="font-weight: 800;font-size: 30px;font-family: HiraginoSansGB-W6;">${houses.descr}</div>
                                        <div style="margin-top: 20px">
                                            <div style="margin-top: 30px;color: #08bce5;font-size: 20px;font-weight: 800">${houses.village} / ${houses.square}m² / 朝${houses.direction} / ${houses.style}</div>
                                            <div style="margin-top: 30px;color: #08bce5;font-size: 20px;font-weight: 800">${houses.style} / ${houses.storey}层 / ${houses.city} / ${houses.area}</div>
                                            <div style="margin-top: 40px;color: #08bce5;font-size: 20px;font-weight: 800"><fmt:formatDate value='${houses.publishdate}' pattern='yyyy-MM-dd' /></div>
                                            <div style="position: absolute;right: 0;top: 30%;font-weight: 800;font-size: 30px;color: red">${houses.price}<span style="color: red;font-size: 15px;font-weight: normal">元/月</span></div>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="houseListPage" style="margin: 50px 300px">
                        <ul>
                            <li style="font-size: 10px">共${personalList.pages}页</li>
                            <li><button class="layui-btn layui-btn-sm" id="houseListFirstBtn">首页</button></li>
                            <li><button class="layui-btn layui-btn-sm" id="houseListPrevBtn"><i class="layui-icon">&#xe65a;</i></button></li>
                            <li id="houseListReplaceFirstLi"></li>
                            <c:if test="${personalList.pageNum > 1 }">
                                <li id="houseListFirstLi">${personalList.pageNum - 1}</li>
                            </c:if>
                            <li style="color: #1E9FFF" id="houseListSecondLi">${personalList.pageNum}</li>
                            <c:if test="${personalList.pageNum < personalList.pages}">
                                <li id="houseListThirdLi">${personalList.pageNum + 1}</li>
                            </c:if>
                            <li id="houseListReplaceSecondLi"></li>
                            <li><button class="layui-btn layui-btn-sm" id="houseListNextBtn"><i class="layui-icon">&#xe65b;</i></button></li>
                            <li><button class="layui-btn layui-btn-sm" id="houseListLastBtn">最后一页</button></li>
                            <li style="font-size: 10px">到第 <input type="text" id="houseListJumpPageInput" style="height: 25px;width: 50px"> 页</li>
                            <li><button class="layui-btn layui-btn-sm" id="houseListJumpBtn">跳转</button></li>
                        </ul>
                    </div>
                </c:if>
            </div>
            <div class="layui-tab-item">
                <c:if test="${empty history}">
                    <img src="${pageContext.request.contextPath}/img/NoImage/no.png" alt="" style="width: 100%">
                    <div style="position: absolute;width: 1090px;margin-top: -80px;text-align: center;font-size: 1.3em;font-family: 'microsoft yahei';font-weight: 600;">暂无记录呦~</div>
                </c:if>
                <c:if test="${not empty history}">
                    <div id="houseHistory">
                        <ul>
                            <c:forEach items="${history.list}" var="houses">
                                <li style="padding: 35px 0px;position: relative;border-bottom:1px solid #f1f1f1;height: 280px ">
                                    <a href="${pageContext.request.contextPath}/singleHouse?id=${houses.id}&remove=1&agree=2" style="position: relative;float: left"><img src="${pageContext.request.contextPath}/img/houses/${houses.path}" alt="" style="height: 280px;width: 280px"></a>
                                    <div style="float: right;border: 1px solid #e3d2d2;height: 280px;width: 824px;">
                                        <div style="font-weight: 800;font-size: 30px;font-family: HiraginoSansGB-W6;">${houses.descr}</div>
                                        <div style="margin-top: 20px">
                                            <div style="margin-top: 30px;color: #08bce5;font-size: 20px;font-weight: 800">${houses.village} / ${houses.square}m² / 朝${houses.direction} / ${houses.style}</div>
                                            <div style="margin-top: 30px;color: #08bce5;font-size: 20px;font-weight: 800">${houses.style} / ${houses.storey}层 / ${houses.city} / ${houses.area}</div>
                                            <div style="margin-top: 40px;color: #08bce5;font-size: 20px;font-weight: 800"><fmt:formatDate value='${houses.publishdate}' pattern='yyyy-MM-dd' /></div>
                                            <div style="position: absolute;right: 0;top: 30%;font-weight: 800;font-size: 30px;color: red">${houses.price}<span style="color: red;font-size: 15px;font-weight: normal">元/月</span></div>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="houseListPage" style="margin: 50px 300px">
                        <ul>
                            <li style="font-size: 10px">共${history.pages}页</li>
                            <li><button class="layui-btn layui-btn-sm" id="houseHistoryFirstBtn" >首页</button></li>
                            <li><button class="layui-btn layui-btn-sm" id="houseHistoryPrevBtn"><i class="layui-icon">&#xe65a;</i></button></li>
                            <li id="houseHistoryReplaceFirstLi"></li>
                            <c:if test="${history.pageNum > 1 }">
                                <li id="houseHistoryFirstLi">${history.pageNum - 1}</li>
                            </c:if>
                            <li style="color: #1E9FFF" id="houseHistorySecondLi">${history.pageNum}</li>
                            <c:if test="${history.pageNum < history.pages}">
                                <li id="houseHistoryThirdLi">${history.pageNum + 1}</li>
                            </c:if>
                            <li id="houseHistoryReplaceSecondLi"></li>
                            <li><button class="layui-btn layui-btn-sm" id="houseHistoryNextBtn"><i class="layui-icon">&#xe65b;</i></button></li>
                            <li><button class="layui-btn layui-btn-sm" id="houseHistoryLastBtn">最后一页</button></li>
                            <li style="font-size: 10px">到第 <input type="text" id="houseHistoryJumpPageInput" style="height: 25px;width: 50px"> 页</li>
                            <li><button class="layui-btn layui-btn-sm" id="houseHistoryJumpBtn">跳转</button></li>
                        </ul>
                    </div>
                </c:if>
            </div>
            <div class="layui-tab-item ">
                <c:if test="${message == 1}">
                    <img src="${pageContext.request.contextPath}/img/NoImage/no.png" alt="" style="width: 100%">
                    <div style="position: absolute;width: 1090px;margin-top: -80px;text-align: center;font-size: 1.3em;font-family: 'microsoft yahei';font-weight: 600;">暂无消息呦~</div>
                </c:if>
                <c:if test="${message == 2}">
                    <table class="layui-table" lay-data="{width: 1120, height:330, url:'${pageContext.request.contextPath}/findOrders', page:true, id:'idTest'}" lay-filter="demo">
                        <thead>
                        <tr>
                            <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
                            <th lay-data="{field:'id', width:150, sort: true, fixed: true}">账单号</th>
                            <th lay-data="{field:'renterid', width:150}">租客号</th>
                            <th lay-data="{field:'renterEmail', width:200}">租客邮箱</th>
                            <th lay-data="{field:'ownerid', width:150, sort: true}">房东号码</th>
                            <th lay-data="{field:'houseid', width:150}">房子号</th>
                            <th lay-data="{fixed: 'right', width:240, align:'center', toolbar: '#barDemo'}"></th>
                        </tr>
                        </thead>
                    </table>
                </c:if>

            </div>
        </div>
    </div>
</div>

<a href="" id="go"><span style="visibility:hidden">我的</span></a>
<div class=" layui-container" style="border-top: 2px solid #e4e6f0;margin-top: 350px;">
    <footer>
        <p>2021-2999 &copy; 房屋租赁网 懂您的需求 服务于心</p>
    </footer>
</div>
</body>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script>
    var houseOwnerPage = 1,
        houseRenterPage = 1,
        houseListPage = 1,
        houseHistoryPage = 1;
    layui.use(['element', 'carousel', 'layer', 'form','laypage','table'], function () {
        var element = layui.element,
            carousel = layui.carousel,
            $ = layui.jquery,
            layer = layui.layer,
            laypage = layui.laypage,
            form = layui.form;
            table = layui.table;
        table.on('checkbox(demo)', function(obj){
            console.log(obj)
        });
        //监听工具条
        table.on('tool(demo)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                $("#go").attr("href","${pageContext.request.contextPath}/singleHouse?id="+data.houseid+"&remove=3&agree=1&renterid="+data.renterid);
                $("#go")[0].click();

            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){


                    $.get("${pageContext.request.contextPath}/removeOrder","id="+data.id,function (res) {
                        if(res == "ok"){
                            layer.msg('移除成功',{context:'移除成功',offset:'150px'});
                        }else{
                            layer.msg('移除失败',{context:'移除成功',offset:'150px'});
                        }
                    })
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                layer.alert('编辑行：<br>'+ JSON.stringify(data))
            }
        });



        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });


        var pathString = "http://localhost:8080";

        /**
         *
         * @param ulParent
         * @param page
         * @param action
         * @param status
         * @param firstReplaceLi
         * @param firstLi
         * @param SecondLi
         * @param thirdLi
         * @param SecondReplaceLi
         * @param remove
         */
        function pageHelperToMovePage(ulParent,page,action,status,firstReplaceLi,firstLi,SecondLi,thirdLi,SecondReplaceLi,remove,houseStyle){
            $.ajax({
                url:"${pageContext.request.contextPath}/pageHelp",
                type:"get",
                data:"page="+page+"&action="+action+"&status="+status,
                dataType:"json",
                success:function (res) {
                    console.log(res)
                    if (page > res.pages) {
                        layer.msg('已经是最后一页', {context: '已经是最后一页', offset: '150px'})
                        page = res.pages;
                        return;
                    }
                    $(ulParent + ' ul').empty();
                    var thePage = res.list;
                    for (var i = 0; i < thePage.length; i++) {
                        var date = thePage[i].publishdate;
                        var dateString = new Date(date);
                        var s = dateString.toLocaleDateString();

                        $(ulParent + ' ul').append(
                            "<li style='padding: 35px 0px;position: relative;border-bottom:1px solid #f1f1f1;height: 280px'>" +
                            "<a href='" + pathString + "/"+houseStyle+"?id=" + thePage[i].id + "&remove="+remove+"&agree=2 'style='position: relative;float: left'><img src='" + pathString + "/img/houses/" + thePage[i].path + "' alt='' style='height: 280px;width: 280px'></a>" +
                            "<div style='float: right;border: 1px solid #e3d2d2;height: 280px;width: 824px;'>" +
                            "<div style='font-weight: 800;font-size: 30px;font-family: HiraginoSansGB-W6;'>" + thePage[i].descr + "</div>" +
                            "<div style='margin-top: 20px'>" +
                            "<div style='margin-top: 30px;color: #08bce5;font-size: 20px;font-weight: 800'>" + thePage[i].village + " / " + thePage[i].square + "m² / " + thePage[i].direction + " / " + thePage[i].style + "</div>" +
                            "<div style='margin-top: 30px;color: #08bce5;font-size: 20px;font-weight: 800'>" + thePage[i].style + " / " + thePage[i].storey + "层 / " + thePage[i].city + " / " + thePage[i].area + "</div>" +
                            "<div style='margin-top: 40px;color: #08bce5;font-size: 20px;font-weight: 800'>" + s + "</div>" +
                            "<div style='position: absolute;right: 0;top: 30%;font-weight: 800;font-size: 30px;color: red'>" + thePage[i].price + "<span style='color: red;font-size: 15px;font-weight: normal'>元/月</span></div>" +
                            "</div> </div> </li>"
                        );
                    }
                    $('#'+firstLi).empty()
                    $('#'+thirdLi).empty()
                    if(page == 1){
                        $('#'+firstReplaceLi).replaceWith("<li id='"+firstReplaceLi+"'></li>")
                        $('#'+SecondLi).replaceWith("<li id='"+SecondLi+"' style='color: #1E9FFF'>"+1+"</li>")
                        $('#'+SecondReplaceLi).replaceWith("<li id='"+SecondReplaceLi+"'>"+2+"</li>")
                    }else if(page == res.pages){
                        $('#'+firstReplaceLi).replaceWith("<li id='"+firstReplaceLi+"'>"+(page-1)+"</li>")
                        $('#'+SecondLi).replaceWith("<li id='"+SecondLi+"' style='color: #1E9FFF'>"+page+"</li>")
                        $('#'+SecondReplaceLi).replaceWith("<li id='"+SecondReplaceLi+"'></li>")
                    }else {
                        $('#'+firstReplaceLi).replaceWith("<li id='"+firstReplaceLi+"'>"+(page-1)+"</li>")
                        $('#'+SecondLi).replaceWith("<li id='"+SecondLi+"' style='color: #1E9FFF'>"+page+"</li>")
                        $('#'+SecondReplaceLi).replaceWith("<li id='"+SecondReplaceLi+"'>"+(page + 1)+"</li>")
                    }


                }
            })
        }
        //自己第一页
        $('#houseOwnerFirstBtn').click(function () {
            if(houseOwnerPage == 1){
                layer.msg("已经是第一页",{context:'已经是第一页',offset:'150px'})
            }
            else {
                houseOwnerPage = 1;
                pageHelperToMovePage('.houseOwner',houseOwnerPage,'houseOwner',"0",'houseOwnerReplaceFirstLi','houseOwnerFirstLi','houseOwnerSecondLi',
                'houseOwnerThirdLi','houseOwnerReplaceSecondLi',1,'houseSetting');
            }
        })
        //自己下一页
        $('#houseOwnerNextBtn').click(function () {
            houseOwnerPage += 1;
            pageHelperToMovePage('.houseOwner',houseOwnerPage,'houseOwner',"0",'houseOwnerReplaceFirstLi','houseOwnerFirstLi','houseOwnerSecondLi',
                'houseOwnerThirdLi','houseOwnerReplaceSecondLi',1,'houseSetting');
        })
        //自己最后一一页
        $('#houseOwnerLastBtn').click(function () {
            pageHelperToMovePage('.houseOwner',0,'houseOwner',"1",'houseOwnerReplaceFirstLi','houseOwnerFirstLi','houseOwnerSecondLi',
                'houseOwnerThirdLi','houseOwnerReplaceSecondLi',1,'houseSetting');
        })
        //自己上一页
        $('#houseOwnerPrevBtn').click(function () {
            if(houseOwnerPage == 1){
                layer.msg("已经是第一页",{context:'已经是第一页',offset:'150px'})
            }else {
                houseOwnerPage -= 1;
                pageHelperToMovePage('.houseOwner',houseOwnerPage,'houseOwner',"0",'houseOwnerReplaceFirstLi','houseOwnerFirstLi','houseOwnerSecondLi',
                    'houseOwnerThirdLi','houseOwnerReplaceSecondLi',1,'houseSetting');
            }
        })

        //判断是否是整数
        function isInteger(obj) {
            return typeof obj === 'number' && obj%1 === 0
        }
        //自己跳页
        $('#houseOwnerJumpBtn').click(function () {
            var thisPage = $('#jumpPageInput').val();
            var pageNumber = Number(thisPage);
            if(!isInteger(pageNumber)){
                layer.msg('请输入整数',{context:'请输入一个整数',offset:'150px'});
            }else{
                houseOwnerPage = pageNumber;
                pageHelperToMovePage('.houseOwner',houseOwnerPage,'houseOwner',"0",'houseOwnerReplaceFirstLi','houseOwnerFirstLi','houseOwnerSecondLi',
                    'houseOwnerThirdLi','houseOwnerReplaceSecondLi',1,'houseSetting');
            }
        })

        //租房第一页
        $('#houseRenterFirstBtn').click(function () {
            if(houseRenterPage == 1){
                layer.msg("已经是第一页",{context:'已经是第一页',offset:'150px'})
            }
            else {
                houseRenterPage = 1;
                pageHelperToMovePage('.houseRenter',houseRenterPage,'houseRenter',"0",'houseRenterReplaceFirstLi','houseRenterFirstLi','houseRenterSecondLi',
                    'houseRenterThirdLi','houseRenterReplaceSecondLi',1,'singleHouse');
            }
        })
        //租房最后一页
        $('#houseRenterLastBtn').click(function () {
            pageHelperToMovePage('.houseRenter',0,'houseRenter',"0",'houseRenterReplaceFirstLi','houseRenterFirstLi','houseRenterSecondLi',
                'houseRenterThirdLi','houseRenterReplaceSecondLi',1,'singleHouse');
        })
        //租房上一页
        $('#houseRenterPrevBtn').click(function () {
            if(houseRenterPage == 1){
                layer.msg("已经是第一页",{context:'已经是第一页',offset:'150px'})
            }else {
                houseRenterPage -= 1;
                pageHelperToMovePage('.houseRenter',houseRenterPage,'houseRenter',"0",'houseRenterReplaceFirstLi','houseRenterFirstLi','houseRenterSecondLi',
                    'houseRenterThirdLi','houseRenterReplaceSecondLi',1,'singleHouse');
            }
        })
        //租房下一页
        $('#houseRenterNextBtn').click(function () {
            houseRenterPage += 1;
            pageHelperToMovePage('.houseRenter',houseRenterPage,'houseRenter',"0",'houseRenterReplaceFirstLi','houseRenterFirstLi','houseRenterSecondLi',
                'houseRenterThirdLi','houseRenterReplaceSecondLi',1,'singleHouse');
        })
        //租房跳页
        $('#houseRenterJumpBtn').click(function () {
            var thisPage = $('#houseRenterJumpPage').val();
            var pageNumber = Number(thisPage);
            if(!isInteger(pageNumber)){
                layer.msg('请输入整数',{context:'请输入一个整数',offset:'150px'});
            }else{
                houseRenterPage = pageNumber;
                pageHelperToMovePage('.houseRenter',houseRenterPage,'houseRenter',"0",'houseRenterReplaceFirstLi','houseRenterFirstLi','houseRenterSecondLi',
                    'houseRenterThirdLi','houseRenterReplaceSecondLi',1,'singleHouse');
            }
        })
        //清单第一页
        $('#houseListFirstBtn').click(function () {
            if(houseListPage == 1){
                layer.msg("已经是第一页",{context:'已经是第一页',offset:'150px'})
            }
            else {
                houseListPage = 1;
                pageHelperToMovePage('.houseList',houseListPage,'houseList',"0",'houseListReplaceFirstLi','houseListFirstLi','houseListSecondLi',
                    'houseListThirdLi','houseListReplaceSecondLi',2,'singleHouse');
            }
        })
        //清单最后一页
        $('#houseListLastBtn').click(function () {
            pageHelperToMovePage('.houseList',0,'houseList',"1",'houseListReplaceFirstLi','houseListFirstLi','houseListSecondLi',
                'houseListThirdLi','houseListReplaceSecondLi',2,'singleHouse');
        })
        //清单前一夜
        $('#houseListPrevBtn').click(function () {
            if(houseListPage == 1){
                layer.msg("已经是第一页",{context:'已经是第一页',offset:'150px'})
            }else {
                houseListPage -= 1;
                pageHelperToMovePage('.houseList',houseListPage,'houseList',"0",'houseListReplaceFirstLi','houseListFirstLi','houseListSecondLi',
                    'houseListThirdLi','houseListReplaceSecondLi',2,'singleHouse');
            }
        })
        //清单下一页
        $('#houseListNextBtn').click(function () {
            houseListPage += 1;
            pageHelperToMovePage('.houseList',houseListPage,'houseList',"0",'houseListReplaceFirstLi','houseListFirstLi','houseListSecondLi',
                'houseListThirdLi','houseListReplaceSecondLi',2,'singleHouse');
        })
        //清单跳页
        $('#houseListJumpBtn').click(function () {
            var thisPage = $('#houseListJumpPageInput').val();
            var pageNumber = Number(thisPage);
            if(!isInteger(pageNumber)){
                layer.msg('请输入整数',{context:'请输入一个整数',offset:'150px'});
            }else{
                houseListPage = pageNumber;
                pageHelperToMovePage('.houseRenter',houseListPage,'houseRenter',"0",'houseRenterReplaceFirstLi','houseRenterFirstLi','houseRenterSecondLi',
                    'houseRenterThirdLi','houseRenterReplaceSecondLi',2,'singleHouse');
            }
        })

        //历史记录第一页
        $('#houseHistoryFirstBtn').click(function () {
            if(houseHistoryPage == 1){
                layer.msg("已经是第一页",{context:'已经是第一页',offset:'150px'})
            }
            else {
                houseHistoryPage = 1;
                pageHelperToMovePage('.houseHistory',houseHistoryPage,'houseHistory',"0",'houseHistoryReplaceFirstLi','houseHistoryFirstLi','houseHistorySecondLi',
                    'houseHistoryThirdLi','houseHistoryReplaceSecondLi',1,'singleHouse');
            }
        })
        //历史记录最后一页
        $('#houseHistoryLastBtn').click(function () {
            pageHelperToMovePage('.houseHistory',0,'houseHistory',"1",'houseHistoryReplaceFirstLi','houseHistoryFirstLi','houseHistorySecondLi',
                'houseHistoryThirdLi','houseHistoryReplaceSecondLi',1,'singleHouse');
        })
        //历史记录前一页
        $('#houseHistoryPrevBtn').click(function () {
            if(houseHistoryPage == 1){
                layer.msg("已经是第一页",{context:'已经是第一页',offset:'150px'})
            }else {
                houseHistoryPage -= 1;
                pageHelperToMovePage('.houseHistory',houseHistoryPage,'houseHistory',"0",'houseHistoryReplaceFirstLi','houseHistoryFirstLi','houseHistorySecondLi',
                    'houseHistoryThirdLi','houseHistoryReplaceSecondLi',1,'singleHouse');
            }
        })
        //历史记录后一页
        $('#houseHistoryNextBtn').click(function () {
            houseHistoryPage += 1;
            pageHelperToMovePage('.houseHistory',houseHistoryPage,'houseHistory',"0",'houseHistoryReplaceFirstLi','houseHistoryFirstLi','houseHistorySecondLi',
                'houseHistoryThirdLi','houseHistoryReplaceSecondLi',1,'singleHouse');
        })
        //历史记录跳页
        $('#houseHistoryJumpBtn').click(function () {
            var thisPage = $('#houseHistoryJumpPageInput').val();
            var pageNumber = Number(thisPage);
            if(!isInteger(pageNumber)){
                layer.msg('请输入整数',{context:'请输入一个整数',offset:'150px'});
            }else{
                houseHistoryPage = pageNumber;
                pageHelperToMovePage('.houseHistory',houseHistoryPage,'houseHistory',"0",'houseHistoryReplaceFirstLi','houseHistoryFirstLi','houseHistorySecondLi',
                    'houseHistoryThirdLi','houseHistoryReplaceSecondLi',1,'singleHouse');
            }
        })

    })
</script>

</html>
