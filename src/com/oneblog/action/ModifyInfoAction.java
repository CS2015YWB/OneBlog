package com.oneblog.action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import jdk.nashorn.internal.objects.annotations.Getter;
import jdk.nashorn.internal.objects.annotations.Setter;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.sql.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ModifyInfoAction extends ActionSupport{
    private String userId;
    private String password;
    private String userName;
    private String email;
    private String address;
    private String age;
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
    @Getter
    public String getMessage() {
        return message;
    }
    @Setter
    public void setMessage(String message) {
        this.message = message;
    }

    //判断邮箱是否合法
    public static boolean isEmail(String string) {
        if (string == null)
            return false;
        String regEx1 = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
        Pattern p;
        Matcher m;
        p = Pattern.compile(regEx1);
        m = p.matcher(string);
        if (m.matches())
            return true;
        else
            return false;
    }

    public String execute() throws Exception {
        System.out.println("\n--------------------------\n信息修改中……");
        HttpServletRequest request = ServletActionContext.getRequest();
        String idr = (String) request.getSession().getAttribute("USERID");
        /*-------------------------------------*/
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/blog?characterEncoding=utf8&useSSL=true"; //URL指向访问的数据库名blog
        /*-------------------------------------*/
        String uname = this.getUserName();
        String pwd = this.getPassword();
        String e_mail = this.getEmail();
        String ads = this.getAddress();
        String age = this.getAge();
        String back = null;
        if (uname.length()>10 || uname.length() <3){
            System.out.println("用户名修改不合法！");
            this.message = "用户名修改不合法！";
            back = "fail";
        }else if (pwd.length()<3 || pwd.length() > 16) {
            System.out.println("密码太长或太短，请重新输入！");
            this.message = "密码太长或太短，请重新输入！";
            back = "fail";
        }else if (!isEmail(e_mail)) {
            System.out.println("邮箱格式错误！");
            this.message = "邮箱格式错误！";
            back = "fail";
        }else{
            try {
                Class.forName(driver);                                                        //加载驱动程序
                Connection conn = DriverManager.getConnection(url,"root","");  //链接数据库
                Statement ststment = conn.createStatement();                                  //用来执行sql语言
                String sql="UPDATE user SET password=?, username=?, email=?, address=?, age=?" + " where id="+idr;
                PreparedStatement pstat = conn.prepareStatement(sql);
                this.userId = idr;
                pstat.setString(1, pwd);
                pstat.setString(2, uname);
                pstat.setString(3, e_mail);
                pstat.setString(4, ads);
                pstat.setString(5, age);
                pstat.executeUpdate();
                ResultSet rs =  pstat.executeQuery("select * from user where id='"+idr+"'");
                if (rs.next()) {
                    /*-----------------更新 Session ----------------*/
                    ActionContext.getContext().getSession().put("USERNAME",rs.getString(3));

                    System.out.println(">>>修改后的个人信息：\n账号：" + this.userId + "\n密码：" + rs.getString(1) +
                            "\n用户名：" + rs.getString(2) + "\n邮箱：" + rs.getString(3) + "\n地址：" + rs.getString(4)+ "\n年龄：" + rs.getString(5));
                    this.message = "修改成功！";
                    back = "success";
                }else{
                    this.message = "修改个人信息失败！请重试！";
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
        }
        return back;
    }
}
