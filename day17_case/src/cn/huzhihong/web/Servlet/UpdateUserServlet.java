package cn.huzhihong.web.Servlet;

import cn.huzhihong.domain.User;
import cn.huzhihong.service.Impl.UserServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;
import java.util.Set;

@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //1.设置编码
        request.setCharacterEncoding("utf-8");
        //2.获取表单数据
        Map<String, String[]> map = request.getParameterMap();



        for (Map.Entry<String, String[]> entry : map.entrySet()) {
            String k = entry.getKey();
            String[] v = entry.getValue();
            System.out.println("Key: " + k + ", Value: " + v);

        }
        //3.封装User对象
        User user = new User();
        try {
            BeanUtils.populate(user,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        //4.调用service完成修改
        UserServiceImpl service = new UserServiceImpl();
        service.UpdateUser(user);

        //5.跳转到查询页面
        response.sendRedirect(request.getContextPath()+"/FindUserByPageServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
