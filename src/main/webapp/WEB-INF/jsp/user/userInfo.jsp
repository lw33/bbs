<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page isELIgnored="false" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@include file="../common/import.jsp" %>
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
        $(function () {
            $(".meun-item").click(function () {
                $(".meun-item").removeClass("meun-item-active");
                $(this).addClass("meun-item-active");
                var itmeObj = $(".meun-item").find("img");
                itmeObj.each(function () {
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
            $("#topAD").click(function () {
                $("#topA").toggleClass(" glyphicon-triangle-right");
                $("#topA").toggleClass(" glyphicon-triangle-bottom");
            });
            $("#topBD").click(function () {
                $("#topB").toggleClass(" glyphicon-triangle-right");
                $("#topB").toggleClass(" glyphicon-triangle-bottom");
            });
            $("#topCD").click(function () {
                $("#topC").toggleClass(" glyphicon-triangle-right");
                $("#topC").toggleClass(" glyphicon-triangle-bottom");
            });
            $(".toggle-btn").click(function () {
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css"${pageContext.request.contextPath}/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/slide.css"${pageContext.request.contextPath}/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"${pageContext.request.contextPath}/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/flat-ui.min.css"${pageContext.request.contextPath}/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.nouislider.css">
    <style>
        a {
            text-decoration: none;
        }
        #rightContent>#char>form>.form-group>.col-xs-8 {
            text-align: left;
        }
    </style>
</head>

<body>
<div id="wrap">
    <!-- 左侧菜单栏目块 -->
    <%@include file="../leftMeun.jsp" %>
    <!-- 右侧具体内容栏目 -->
    <%--<%@include file="rightContent.jsp"%>--%>
    <div id="rightContent" style="margin-bottom: 100px;">
        <div role="tabpanel" class="tab-pane" id="char">
            <form class="form-horizontal" style="margin-top: 50px;margin-left: 20%;">

            <div class="form-group ">
                <div  class="col-xs-3 control-label" style="margin-left: 31px;">
                    <img src="${pageContext.request.contextPath}${userInfo.profile}" height="80px" class="img-circle">
                </div>

                </div>
                <div class="form-group ">
                    <label  class="col-xs-3 control-label">用户名：</label>
                    <label class="col-xs-8 control-label">
                        ${userInfo.name}
                    </label>
                </div>
                <div class="form-group">
                    <label  class="col-xs-3 control-label">电话：</label>
                    <label class="col-xs-8 control-label">
                        ${userInfo.tel}
                    </label>
                </div>
                <div class="form-group">
                    <label class="col-xs-3 control-label">生日：</label>
                    <label class="col-xs-8 control-label">
                        <fmt:formatDate value="${userInfo.birth}" pattern="YYYY-MM-dd" />
                    </label>
                </div>
                <div class="form-group">
                    <label class="col-xs-3 control-label">职业：</label>
                    <label class="col-xs-8 control-label">
                        ${userInfo.vocation}
                    </label>
                </div>
                <div class="form-group">
                    <label  class="col-xs-3 control-label">地址：</label>
                    <label class="col-xs-8 control-label">
                        ${userInfo.address}
                    </label>
                </div>
                <div class="form-group">
                    <label  class="col-xs-3 control-label">简介：</label>
                    <label class="col-xs-8 control-label">
                        ${userInfo.introduction}
                    </label>
                </div>
                <input type="hidden" name="uid" value="${userInfo.uid}">
                <div class="form-group">
                    <label  class="col-xs-3 control-label">性别：</label>
                    <label class="col-xs-8 control-label">
                        ${userInfo.gender}
                    </label>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="login.jsp" %>
<%@include file="register.jsp" %>

</body>

<script>
    function setAdmin(uid) {


        $.ajax(
            {
                url: "${pageContext.request.contextPath}/user/updateUser",
                type: "get",
                data: {
                    uid: uid,
                    isadmin: 1
                }
            }
        );

        setTimeout(function () {

            location.reload();
        }, 500)
    }

    function setNormal(uid) {
        $.ajax(
            {
                url: "${pageContext.request.contextPath}/user/updateUser",
                type: "get",
                data: {
                    uid: uid,
                    isadmin: 0
                },
            }
        );
        setTimeout(function () {

            location.reload();
        }, 500)
    }
</script>
</html>