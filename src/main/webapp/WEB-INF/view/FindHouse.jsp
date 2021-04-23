<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"/>
    <title>寻找房源</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/details.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
<body>
<%--导航栏--%>
<div class="layui-fluid" style="background: #2F4056;height: 80px">
    <div style="float: left">
        <img class="find" src="${pageContext.request.contextPath}/img/logo.png" alt="蜗壳" style="height: 50px;width: 100px;margin-left: 100px;margin: 10px">
    </div>
    <div class="add" style="float: left;margin-left: 20px">
        <button  class=" layui-btn layui-btn-radius " id="address" style="margin-top: 18px;font-size: 18px;background: none;border: 1px solid white" >
            <i class="layui-icon layui-icon-website" style="font-size: 20px" id="citySelect">
            </i>衢州
        </button>
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
        <c:if test="${not empty loginUser}">
            <ul class="layui-nav " style="background: none">
                <li class="layui-nav-item">
                    <button class="" style="background: none;border: none"><img src="${pageContext.request.contextPath}/img/normal.jpg" class="layui-nav-img"></button>
                    <dl class="layui-nav-child">
                        <dd><button class="layui-btn layui-btn-xs"><a href="${pageContext.request.contextPath}/personalCenter" style="padding:  0px;color: white">个人中心</a></button></dd>
                        <dd><button class="layui-btn layui-btn-xs layui-btn-danger"><a href="${pageContext.request.contextPath}/exit" style="padding:  0px;color: white">退&#12288&#12288出</a></button></dd>
                    </dl>
                </li>
            </ul>
        </c:if>
        <c:if test="${empty loginUser}">
            <button class="operation layui-btn layui-btn-primary layui-btn-radius" >
                <i class="layui-icon layui-icon-friends" style="font-size: 20px"></i> 登录/注册
            </button>
        </c:if>
    </div>
</div>
<%--房源选项--%>
<div class="layui-container" style="background: #fbfbfb;margin-top:20px;">
    <form action="${pageContext.request.contextPath}/housesConditions/1" class="layui-form" id="lookForHouseForm">
        <p style="font-weight: 600" >区域 <span style="color: #1E9FFF">地区</span></p>
        <hr style="border: 1px grey">
        <ul class="area">
            <li>常山县</li>
            <li>衢江区</li>
            <li>柯城区</li>
            <li>江山市</li>
            <li>开化县</li>
            <li>龙游县</li>
        </ul>
        <hr style="border: 1px grey">
        <div class="layui-form">
            <div class="layui-form-item">

                <div class=" ">
                    <table class="layui-table TabStyle" lay-skin="line" style="background: none;border: none">
                        <colgroup>
                            <col width="100">
                            <col width="115">
                            <col width="120">
                            <col width="120">
                            <col width="120">
                            <col width="120">
                            <col width="110">
                            <col width="350">
                        </colgroup>
                        <tbody>
                        <tr>
                            <td style="font-weight: 600;color: #1E9FFF">价格(元/月)</td>
                            <td><input type="radio" name="price" value="500" title="500-1000"></td>
                            <td><input type="radio" name="price" value="1000" title="1000-2000"></td>
                            <td><input type="radio" name="price" value="2000" title="2000-4000"></td>
                            <td><input type="radio" name="price" value="4000" title="4000-8000"></td>
                            <td><input type="radio" name="price" value="8000" title="8000以上"></td>
                            <td><input type="radio" name="price" value="f" title="自定义"></td>
                            <td>
                                <div class="layui-inline">
                                    <label class="layui-form-label">范围</label>
                                    <div class="layui-input-inline" style="width: 80px;">
                                        <input type="text" name="price_min" placeholder="￥" autocomplete="off" class="layui-input">
                                    </div>
                                    <div class="layui-form-mid">-</div>
                                    <div class="layui-input-inline" style="width: 80px;">
                                        <input type="text" name="price_max" placeholder="￥" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td style="font-weight: 600;color: #1E9FFF">建筑面积(m²)</td>
                            <td><input type="radio" name="area" value="0" title="50以下"></td>
                            <td><input type="radio" name="area" value="50" title="50-70"></td>
                            <td><input type="radio" name="area" value="70" title="70-90"></td>
                            <td><input type="radio" name="area" value="90" title="90-110"></td>
                            <td><input type="radio" name="area" value="110" title="110以上"></td>
                            <td><input type="radio" name="area" value="f" title="自定义"></td>
                            <td>
                                <div class="layui-inline">
                                    <label class="layui-form-label">范围</label>
                                    <div class="layui-input-inline" style="width: 80px;">
                                        <input type="text" name="area_min" placeholder="m²" autocomplete="off" class="layui-input">
                                    </div>
                                    <div class="layui-form-mid">-</div>
                                    <div class="layui-input-inline" style="width: 80px;">
                                        <input type="text" name="area_max" placeholder="m²" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td style="font-weight: 600;color: #1E9FFF">房型</td>
                            <td><input type="radio" name="houseStyle" value="一室" title="一室"></td>
                            <td><input type="radio" name="houseStyle" value="二室" title="两室"></td>
                            <td><input type="radio" name="houseStyle" value="三室" title="三室"></td>
                            <td><input type="radio" name="houseStyle" value="四室" title="四室"></td>
                            <td><input type="radio" name="houseStyle" value="五室" title="五室"></td>
                            <td><input type="radio" name="houseStyle" value="五室以上" title="五室以上"></td>
                            <td><input type="submit" class="layui-btn layui-btn-sm" id="looKForHouses" style="margin: 0 150px;color: white" value="搜索"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </form>

