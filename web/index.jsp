<%--
  Created by IntelliJ IDEA.
  User: yanwenbo
  Date: 2018.5.22
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" href="https://cdn3.iconfinder.com/data/icons/communication/512/Blog_C-128.png"/>
  <title>一个博客</title>
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
      <div class="search">
        <form action="search.action" method="post">
            <input type="text" name="searchText" placeholder=" 输入关键词搜索……">
        </form>
      </div>
    </div>
    <div class="col-md-2">
      <%
        if (session.getAttribute("USERID") != null) {
      %>
        <a href="#" class="btn btn-info btn-lg active signup" role="button">${sessionScope.USERNAME}</a>
        <button type="button" class="btn btn-success signin" onclick="window.location.href='logout.action'">退 出</button>
      <%
        } else {
      %>
        <button type="button" class="btn btn-success signup" onClick="window.location.href='signup.jsp'">注 册</button>
        <button type="button" class="btn btn-success signin" onClick="window.location.href='signin.jsp'">登 录</button>
      <%
        }
      %>
    </div>
  </div>
</div>

<!--MAIN-->
<div class="container-fluid context">
  <div class="row mainarea">
    <div class="col-md-8 main">
        <div class="alert alert-warning" role="alert" style="position: relative; top: 10px">
            <p style="position: relative; font-family: sans-serif;font-size: large; font-weight: bold">全部文章</p>
        </div>
        <!--博客展示-->
        <div class="row" style="position: relative">
            ${displayBlock}
            <!--div class="col-md-10" style="margin: 20px 60px 10px 60px">
                 <div class="thumbnail">
                      <div class="caption">
                          <h3>Java Web Project</h3>
                          <p>作者：cslion 时间：2018-06-09 阅读量：24</p>
                          <p class="yuedu1"><a href="#" class="btn btn-primary yuedu2" role="button">阅读全文</a></p>
                      </div>
                 </div>
             </div-->
        </div>
        <div class="alert alert-danger" role="alert" style="position: relative">
            <p align="center"> 已 经 到 底 啦！</p>
        </div>
    </div>
        <%
            if (session.getAttribute("USERID") != null) {
        %>
        <div class="col-md-4 subsidiary">
            <div style="position: relative">
                <button type="button" class="btn btn-success myinfo" onClick="window.location.href='myInfo.action'">信 息</button>
                <button type="button" class="btn btn-warning mypost" onClick="window.location.href='myPost.action'">归 档</button>
            </div>
            <div style="position: relative">
                <button type="button" class="btn btn-danger writeblog" onClick="window.location.href='edit.jsp'">写 作</button>
                <button type="button" class="btn btn-primary myfavorite" onClick="window.location.href='myFavorite.jsp'">收 藏</button>
            </div>
            <div>
                <img src="public/img/1.jpg" alt="OneBlog" class="img-rounded">
            </div>
        </div>
        <%
            }
        %>
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