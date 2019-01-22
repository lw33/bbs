<%@page isELIgnored="false"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="modal fade" id="changeUser" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document" >
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel">修改密码</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/user/updateUser">
                        <div class="form-group ">
                            <label for="sNameRegister11" class="col-xs-4 control-label">用&nbsp;户&nbsp;名：</label>
                            <div class="col-xs-6 ">
                                <input type="text" class="form-control input-sm duiqi" id="sNameRegister11" placeholder="" name="" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="sPasswdRegister11" class="col-xs-4 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
                            <div class="col-xs-6">
                                <input type="text" class="form-control input-sm duiqi" id="sPasswdRegister11" placeholder="" name="passwd">
                            </div>
                        </div>

                        <%--<hidd--%>

                        <input type="hidden" name="uid" id="changePasswdUid">
                        <div class="form-group">
                            <label for="sPasswdRegister21" class="col-xs-4 control-label">确认密码：</label>
                            <div class="col-xs-6">
                                <input type="text" class="form-control input-sm duiqi" id="sPasswdRegister21" placeholder="" name="">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                            <%--<a href="#">--%>
                            <button type="submit" class="btn btn-xs btn-green">修 改</button>
                            <%--</a>--%>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script>
    function changeUser(uid) {

        $("#changePasswdUid").val(uid);
        $.ajax(
            {
                url: "${pageContext.request.contextPath}/user/showChangeUser/"+uid,
                type: "get",
                dataType:"json",
                // data:
                success: function (data) {

                    $("#sNameRegister11").val(data.name);

                    console.log(data);
                    $("#sPasswdRegister11").val(data.passwd);
                    $("#sPasswdRegister21").val(data.passwd);

                }
            }
        );
    }

</script>
