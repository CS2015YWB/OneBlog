<%--
  Created by IntelliJ IDEA.
  User: yanwe
  Date: 2018.6.12
  Time: 22:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    response.sendRedirect(basePath+"myPost.action");
%>
<html>
<head>
    <title>重定向</title>
</head>
<body>
    <p>缓冲！</p>
</body>
</html>
