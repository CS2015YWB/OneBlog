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
    private String Comment;
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
    @Getter
    public String getComment() {
        return Comment;
    }
    @Setter
    public void setComment(String comment) {
        Comment = comment;
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
                this.count = rs.getInt("count") + 1;
                this.zan = rs.getInt("zan");
            }
            pstmt.close();
            rs.close();
            String sql2="SELECT * FROM user WHERE user.id IN (SELECT uid FROM post WHERE post.id = " + pid +")";  //嵌套查询
            pstmt = conn.prepareStatement(sql2);
            rs = pstmt.executeQuery();
            while (rs.next()){
                this.author = rs.getString("username");
            }
            pstmt.close();
            String sql3="UPDATE post SET count=?" + " where id="+pid;
            pstmt = conn.prepareStatement(sql3);
            pstmt.setInt(1, count);
            pstmt.executeUpdate();
            this.Comment = "<!-- 来必力City版安装代码 -->\n" +
                    "            <div id='lv-container' data-id='city' data-uid='MTAyMC8yODk0My81NTEy'>\n" +
                    "                <script type='text/javascript'>\n" +
                    "                    window.livereOptions = {" +
                    "                         refer:'http://localhost:8080/fullText.action?postId=" + pid + "' " +
                    "                       };" +
                    "                    (function(d, s) {\n" +
                    "                        var j, e = d.getElementsByTagName(s)[0];\n" +
                    "\n" +
                    "                        if (typeof LivereTower === 'function') { return; }\n" +
                    "\n" +
                    "                        j = d.createElement(s);\n" +
                    "                        j.src = 'https://cdn-city.livere.com/js/embed.dist.js';\n" +
                    "                        j.async = true;\n" +
                    "\n" +
                    "                        e.parentNode.insertBefore(j, e);\n" +
                    "                    })(document, 'script');\n" +
                    "                </script>\n" +
                    "                <noscript>为正常使用来必力评论功能请激活JavaScript</noscript>\n" +
                    "            </div>\n" +
                    "            <!-- City版安装代码已完成 -->";
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