</div>

<%--城市选择--%>
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
<%--登录注册--%>
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
                                <input type="text" name="userName" required lay-verify="required" placeholder="请输入用户名"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <br>
                        <div class="layui-form-item">
                            <label class="layui-form-label">密码</label>
                            <div class="layui-input-block">
                                <input type="password" name="userPassword" required lay-verify="required"
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
                    <form class="layui-form layui-form-pane form">
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
                                <input type="text" name="userPassword" required lay-verify="required"
                                       placeholder="请输入密码"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                        <label class="layui-form-label">邮箱</label>
                        <div class="layui-input-block">
                            <input type="text" name="userPhoneNumber" required lay-verify="email"
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
                                <input type="text" name="userNickName" required lay-verify="required"
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


<div class="layui-container">
    <div class="layui-tab layui-tab-brief">
        <ul class="layui-tab-title">
            <li class="layui-this">默认排序</li>
            <li>最新发布</li>
            <li>价格升序</li>
            <li>价格降序</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <%--默认排序的展示--%>
                    <div class="defaultOrder">
                        <ul>
                            <c:forEach items="${defaultOrder.list}" var="houses">
                                    <li style="padding: 35px 0px;position: relative;border-bottom:1px solid #f1f1f1;height: 280px ">
                                        <a href="${pageContext.request.contextPath}/singleHouse?id=${houses.id}&remove=1&agree=2" style="position: relative;float: left"><img src="${pageContext.request.contextPath}/img/houses/${houses.path}" alt="" style="height: 280px;width: 280px"></a>
                                        <div style="float: right;border: 1px solid #e3d2d2;height: 280px;width: 824px;">
                                            <div style="font-weight: 800;font-size: 30px;font-family: HiraginoSansGB-W6;">${houses.descr}</div>
                                            <div style="margin-top: 20px">
                                                <div style="margin-top: 30px;color: #08bce5;font-size: 20px;font-weight: 800">${houses.village} / ${houses.square}m² / ${houses.direction} / ${houses.style}</div>
                                                <div style="margin-top: 30px;color: #08bce5;font-size: 20px;font-weight: 800">${houses.style} / ${houses.storey}层 / ${houses.city} / ${houses.area}</div>
                                                <div style="margin-top: 40px;color: #08bce5;font-size: 20px;font-weight: 800"><fmt:formatDate value='${houses.publishdate}' pattern='yyyy-MM-dd' /></div>
                                                <div style="position: absolute;right: 0;top: 30%;font-weight: 800;font-size: 30px;color: red">${houses.price}<span style="color: red;font-size: 15px;font-weight: normal">元/月</span></div>
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                        </ul>
                    </div>
                <%--默认排序分页--%>
                    <div class="defaultOperatePage" style="margin: 50px 300px">
                        <ul>
                            <li style="font-size: 10px" class`="firstLi">共${defaultOrder.pages}页</li>
                            <li><button class="layui-btn layui-btn-sm" id="defaultFirstPage">首页</button></li>
                            <li><button class="layui-btn layui-btn-sm" id="defaultPrevPage"><i class="layui-icon layui-icon-prev"></i></button></li>
                            <c:if test="${defaultOrder.pageNum > 1}">
                                <li id="defaultSecondLi">${defaultOrder.pageNum - 1}</li>
                            </c:if>
                            <li style="color: #1E9FFF" id="defaultThirdLi">${defaultOrder.pageNum}</li>
                            <c:if test="${defaultOrder.pageNum < defaultOrder.pages }">
                                <li id="defaultForthLi">${defaultOrder.pageNum + 1}</li>
                            </c:if>
                            <li><button class="layui-btn layui-btn-sm" id="defaultNextPage"><i class="layui-icon layui-icon-next"></i></button></li>
                            <li><button class="layui-btn layui-btn-sm" id="defaultLastPage">最后一页</button></li>
                            <li style="font-size: 10px">到第 <input type="text" id="defaultJumpPageNum" style="height: 25px;width: 50px"> 页</li>
                            <li><button class="layui-btn layui-btn-sm" id="defaultJumpPage">跳转</button></li>
                        </ul>
                    </div>

            </div>
            <div class="layui-tab-item">
                <%--最新发布展示--%>
                <div class="dateAscOrder">
                    <ul>
                        <c:forEach items="${dateAsc.list}" var="houses">
                            <li style="padding: 35px 0px;position: relative;border-bottom:1px solid #f1f1f1;height: 280px ">
                                <a href="${pageContext.request.contextPath}/singleHouse?id=${houses.id}&remove=1&agree=2" style="position: relative;float: left"><img src="${pageContext.request.contextPath}/img/houses/${houses.path}" alt="" style="height: 280px;width: 280px"></a>
                                <div style="float: right;border: 1px solid #e3d2d2;height: 280px;width: 824px;">
                                    <div style="font-weight: 800;font-size: 30px;font-family: HiraginoSansGB-W6;">${houses.descr}</div>
                                    <div style="margin-top: 20px">
                                        <div style="margin-top: 30px;color: #08bce5;font-size: 20px;font-weight: 800">${houses.village} / ${houses.square}m² / ${houses.direction} / ${houses.style}</div>
                                        <div style="margin-top: 30px;color: #08bce5;font-size: 20px;font-weight: 800">${houses.style} / ${houses.storey}层 / ${houses.city} / ${houses.area}</div>
                                        <div style="margin-top: 40px;color: #08bce5;font-size: 20px;font-weight: 800"><fmt:formatDate value='${houses.publishdate}' pattern='yyyy-MM-dd' /></div>
                                        <div style="position: absolute;right: 0;top: 30%;font-weight: 800;font-size: 30px;color: red">${houses.price}<span style="color: red;font-size: 15px;font-weight: normal">元/月</span></div>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                    <%--最新发布的分页--%>
                <div class="dateAscOperatePage" style="margin: 50px 300px">
                    <ul>
                        <li style="font-size: 10px" class="firstLi">共${dateAsc.pages}页</li>
                        <li><button class="layui-btn layui-btn-sm" id="latestAscFirstPage">首页</button></li>
                        <li><button class="layui-btn layui-btn-sm" id="latestAscPrevPage"><i class="layui-icon">&#xe65a;</i></button></li>
                        <c:if test="${dateAsc.pageNum > 1}">
                            <li>${dateAsc.pageNum - 1}</li>
                        </c:if>
                        <li style="color: #1E9FFF">${dateAsc.pageNum}</li>
                        <c:if test="${dateAsc.pageNum < dateAsc.pages}">
                            <li>${dateAsc.pageNum + 1}</li>
                        </c:if>
                        <li><button class="layui-btn layui-btn-sm" id="latestAscNextPage"><i class="layui-icon">&#xe65b;</i></button></li>
                        <li><button class="layui-btn layui-btn-sm" id="latestAscLastPage">最后一页</button></li>
                        <li style="font-size: 10px">到第 <input type="text" id="latestAscJumpPageNum" style="height: 25px;width: 50px"> 页</li>
                        <li><button class="layui-btn layui-btn-sm" id="latestAscJumpPage">跳转</button></li>
                    </ul>
                </div>
            </div>
            <div class="layui-tab-item">
                <%--价格降序排序--%>
                <div class="priceAscOrder">
                    <ul>
                        <c:forEach items="${priceAsc.list}" var="houses">
                            <li style="padding: 35px 0px;position: relative;border-bottom:1px solid #f1f1f1;height: 280px ">
                                <a href="${pageContext.request.contextPath}/singleHouse?id=${houses.id}&remove=1&agree=2" style="position: relative;float: left"><img src="${pageContext.request.contextPath}/img/houses/${houses.path}" alt="" style="height: 280px;width: 280px"></a>
                                <div style="float: right;border: 1px solid #e3d2d2;height: 280px;width: 824px;">
                                    <div style="font-weight: 800;font-size: 30px;font-family: HiraginoSansGB-W6;">${houses.descr}</div>
                                    <div style="margin-top: 20px">
                                        <div style="margin-top: 30px;color: #08bce5;font-size: 20px;font-weight: 800">${houses.village} / ${houses.square}m² / ${houses.direction} / ${houses.style}</div>
                                        <div style="margin-top: 30px;color: #08bce5;font-size: 20px;font-weight: 800">${houses.style} / ${houses.storey}层 / ${houses.city} / ${houses.area}</div>
                                        <div style="margin-top: 40px;color: #08bce5;font-size: 20px;font-weight: 800"><fmt:formatDate value='${houses.publishdate}' pattern='yyyy-MM-dd' /></div>
                                        <div style="position: absolute;right: 0;top: 30%;font-weight: 800;font-size: 30px;color: red">${houses.price}<span style="color: red;font-size: 15px;font-weight: normal">元/月</span></div>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                    <%--价格降序的分页--%>
                <div class="priceAscOperatePage" style="margin: 50px 300px">
                    <ul>
                        <li style="font-size: 10px" class="firstLi">共${priceAscNum.pages}页</li>
                        <li><button class="layui-btn layui-btn-sm" id="priceAscFirstPage">首页</button></li>
                        <li><button class="layui-btn layui-btn-sm" id="priceAscPrevPage"><i class="layui-icon">&#xe65a;</i></button></li>
                        <c:if test="${priceAsc.pageNum > 1}">
                            <li>${priceAsc.pageNum - 1}</li>
                        </c:if>
                        <li style="color: #1E9FFF">${priceAsc.pageNum}</li>
                        <c:if test="${priceAsc.pageNum < priceAsc.pages}">
                            <li>${priceAsc.pageNum + 1}</li>
                        </c:if>
                        <li><button class="layui-btn layui-btn-sm"><i class="layui-icon" id="priceAscNextPage">&#xe65b;</i></button></li>
                        <li><button class="layui-btn layui-btn-sm" id="priceAscLastPage">最后一页</button></li>
                        <li style="font-size: 10px">到第 <input type="text" id="priceAscJumpPageNum" style="height: 25px;width: 50px"> 页</li>
                        <li><button class="layui-btn layui-btn-sm" id="priceAscJumpPage">跳转</button></li>
                    </ul>
                </div>
            </div>
            <div class="layui-tab-item">
                <%--讲个升序的展示--%>
                <div class="priceDescOrder">
                    <ul>
                        <c:forEach items="${priceDesc.list}" var="houses">
                            <li style="padding: 35px 0px;position: relative;border-bottom:1px solid #f1f1f1;height: 280px ">
                                <a href="${pageContext.request.contextPath}/singleHouse?id=${houses.id}&remove=1&agree=2" style="position: relative;float: left"><img src="${pageContext.request.contextPath}/img/houses/${houses.path}" alt="" style="height: 280px;width: 280px"></a>
                                <div style="float: right;border: 1px solid #e3d2d2;height: 280px;width: 824px;">
                                    <div style="font-weight: 800;font-size: 30px;font-family: HiraginoSansGB-W6;">${houses.descr}</div>
                                    <div style="margin-top: 20px">
                                        <div style="margin-top: 30px;color: #08bce5;font-size: 20px;font-weight: 800">${houses.village} / ${houses.square}m² / ${houses.direction} / ${houses.style}</div>
                                        <div style="margin-top: 30px;color: #08bce5;font-size: 20px;font-weight: 800">${houses.style} / ${houses.storey}层 / ${houses.city} / ${houses.area}</div>
                                        <div style="margin-top: 40px;color: #08bce5;font-size: 20px;font-weight: 800"><fmt:formatDate value='${houses.publishdate}' pattern='yyyy-MM-dd' /></div>
                                        <div style="position: absolute;right: 0;top: 30%;font-weight: 800;font-size: 30px;color: red">${houses.price}<span style="color: red;font-size: 15px;font-weight: normal">元/月</span></div>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                    <%--价格升序的分页--%>
                <div class="priceDescOperatePage" style="margin: 50px 300px">
                    <ul>
                        <li style="font-size: 10px" class="firstLi">共${priceDesc.pages}页</li>
                        <li><button class="layui-btn layui-btn-sm" id="priceDescFirstPage">首页</button></li>
                        <li><button class="layui-btn layui-btn-sm" id="priceDescPrevPage"><i class="layui-icon">&#xe65a;</i></button></li>
                        <c:if test="${priceDesc.pageNum > 1}">
                            <li>${priceDesc.pageNum - 1}</li>
                        </c:if>
                        <li style="color: #1E9FFF">${priceDesc.pageNum}</li>
                        <c:if test="${priceDesc.pageNum < priceDesc.pages}">
                            <li>${priceDesc.pageNum + 1}</li>
                        </c:if>
                        <li><button class="layui-btn layui-btn-sm" id="priceDescNextPage"><i class="layui-icon">&#xe65b;</i></button></li>
                        <li><button class="layui-btn layui-btn-sm" id="priceDescLastPage">最后一页</button></li>
                        <li style="font-size: 10px">到第 <input type="text" id="priceDescJumpPageNum" style="height: 25px;width: 50px"> 页</li>
                        <li><button class="layui-btn layui-btn-sm" id="priceDescJumpPage">跳转</button></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>



<div class="footerDes layui-container">
    <footer>
        <p>2021-2999 &copy; 房屋租赁网 懂您的需求 服务于心</p>
    </footer>
</div>


</body>
<script>
    var pageNum = 1;
    var priceAscPageNum = 1;
    var priceDescPageNum = 1;
    var dateAscPageNum = 1;

    layui.use(['element', 'carousel', 'layer', 'form','laypage'], function () {
        var element = layui.element,
            carousel = layui.carousel,
            $ = layui.jquery,
            layer = layui.layer,
            form = layui.form;
        var layer_index;
        var layer_address;

        $('.operatePage ul li button').click(function () {
            console.log(this.innerText)
        })
        $('#address').click(function () {
            layer_address = layer.open({
                type: 1,
                content: $('#address_select'),
                area: ['600px','400px'],
                title: "城市业务",
                offset:'150px'
            });
        });
        $('.operation').click(function () {
            layer_index = layer.open({
                type: 1,
                content: $('#sign'),
                area: ['400px', '510px'],
                title: "房屋租赁网",
                closeBtn: 2,
                offset:'150px'
            });
        });
        var cities = new Array(13);
        cities[0] = new Array("密云","延庆","朝阳","丰台","石景山"); /*北京*/
        cities[1] = new Array("青羊区","锦江区","金牛区","武侯","成华"); /*成都*/
        cities[2] = new Array("万州","黔江","涪陵","渝中","大渡口");/*重庆*/
        cities[3] = new Array("中山","西岗","沙河口","甘井子","旅顺口");/*大连*/
        cities[4] = new Array("越秀","海珠","荔湾","天河","白云");/*广州*/
        cities[5] = new Array("西湖","滨江","余杭","富阳","江干");/*杭州*/
        cities[6] = new Array("鼓楼","玄武","建邺","秦淮","西霞");/*南京*/
        cities[7] = new Array("黄浦","徐汇","长宁","静安","普陀");/*上海*/
        cities[8] = new Array("龙岗","盐田","宝安","光明","南山");/*深圳*/
        cities[9] = new Array("姑苏","虎丘","吴中","相城","吴江");/*苏州*/
        cities[10] = new Array("和平","河西","河北","河东","南开");/*天津*/
        cities[11] = new Array("江岸","江汉","硚口","汉阳","武昌");/*武汉*/
        cities[12] = new Array("新城","碑林","莲湖","雁塔","灞桥");/*西安*/
        cities[13] = new Array("中原","回族管城","惠济","金水","上街");/*郑州*/
        $('.add_body ul li button').click(function () {
            var sel = this.innerText;
            $('#address')[0].innerHTML ="<i class='layui-icon layui-icon-website' style='font-size: 20px;margin-top: 38px'> </i>" + sel;
            layer.close(layer_address);
            var city = this.innerText;
            function funToDisArea(res) {
                $(".area").empty();
                for(var i =0;i<res.length;i++){
                    var liMark = document.createElement("li");
                    $(liMark).append(res[i]);
                    $(liMark).appendTo($(".area"));
                }
            }
            switch (city) {
                case "北京": funToDisArea(cities[0]);
                            break;
                case "成都": funToDisArea(cities[1]);
                            break;
                case "重庆": funToDisArea(cities[2]);
                            break;
                case "大连": funToDisArea(cities[3]);
                            break;
                case "广州": funToDisArea(cities[4]);
                            break;
                case "杭州": funToDisArea(cities[5]);
                            break;
                case "南京": funToDisArea(cities[6]);
                            break;
                case "上海": funToDisArea(cities[7]);
                            break;
                case "深圳": funToDisArea(cities[8]);
                            break;
                case "苏州": funToDisArea(cities[9]);
                            break;
                case "天津": funToDisArea(cities[10]);
                            break;
                case "武汉": funToDisArea(cities[11]);
                            break;
                case "西安": funToDisArea(cities[12]);
                            break;
                case "郑州": funToDisArea(cities[13]);
                            break;

            }

        });
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
                data:$("#codeForm").serialize(),
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
        $('.ShowHouses li').click(function () {
            $('.ShowHouses li').css('background','none');
            this.setAttribute('style','background:#1E9FFF');
        })
        form.on("submit(login)", function () {
            $.post("${pageContext.request.contextPath}/login", $('#login').serialize(), function (res) {
                if (res === "OK") {
                    window.location.href = "index.jsp";
                } else {
                    layer.msg("用户名或者密码错误");
                }
            });
            return false;
        });
        form.on("submit(register)",function () {
            $.post("${pageContext.request.contextPath}/register", $('.form').serialize(), function (res) {
                if (res === 'OK') {
                    layer.close(layer_index);
                    layer.alert("注册成功", {icon: 1, time: 2000});
                    $('.form')[0].reset();
                } else {
                    layer.msg("注册失败,用户名以存在");
                }
            })
        });
        var pathString = "http://localhost:8080";
        $('#defaultFirstPage').click(function () {

        })
        //判断是否是整数
        function isInteger(obj) {
            return typeof obj === 'number' && obj%1 === 0
        }
        //分页的函数
        /**
         *
         * @param ulParent 每一个房子(li标签)的父元素ul标签
         * @param page 第几页
         * @param pageUlParent 页按钮的ul标签
         * @param action 行为：表示是哪一种排序的返回值
         * @param firstPage 第一页按钮的id值
         * @param lastPage 最后一页按钮的id值
         * @param jumpPage 跳页的按钮id值
         * @param prevPage 前一页按钮的id值
         * @param nextPage 下一页按钮的id值
         * @param jumpPageNum 跳页text标签的id值
         * @param status 标识位,判断是否是查询最后一页
         */
        function pageHelperToMovePage(ulParent,page,pageUlParent,action,firstPage,lastPage,jumpPage,prevPage,nextPage,jumpPageNum,status){
            $.ajax({
                url:"${pageContext.request.contextPath}/nextPage",
                type:"get",
                data:$('#lookForHouseForm').serialize()+"&page="+page+"&action="+action+"&status="+status,
                dataType:"json",
                success:function (res) {
                    if(page <= 0){
                        page = 1;
                    }

                    if(page > res.pages){
                        layer.msg('已经是最后一页',{context:'已经是最后一页',offset:'150px'})
                        page = res.pages;
                    }
                        pageNum = res.pageNum;
                        $(ulParent+' ul').empty();
                        var thePage = res.list;
                        for(var i=0;i<thePage.length;i++){
                            var date = thePage[i].publishdate;
                            var dateString = new Date(date);
                            var s = dateString.toLocaleDateString();

                            $(ulParent+' ul').append(
                                "<li style='padding: 35px 0px;position: relative;border-bottom:1px solid #f1f1f1;height: 280px'>"+
                                "<a href='"+pathString+"/singleHouse?id="+thePage[i].id +"&remove=1&agree=2 'style='position: relative;float: left'><img src='"+pathString+"/img/houses/"+thePage[i].path+"' alt='' style='height: 280px;width: 280px'></a>"+
                                "<div style='float: right;border: 1px solid #e3d2d2;height: 280px;width: 824px;'>"+
                                "<div style='font-weight: 800;font-size: 30px;font-family: HiraginoSansGB-W6;'>"+thePage[i].descr+"</div>"+
                                "<div style='margin-top: 20px'>"+
                                "<div style='margin-top: 30px;color: #08bce5;font-size: 20px;font-weight: 800'>"+thePage[i].village+" / "+thePage[i].square+"m² / "+thePage[i].direction+" / "+thePage[i].style+"</div>"+
                                "<div style='margin-top: 30px;color: #08bce5;font-size: 20px;font-weight: 800'>"+thePage[i].style+" / "+thePage[i].storey+"层 / "+thePage[i].city+" / "+thePage[i].area+"</div>"+
                                "<div style='margin-top: 40px;color: #08bce5;font-size: 20px;font-weight: 800'>"+s+"</div>"+
                                "<div style='position: absolute;right: 0;top: 30%;font-weight: 800;font-size: 30px;color: red'>"+thePage[i].price+"<span style='color: red;font-size: 15px;font-weight: normal'>元/月</span></div>"+
                                "</div> </div> </li>"
                            );
                        }
                        $(pageUlParent+' ul').empty();
                        var strNext = "<li>"+(res.pageNum+1)+"</li>";
                        var strPrev = "<li>"+(res.pageNum-1)+"</li>";
                        if(page == 1){
                            strPrev = "";
                        }
                        if(page == res.pages){
                            strNext = "";
                        }
                        $(pageUlParent+' ul').append(
                            "<li style='font-size: 10px' class='firstLi'>共"+res.pages+"页</li>"+
                            "<li><button class='layui-btn layui-btn-sm' id='"+firstPage+"'>首页</button></li>"+
                            "<li><button class='layui-btn layui-btn-sm' id='"+prevPage+"'><i class='layui-icon layui-icon-prev'></i></button></li>"+
                            strPrev +
                            "<li style='color: #1E9FFF'>"+res.pageNum+"</li>"+
                             strNext +
                            "<li><button class='layui-btn layui-btn-sm' id='"+nextPage+"'><i class='layui-icon layui-icon-next'></i></button></li>"+
                            "<li><button class='layui-btn layui-btn-sm' id='"+lastPage+"'>最后一页</button></li>"+
                            "<li style='font-size: 10px'>到第 <input type='text' id='"+jumpPageNum+"' style='height: 25px;width: 50px'> 页</li>"+
                            "<li><button class='layui-btn layui-btn-sm' id='"+jumpPage+"'>跳转</button></li>"
                        )
                        //解除原来的点击事件,防止干扰
                        $('#'+nextPage).unbind('click');
                        $('#'+prevPage).unbind('click');
                        $('#'+firstPage).unbind('click');
                        $('#'+lastPage).unbind('click');
                        $('#'+jumpPage).unbind('click');
                        //重新绑定下一页的点击事件
                        $('#'+nextPage).on('click',function () {
                            page += 1;
                            pageHelperToMovePage(ulParent,page,pageUlParent,action,firstPage,lastPage,jumpPage,prevPage,nextPage,jumpPageNum,status);
                        });
                        //重新绑定前一页的点击事件
                        $('#'+prevPage).on('click',function () {
                            page -= 1;
                            if(page <= 0 ){
                                page = 1;
                                layer.msg('已经是最前一页',{context:'已经是最前一页',offset:'150px'});
                            }else {
                                pageHelperToMovePage(ulParent,page,pageUlParent,action,firstPage,lastPage,jumpPage,prevPage,nextPage,jumpPageNum,status);

                            }
                        })
                        //重新绑定第一页的点击事件
                        $('#'+firstPage).click(function () {
                            if(page == 1){
                                layer.msg('已经是第一页',{context:'已经是第一页',offset:'150px'})
                            }
                            else {
                                page = 1;
                                pageHelperToMovePage(ulParent,page,pageUlParent,action,firstPage,lastPage,jumpPage,prevPage,nextPage,jumpPageNum,status);
                            }
                        })
                        //重新绑定最后一页的绑定事件
                        $('#'+lastPage).click(function () {
                            if(page == res.pages){
                                layer.msg('已经是最后一页',{context:'已经是最后一页',offset:'150px'});
                            }else {
                                page = res.pages;
                                pageHelperToMovePage(ulParent,page,pageUlParent,action,firstPage,lastPage,jumpPage,prevPage,nextPage,jumpPageNum,status);

                            }
                        })
                        //重新绑定跳页的点击事件
                        $('#'+jumpPage).click(function () {
                            var pageText = $('#'+jumpPageNum).val();
                            if(!isInteger(Number(pageText))){
                                layer.msg('请输入一个整数',{context:'请输入一个整数',offset:'150px'});
                            }else {
                                var pageNumber = Number(pageText);
                                pageHelperToMovePage(ulParent,pageNumber,pageUlParent,action,firstPage,lastPage,jumpPage,prevPage,nextPage,jumpPageNum,status);

                            }

                        })

                }
            })
        }
        //第一页的函数
        function firstPage(controller,ulParent,page,pageUlParent,action,firstPage,lastPage,jumpPage,prevPage,nextPage,jumpPageNum,status){
            $(controller).click(function () {
                if(page == 1){
                    layer.msg('已经是第一页',{context:'已经是第一页',offset:'150px'})
                }else {
                    page = 1;
                    pageHelperToMovePage(ulParent,page,pageUlParent,action,firstPage,lastPage,jumpPage,prevPage,nextPage,jumpPageNum,status);

                }
            })
        }
        //最后一页的函数
        function lastPage(controller,ulParent,page,pageUlParent,action,firstPage,lastPage,jumpPage,prevPage,nextPage,jumpPageNum,status){
            $(controller).click(function () {
                pageHelperToMovePage(ulParent,page,pageUlParent,action,firstPage,lastPage,jumpPage,prevPage,nextPage,jumpPageNum,status);

            })
        }
        //下一页的函数
        function nextPage(controller,ulParent,page,pageUlParent,action,firstPage,lastPage,jumpPage,prevPage,nextPage,jumpPageNum,status){
            $(controller).click(function () {
                page += 1;
                pageHelperToMovePage(ulParent,page,pageUlParent,action,firstPage,lastPage,jumpPage,prevPage,nextPage,jumpPageNum,status);
            })
        }
        //上一页的函数
        function prevPage(controller,ulParent,page,pageUlParent,action,firstPage,lastPage,jumpPage,prevPage,nextPage,jumpPageNum,status){
            $(controller).click(function () {

                page -= 1;
                if(page <= 0){
                    page = 1;
                    layer.msg('已经是第一页',{context:'已经是第一页',offset:'150px'});
                }else{
                    pageHelperToMovePage(ulParent,page,pageUlParent,action,firstPage,lastPage,jumpPage,prevPage,nextPage,jumpPageNum,status);
                }

            })
        }
        //跳转函数
        function jumpPage(controller,ulParent,page,pageUlParent,action,firstPage,lastPage,jumpPage,prevPage,nextPage,jumpPageNum,status){
            $(controller).click(function () {
                var jumpPageStr = $('#' + jumpPageNum).val();
                var pageNumber = Number(jumpPageStr);
                if(!isInteger(pageNumber)){
                    layer.msg('请输入整数',{context:'请输入一个整数',offset:'150px'});
                }else{
                    page = pageNumber;
                    pageHelperToMovePage(ulParent,page,pageUlParent,action,firstPage,lastPage,jumpPage,prevPage,nextPage,jumpPageNum,status)
                }
            })
        }
        //默认排序首页
        firstPage('#defaultFirstPage','.defaultOrder',pageNum,'.defaultOperatePage','default','defaultFirstPage','defaultLastPage','defaultJumpPage','defaultPrevPage','defaultNextPage','defaultJumpPageNum',0)
        //日期升序
        firstPage('#latestAscFirstPage','.dateAscOrder',dateAscPageNum,'.dateAscOperatePage','dateAsc','dateAscFirstPage','dateAscLastPage','dateAscJumpPage','dateAscPrevPage','dateAscNextPage','dateAscJumpPageNum',0);
        //价格升序
        firstPage('#priceAscFirstPage','.priceAscOrder',priceAscPageNum,'.priceAscOperatePage','priceAsc','priceAscFirstPage','priceAscLastPage','priceAscJumpPage','priceAscPrevPage','priceAscNextPage','priceAscJumpPageNum',0);
        //价格降序
        firstPage('#priceDescFirstPage','.priceDescOrder',priceDescPageNum,'.priceDescOperatePage','priceDesc','priceDescFirstPage','priceDescLastPage','priceDescJumpPage','priceDescPrevPage','priceDescNextPage','priceDescJumpPageNum',0);



        //默认排序的下一页
        nextPage('#defaultNextPage','.defaultOrder',pageNum,'.defaultOperatePage','default','defaultFirstPage','defaultLastPage','defaultJumpPage','defaultPrevPage','defaultNextPage','defaultJumpPageNum',0);
        //日期升序
        nextPage('#latestAscNextPage','.dateAscOrder',dateAscPageNum,'.dateAscOperatePage','dateAsc','latestAscFirstPage','latestAscLastPage','latestAscJumpPage','latestAscPrevPage','latestAscNextPage','latestAscJumpPageNum',0);
        //价格升序
        nextPage('#priceAscNextPage','.priceAscOrder',priceAscPageNum,'.priceAscOperatePage','priceAsc','priceAscFirstPage','priceAscLastPage','priceAscJumpPage','priceAscPrevPage','priceAscNextPage','priceAscJumpPageNum',0);
        //价格降序
        nextPage('#priceDescNextPage','.priceDescOrder',priceDescPageNum,'.priceDescOperatePage','priceDesc','priceDescFirstPage','priceDescLastPage','priceDescJumpPage','priceDescPrevPage','priceDescNextPage','priceDescJumpPageNum',0);

        //默认排序前一页
        prevPage('#defaultPrevPage','.defaultOrder',pageNum,'.defaultOperatePage','default','defaultFirstPage','defaultLastPage','defaultJumpPage','defaultPrevPage','defaultNextPage','defaultJumpPageNum',0);
        //日期升序
        prevPage('#latestAscPrevPage','.dateAscOrder',dateAscPageNum,'.dateAscOperatePage','dateAsc','latestAscFirstPage','latestAscLastPage','latestAscJumpPage','latestAscPrevPage','latestAscNextPage','latestAscJumpPageNum',0);
        //价格升
        prevPage('#priceAscPrevPage','.priceAscOrder',priceAscPageNum,'.priceAscOperatePage','priceAsc','priceAscFirstPage','priceAscLastPage','priceAscJumpPage','priceAscPrevPage','priceAscNextPage','priceAscJumpPageNum',0);
        //价格降序
        prevPage('#priceDescPrevPage','.priceDescOrder',priceDescPageNum,'.priceDescOperatePage','priceDesc','priceDescFirstPage','priceDescLastPage','priceDescJumpPage','priceDescPrevPage','priceDescNextPage','priceDescJumpPageNum',0);

        //默认跳转
        jumpPage('#defaultJumpPage','.defaultOrder',pageNum,'.defaultOperatePage','default','defaultFirstPage','defaultLastPage','defaultJumpPage','defaultPrevPage','defaultNextPage','defaultJumpPageNum',0);
        //日期升序
        jumpPage('#latestAscJumpPage','.dateAscOrder',dateAscPageNum,'.dateAscOperatePage','dateAsc','latestAscFirstPage','latestAscLastPage','latestAscJumpPage','latestAscPrevPage','latestAscNextPage','latestAscJumpPageNum',0);
        //价格升序
        jumpPage('#priceAscJumpPage','.priceAscOrder',priceAscPageNum,'.priceAscOperatePage','priceAsc','priceAscFirstPage','priceAscLastPage','priceAscJumpPage','priceAscPrevPage','priceAscNextPage','priceAscJumpPageNum',0);
        //价格降序
        jumpPage('#priceDescJumpPage','.priceDescOrder',priceDescPageNum,'.priceDescOperatePage','priceDesc','priceDescFirstPage','priceDescLastPage','priceDescJumpPage','priceDescPrevPage','priceDescNextPage','priceDescJumpPageNum',0);

        //默认最后一页
        lastPage('#defaultLastPage','.defaultOrder',1,'.defaultOperatePage','default','defaultFirstPage','defaultLastPage','defaultJumpPage','defaultPrevPage','defaultNextPage','defaultJumpPageNum',1);
        //日期升序
        lastPage('#latestAscLastPage','.dateAscOrder',1,'.dateAscOperatePage','dateAsc','latestAscFirstPage','latestAscLastPage','latestAscJumpPage','latestAscPrevPage','latestAscNextPage','latestAscJumpPageNum',1);
        //价格升序
        lastPage('#priceAscLastPage','.priceAscOrder',1,'.priceAscOperatePage','priceAsc','priceAscFirstPage','priceAscLastPage','priceAscJumpPage','priceAscPrevPage','priceAscNextPage','priceAscJumpPageNum',1);
        //价格降序
        lastPage('#priceDescLastPage','.priceDescOrder',1,'.priceDescOperatePage','priceDesc','priceDescFirstPage','priceDescLastPage','priceDescJumpPage','priceDescPrevPage','priceDescNextPage','priceDescJumpPageNum',1);
        function lookForHouseByCondition(ulParent,res) {
            $(ulParent + ' ul').empty();
            var thePage = res.list;
            for (var i = 0; i < thePage.length; i++) {
                var date = thePage[i].publishdate;
                var dateString = new Date(date);
                var s = dateString.toLocaleDateString();

                $(ulParent + ' ul').append(
                    "<li style='padding: 35px 0px;position: relative;border-bottom:1px solid #f1f1f1;height: 280px'>" +
                    "<a href='" + pathString + "/singleHouse?id=" + thePage[i].id + "&remove=1&agree=2 'style='position: relative;float: left'><img src='" + pathString + "/img/houses/" + thePage[i].path + "' alt='' style='height: 280px;width: 280px'></a>" +
                    "<div style='float: right;border: 1px solid #e3d2d2;height: 280px;width: 824px;'>" +
                    "<div style='font-weight: 800;font-size: 30px;font-family: HiraginoSansGB-W6;'>" + thePage[i].descr + "</div>" +
                    "<div style='margin-top: 20px'>" +
                    "<div style='margin-top: 30px;color: #08bce5;font-size: 20px;font-weight: 800'>" + thePage[i].village + " / " + thePage[i].square + "m² / "+ thePage[i].direction +" / " + thePage[i].style + "</div>" +
                    "<div style='margin-top: 30px;color: #08bce5;font-size: 20px;font-weight: 800'>" + thePage[i].style + " / "+ thePage[i].storey +"层 / "+thePage[i].city+" / "+thePage[i].area+"</div>" +
                    "<div style='margin-top: 40px;color: #08bce5;font-size: 20px;font-weight: 800'>" + s + "</div>" +
                    "<div style='position: absolute;right: 0;top: 30%;font-weight: 800;font-size: 30px;color: red'>" + thePage[i].price + "<span style='color: red;font-size: 15px;font-weight: normal'>元/月</span></div>" +
                    "</div> </div> </li>"
                );

                $('.firstLi').replaceWith('<li>共'+res.pages+'页</li>');
            }
        }
        $('#looKForHouses').click(function (e) {
            e.preventDefault();
            $.get("${pageContext.request.contextPath}/housesConditions/1",$('#lookForHouseForm').serialize(),function (res) {
                lookForHouseByCondition('.defaultOrder',res[0]);
                lookForHouseByCondition('.dateAscOrder',res[1]);
                lookForHouseByCondition('.priceAscOrder',res[2]);
                lookForHouseByCondition('.priceDescOrder',res[3]);
            })
        })

        })
</script>
</html>
