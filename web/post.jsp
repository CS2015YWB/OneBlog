<!--
Created by IntelliJ IDEA.
User: yanwe
Date: 2018.6.9
Time: 18:48
To change this template use File | Settings | File Templates.
-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="https://cdn3.iconfinder.com/data/icons/communication/512/Blog_C-128.png"/>
    <title>����</title>
    <!--Stylesheet-->
    <link rel="stylesheet" href="public/css/bootstrap.min.css">
    <link rel="stylesheet" href="public/css/font-awesome.min.css">
    <link rel="stylesheet" href="public/css/post.css">
    <link rel="stylesheet" href="public/css/favorite.css">
</head>
<body>
<!--HEADER-->
<div class="container-fluid header">
    <div class="row">
        <div class="col-md-2">
            <a class="logo" href="index.jsp">One Blog</a>
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
        <div class="col-md-2"></div>
        <div class="col-md-8 postmain">
            <h2>�����������ļ�ֵ��</h2>
            <div class="postinfo">
                <span>���ߣ�${author}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span>���ڣ�${publishTime}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span>�Ķ�����${count}</span>
            </div>
            <div class="postcontext">
                <p>
                    ������

���� �����㣬����̫�ණ�������㡣

���� ���ѵ�ʱ��Ų�����֣�����˵��ϲ���㣬ֻ����ĳ��ҹ�����Ƹ�����������ͷ���������Ѿۻ��ϵĴ����Ÿҽ�������˵����ϲ���㣬ϲ���˺þúþá�

����������
                </p>
            </div>
            <div class="praise myfavorite">
                <span id="praise"><img src="public/img/zan.png" id="praise-img" /></span>
                <span id="praise-txt">0</span>
                <span id="add-num"><em>+1</em></span>
            </div>
        </div>
        <div class="col-md-2"></div>
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
<!--Favorite-->
<script src="public/js/jquery-1.8.3.min.js"></script>
<script>
    $(function(){
        $("#praise").click(function(){
            var praise_img = $("#praise-img");
            var text_box = $("#add-num");
            var praise_txt = $("#praise-txt");
            var num=parseInt(praise_txt.text());
            if(praise_img.attr("src") == ("public/img/yizan.png")){
                $(this).html("<img src='public/img/zan.png' id='praise-img' class='animation' />");
                praise_txt.removeClass("hover");
                text_box.show().html("<em class='add-animation'>-1</em>");
                $(".add-animation").removeClass("hover");
                num -=1;
                praise_txt.text(num)
            }else{
                $(this).html("<img src='public/img/yizan.png' id='praise-img' class='animation' />");
                praise_txt.addClass("hover");
                text_box.show().html("<em class='add-animation'>+1</em>");
                $(".add-animation").addClass("hover");
                num +=1;
                praise_txt.text(num)
            }
        });
    })
</script>
</body>
</html>
