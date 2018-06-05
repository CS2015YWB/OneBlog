<%--
  Created by IntelliJ IDEA.
  User: yanwenbo
  Date: 2018.5.22
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
      <a class="logo" href="index.jsp">One Blog</a>
    </div>
    <div class="col-md-8">
      <div class="search">
        <form> <input type="text" placeholder=" 输入关键词搜索……">
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
      <!--博客展示-->
      ${messaage}
    </div>
    <div class="col-md-4 subsidiary">

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