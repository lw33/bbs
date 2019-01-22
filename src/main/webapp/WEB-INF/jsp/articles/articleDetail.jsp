<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page isELIgnored="false"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../common/import.jsp"%>
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
            .page-header {
                padding-bottom: 2px;
                margin: 10px 0 15px;
                border-bottom: 1px solid #e7e9ec;
            }

        </style>
    </head>

    <body>
        <div id="wrap">
            <!-- 左侧菜单栏目块 -->
            <%--<div class="leftMeun" id="leftMeun" style="position: fixed;">--%>
                <%--&lt;%&ndash;首页用户信息&ndash;%&gt;--%>

                <%--<%@include file="../user/indexUserInfo.jsp"%>--%>
                <%--&lt;%&ndash;<jsp:import&ndash;%&gt;--%>
                <%--&lt;%&ndash;<div class="meun-title">账号管理</div>&ndash;%&gt;--%>
                <%--<a class="meun-item" href="${pageContext.request.contextPath}/index"  style="display: block;padding-left: 20px" role="tab"><img src="${pageContext.request.contextPath}/images/icon_source.png">--%>
                    <%--首页帖子--%>
                <%--</a>--%>
            <%--</div>--%>
            <%@include file="../leftMeun.jsp"%>
            <%@include file="../user/login.jsp"%>
            <%@include file="../user/register.jsp"%>
            <!-- 右侧具体内容栏目 -->
            <%--<%@include file="../rightContent.jsp"%>--%>
            <div id="rightContent">
                <div class="container" style="box-shadow: 0px 0px 1px #666;width: 100%;">
                    <div class="page-header">
                        <h4><c:out value="${article.title }"></c:out></h4>
                    </div>
                    <div class="row">
                        <div class="panel panel-default" style="border-radius : 0;">
                            <div class="panel-body" style="font-size: 16px;">
                                <div class="col-md-2">
                                    <center>
                                        <a href="${pageContext.request.contextPath}/user/info/${article.author.uid}" target="_blank">
                                            <img alt="profile" style="width: 111px;" src="<c:url value="${article.author.profile }"/>" class="img-thumbnail"></a>
                                        <br><br>楼主 :<a href="${pageContext.request.contextPath}/user/info/${article.author.uid }" target="_blank">${article.author.name }</a>
                                    </center>
                                </div>
                                <div class="col-md-8">
                                    <c:out value="${article.acontent}" escapeXml="false"></c:out>
                                </div>

                            </div>
                            <h6 style="float: right;">
                                发布时间:
                                <fmt:formatDate value="${article.cratetime}"
                                                pattern="YYYY-MM-dd HH:mm:ss" />&nbsp;
                            </h6>
                        </div>
                    </div>
                    <h5>共${article.commentNum}条评论</h5>

                    <%-- 评论列表 --%>
                    <c:forEach var="c" items="${comments}" varStatus="st">
                        <div class="row">
                            <div class="panel panel-default" style="border-radius : 0;">
                                <div class="panel-body" style="font-size: 16px;">
                                    <div class="col-md-2">
                                        <center>
                                            <a href="${pageContext.request.contextPath}/user/info/${c.uid}" target="_blank">
                                                <img alt="profile" style="width: 111px;" src="<c:url value="${c.author.profile }"/>" class="img-thumbnail">
                                            </a>
                                            <br><br>
                                            <c:if test="${c.uid eq article.uid }">楼主:</c:if>
                                            <a href="${pageContext.request.contextPath}/user/info/${c.uid}" target="_blank">${c.author.name }</a>
                                        </center>
                                    </div>
                                    <div class="col-md-8">
                                        <c:out value="${c.ccontent }" escapeXml="false"></c:out>
                                        <br><br><hr/>
                                            <%-- 楼中楼评论数据 --%>
                                        <div class="media" id="media${c.cid }" style="font-size: 16px;">
                                            <c:forEach var="r" items="${c.replies}">
                                                <%--<c:if test="${f.cid eq c.cid }">--%>
                                                    <!-- 头像 -->
                                                    <div class="media-left">
                                                        <a href="${pageContext.request.contextPath}/user/info/${r.uid}" target="_blank">
                                                            <img class="media-object" style="width: 34px;" src="<c:url value="${r.replyer.profile }" />">
                                                        </a>
                                                    </div>
                                                    <!-- 评论内容 -->
                                                    <div class="media-body">
                                                        <a href="${pageContext.request.contextPath}/user/info/${r.uid}" target="_blank">${r.replyer.name }</a>:
                                                        <span style="font-size: 16px;">
                                                                <c:out value="${r.rcontent }"></c:out>
                                                        </span>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <span style="font-size: 12px;">
                                                             <fmt:formatDate value="${r.date }" pattern="YYYY-MM-dd HH:mm:ss" />
                                                        </span>
                                                        <a onclick="floorInput('${c.cid }','${r.replyer.name }')">&nbsp;回复&nbsp;</a>
                                                    </div>
                                                    <br>
                                                <%--</c:if>--%>
                                            </c:forEach>

                                        </div>
                                    </div>
                                </div>
                                <div class="replyMsg">
                                    <h6 style="float: right;">
                                            <%-- ${fn:length(commentList)-st.index }楼 --%>
                                            ${st.index+1 }楼
                                        <fmt:formatDate value="${c.date }"
                                                        pattern="YYYY-MM-dd HH:mm:ss" />
                                        <a onclick="openFloorInput(${c.cid })">&nbsp;回复&nbsp;</a>
                                    </h6>
                                </div>
                            </div>


                                <%-- 楼中楼评论框 --%>
                            <br>
                            <div class="floor" id="floor${c.cid }" style="display: none;width: 40%;float: right;margin: 5px;">
                                <textarea class="form-control" rows="3" id="text${c.cid }"></textarea>
                                <input class="btn btn-primary" type="submit" onClick="floorReply(${c.cid})" value="回复" style="float: right; margin-top: 5px;">
                            </div>
                        </div>
                    </c:forEach>

                    <%-- 评论框 --%>
                    <c:choose>
                        <c:when test="${!empty user }">
                            <div style="padding-top: 50px; padding-bottom: 50px;">
                                <form action="${pageContext.request.contextPath}/comment/add" method="post">
                                    <div style="width:97%;margin:auto;">
                                        <%@include file="../common/edit.jsp"%>
                                    </div>
                                    <input type="hidden" name="uid" value="${sessionScope.user.uid}">
                                    <input type="hidden" name="aid" value="${article.aid}">
                                    <br>
                                    <button type="submit" class="btn btn-primary"
                                             style="float: right; margin-right:1.5%;">评 论</button>
                                </form>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <center>
                                <h3>登陆后才能评论</h3>
                            </center>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

