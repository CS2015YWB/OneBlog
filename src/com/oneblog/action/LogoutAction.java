package com.oneblog.action;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;
import jdk.nashorn.internal.objects.annotations.Getter;
import jdk.nashorn.internal.objects.annotations.Setter;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutAction extends ActionSupport{
    @Override
    public String execute() throws Exception {
        String back= null;
        //清空session
        ActionContext.getContext().getSession().clear();
        //使HttpSession失效
        ServletActionContext.getRequest().getSession().invalidate();
        //清除Cookie
        System.out.println(">>> 清除 Session!");
        HttpServletRequest request = ServletActionContext.getRequest();
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (int i=0; i<cookies.length; i++) {
                cookies[i].setMaxAge(0);
                HttpServletResponse response = ServletActionContext.getResponse();
                response.addCookie(cookies[i]);
            }
            System.out.println(">>> 清除 Cookies!");
        }
        System.out.println(">>> 一位用户退出系统");
        back= "success";
        return back;
    }
}