package com.oneblog.action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import jdk.nashorn.internal.objects.annotations.Getter;
import jdk.nashorn.internal.objects.annotations.Setter;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class MyInfoAction extends ActionSupport{
    private String userId;
    private String password;
    private String userName;
    private String email;
    private String address;
    private String age;

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
    public String getEmail() {
        return email;
    }
    @Setter
    public void setEmail(String email) {
        this.email = email;
    }
    @Getter
    public String getAddress() {
        return address;
    }
    @Setter
    public void setAddress(String address) {
        this.address = address;
    }
    @Getter
    public String getAge() {
        return age;
    }
    @Setter
    public void setAge(String age) {
        this.age = age;
    }
    public String execute() throws Exception {
        System.out.println("\n--------------------------\n读取中……");
        HttpServletRequest request = ServletActionContext.getRequest();
        String idr = (String) request.getSession().getAttribute("USERID");
        /*-------------------------------------*/
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/blog?characterEncoding=utf8&useSSL=true"; //URL指向访问的数据库名blog
        /*-------------------------------------*/
        String back = null;
        try {
            Class.forName(driver);                                                        //加载驱动程序
            Connection conn = DriverManager.getConnection(url,"root","");  //链接数据库
            Statement ststment = conn.createStatement();                                  //用来执行sql语言
            String sql = "Select * from user where id='"+idr+"'";
            ResultSet rs = ststment.executeQuery(sql);
            if (rs.next()) {
                this.userId = idr;
                this.password = rs.getString("password");
                this.userName = rs.getString("username");
                this.email = rs.getString("email");
                this.address = rs.getString("address");
                this.age = rs.getString("age");
                System.out.println(">>>个人信息：\n账号：" + idr + "\n密码：" + this.password +
                "\n用户名：" + this.userName + "\n邮箱：" + this.email + "\n地址：" + this.address + "\n年龄：" + this.age);
                back = "success";
            }else{
                System.out.println("读取失败！请检查网络及配置……");
                back = "fail";
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
