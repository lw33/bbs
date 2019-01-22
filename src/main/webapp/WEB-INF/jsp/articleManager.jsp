<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page isELIgnored="false"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="common/import.jsp"%>
<!doctype html>
<html lang="ch">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta name="format-detection" content="telephone=no">
        <title>509BBS</title>
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script>
            $(function() {
                $(".meun-item").click(function() {
                    $(".meun-item").removeClass("meun-item-active");
                    $(this).addClass("meun-item-active");
                    var itmeObj = $(".meun-item").find("img");
                    itmeObj.each(function() {
                        var items = $(this).attr("src");
                        items = items.replace("_grey.png", ".png");
                        items = items.replace(".png", "_grey.png")
                        $(this).attr("src", items);
                    });
                    var attrObj = $(this).find("img").attr("src");
                    ;
                    attrObj = attrObj.replace("_grey.png", ".png");
                    $(this).find("img").attr("src", attrObj);
                });
                $("#topAD").click(function() {
                    $("#topA").toggleClass(" glyphicon-triangle-right");
                    $("#topA").toggleClass(" glyphicon-triangle-bottom");
                });
                $("#topBD").click(function() {
                    $("#topB").toggleClass(" glyphicon-triangle-right");
                    $("#topB").toggleClass(" glyphicon-triangle-bottom");
                });
                $("#topCD").click(function() {
                    $("#topC").toggleClass(" glyphicon-triangle-right");
                    $("#topC").toggleClass(" glyphicon-triangle-bottom");
                });
                $(".toggle-btn").click(function() {
                    $("#leftMeun").toggleClass("show");
                    $("#rightContent").toggleClass("pd0px");
                })
            })
        </script>
        <!--[if lt IE 9]>
        <script src="${pageContext.request.contextPath}/js/html5shiv.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/respond.min.js"></script>
        <![endif]-->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/slide.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/flat-ui.min.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.nouislider.css">
        <style>
            a {
                text-decoration: none;
            }
        </style>
    </head>

    <body>
        <div id="wrap">
            <!-- 左侧菜单栏目块 -->
            <%@include file="leftMeun.jsp"%>
            <!-- 右侧具体内容栏目 -->
            <%--<%@include file="rightContent.jsp"%>--%>
            <div id="rightContent">
            <div role="tabpanel" class="tab-pane" id="char">

                <div class="check-div">
                    <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addChar">发帖</button>
                </div>
                <div class="data-div">
                    <div class="row tableHeader">
                        <div class="col-xs-1 ">
                            序号
                        </div>
                        <div class="col-xs-3">
                            标题
                        </div>
                        <div class="col-xs-1">
                            回复量
                        </div>
                        <div class="col-xs-3" style="text-align:center;">
                            创建时间
                        </div>
                        <div class="col-xs-4" style="text-align:center;">
                            操作
                        </div>
                    </div>
                    <div class="tablebody" id="articleManagerContent">

                        <c:forEach var="u" items="${articles}" varStatus="status">


                            <a href="${pageContext.request.contextPath}/article/detail/${u.aid}" style="color:#717592">
                                <div class="row" style="position: relative;">
                                    <c:if test="${! empty u.lable}">

                                    <span class="label label-success" style="position: absolute;top: 46px;left: 108px;">#${u.lable}#</span>

                                    </c:if>
                                    <div class="col-lg-1">
                                        <c:out value="${status.index+1}" />
                                    </div>
                                    <div class="col-lg-3">
                                            ${u.title}
                                    </div>
                                        <div class="col-lg-1">
                                                ${u.commentNum}
                                        </div>
                                    <div class="col-lg-3">
                                        <fmt:formatDate value="${u.cratetime }" pattern="yyyy-MM-dd HH:mm:ss" />
                                    </div>
                            </a>
                                    <div class="col-lg-4">

                                        <div class="col-xs-6" style='text-align: center;'>
                                             <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#changeArticle" style="width:64px" onclick="changeArticle(${u.aid})">修改</button>
                                             <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteArtile" style="margin-left:10px;width:64px"  onclick="setDeleteArticleId(${u.aid})">删除</button>
                                        </div>
                                        <c:if test="${sessionScope.user.isadmin eq 1}">
                                            <div class="col-xs-6">
                                                <c:choose>
                                                    <c:when test="${u.istop eq 0}">
                                                        <button class="btn btn-success btn-xs"   style="width:64px" onclick="setTop(${u.aid}, ${u.isexcellent})">置顶</button>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button class="btn btn-success btn-xs" style="width:64px" onclick="cancelTop(${u.aid}, ${u.isexcellent})">取消置顶</button>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${u.isexcellent eq 0}">
                                                        <button class="btn btn-danger btn-xs"  style="width:64px" onclick="setExcellent(${u.aid}, ${u.istop})">加精</button>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button class="btn btn-danger btn-xs"  style="width:64px" onclick="cancelExcellent(${u.aid}, ${u.istop})">取消加精</button>
                                                    </c:otherwise>
                                                </c:choose>
                                               
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                        </c:forEach>

                    </div>

                </div>
                <!--页码块-->
                <footer class="footer">
                    <ul class="pagination">
                        <li>

                            第${pageInfo.pageNum}页
                        </li>
                        <li class="gray">
                            共${pageInfo.pages}页
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/article/manage/${pageInfo.pageNum==1?1:pageInfo.pageNum-1 }">
                                <i class="glyphicon glyphicon-menu-left">
                                </i>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/article/manage/${pageInfo.pageNum==pageInfo.pages?pageInfo.pages:pageInfo.pageNum+1 }">
                                <i class="glyphicon glyphicon-menu-right">
                                </i>
                            </a>
                        </li>
                    </ul>
                </footer>


                <!--发帖弹出窗口-->
                <%@include file="articles/sendArticle.jsp"%>

                <%--修改帖弹出框--%>
                <%@include file="articles/changegArticle.jsp"%>
                
                <!--弹出删除用户警告窗口-->
                <%@include file="articles/deleteArticle.jsp"%>

            </div>
        </div>
        </div>
        <%@include file="user/login.jsp"%>
        <%@include file="user/register.jsp"%>

</body>
<script>
    function setTop(aid, isexcellent) {



        $.ajax(
            {
                url: "${pageContext.request.contextPath}/article/updateSpecial",
                type: "get",
                data: {
                    aid: aid,
                    istop: 1,
                    isexcellent: isexcellent
                }
            }
        );

        setTimeout(function () {

            location.reload();
        }, 500)
    }
    function cancelTop(aid, isexcellent) {
        $.ajax(
            {
                url: "${pageContext.request.contextPath}/article/updateSpecial",
                type: "get",
                data: {
                    aid: aid,
                    istop: 0,
                    isexcellent: isexcellent
                }
            }
        );
        setTimeout(function () {

            location.reload();
        }, 500)
    }

    function setExcellent(aid, istop) {



        $.ajax(
            {
                url: "${pageContext.request.contextPath}/article/updateSpecial",
                type: "get",
                data: {
                    aid: aid,
                    isexcellent: 1,
                    istop: istop
                }
            }
        );

        setTimeout(function () {

            location.reload();
        }, 500)
    }
    function cancelExcellent(aid, istop) {
        $.ajax(
            {
                url: "${pageContext.request.contextPath}/article/updateSpecial",
                type: "get",
                data: {
                    aid: aid,
                    isexcellent: 0,
                    istop: istop
                }
            }
        );
        setTimeout(function () {

            location.reload();
        }, 500)
    }
</script>

</html>