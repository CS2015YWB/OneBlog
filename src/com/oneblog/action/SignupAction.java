package com.oneblog.action;
import java.sql.*;
import java.util.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import jdk.nashorn.internal.objects.annotations.Getter;
import jdk.nashorn.internal.objects.annotations.Setter;
import org.apache.struts2.ServletActionContext;


public class SignupAction extends ActionSupport{
    private String userName;
    private String password1;
    private String password2;
    private String message;
    @Getter
    public String getUserName() {
        return userName;
    }
    @Setter
    public void setUserName(String userName) {
        this.userName = userName;
    }
    @Getter
    public  String getPassword1() {
        return password1;
    }
    @Setter
    public void setPassword1(String password1) {
        this.password1 = password1;
    }
    @Getter
    public  String getPassword2() {
        return password2;
    }
    @Setter
    public void setPassword2(String password2) {
        this.password2 = password2;
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
        System.out.println("\n-------------------------\n注册中……");
        /*-------------------------------------*/
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/blog?characterEncoding=utf8&useSSL=true"; //URL指向访问的数据库名blog
        /*-------------------------------------*/
        String uname = this.getUserName();
        String pwd1 = this.getPassword1();
        String pwd2 = this.getPassword2();
        System.out.println("参数：" + uname + "\t" + pwd1 + "\t" + pwd2);
        String back = null;
        if (!pwd1.equals(pwd2)){
            System.out.println("两次密码输入不一致！");
            this.setMessage("两次密码输入不一致！");
            back = "error";
        }else if (pwd1.equals(pwd2) && (pwd1.length() >16 || pwd1.length() <3)) {
            System.out.println("密码太长或太短，请重新输入！");
            this.setMessage("密码太长或太短，请重新输入！");
            back = "error";
        }else if (uname.length() > 10) {
            System.out.println("用户名字符位数超限！");
            this.setMessage("用户名字符位数超限！");
            back = "error";
        }else if (uname.length() < 3) {
            System.out.println("用户名字符位数不足！");
            this.setMessage("用户名字符位数不足！");
            back = "error";
        }else{
            try {
                System.out.println("恭喜！密码输入正确！");
                Class.forName(driver);                                                        //加载驱动程序
                Connection conn = DriverManager.getConnection(url,"root","");  //链接数据库
                System.out.println("数据库连接成功……");
                String sql="INSERT INTO user" + "(password,username)VALUES(?,?)";
                PreparedStatement pstat = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                pstat.setString(1, pwd1);
                pstat.setString(2, uname);
                pstat.executeUpdate();
                ResultSet rs = pstat.getGeneratedKeys();
                if (rs.next()) {
                    int key = rs.getInt(1);
                    System.out.println("用户名：" + userName + "\t" + "ID："+key);
                    ServletActionContext.getRequest().setAttribute("idnumber",key);
                    back = "success";
                }else{
                    this.setMessage("出错啦！");
                    System.out.println("出错啦！");
                    back = "error";
                }
                rs.close();
                conn.close();
            }catch(ClassNotFoundException e){
                System.out.println("No Drive!");
                e.printStackTrace();
            } catch(Exception e){
                e.printStackTrace();
            }
        }
        return back;
    }
}

