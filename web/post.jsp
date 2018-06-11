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
    <title>博文</title>
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
        <div class="col-md-2"></div>
        <div class="col-md-8 postmain">
            <h2>${title}</h2>
            <div class="postinfo">
                <span>作者：${author}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span>日期：${publishTime}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span>阅读量：${count}</span>
            </div>
            <div class="postcontext">
                ${bowen}
            </div>
            <div class="praise myfavorite">
                <span id="praise"><img src="public/img/zan.png" id="praise-img" /></span>
                <span id="praise-txt">${zan}</span>
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
        <span id="busuanzi_container_site_pv" style="font-size: 12px;">本站总访问量: <span id="busuanzi_value_site_pv">1</span> 次</span>
        <span> | </span>
        <span id="busuanzi_container_site_pv" style="font-size: 12px;"> 本站访客数: <span id="busuanzi_value_site_uv">1</span> 人次</span>
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
<script type="text/javascript">
    function praise(recordNo, praiseCount) {
        $.ajax({
            url: 'myFavorite.action',
            type: 'POST',
            data: {
                'recordNo': recordNo
            },
            dataType: "JSON",
            success: function(d) {
                if (d.success) {
                    var strategyPraiseNo = parseInt(praiseCount) + 1;
                    $('#praiseNo' + recordNo).html(strategyPraiseNo)
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                bootbox.alert("无法连接服务器:" + textStatus);
            }
        });
    }
</script>
</body>
</html>
