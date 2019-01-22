<%@page isELIgnored="false"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!--发帖弹出窗口-->
<div class="modal fade" id="login" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document" >
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel">登入</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/login">
                        <div class="form-group ">
                            <label for="sNameLogin" class="col-xs-4 control-label">用户名：</label>
                            <div class="col-xs-6 ">
                                <input type="text" class="form-control input-sm duiqi" id="sNameLogin" placeholder="" name="name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="sPasswdLogin" class="col-xs-4 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
                                <div class="col-xs-6">
                                    <input type="password" class="form-control input-sm duiqi" id="sPasswdLogin" placeholder="" name="passwd">
                                </div>
                            </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                            <%--<a href="#">--%>
                            <button type="submit" class="btn btn-xs btn-green">登 入</button>
                            <%--</a>--%>
                        </div>
                    </form>
                </div>
            </div>
            <%--<div class="modal-footer">
                <a href="#">
                    <button type="button" class="btn btn-xs btn-green">发 布</button>
                </a>
            </div>--%>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
