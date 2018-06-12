package com.post.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import jdk.nashorn.internal.objects.annotations.Getter;
import jdk.nashorn.internal.objects.annotations.Setter;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.sql.*;

public class SearchAction extends ActionSupport {
    private String searchText;
    private StringBuffer searchDisplayBlock;
    @Getter
    public String getSearchText() {
        return searchText;
    }
    @Setter
    public void setSearchText(String searchText) {
        this.searchText = searchText;
    }
    @Getter
    public StringBuffer getSearchDisplayBlock() {
        return searchDisplayBlock;
    }
    @Setter
    public void setSearchDisplayBlock(StringBuffer searchDisplayBlock) {
        this.searchDisplayBlock = searchDisplayBlock;
    }
    @Override
    public String execute() throws Exception {
        System.out.println("\n-------------------------\n查询中……");
        /*-------------------------------------*/
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/blog?characterEncoding=utf8&useSSL=true"; //URL指向访问的数据库名blog
        /*-------------------------------------*/
        String search = this.getSearchText();
        System.out.println("查询内容：" + search);
        String back = null;
        StringBuffer block = new StringBuffer();
        try {
            Class.forName(driver);                                                        //加载驱动程序
            Connection conn = DriverManager.getConnection(url,"root","");  //链接数据库
            System.out.println("数据库连接成功……");
            Statement ststment = conn.createStatement();                                  //用来执行sql语言
            String sql="Select * from post where title like ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + search + "%");
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
                block.append("             <div class='col-md-10' style='margin: 20px 60px 10px 60px'>\n");
                block.append("                 <div class='thumbnail'>\n");
                block.append("                      <div class='caption'>\n");
                block.append("                          <h3>" + title[i] + "</h3>\n");
                block.append("                          <p>作者：" + uid[i] + "\t时间："+ publishtime[i] + "\t阅读量：" + count[i] + "</p>\n");
                block.append("                          <p class='yuedu1'><a href='fullText.action?postId=" + id[i] + "' class='btn btn-primary yuedu2' role='button'>阅读全文</a></p>\n");
                block.append("                      </div>\n");
                block.append("                 </div>\n");
                block.append("             </div>");
            }
            System.out.println("查询成功！");
            ActionContext.getContext().getSession().put("FAIL","");
            this.searchDisplayBlock = block;
            System.out.println("this.searchDisplayBlock\n" + this.searchDisplayBlock);
            System.out.println(block);
            back = "success";
            if (block.toString().equals("")){
                System.out.println("未查询到任何相关文章！");
                block.append("             <div class='alert alert-danger' role='alert' style='position: relative; top: 230px'>");
                block.append("                  <p align='center' style='font-size: xx-large; font-family: 汉仪黑荔枝体简'> 抱歉，暂时没有您要查询的相关文章！</p>");
                block.append("             </div>");
                this.searchDisplayBlock = block;
                back = "fail";
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
