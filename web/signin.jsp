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
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录界面</title>
    <!--Stylesheet-->
    <link rel="stylesheet" href="public/css/bootstrap.min.css">
    <link rel="stylesheet" href="public/css/font-awesome.min.css">
    <link rel="stylesheet" href="public/css/signin.css">
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

<%
    String incode = (String)request.getParameter("code");
    String rightcode = (String)session.getAttribute("rCode");

    if(incode != null && rightcode != null){
        if(incode.equals(rightcode)){
            out.println("验证码输入正确！");
        }else{
            out.println("验证码输入不正确，请重新输入！");
        }
    }
%>

<!--MAIN-->
<div class="container-fluid context">
    <div class="row mainarea">
        <h2 class="title">用户登录</h2>
        <form action="http://localhost/signin" method="post">
            <table>
                <tr>
                    <td>账号：</td>
                    <td><input type="text" name="username"/></td>
                </tr>
                <tr>
                    <td>密码：</td>
                    <td><input type="password" name="password"/></td>
                </tr>
                <tr>
                    <td><img src="checkcode.jsp"/></td>
                    <td><input type="text" name="code"/></td>
                </tr>
                <tr>
                    <td><input type="reset" value="重置"/></td>
                    <td><input type="submit" value="登录"/></td>
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
