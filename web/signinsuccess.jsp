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

<%
    String path = request.getContextPath();

    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录成功</title>
    <!--Stylesheet-->
    <link rel="stylesheet" href="public/css/bootstrap.min.css">
    <link rel="stylesheet" href="public/css/font-awesome.min.css">
    <link rel="stylesheet" href="public/css/signin.css">
    <style>
        .mainarea p {
            position: relative;
            text-align: center;
            top: 200px;
            font-family: 汉仪黑荔枝体简;
            font-size: x-large;
            width: 100%;
        }
    </style>
</head>
<body onload="shownum()">
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
        <s:fielderror>
            <s:param>success</s:param>
        </s:fielderror>
        <p id="time"></p>
    </div>
</div>

<%
    response.setHeader("Refresh","5;URL=index.jsp");
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
    var i = 6; function shownum(){
        i=i-1; document.getElementById("time").innerHTML="${username}"+"：恭喜您登录成功！"+"</br>"+i+"s后跳转至主页 n(*≧▽≦*)n";
        setTimeout('shownum()',1000); }
</script>
</body>
</html>
