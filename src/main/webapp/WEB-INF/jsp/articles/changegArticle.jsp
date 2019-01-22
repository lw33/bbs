<%@page isELIgnored="false"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!--发帖弹出窗口-->
<div class="modal fade" id="changeArticle" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document" style="width: 80%;">
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel">修 改</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/article/update">
                        <div class="form-group ">
                            <label for="sChangeArticleTitle" class="col-xs-2 control-label">标题：</label>
                            <div class="col-xs-8 ">
                                <input type="text" class="form-control input-sm duiqi" id="sChangeArticleTitle" placeholder="" name="title">
                            </div>
                        </div>
                        <div class="form-group">
                            <label <%--for=""--%> class="col-xs-2 control-label">内容：</label>
                            <div class="col-xs-8 ">
                                <%--<textarea class="form-control input-sm duiqi" name="content"></textarea>--%>

                                    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
                                    <script type="text/javascript" src="${pageContext.request.contextPath}/js/release/wangEditor.min.js"></script>
                                    <div id="divChangeArticle">
                                    </div>
                                    <input type="hidden" name="acontent" id="divChangeArticleTxt"/>
                                    <input type="hidden" name="aid" id="sChangeArticleAid">

                            </div>
                        </div>
                        <div class="form-group">
                            <label for="sChangeArticleLabel" class="col-xs-2 control-label">标签：</label>
                            <div class="col-xs-8">
                                <input type="text" class="form-control input-sm duiqi" id="sChangeArticleLabel" placeholder="" name="lable">

                            </div>
                            <%--<form:hidden path=""--%>

                        </div>
                        <input type="hidden" name="uid" value="${sessionScope.user.uid}">
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
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script>
    function changeArticle(aid) {

        $.ajax(
            {
                url: "${pageContext.request.contextPath}/article/showChangeArticle/"+aid,
                type: "get",
                dataType:"json",
                // data:
                success: function (data) {
                    // $("#articleManagerContentTotal").text(data.totalPage);
                    // $("#articleManagerContentCurrent").text(data.currtentPage)
                    var E = window.wangEditor;
                    var editor = new E('#divChangeArticle');
                    editor.customConfig.uploadImgShowBase64 = true;   // 使用 base64 保存图片

                    editor.customConfig.onchange = function (html) {
                        // html 即变化之后的内容

                        var html = editor.txt.html();
                        // var text=editor.txt.text();
                        $("#divChangeArticleTxt").val(html);
                    };

                    editor.create()
                    //创建
                    $("#sChangeArticleTitle").val(data.title);
                    $("#sChangeArticleAid").val(aid);
                    editor.txt.html(data.acontent);
                    $("#divChangeArticleTxt").val(data.acontent);
                    $("#sChangeArticleLabel").val(data.lable);
                }
            }
        );
    }

</script>
