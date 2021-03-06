<%--
  Created by IntelliJ IDEA.
  User: yanwe
  Date: 2018.6.6
  Time: 18:10
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
    <title>文章集</title>
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
        <div class="alert alert-warning" role="alert" style="position: relative; top: 10px">
            <p style="position: relative; font-family: sans-serif;font-size: large; font-weight: bold">全部文章</p>
        </div>
        <!--博客展示-->
        <div class="row" style="position: relative">
            ${myDisplayBlock}
            <!--div class="col-md-5" style="margin: 20px 50px 10px 50px">
                <div class="thumbnail">
                    <div class="caption">
                        <h3>Java Web Project</h3>
                        <p>时间：2018-06-09 阅读量：24</p>
                        <p class="yuedu1"><a href="#" class="btn btn-primary yuedu3" role="button">阅读</a><a href="#" class="btn btn-success yuedu2" role="button">修改</a><a href="#" class="btn btn-danger yuedu3" role="button"> 删除 </a></p>
                    </div>
                </div>
            </div-->
        </div>
        <div class="alert alert-danger" role="alert" style="position: relative">
            <p align="center"> 已 经 到 底 啦！</p>
        </div>
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
