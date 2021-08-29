package cn.huzhihong.service.Impl;

import cn.huzhihong.dao.Impl.UserDaoImpl;
import cn.huzhihong.dao.UserDao;
import cn.huzhihong.domain.Login;
import cn.huzhihong.domain.PageBean;
import cn.huzhihong.domain.User;
import cn.huzhihong.service.UserService;

import java.util.List;
import java.util.Map;

public class UserServiceImpl implements UserService {

    private UserDao dao = new UserDaoImpl();
    @Override
    public List<User> findAll() {

        //调用Dao完成查询
        return dao.findAll();
    }

    @Override
    public Login loginu(Login login){
        return dao.findUserByUsernameAndPassword(login.getUsername(),login.getPassword());

    }

    @Override
    public void addUser(User user) {
        dao.add(user);


    }

    @Override
    public void deleteUser(String id) {
        dao.delete(Integer.parseInt(id));
    }

    @Override
    public User findUserByid(String id) {

        return dao.findById(Integer.parseInt(id));
    }

    @Override
    public void UpdateUser(User user) {
        dao.Update(user);
    }

    @Override
    public void DelSelectedUser(String[] ids) {
        //1.遍历数组

        for (String id : ids) {
            //2.调用dao删除
            dao.delete(Integer.parseInt(id));
        }
    }

    @Override
    public PageBean<User> findUserByPage(String _currentPage, String _rows, Map<String, String[]> condition) {

        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);
        if(currentPage < 1){
            currentPage = 1;
        }
//        System.out.println(currentPage);

        //1.创建空的PageBean对象
        PageBean<User> pb = new PageBean<User>();
        //2.设置参数
        pb.setCurrentPage(currentPage);
        pb.setRows(rows);

        //3.调用dao查询总记录数
        int totalCount = dao.findTotalCount(condition);
        pb.setTotalCount(totalCount);

        //4.调用dao查询list集合
        //计算开始的记录索引
        int start = (currentPage - 1) * rows;
        List<User> list = dao.findByPage(start,rows,condition);
        pb.setList(list);

        //5.计算总页码
        int totalPage = totalCount % rows == 0 ? totalCount/rows : totalCount/rows + 1;
        pb.setTotalPage(totalPage);
        if(currentPage >= totalPage){
            pb.setCurrentPage(totalPage );
        }

        return pb;

    }


}
