<%@page isELIgnored="false"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/release/wangEditor.min.js"></script>
<div id="div1">
</div>
<input type="hidden" name="content" id="txt"/>
<script type="text/javascript">

    var E = window.wangEditor;
    var editor = new E('#div1');
    editor.customConfig.uploadImgShowBase64 = true;   // 使用 base64 保存图片

    editor.customConfig.onchange = function (html) {
        // html 即变化之后的内容

        var html= editor.txt.html();
        // var text=editor.txt.text();
        $("#txt").val(html);
    }
    editor.create()
    //创建
    //editor.create();

    // 禁用
    //editor.disable();

    // 启用
    //editor.enable();

</script>
