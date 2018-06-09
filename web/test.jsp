<%--
  Created by IntelliJ IDEA.
  User: yanwe
  Date: 2018.5.30
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
    <head>
        <title>Test</title>
    </head>
    <body style="background-color: black">

    <!-- editormd start -->
    <div class="editormd" id="test-editormd">
        <textarea class="editormd-markdown-textarea" name="test-editormd-markdown-doc" id="editormd"></textarea>
        <!-- 第二个隐藏文本域，用来构造生成的HTML代码，方便表单POST提交，这里的name可以任意取，后台接受时以这个name键为准 -->
        <!-- html textarea 需要开启配置项 saveHTMLToTextarea == true -->
        <textarea class="editormd-html-textarea" name="editorhtml" id="editorhtml"></textarea>
    </div>
    <!-- editormd end -->

    <!-- editormd start -->
    <link href="/public/editormd/css/editormd.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/public/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="/public/editormd/editormd.min.js"></script>
    <script type="text/javascript">
        var testEditor;

        testEditor=$(function() {
            editormd("test-editormd", {
                width   : "90%",
                height  : 640,
                //markdown : md,
                codeFold : true,
                syncScrolling : "single",
                //你的lib目录的路径
                path    : "<%=request.getContextPath()%>/public/editormd/lib/",
                imageUpload: false,//关闭图片上传功能
                /*  theme: "dark",//工具栏主题
                 previewTheme: "dark",//预览主题
                 editorTheme: "pastel-on-dark",//编辑主题 */
                emoji: false,
                taskList: true,
                tocm: true,         // Using [TOCM]
                tex: true,                   // 开启科学公式TeX语言支持，默认关闭
                flowChart: true,             // 开启流程图支持，默认关闭
                sequenceDiagram: true,       // 开启时序/序列图支持，默认关闭,
                //这个配置在simple.html中并没有，但是为了能够提交表单，使用这个配置可以让构造出来的HTML代码直接在第二个隐藏的textarea域中，方便post提交表单。
                saveHTMLToTextarea : true
            });

        });

    </script>
    <!-- editormd end -->
    </body>
</html>
