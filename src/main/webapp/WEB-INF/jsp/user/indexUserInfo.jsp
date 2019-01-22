<%@page isELIgnored="false"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="top.lw33.bbs.pojo.User" %>
<!--发帖弹出窗口-->

<div id="personInfor">
    <c:choose>
        <c:when test="${empty sessionScope.user }">
            <img src="${pageContext.request.contextPath}/imgs/head.png" class="img-circle"  data-toggle="modal" data-target="#myModal" width="140px">
            <br>
            <br>
            &nbsp;&nbsp;
            &nbsp;&nbsp;
            &nbsp;&nbsp;
            <a href="javascript:void(0)" data-toggle="modal" data-target="#login" style="text-decoration: none">登录</a>

            &nbsp;&nbsp;
            <a href="javascript:void(0);" style="text-decoration: none" data-toggle="modal" data-target="#register">注册</a>


        </c:when>
        <c:otherwise>
            <a href="${pageContext.request.contextPath}/user/info/${sessionScope.user.uid }" target="_blank">
                <c:choose>
                    <c:when test="${empty sessionScope.user.profile}">
                        <img src="${pageContext.request.contextPath}/imgs/head.png" class="img-circle"  data-toggle="modal" data-target="#myModal" width="140px">
                    </c:when>
                    <c:otherwise>
                        <img alt="${sessionScope.user.name }" src="${pageContext.request.contextPath}${sessionScope.user.profile}" class="img-circle" style="width: 140px;">
                    </c:otherwise>
                </c:choose>

            </a>
            <br>
            <br>
            用户名：
            ${sessionScope.user.name}
            <br><a href="${pageContext.request.contextPath}/exit" style="text-decoration: none;">安全退出</a>
        </c:otherwise>
    </c:choose>

</div>