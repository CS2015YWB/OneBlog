<%--
  Created by IntelliJ IDEA.
  User: yanwe
  Date: 2018.5.29
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="https://cdn3.iconfinder.com/data/icons/communication/512/Blog_C-128.png"/>
    <title>注册成功</title>
    <!--Stylesheet-->
    <link rel="stylesheet" href="public/css/bootstrap.min.css">
    <link rel="stylesheet" href="public/css/font-awesome.min.css">
    <link rel="stylesheet" href="public/css/signup.css">
    <style>
        .mainarea p {
            position: relative;
            text-align: center;
            top: 250px;
            font-family: 汉仪黑荔枝体简;
            font-size: x-large;
        }
    </style>
</head>
<body onload="shownum()">
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
    <s:fielderror>
        <s:param>success</s:param>
    </s:fielderror>
    <div class="row mainarea">
        <p id="time"></p>
    </div>
</div>
<%
    response.setHeader("Refresh","10;URL=signin.jsp");
%>

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
<script>
    var i = 11; function shownum(){
        i=i-1; document.getElementById("time").innerHTML="注册成功，您的ID为："+"${idnumber}"+"</br>"+i+"s后转至登录界面 o(￣▽￣)ｄ";
        setTimeout('shownum()',1000); }
</script>
</body>
</html>