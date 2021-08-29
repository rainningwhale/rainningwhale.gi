package cn.huzhihong.service;


import cn.huzhihong.domain.Login;
import cn.huzhihong.domain.PageBean;
import cn.huzhihong.domain.User;

import java.util.List;
import java.util.Map;

/**
 * 用户管理的业务接口
 */
public interface UserService {

    /**
     * 查询所有用户信息
     * @return
     */
    public List<User> findAll();

    Login loginu(Login login);

    /**
     * 保存对象
     * @param user
     */
    void addUser(User user);

    /**
     * 根据id删除
     * @param id
     */

    void deleteUser(String id);

    User findUserByid(String id);

    void UpdateUser(User user);

    void DelSelectedUser(String[] ids);

    /**
     * 分页查询
     * @param _currentPage
     * @param _rows
     * @param condition
     * @return
     */
    PageBean<User> findUserByPage(String _currentPage, String _rows, Map<String, String[]> condition);
}
