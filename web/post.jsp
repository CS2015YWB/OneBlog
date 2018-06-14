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
        <div class="col-md-1"></div>
        <div class="col-md-10 postmain">
            <h2>${title}</h2>
            <div class="postinfo">
                <div class="alert alert-warning" role="alert">
                    <span><span class="glyphicon glyphicon-user" aria-hidden="true"></span> 作者：${author}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> 发表于：${publishTime}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> 热度：${count}℃</span>
                </div>
            </div>
            <div class="postcontext">
                ${bowen}
                <div>
                    <div style="height: 5px"></div>
                    <HR width="100%" color=black SIZE=2>
                </div>
                ${Comment}
            </div>
        </div>
        <div class="col-md-1"></div>
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
</body>
</html>

