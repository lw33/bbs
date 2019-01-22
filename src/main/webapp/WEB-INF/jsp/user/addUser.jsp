<%@page isELIgnored="false"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!--发帖弹出窗口-->
<div class="modal fade" id="addUser" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document" >
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel">添加用户</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/user/add">
                        <div class="form-group ">
                            <label for="sNameRegister" class="col-xs-4 control-label">用&nbsp;户&nbsp;名：</label>
                            <div class="col-xs-6 ">
                                <input type="text" class="form-control input-sm duiqi" id="sNameRegister" placeholder="" name="name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="sPasswdRegister" class="col-xs-4 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
                                <div class="col-xs-6">
                                    <input type="password" class="form-control input-sm duiqi" id="sPasswdRegister" placeholder="" name="passwd">
                                </div>
                        </div>

                        <div class="form-group">
                            <label for="sPasswdRegister2" class="col-xs-4 control-label">确认密码：</label>
                            <div class="col-xs-6">
                                <input type="password" class="form-control input-sm duiqi" id="sPasswdRegister2" placeholder="" name="">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                            <%--<a href="#">--%>
                            <button type="submit" class="btn btn-xs btn-green">添 加</button>
                            <%--</a>--%>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
