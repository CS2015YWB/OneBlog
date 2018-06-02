<%--
  Created by IntelliJ IDEA.
  User: yanwe
  Date: 2018.5.30
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@page import="java.sql.*" %>
<html>
    <head>
        <title>Test</title>
    </head>
    <body>
 <%
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/blog"; //URL指向访问的数据库名blog
    String user = "root";                            //Mysql配置时的用户名
    String password = "yanwenbo";                    //密码
    try {
        Class.forName(driver);                       //加载驱动程序
        Connection conn = DriverManager.getConnection(url,user,password);  //链接数据库
        Statement ststment = conn.createStatement();                       //用来执行sql语言
        String sql = "SELECT * FROM user";
        ResultSet rs = ststment.executeQuery(sql);
        String username; String email;
        while(rs.next()){
            username = rs.getString("username");
            email = rs.getString("email");
            out.println(username+" "+email + "</br>");
        }
        rs.close();
        conn.close();
    }catch(ClassNotFoundException e){
        System.out.println("No Drive!");
        e.printStackTrace();
    }catch (SQLException e){
        e.printStackTrace();
    }catch(Exception e){
        e.printStackTrace();
    } %>
    </body>
</html>
