package top.lw33.bbs.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.lw33.bbs.mapper.CommentMapper;
import top.lw33.bbs.mapper.ReplyMapper;
import top.lw33.bbs.mapper.UserMapper;
import top.lw33.bbs.pojo.Comment;
import top.lw33.bbs.pojo.CommentExample;
import top.lw33.bbs.pojo.Reply;
import top.lw33.bbs.pojo.ReplyExample;
import top.lw33.bbs.service.CommentService;

import java.util.Date;
import java.util.List;
import java.util.Objects;

@Service
public class CommentServiceImpl implements CommentService {

    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    @Autowired
    CommentMapper commentMapper;

    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    @Autowired
    UserMapper userMapper;

    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    @Autowired
    ReplyMapper replyMapper;

    @Override
    public List<Comment> getCommentsByAid(int aid) {

        CommentExample example = new CommentExample();
        CommentExample.Criteria criteria = example.createCriteria();
        criteria.andAidEqualTo(aid);

        List<Comment> comments = commentMapper.selectByExampleWithBLOBs(example);
        comments.forEach(comment -> {
            comment.setAuthor(userMapper.selectByPrimaryKey(comment.getUid()));
            comment.setReplies(selectReplysByAidAndCid(aid, comment.getCid()));
        });
        //comments.forEach(comment -> System.out.println(comment.getCcontent()));
        return comments;
    }

    @Override
    public Integer getCommentNumByAid(int aid) {
        CommentExample example = new CommentExample();
        CommentExample.Criteria criteria = example.createCriteria();
        criteria.andAidEqualTo(aid);
        int i = commentMapper.countByExample(example);
        return i;
    }

    @Override
    public Integer addComment(Comment comment) {
        int result = 0;
        //comment
        if (Objects.nonNull(comment)) {
            comment.setDate(new Date());
            result = commentMapper.insert(comment);
        }
        return result;
    }

    @Override
    public Integer addReply(Reply reply) {
        int result = 0;
        reply.setDate(new Date());
        if (Objects.nonNull(reply)) {

            result = replyMapper.insert(reply);
        }
        return result;
    }

    @Override
    public List<Reply> selectReplysByAidAndCid(int aid, int cid) {

        ReplyExample example = new ReplyExample();
        ReplyExample.Criteria criteria = example.createCriteria();
        criteria.andAidEqualTo(aid);
        criteria.andCidEqualTo(cid);
        List<Reply> replies = replyMapper.selectByExampleWithBLOBs(example);
        replies.forEach(reply -> reply.setReplyer(userMapper.selectByPrimaryKey(reply.getUid())));
        return replies;
    }

}
