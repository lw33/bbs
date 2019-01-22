<%@page contentType="text/html;charset=gb2312"%>
<%@include file="sessioncheck.jsp"%>
<base target=right>



<%


    if (session.getAttribute("username") != null) {
        out.write("欢迎您：<font color=red>" + session.getAttribute("username")+"</font><br><br>");
        out.write("<a href=\"news_add.jsp\">信息修改</a><br>");
        out.close();
    }
    out.write("<a href='news_query.jsp'>信息查询</a><br>");


%>

<a href="logout.jsp" target=_top>安全退出</a><br>

