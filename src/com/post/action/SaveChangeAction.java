package com.post.action;

import com.opensymphony.xwork2.ActionSupport;
import jdk.nashorn.internal.objects.annotations.Getter;
import jdk.nashorn.internal.objects.annotations.Setter;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.sql.*;

public class SaveChangeAction extends ActionSupport {
    private String saveId;
    private String title;
    private String editorhtml;
    private String testeditormdmarkdowndoc;
    @Getter
    public String getSaveId() {
        return saveId;
    }
    @Setter
    public void setSaveId(String saveId) {
        this.saveId = saveId;
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
    public String getEditorhtml() {
        return editorhtml;
    }
    @Setter
    public void setEditorhtml(String editorhtml) {
        this.editorhtml = editorhtml;
    }
    @Getter
    public String getTesteditormdmarkdowndoc() {
        return testeditormdmarkdowndoc;
    }
    @Setter
    public void setTesteditormdmarkdowndoc(String testeditormdmarkdowndoc) {
        this.testeditormdmarkdowndoc = testeditormdmarkdowndoc;
    }

    public String execute() throws Exception {
        System.out.println("\n-------------------------\n博文保存中……");
        /*-------------------------------------*/
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/blog?characterEncoding=utf8&useSSL=true"; //URL指向访问的数据库名blog
        /*-------------------------------------*/
        String pid = this.getSaveId();
        String ttl = this.getTitle();
        String mdtext = this.getTesteditormdmarkdowndoc();
        String edithtml = this.getEditorhtml();
        String back = null;
        try {
            Class.forName(driver);                                                        //加载驱动程序
            Connection conn = DriverManager.getConnection(url,"root","");  //链接数据库
            Statement ststment = conn.createStatement();                                  //用来执行sql语言
            String sql="UPDATE post SET title=?, md=?, content=?" + " where id="+pid;
            PreparedStatement pstat = conn.prepareStatement(sql);
            pstat.setString(1, ttl);
            pstat.setString(2, mdtext);
            pstat.setString(3, edithtml);
            pstat.executeUpdate();
            System.out.println("修改成功！");
            back = "success";
            pstat.close();
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