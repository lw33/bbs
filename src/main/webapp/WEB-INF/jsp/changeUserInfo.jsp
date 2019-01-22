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
        <style>
            input[type=date]::-webkit-inner-spin-button{visibility: hidden;}
        </style>
    </head>

    <body>
        <div id="wrap">
            <!-- 左侧菜单栏目块 -->
            <%@include file="leftMeun.jsp"%>
            <!-- 右侧具体内容栏目 -->
            <%--<%@include file="rightContent.jsp"%>--%>
            <div id="rightContent" style="margin-bottom: 50px;">
                <div role="tabpanel" class="tab-pane" id="char">
                <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/user/updateInfo"  enctype="multipart/form-data" style="margin-top: 50px;margin-left: 20%;">

                        <div class="form-group ">
                            <%--<label  class="col-xs-3 control-label">头像: </label>--%>
                            <label  class="col-xs-3 control-label">头       像：</label>
                            <label for="file" class=" btn btn-success col-xs-1 control-label" style="z-index: 5;">更换头像</label>
                            <div style="position: relative;">
                                <input id="file"type="file" name="inputfile" style="position: absolute;left: 26%;color: deepskyblue;">
                            </div>
                        </div>



                        <div class="form-group ">
                        <label for="sName" class="col-xs-3 control-label">用户名：</label>
                        <div class="col-xs-8 ">
                            <input type="text" class="form-control input-sm duiqi" id="sName"  name="name" placeholder="" value="${userInfo.name}">
                        </div>
                    </div>
                    <div class="form-group ">
                        <label for="sPasswd" class="col-xs-3 control-label">密    码：</label>
                        <div class="col-xs-8 ">
                            <input type="text" class="form-control input-sm duiqi" id="sPasswd"  name="name" placeholder="" value="${userInfo.passwd}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sLink" class="col-xs-3 control-label">电话：</label>
                        <div class="col-xs-8 ">
                            <input type="text" class="form-control input-sm duiqi" id="sLink" name="tel" placeholder="" value="${userInfo.tel}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sOrd" class="col-xs-3 control-label">生日：</label>
                        <div class="col-xs-8">
                            <input type="date" class="form-control input-sm duiqi" name="birth" id="sOrd" placeholder="" value='<fmt:formatDate value="${userInfo.birth}" pattern="YYYY-MM-dd" />'>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sKnot" class="col-xs-3 control-label">职业：</label>
                        <div class="col-xs-8">
                            <input type="text" class="form-control input-sm duiqi"  name="vocation" placeholder="" value="${userInfo.vocation}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sKnot" class="col-xs-3 control-label">地址：</label>
                        <div class="col-xs-8">
                            <input type="text" class="form-control input-sm duiqi" name="address" placeholder="" value="${userInfo.address}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sKnot" class="col-xs-3 control-label">简介：</label>
                        <div class="col-xs-8">
                                <textarea name="introduction" id="sKnot" cols="30" rows="10">${userInfo.introduction}</textarea>
                        </div>
                    </div>
                    <input type="hidden" name="uid" value="${userInfo.uid}">
                    <div class="form-group">
                        <label  class="col-xs-3 control-label">性别：</label>
                        <div class="col-xs-8">
                            <label class="control-label" >
                                <input type="radio" name="gender" id="normal" value="1" <c:if test="${gender eq 1}">checked="checked"</c:if>
                                >男</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label class="control-label" >
                                <input type="radio" name="gender" id="forbid" value="0" <c:if test="${gender eq 0}">checked="checked"</c:if>
                                >女</label>
                        </div>
                    </div>
                    <label for="sKnot" class="col-xs-3 control-label"></label>
                    <div class="col-xs-8">
                        <input type="submit" value="提交" class="btn btn-success btn-xs;" style="border-radius:0px;margin-left: 49%;width: 69px;height: 30px;line-height: 13px;">
                    </div>
                </form>

            </div>
            </div>
        </div>
        <%@include file="user/login.jsp"%>
        <%@include file="user/register.jsp"%>

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