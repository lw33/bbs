package top.lw33.bbs.service;

import top.lw33.bbs.pojo.User;

import java.util.List;

public interface UserService {

    User login(User user);

    User register(User user);

    User selectByUserId(int id);

    /**
     * 查出所有用户
     * @return
     */
    List<User> selectUsers();

    User selectUserByName(String name);

    int deleteUserByUid(int id);

    int updateUser(User user);
}
