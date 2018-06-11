package com.post.action;
import com.opensymphony.xwork2.ActionSupport;
import jdk.nashorn.internal.objects.annotations.Getter;
import jdk.nashorn.internal.objects.annotations.Setter;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.sql.*;

public class EditAction extends ActionSupport{
    private String title;
    private String editorhtml;
    @Getter
    public String getTitle() {
        return title;
    }
    @Setter
    public void setTitle(String title) {
        this.title = title;
    }
    @Getter
    public String getEditorhtml() {
        return editorhtml;
    }
    @Setter
    public void setEditorhtml(String editorhtml) {
        this.editorhtml = editorhtml;
    }
    public String execute() throws Exception {
        System.out.println("\n-------------------------\n博文保存中……");
        /*-------------------------------------*/
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/blog?characterEncoding=utf8&useSSL=true"; //URL指向访问的数据库名blog
        /*-------------------------------------*/
        String ttl = this.getTitle();
        String edithtml = this.getEditorhtml();
        HttpServletRequest request = ServletActionContext.getRequest();
        String idr = (String) request.getSession().getAttribute("USERID");
        String back = null;
        try {
            Class.forName(driver);                                                        //加载驱动程序
            Connection conn = DriverManager.getConnection(url,"root","");  //链接数据库
            System.out.println("数据库连接成功……");
            String sql="INSERT INTO post" + "(title,content,uid)VALUES(?,?,?)";
            PreparedStatement pstat = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pstat.setString(1, ttl);
            pstat.setString(2, edithtml);
            pstat.setString(3, idr);
            pstat.executeUpdate();
            ResultSet rs = pstat.getGeneratedKeys();
            if (rs.next()) {
                back = "success";
            }else{
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
        return back;
    }
}
