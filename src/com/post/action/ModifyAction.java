package com.post.action;

import com.opensymphony.xwork2.ActionSupport;
import jdk.nashorn.internal.objects.annotations.Getter;
import jdk.nashorn.internal.objects.annotations.Setter;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.sql.*;

public class ModifyAction extends ActionSupport {
    private String modifyId;
    private String title;
    private String md;
    private String mid;
    @Getter
    public String getMid() {
        return mid;
    }
    @Setter
    public void setMid(String mid) {
        this.mid = mid;
    }
    @Getter
    public String getModifyId() {
        return modifyId;
    }
    @Setter
    public void setModifyId(String modifyId) {
        this.modifyId = modifyId;
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
    public String getMd() {
        return md;
    }
    @Setter
    public void setMd(String md) {
        this.md = md;
    }
    @Override
    public String execute() throws Exception {
        System.out.println("\n-------------------------\n修改中……");
        /*-------------------------------------*/
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/blog?characterEncoding=utf8&useSSL=true"; //URL指向访问的数据库名blog
        /*-------------------------------------*/
        String back = null;
        String pid = this.getModifyId();
        this.mid = pid;
        StringBuffer block = new StringBuffer();
        try {
            Class.forName(driver);                                                        //加载驱动程序
            Connection conn = DriverManager.getConnection(url,"root","");  //链接数据库
            System.out.println("数据库连接成功……");
            Statement ststment = conn.createStatement();                                  //用来执行sql语言
            String sql="Select * from post where id='"+pid+"'";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                this.title = rs.getString("title");
                this.md = rs.getString("md");
                System.out.println("Title：" + this.title);
                System.out.println("Md：" + this.md);
                System.out.println("查询成功");
                back = "success";
            }
            pstmt.close();
            rs.close();
            conn.close();
        } catch(Exception e){
            e.printStackTrace();
        }
        return back;
    }
}
