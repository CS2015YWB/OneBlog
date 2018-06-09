package com.post.action;
import com.opensymphony.xwork2.ActionSupport;
import jdk.nashorn.internal.objects.annotations.Getter;
import jdk.nashorn.internal.objects.annotations.Setter;

import java.sql.*;

public class DisplayAction extends ActionSupport{
    private String displayBlock;
    @Getter
    public String getDisplayBlock() {
        return displayBlock;
    }
    @Setter
    public void setDisplayBlock(String displayBlock) {
        this.displayBlock = displayBlock;
    }
    @Override
    public String execute() throws Exception {
        System.out.println("\n-------------------------\n首页加载中……");
        /*-------------------------------------*/
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/blog?characterEncoding=utf8&useSSL=true"; //URL指向访问的数据库名blog
        /*-------------------------------------*/
        String back = null;
        try {
            Class.forName(driver);                                                        //加载驱动程序
            Connection conn = DriverManager.getConnection(url,"root","");  //链接数据库
            System.out.println("数据库连接成功……");
            Statement ststment = conn.createStatement();                                  //用来执行sql语言
            String sql="SELECT * FROM post";
            ResultSet rs = ststment.executeQuery(sql);
            String id, title, content, publishtime, uid;
            int count;
            while(rs.next()){
                id = rs.getString("id");
                title = rs.getString("title");
                content = rs.getString("content");
                publishtime = rs.getString("publishtime");
                uid = rs.getString("uid");
                count = rs.getInt("count");
                this.displayBlock = "<div><p>" + id + "</p><p>" + title + "</p><p>" +
                        content + "</p><p>" + publishtime + "</p><p>" + uid + "</p><p>" +
                        count + "</p></div>";
                back = "success";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return back;
    }
}
