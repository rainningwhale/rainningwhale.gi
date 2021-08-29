package cn.huzhihong.web.Servlet;

import cn.huzhihong.domain.User;
import cn.huzhihong.service.Impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/findUserServlet")
public class findUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //1.获取id
        String id = request.getParameter("id");
        //2.调用Service查询
        UserServiceImpl service = new UserServiceImpl();
        User user = service.findUserByid(id);

        //3.将User存入reques
        request.setAttribute("user",user);
        //4.转发到update
        request.getRequestDispatcher("update.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
