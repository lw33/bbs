package top.lw33.bbs.service;


import top.lw33.bbs.pojo.Comment;
import top.lw33.bbs.pojo.Reply;

import java.util.List;

public interface CommentService {

    /**
     * 通过帖子id查询评论
     * @param aid
     * @return
     */
    List<Comment> getCommentsByAid(int aid);

    /**
     * 通过帖子id查询评论数
     * @param aid
     * @return
     */
    Integer getCommentNumByAid(int aid);

    /**
     * 添加评论
     * @param comment
     * @return
     */
    Integer addComment(Comment comment);

    /**
     * 添加回复
     * @param reply
     * @return
     */
    Integer addReply(Reply reply);

    /**
     * 通过贴子与评论id查回复
     * @param aid
     * @param cid
     * @return
     */
    List<Reply> selectReplysByAidAndCid(int aid, int cid);
}
