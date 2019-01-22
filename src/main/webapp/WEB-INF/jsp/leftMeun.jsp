<%@page isELIgnored="false"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="leftMeun" id="leftMeun" style="position: fixed;">

    <%--首页用户信息--%>

    <%@include file="user/indexUserInfo.jsp"%>
    <%--<jsp:import--%>
    <%--<div class="meun-title">账号管理</div>--%>
    <a class="meun-item <c:if test="${index eq 1}">
							meun-item-active
        </c:if>" href="${pageContext.request.contextPath}/index" style="display: block;padding-left:20px" id="indexArticles"><img src="${pageContext.request.contextPath}/images/icon_source.png">
        首页帖子
    </a>

        <c:if test="${! empty sessionScope.user}">
    <a class="meun-item <c:if test="${index eq 2}">
							meun-item-active
        </c:if>
        " href="${pageContext.request.contextPath}/article/manage/1" style="display: block;padding-left:20px" id="articleManager">
        <img src="${pageContext.request.contextPath}/images/icon_user_grey.png"> 帖子管理
    </a>
            <c:if test="${sessionScope.user.isadmin eq 1}">
    <a class="meun-item <c:if test="${index eq 3}">
							meun-item-active
        </c:if>" href="${pageContext.request.contextPath}/user/manage/1" style="display: block;padding-left:20px" id="userManager">
        <img src="${pageContext.request.contextPath}/images/icon_chara_grey.png">用户管理
    </a>
            </c:if>
    <a class="meun-item <c:if test="${index eq 4}">
							meun-item-active
        </c:if>" href="${pageContext.request.contextPath}/user/changeInfo" style="display: block;padding-left:20px" id="changerInfo">
        <img src="${pageContext.request.contextPath}/images/icon_change_grey.png">修改资料
    </a>
        </c:if>
</div>





