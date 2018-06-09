<%--
  Created by IntelliJ IDEA.
  User: yanwenbo
  Date: 2018.5.22
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="shortcut icon" href="https://cdn3.iconfinder.com/data/icons/communication/512/Blog_C-128.png"/>
      <title>注册界面</title>
      <!--Stylesheet-->
      <link rel="stylesheet" href="public/css/bootstrap.min.css">
      <link rel="stylesheet" href="public/css/font-awesome.min.css">
      <link rel="stylesheet" href="public/css/signup.css">
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
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <h2 class="title">用户注册</h2>
                <form action="signup.action" method="post">
                    <div class="input-group signup_username">
                        <span class="input-group-addon" id="sizing-addon1">用户名</span>
                        <input type="text" class="form-control" name="userName" aria-describedby="sizing-addon2">
                    </div>
                    <div class="input-group signup_pwd1">
                        <span class="input-group-addon" id="sizing-addon2">密码</span>
                        <input type="password" class="form-control" name="password1" aria-describedby="sizing-addon2">
                    </div>
                    <div class="input-group signup_pwd2">
                        <span class="input-group-addon" id="sizing-addon3">确认</span>
                        <input type="password" class="form-control" name="password2" aria-describedby="sizing-addon2">
                    </div>
                    <div class="form-group signup_submit" style="text-align: center">
                        <button type="submit" class="btn btn-default navbar-btn" style="text-align: center"> 注 册 </button>
                    </div>
                    <div class="alert alert-danger signup_message" role="alert">${message}</div>
                </form>
            </div>
            <div class="col-md-4"></div>
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
