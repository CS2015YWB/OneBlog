<%--
  Created by IntelliJ IDEA.
  User: yanwe
  Date: 2018.6.6
  Time: 18:09
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
    <title>�ҵ���Ϣ</title>
    <!--Stylesheet-->
    <link rel="stylesheet" href="public/css/bootstrap.min.css">
    <link rel="stylesheet" href="public/css/font-awesome.min.css">
    <link rel="stylesheet" href="public/css/info.css">
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
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <h2>�û���Ϣ</h2>
            <form action="modifyInfo.action" method="post">
                <div class="input-group info_id">
                    <span class="input-group-addon" id="sizing-addon1">�˺�</span>
                    <input type="text" class="form-control" name="userId" aria-describedby="sizing-addon2" disabled="disabled" value=${userId}>
                </div>
                <div class="input-group info_username">
                    <span class="input-group-addon" id="sizing-addon2">�û���</span>
                    <input type="text" class="form-control" name="userName" aria-describedby="sizing-addon2" value=${userName}>
                </div>
                <div class="input-group info_pwd">
                    <span class="input-group-addon" id="sizing-addon3">����</span>
                    <input type="password" class="form-control" name="password" aria-describedby="sizing-addon2" value=${password}>
                </div>
                <div class="input-group info_email">
                    <span class="input-group-addon" id="sizing-addon4">����</span>
                    <input type="text" class="form-control" name="email" aria-describedby="sizing-addon2" value=${email}>
                </div>
                <div class="input-group info_age">
                    <span class="input-group-addon" id="sizing-addon5">����</span>
                    <input type="text" class="form-control" name="age" aria-describedby="sizing-addon2" value=${age}>
                </div>
                <div class="input-group info_address">
                    <span class="input-group-addon" id="sizing-addon6">��ַ</span>
                    <input type="text" class="form-control" name="address" aria-describedby="sizing-addon2" value=${address}>
                </div>
                <div class="form-group info_submit" style="text-align: center">
                    <button type="submit" class="btn btn-default navbar-btn" style="text-align: center"> ȷ �� �� �� </button>
                </div>
                <div class="alert alert-danger info_message" role="alert">${message}</div>
            </form>
        </div>
        <div class="col-md-3"></div>
    </div>
</div>

<!--FOOTER-->
<div class="container-fluid footer">
    <p class="copyright foot">
        Copyright &copy; JINGSHUI
        <br>
        <span id="busuanzi_container_site_pv" style="font-size: 12px;">��վ�ܷ�����: <span id="busuanzi_value_site_pv">1</span> ��</span>
        <span> | </span>
        <span id="busuanzi_container_site_pv" style="font-size: 12px;"> ��վ�ÿ���: <span id="busuanzi_value_site_uv">1</span> �˴�</span>
    </p>
</div>
<!--JavaScript-->
<!--busuanzi tongji-->
<script async src="//dn-lbstatics.qbox.me/busuanzi/2.3/busuanzi.pure.mini.js"></script>
</body>
</html>