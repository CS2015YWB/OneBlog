<%--
  Created by IntelliJ IDEA.
  User: yanwe
  Date: 2018.6.12
  Time: 23:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="https://cdn3.iconfinder.com/data/icons/communication/512/Blog_C-128.png"/>
    <title>修改文章</title>
    <!--Stylesheet-->
    <link rel="stylesheet" href="public/css/bootstrap.min.css">
    <link rel="stylesheet" href="public/css/font-awesome.min.css">
    <link rel="stylesheet" href="public/css/index.css">
</head>
<body>
<!--HEADER-->
<div class="container-fluid header">
    <div class="row">
        <div class="col-md-2">
            <a class="logo" href="display.action">One Blog</a>
        </div>
        <div class="col-md-8">

        </div>
        <div class="col-md-2">

        </div>
    </div>
</div>

<!--MAIN-->
<div class="container-fluid context">
    <div class="row mainarea">
        <!--写文章-->
        <form action="saveChange.action?saveId=${mid}" method="post">
            <div class="input-group" style="width: 90%; margin: 20px auto">
                <span class="input-group-addon" id="basic-addon1">标 题</span>
                <input type="text" class="form-control" placeholder="标题字数不得超过20个字" aria-describedby="basic-addon1" name="title" value=${title}>
            </div>
            <div class="form-group" style="position:relative; z-index: 9999">
                <!-- editormd start -->
                <div class="editormd" id="test-editormd">
                    <textarea class="editormd-markdown-textarea" name="testeditormdmarkdowndoc" id="editormd">${md}</textarea>
                    <!-- 第二个隐藏文本域，用来构造生成的HTML代码，方便表单POST提交，这里的name可以任意取，后台接受时以这个name键为准 -->
                    <!-- html textarea 需要开启配置项 saveHTMLToTextarea == true -->
                    <textarea class="editormd-html-textarea" name="editorhtml" id="editorhtml"></textarea>
                </div>
                <!-- editormd end -->
            </div>
            <div class="form-group" style="text-align: center">
                <button type="submit" class="btn btn-success navbar-btn" style="text-align: center">完 成 修 改</button>
            </div>
        </form>
    </div>
</div>

<!--FOOTER-->
<div class="container-fluid footer">
    <p class="copyright foot">
        Copyright &copy; JINGSHUI
        <br>
        <span id="busuanzi_container_site_pv" style="font-size: 12px;">本站总访问量: <span id="busuanzi_value_site_pv">1</span> 次</span>
        <span> | </span>
        <span id="busuanzi_container_site_pv" style="font-size: 12px;"> 本站访客数: <span id="busuanzi_value_site_uv">1</span> 人次</span>
    </p>
</div>
<!--JavaScript-->
<!--busuanzi tongji-->
<script async src="//dn-lbstatics.qbox.me/busuanzi/2.3/busuanzi.pure.mini.js"></script>
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
            emoji: true,
            taskList: true,
            tocm: true,                  // Using [TOCM]
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

