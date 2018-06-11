package com.post.action;
import com.opensymphony.xwork2.ActionSupport;
import jdk.nashorn.internal.objects.annotations.Getter;
import jdk.nashorn.internal.objects.annotations.Setter;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.sql.*;
import java.util.*;

public class FullTextAction extends ActionSupport{
    private String postId;
    private String title;
    private String author;
    private String publishTime;
    private int count;
    private String bowen;
    private int zan;
    @Getter
    public String getPostId() {
        return postId;
    }
    @Setter
    public void setPostId(String postId) {
        this.postId = postId;
    }
    @Getter
    public String getTitle() {
        return title;
    }
    @Setter
    public void setTitle(String title) {
        this.title = title;
    }
    @Getter
    public String getAuthor() {
        return author;
    }
    @Setter
    public void setAuthor(String author) {
        this.author = author;
    }
    @Getter
    public String getPublishTime() {
        return publishTime;
    }
    @Setter
    public void setPublishTime(String publishTime) {
        this.publishTime = publishTime;
    }
    @Getter
    public int getCount() {
        return count;
    }
    @Setter
    public void setCount(int count) {
        this.count = count;
    }
    @Getter
    public String getBowen() {
        return bowen;
    }
    @Setter
    public void setBowen(String bowen) {
        this.bowen = bowen;
    }
    @Getter
    public int getZan() {
        return zan;
    }
    @Setter
    public void setZan(int zan) {
        this.zan = zan;
    }

    @Override
    public String execute() throws Exception {
        System.out.println("\n-------------------------\n我的文档集加载中……");
        /*-------------------------------------*/
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/blog?characterEncoding=utf8&useSSL=true"; //URL指向访问的数据库名blog
        /*-------------------------------------*/
        String back = null;
        String pid = this.getPostId();
        try {
            Class.forName(driver);                                                        //加载驱动程序
            Connection conn = DriverManager.getConnection(url,"root","");  //链接数据库
            System.out.println("数据库连接成功……");
            Statement ststment = conn.createStatement();                                  //用来执行sql语言
            String sql1="Select * from post where id='"+pid+"'";
            PreparedStatement pstmt = conn.prepareStatement(sql1);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){
                this.title = rs.getString("title");
                this.bowen = rs.getString("content");
                this.publishTime = rs.getString("publishtime");
                this.author = rs.getString("uid");
                this.count = rs.getInt("count") + 1;
                this.zan = rs.getInt("zan");
            }
            pstmt.close();
            String sql2="UPDATE post SET count=?" + " where id="+pid;
            pstmt = conn.prepareStatement(sql2);
            pstmt.setInt(1, count);
            pstmt.executeUpdate();
            back = "success";
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