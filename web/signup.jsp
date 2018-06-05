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
            <h2 class="title">用户注册</h2>
            <form action="signup.action" method="post">
                <table>
                    <tr>
                        <td width="100" height="40" align="right" valign="middle">用户名:</td>
                        <td width="250" align="right" valign="middle">
                            <input type="text" name="userName"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100" height="40" align="right" valign="middle">密码:</td>
                        <td width="250" align="right" valign="middle">
                            <input type="password" name="password1"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100" height="40" align="right" valign="middle">确认: </td>
                        <td width="250" align="right" valign="middle">
                            <input type="password"name="password2"/>
                        </td>
                    </tr>
                    <tr>
                        <td height="50" colspan="2" align="center" valign="middle">
                            <input type="submit" value="注 册"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px" height="40px" colspan="2" align="middle">
                            <p style="color: red">${message}</p>
                        </td>
                    </tr>
                </table>
            </form>
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
