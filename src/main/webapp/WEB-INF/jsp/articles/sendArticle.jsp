<%@page isELIgnored="false"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!--发帖弹出窗口-->
<div class="modal fade" id="addChar" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document" style="width: 80%;">
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel">发帖</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/article/addArticle">
                        <div class="form-group ">
                            <label for="sName" class="col-xs-2 control-label">标题：</label>
                            <div class="col-xs-8 ">
                                <input type="text" class="form-control input-sm duiqi" id="sName" placeholder="" name="title">
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-xs-2 control-label">内容：</label>
                            <div class="col-xs-8 ">
                                <%--<textarea class="form-control input-sm duiqi" name="content"></textarea>--%>

                                    <%@include file="../common/edit.jsp"%>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="sOrd" class="col-xs-2 control-label">标签：</label>
                            <div class="col-xs-8">
                                <input type="text" class="form-control input-sm duiqi" id="sOrd" placeholder="" name="lable">
                            </div>
                            <%--<form:hidden path=""--%>

                        </div>
                        <input type="hidden" name="uid" value="${sessionScope.user.uid}">
                        <div class="modal-footer">
                            <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                            <%--<a href="#">--%>
                            <button type="submit" class="btn btn-xs btn-green">发 布</button>
                            <%--</a>--%>
                        </div>
                    </form>
                </div>
            </div>

        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
