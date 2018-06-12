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
    <title>�޸�����</title>
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
        <!--д����-->
        <form action="saveChange.action?saveId=${mid}" method="post">
            <div class="input-group" style="width: 90%; margin: 20px auto">
                <span class="input-group-addon" id="basic-addon1">�� ��</span>
                <input type="text" class="form-control" placeholder="�����������ó���20����" aria-describedby="basic-addon1" name="title" value=${title}>
            </div>
            <div class="form-group" style="position:relative; z-index: 9999">
                <!-- editormd start -->
                <div class="editormd" id="test-editormd">
                    <textarea class="editormd-markdown-textarea" name="testeditormdmarkdowndoc" id="editormd">${md}</textarea>
                    <!-- �ڶ��������ı��������������ɵ�HTML���룬�����POST�ύ�������name��������ȡ����̨����ʱ�����name��Ϊ׼ -->
                    <!-- html textarea ��Ҫ���������� saveHTMLToTextarea == true -->
                    <textarea class="editormd-html-textarea" name="editorhtml" id="editorhtml"></textarea>
                </div>
                <!-- editormd end -->
            </div>
            <div class="form-group" style="text-align: center">
                <button type="submit" class="btn btn-success navbar-btn" style="text-align: center">�� �� �� ��</button>
            </div>
        </form>
    </div>
</div>

<!--FOOTER-->
<div class="container-fluid footer">
    <p class="copyright foot">
        Copyright &copy; JINGSHUI
        <br>
        <span id="busuanzi_container_site_pv" style="font-size: 12px;">��վ�ܷ�����: <span id="busuanzi_value_site_pv">1</span> ��</span>
        <span> | </span>
        <span id="busuanzi_container_site_pv" style="font-size: 12px;"> ��վ�ÿ���: <span id="busuanzi_value_site_uv">1</span> �˴�</span>
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
            //���libĿ¼��·��
            path    : "<%=request.getContextPath()%>/public/editormd/lib/",
            imageUpload: false,//�ر�ͼƬ�ϴ�����
            /*  theme: "dark",//����������
             previewTheme: "dark",//Ԥ������
             editorTheme: "pastel-on-dark",//�༭���� */
            emoji: true,
            taskList: true,
            tocm: true,                  // Using [TOCM]
            tex: true,                   // ������ѧ��ʽTeX����֧�֣�Ĭ�Ϲر�
            flowChart: true,             // ��������ͼ֧�֣�Ĭ�Ϲر�
            sequenceDiagram: true,       // ����ʱ��/����ͼ֧�֣�Ĭ�Ϲر�,
            //���������simple.html�в�û�У�����Ϊ���ܹ��ύ����ʹ��������ÿ����ù��������HTML����ֱ���ڵڶ������ص�textarea���У�����post�ύ����
            saveHTMLToTextarea : true
        });

    });

</script>
<!-- editormd end -->
</body>
</html>

