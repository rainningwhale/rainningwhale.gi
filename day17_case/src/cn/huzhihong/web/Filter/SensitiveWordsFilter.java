package cn.huzhihong.web.Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.List;

@WebFilter("/*")
public class SensitiveWordsFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
       //1.创建代理对象，增强getParameter方法
        System.out.println("进入filter");
        ServletRequest proxy_req = (ServletRequest)Proxy.newProxyInstance(req.getClass().getClassLoader(), req.getClass().getInterfaces(), new InvocationHandler() {


            @Override

            public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                //增强getParameter方法
                //判断是否是getparameter方法

                System.out.println("能不能进来");
                if(method.getName().equals("getParameter")){
                    //1.增强返回值
                    //2.获取返回值
                    System.out.println("hello...");
                    String  value = (String) method.invoke(req, args);
                    if(value != null){
                        for (String str : list) {
                            if(value.contains(str)){
                                value = value.replaceAll(str,"***");
                            }
                        }
                    }
                    return value;
                }
                return method.invoke(req,args);
            }
        });


        chain.doFilter(proxy_req, resp);
    }

    private List<String > list = new ArrayList<String>(); //敏感词汇集合
    public void init(FilterConfig config) throws ServletException {
        //1.获取文件真实路径
        try {
            ServletContext servletContext = config.getServletContext();
            String realPath = servletContext.getRealPath("/WEB-INF/classes/SensitiveWords.txt");
            //2.读取文件
            BufferedReader br = new BufferedReader(new FileReader(realPath));
            //3.将文件的每一行数据添加到list中
            String line = null;
            while ((line = br.readLine())!=null){
                list.add(line);
            }

            br.close();
            System.out.println(list);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
        }

    }

}