</div>
        <script>

            /*楼中楼回复框*/
            function floorInput(num,name){
                $('#floor'+num).slideToggle();
                $('#text'+num).focus();
                $('#text'+num).val("回复 "+name+" : ");
            }
            function openFloorInput(num){
                $('#floor'+num).slideToggle();
                $('#text'+num).focus();
            }
            function floorReply(num){
                //文本框内容
                var t = $('#text'+num).val();
                t = $.trim(t);
                if (t == "") {
                    alert("回复内容不能为空");
                    $('#text'+num).val("");
                    return;
                }
                //请求服务器,插入评论
                var url = "${pageContext.request.contextPath}/comment/addReply";
                var params = {
                    cid : num,
                    aid : '${article.aid }',
                    uid : '${user.uid}',
                    rcontent : t,
                };
                $.ajax({
                    'url' : url,
                    'data' : params,
                    'type' : 'POST',
                    'success' : function(data) {
                        //js插入评论数据
                        var t1 = '<div class="media-left">'+
                            '<a href="${pageContext.request.contextPath}/user/info/${user.uid}"><img class="media-object" src="${pageContext.request.contextPath}${user.profile }" style="width:34px;"></a>'+
                            '</div>'+
                            '<div class="media-body">'+
                            '<a href="${pageContext.request.contextPath}/user/info/${user.uid}" target="_blank">${user.name }</a>:'+t+
                            '<a onclick="floorInput(\''+num+'\',\'${user.name }\')">&nbsp;回复&nbsp;</a>'+
                            '</div><br>';
                        $('#media'+num).append(t1);
                        $('#text'+num).val('');
                        $('#floor'+num).slideUp();
                        location.reload();
                    },
                    'error' : function() {
                        alert("回复失败！");
                    }
                });
            }


        </script>
<script src="${pageContext.request.contextPath}/js/jquery.nouislider.js"></script>

<script>
                                                //min/max slider
                                                function huadong(my, unit, def, max) {
                                                    $(my).noUiSlider({
                                                        range: [0, max],
                                                        start: [def],
                                                        handles: 1,
                                                        connect: 'upper',
                                                        slide: function() {
                                                            var val = Math.floor($(this).val());
                                                            $(this).find(".noUi-handle").text(
                                                                    val + unit
                                                                    );
                                                            console.log($(this).find(".noUi-handle").parent().parent().html());
                                                        },
                                                        set: function() {
                                                            var val = Math.floor($(this).val());
                                                            $(this).find(".noUi-handle").text(
                                                                    val + unit
                                                                    );
                                                        }
                                                    });
                                                    $(my).val(def, true);
                                                }
                                                huadong('.slider-minmax1', "分钟", "5", 30);
                                                huadong('.slider-minmax2', "分钟", "6", 15);
                                                huadong('.slider-minmax3', "分钟", "10", 60);
                                                huadong('.slider-minmax4', "次", "2", 10);
                                                huadong('.slider-minmax5', "天", "3", 7);
                                                huadong('.slider-minmax6', "天", "8", 10);
</script>
</body>

</html>