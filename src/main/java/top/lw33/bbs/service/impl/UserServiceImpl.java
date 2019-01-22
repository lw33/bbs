package top.lw33.bbs.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.lw33.bbs.config.Config;
import top.lw33.bbs.mapper.ArticleMapper;
import top.lw33.bbs.mapper.CommentMapper;
import top.lw33.bbs.mapper.ReplyMapper;
import top.lw33.bbs.mapper.UserMapper;
import top.lw33.bbs.pojo.*;
import top.lw33.bbs.service.UserService;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    @Autowired
    private ArticleMapper articleMapper;

    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    @Autowired
    private UserMapper userMapper;

    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    @Autowired
    private CommentMapper commentMapper;

    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    @Autowired
    private ReplyMapper replyMapper;
    @Override
    public User login(User user) {

        if (StringUtils.isNotBlank(user.getName()) && StringUtils.isNotBlank(user.getPasswd())) {


            UserExample example = new UserExample();
            UserExample.Criteria criteria = example.createCriteria();
            criteria.andNameEqualTo(user.getName());
            criteria.andPasswdEqualTo(user.getPasswd());
            List<User> users = userMapper.selectByExample(example);
            if (users != null && users.size() > 0) {
                return users.get(0);
            }
        }
        return null;
    }

    @Override
    public User register(User user) {
        //selectUserByName(user.n)
        user.setProfile(Config.DEFAULT_HEADIMG_ADDRESS);
        user.setIsadmin(0);
        user.setGender("男");
        user.setIntroduction("这个人很赖，什么都没有留下");
        int insert = userMapper.insert(user);
        user = login(user);
        if (insert > 0) {
            user.setPasswd("");
            return user;
        }
        return null;
    }

    @Override
    public User selectByUserId(int id) {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andUidEqualTo(id);
        List<User> users = userMapper.selectByExampleWithBLOBs(example);
        if (users != null && users.size() > 0) {
            return users.get(0);

        }
        return null;
    }

    @Override
    public List<User> selectUsers() {

        UserExample example = new UserExample();
        example.setOrderByClause("isAdmin DESC");
        List<User> users = userMapper.selectByExample(example);
        //if (users)
        return users;
    }

    @Override
    public User selectUserByName(String name) {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andNameEqualTo(name);
        List<User> users = userMapper.selectByExample(example);
        if (users != null && users.size() > 0) {

            return users.get(0);
        }
        return null;
    }

    @Override
    public int deleteUserByUid(int id) {
        CommentExample example = new CommentExample();
        CommentExample.Criteria criteria = example.createCriteria();
        criteria.andUidEqualTo(id);
        commentMapper.deleteByExample(example);

        ReplyExample replyExample = new ReplyExample();
        ReplyExample.Criteria replyExampleCriteria = replyExample.createCriteria();
        replyExampleCriteria.andUidEqualTo(id);
        replyMapper.deleteByExample(replyExample);
        //articleMapper.deleteByPrimaryKey(aid);
        ArticleExample articleExample = new ArticleExample();
        ArticleExample.Criteria articleExampleCriteria = articleExample.createCriteria();
        articleExampleCriteria.andUidEqualTo(id);
        articleMapper.deleteByExample(articleExample);
        int i = userMapper.deleteByPrimaryKey(id);
        return i;
    }

    @Override
    public int updateUser(User user) {

        int i = userMapper.updateByPrimaryKeySelective(user);
        return i;
    }
}
