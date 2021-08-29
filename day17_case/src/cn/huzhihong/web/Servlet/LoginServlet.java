package cn.huzhihong.web.Servlet;

import cn.huzhihong.domain.Login;
import cn.huzhihong.service.Impl.UserServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.Collection;
import java.util.Map;
import java.util.Set;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //1.设置编码
//        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
//        response.setContentType("text/html;charset=utf-8");
//           response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");

        //2.获取数据
        //2.1获取用户填写的验证码
        String checkcode = request.getParameter("checkcode");


        //3.验证码校验
        HttpSession session = request.getSession();
        String checkCode_session = (String) session.getAttribute("checkCode_session");
        System.out.println(checkCode_session+">>>>>>>>>>>>>>>>>>>");
        session.removeAttribute("checkCode_session"); //确保验证码一次性

        if( (checkCode_session == null) || !(checkCode_session.equalsIgnoreCase(checkcode))){
            //验证码不正确
            //提示信息
            System.out.println(checkcode);
            System.out.println("|||||||||||||");
            System.out.println(checkCode_session);
            request.setAttribute("login_msg","验证码错误");
            //跳转登录页面
//            request.getRequestDispatcher("/login.jsp").forward(request,response);
            PrintWriter out = response.getWriter();
            out.flush();
            out.print("<script type='text/javascript'>alert('验证码错误');");
            out.print("location.href='/day17/Interface/login.jsp';");
            out.print("</script>");
            out.close();
        }


//        Map<String, String[]> map = request.getParameterMap();
//        Set<String> keySet = map.keySet();
//        for (String s : keySet) {
//            System.out.println("key:"+s);
//        }
//
//        Collection<String[]> values = map.values();
//        for (String[] value : values) {
//            System.out.println("value:"+value);
//        }
//        for (Map.Entry<String, String[]> entry : map.entrySet()) {
//            String k = entry.getKey();
//            String[] v = entry.getValue();
//            System.out.println("Key: " + k + ", Value: " + v);
//
//        }
        String username = request.getParameter("username");
        String password = request.getParameter("password");



        //3.封装用户对象
        Login login = new Login();

//        try {
//            BeanUtils.populate(login,map);
//        } catch (IllegalAccessException e) {
//            e.printStackTrace();
//        } catch (InvocationTargetException e) {
//            e.printStackTrace();
//        }
        login.setUsername(username);
        login.setPassword(password);
        System.out.println("1111111111111111");

        //5.调用Service查询
        UserServiceImpl service = new UserServiceImpl();
        Login loginuser = service.loginu(login);
        //6.判断是否登录成功
        if(loginuser != null){
            //登录成功
            //将用户存入session
            session.setAttribute("loginuser",login);

            //跳转页面
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        }
            else{
                //登录失败
                //提示信息
                request.setAttribute("login_msg","用户名或密码错误");
                //跳转登录页面
            PrintWriter out = response.getWriter();
            out.flush();
            out.print("<script type='text/javascript'>alert('用户名或密码错误');");
            out.print("location.href='/day17/Interface/login.jsp';");
            out.print("</script>");
            out.close();
//                request.getRequestDispatcher("/Interface/login.jsp").forward(request,response);
            }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
