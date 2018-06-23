package com.oneblog.action;
import java.sql.*;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.deploy.net.proxy.UserDefinedProxyConfig;
import jdk.nashorn.internal.objects.annotations.Getter;
import jdk.nashorn.internal.objects.annotations.Setter;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;


public class SigninAction extends ActionSupport {
    private String userId;
    private String password;
    private String userName;
    private String message;
    @Getter
    public String getUserId() {
        return userId;
    }
    @Setter
    public void setUserId(String userId) {
        this.userId = userId;
    }
    @Getter
    public String getPassword() {
        return password;
    }
    @Setter
    public void setPassword(String password) {
        this.password = password;
    }
    @Getter
    public String getUserName() {
        return userName;
    }
    @Setter
    public void setUserName(String userName) {
        this.userName = userName;
    }
    @Getter
    public String getMessage() {
        return message;
    }
    @Setter
    public void setMessage(String message) {
        this.message = message;
    }
    @Override
    public String execute() throws Exception {
        System.out.println("\n--------------------------\n登录中……");
        /*-------------------------------------*/
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/blog?characterEncoding=utf8&useSSL=true"; //URL指向访问的数据库名blog
        /*-------------------------------------*/
        String idr = this.getUserId();
        String pwd = DigestUtils.md5Hex(this.getPassword());
        System.out.println("md5Hex:" + pwd);
        String back = null;
        try {
            Class.forName(driver);                                                        //加载驱动程序
            Connection conn = DriverManager.getConnection(url,"root","");  //链接数据库
            Statement ststment = conn.createStatement();                                  //用来执行sql语言
            String sql = "Select * from user where id='"+idr+"' and password='"+pwd+"'";
            ResultSet rs = ststment.executeQuery(sql);
            if (rs.next()) {
                userName = rs.getString("username");
                System.out.println("用户ID：" + idr + "\t" + "用户名：" + userName);
                ServletActionContext.getRequest().setAttribute("username", userName);
                /*-----------------添加 Session ----------------*/
                ActionContext.getContext().getSession().put("USERID",userId);
                ActionContext.getContext().getSession().put("USERNAME",userName);
                /*-----------------添加 Cookies ----------------*/
                Cookie userid = new Cookie("USERID", userId);   //setcookie(name,value,expire,path,domain,secure) 各个参数的意义
                Cookie userpassword = new Cookie("USERPASSWORD", password);
                userid.setMaxAge(24*60*60);                     //一天
                userpassword.setMaxAge(24*60*60);
                ServletActionContext.getResponse().addCookie(userid);
                ServletActionContext.getResponse().addCookie(userpassword);
                back = "success";
            }else{
                this.setMessage("账号或密码输入有误,请重新输入!");
                System.out.println("账号或密码输入有误,请重新输入!");
                back = "input";
            }
            rs.close();
            conn.close();
        } catch(ClassNotFoundException e){
            System.out.println("No Drive!");
            e.printStackTrace();
        } catch(Exception e){
            e.printStackTrace();
        }
        return back;
    }
}
