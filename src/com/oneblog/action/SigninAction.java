package com.oneblog.action;
import java.sql.*;
import com.opensymphony.xwork2.ActionSupport;
import jdk.nashorn.internal.objects.annotations.Getter;
import jdk.nashorn.internal.objects.annotations.Setter;
import org.apache.struts2.ServletActionContext;


public class SigninAction extends ActionSupport {
    private String userId;
    private String password;
    @Getter
    public String getUserId() {
        System.out.println(userId);
        return userId;
    }
    @Setter
    public void setUserId(String userId) {
        this.userId = userId;
    }
    @Getter
    public String getPassword() {
        System.out.println(password);
        return password;
    }
    @Setter
    public void setPassword(String password) {
        this.password = password;
    }
    @Override
    public String execute() throws Exception {
        System.out.println("登录中……");
        /*-------------------------------------*/
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/blog?characterEncoding=utf8&useSSL=true"; //URL指向访问的数据库名blog
        /*-------------------------------------*/
        String idr = this.getUserId();
        String pwd = this.getPassword();
        String back = null;
        try {
            Class.forName(driver);                                                        //加载驱动程序
            Connection conn = DriverManager.getConnection(url,"root","");  //链接数据库
            Statement ststment = conn.createStatement();                                  //用来执行sql语言
            String sql = "Select * from user where id='"+idr+"' and password='"+pwd+"'";
            System.out.println("请求参数：" + idr + "\t" + pwd);
            ResultSet rs = ststment.executeQuery(sql);
            if (rs.next()) {
                String username = rs.getString("username");
                ServletActionContext.getRequest().setAttribute("username", username);
                back = "success";
            }else{
                System.out.println("输入有误,请重新输入!");
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
