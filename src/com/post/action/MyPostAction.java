package com.post.action;
import com.opensymphony.xwork2.ActionSupport;
import jdk.nashorn.internal.objects.annotations.Getter;
import jdk.nashorn.internal.objects.annotations.Setter;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.sql.*;
import java.util.*;

public class MyPostAction extends ActionSupport{
    private StringBuffer myDisplayBlock;
    @Getter
    public StringBuffer getMyDisplayBlock() {
        return myDisplayBlock;
    }
    @Setter
    public void setMyDisplayBlock(StringBuffer myDisplayBlock) {
        this.myDisplayBlock = myDisplayBlock;
    }
    @Override
    public String execute() throws Exception {
        System.out.println("\n-------------------------\n我的文档集加载中……");
        HttpServletRequest request = ServletActionContext.getRequest();
        String idr = (String) request.getSession().getAttribute("USERID");
        /*-------------------------------------*/
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/blog?characterEncoding=utf8&useSSL=true"; //URL指向访问的数据库名blog
        /*-------------------------------------*/
        String back = null;
        StringBuffer block = new StringBuffer();
        try {
            Class.forName(driver);                                                        //加载驱动程序
            Connection conn = DriverManager.getConnection(url,"root","");  //链接数据库
            System.out.println("数据库连接成功……");
            Statement ststment = conn.createStatement();                                  //用来执行sql语言
            String sql="Select * from post where uid='"+idr+"'";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            rs.last();                            //移至最后一条记录
            int rowCount = rs.getRow();           //获得ResultSet的总行数
            ResultSetMetaData rsmd = rs.getMetaData() ;
            int colCount = rsmd.getColumnCount(); //获得ResultSet的总列数
            System.out.println("行数：" + rowCount + "\t" + "列数：" + colCount);
            rs.beforeFirst();                     //移至第一条记录之前
            String[] id = new String[rowCount];
            String[] title = new String[rowCount];
            String[] content = new String[rowCount];
            String[] publishtime = new String[rowCount];
            String[] uid = new String[rowCount];
            String[] count = new String[rowCount];
            String[] zan = new String[rowCount];
            int list = 0;
            while(rs.next()){
                id[list] = rs.getString("id");
                title[list] = rs.getString("title");
                content[list] = rs.getString("content");
                publishtime[list] = rs.getString("publishtime");
                uid[list] = rs.getString("uid");
                count[list] = rs.getString("count");
                zan[list] = rs.getString("zan");
                list++;
            }
            for (int i=0; i<list; i++){
                block.append("             <div class='col-md-3' style='margin: 20px 50px 10px 50px'>\n");
                block.append("                 <div class='thumbnail'>\n");
                block.append("                      <div class='caption'>\n");
                block.append("                          <h3>" + title[i] + "</h3>\n");
                block.append("                          <p>作者：" + uid[i] + "\t时间："+ publishtime[i] + "\t阅读量：" + count[i] + "</p>\n");
                block.append("                          <p class='yuedu1'><a href='fullText.action?postId=" + id[i] + "' class='btn btn-primary yuedu2' role='button'>阅读全文</a></p>\n");
                block.append("                      </div>\n");
                block.append("                 </div>\n");
                block.append("             </div>");
            }
            this.myDisplayBlock = block;
            System.out.println("this.displayBlock\n" + this.myDisplayBlock);
            ServletActionContext.getRequest().setAttribute("bowenblock", block);
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
