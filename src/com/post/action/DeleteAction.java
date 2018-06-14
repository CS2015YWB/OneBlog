package com.post.action;

import com.opensymphony.xwork2.ActionSupport;
import jdk.nashorn.internal.objects.annotations.Getter;
import jdk.nashorn.internal.objects.annotations.Setter;

import java.sql.*;

public class DeleteAction extends ActionSupport {
    private String deleteId;
    @Getter
    public String getDeleteId() {
        return deleteId;
    }
    @Setter
    public void setDeleteId(String deleteId) {
        this.deleteId = deleteId;
    }
    @Override
    public String execute() throws Exception {
        System.out.println("\n-------------------------\n删除中……");
        /*-------------------------------------*/
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/blog?characterEncoding=utf8&useSSL=true"; //URL指向访问的数据库名blog
        /*-------------------------------------*/
        String pid = this.getDeleteId();
        System.out.println("删除文章ID：" + this.getDeleteId());
        String back = null;
        try {
            Class.forName(driver);                                                        //加载驱动程序
            Connection conn = DriverManager.getConnection(url,"root","");  //链接数据库
            System.out.println("数据库连接成功……");
            Statement ststment = conn.createStatement();                                  //用来执行sql语言
            String sql="DELETE FROM post where id =" + pid;
            PreparedStatement pstmt = conn.prepareStatement(sql);
            int rs = pstmt.executeUpdate();
            if (rs == 1) {
                back = "success";
                System.out.println("删除成功！");
            } else {
                back = "fail";
                System.out.println("删除失败！");
            }
            pstmt.close();
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
