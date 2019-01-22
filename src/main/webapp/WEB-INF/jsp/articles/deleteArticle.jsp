<%@page isELIgnored="false"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="modal fade" id="deleteArtile" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    确定要删除该帖子？删除后不可恢复！
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                <button type="button" class="btn  btn-xs btn-danger" data-dismiss="modal" onclick="deleteArticle()">确 认</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script>
    var aid = null;
    function setDeleteArticleId(delAid) {

        aid = delAid;
    }
    function deleteArticle() {
        $.ajax(
            {
                url: "${pageContext.request.contextPath}/article/delete",
                type: "get",
                dataType:"json",
                data: "aid="+aid,
                // data:
                success: function (data) {
                    // alert(data);
                    if (data == 1) {
                        location.reload();
                        alert("删除成功");
                    } else {
                        alert("删除失败");
                    }
                }
            }
        );
    }
</script>