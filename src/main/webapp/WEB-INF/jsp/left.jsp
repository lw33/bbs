<%@page contentType="text/html;charset=gb2312"%>
<%@include file="sessioncheck.jsp"%>
<base target=right>



<%


    if (session.getAttribute("username") != null) {
        out.write("��ӭ����<font color=red>" + session.getAttribute("username")+"</font><br><br>");
        out.write("<a href=\"news_add.jsp\">��Ϣ�޸�</a><br>");
        out.close();
    }
    out.write("<a href='news_query.jsp'>��Ϣ��ѯ</a><br>");


%>

<a href="logout.jsp" target=_top>��ȫ�˳�</a><br>

