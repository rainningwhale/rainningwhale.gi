package cn.huzhihong.web.Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebFilter("/*")
public class LoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        resp.setCharacterEncoding("utf-8");
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");


        //0.强制转换
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;




        //1.获取资源请求路径
        String uri = request.getRequestURI();
        System.out.println(uri);
        //2.判断是否包含登录相关的资源路径
        Boolean flag1 = uri.contains("/login.jsp");
        Boolean flag2 = uri.contains("/LoginServlet");

//        Boolean flag3 = uri.contains(".css");
        Boolean flag4 = uri.contains("/CheckCodeServlet" );
//        Boolean flag5 = uri.endsWith(".js");
        System.out.println(flag1);
        System.out.println(flag2);
//        System.out.println(flag3);
        System.out.println(flag4);
//        System.out.println(flag5);



        if(uri.contains("/login.jsp") || uri.contains("/LoginServlet") ||uri.contains("/CheckCodeServlet" ) || uri.contains(".css") || uri.endsWith(".js")||uri.contains(".jpg") ){
            //包含，用户就是想登录，放行
            if(uri.endsWith(".css")){
                uri = "/day17/Interface/style.css";
            }

            System.out.println("放行");

            chain.doFilter(req,resp);
        }else {
            //不包含,需要验证用户是否登录
            //3.从获取session中获取user
            System.out.println("不包含");
            Object user = request.getSession().getAttribute("loginuser");
            if(user != null){
                //登录放行
                System.out.println("登录过来..");
                chain.doFilter(req,resp);
            }else {
                //没有登录，跳转页面
                System.out.println("登录");
                request.setAttribute("login_msg","您尚未登录，请先登录");
//                response.sendRedirect(request.getContextPath()+"/Interface/login.jsp");;
//                request.getRequestDispatcher("/Interface/login.jsp").forward(request,resp);
                PrintWriter out = resp.getWriter();
                out.flush();
                out.print("<script>");
                out.print("alert('请先登录！');");
                out.print("location.href='/day17/Interface/login.jsp';");
                out.print("</script>");
                out.close();


            }
        }

    }

    public void init(FilterConfig config) throws ServletException {

    }

}
