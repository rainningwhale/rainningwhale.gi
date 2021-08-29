package cn.huzhihong.web.Servlet;

import cn.huzhihong.service.Impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DelSelectedServlet")
public class DelSelectedServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //1.获取所有id
        String[] ids = request.getParameterValues("uid");
        //2.调用Service删除
        UserServiceImpl service = new UserServiceImpl();
        service.DelSelectedUser(ids);

        //3.跳转查询页面
        response.sendRedirect(request.getContextPath()+"/FindUserByPageServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
