package cn.huzhihong.dao;


import cn.huzhihong.domain.Login;
import cn.huzhihong.domain.User;

import java.util.List;
import java.util.Map;

/**
 * 用户操作的Dao
 */
public interface UserDao {
    public List<User> findAll();

    Login findUserByUsernameAndPassword(String username, String password);

    void add(User user);

    void delete(int parseInt);

    User findById(int id);

    void Update(User user);

    /**
     * 查询总记录数方法
     * @return
     * @param condition
     */
    int findTotalCount(Map<String, String[]> condition);

    /**
     * 分页查询每页记录
     * @param start
     * @param rows
     * @param condition
     * @return
     */
    List<User> findByPage(int start, int rows, Map<String, String[]> condition);
}
