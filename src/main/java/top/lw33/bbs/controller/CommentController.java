package top.lw33.bbs.controller;

import top.lw33.bbs.pojo.Comment;
import top.lw33.bbs.pojo.Reply;
import top.lw33.bbs.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private CommentService commentService;



    @RequestMapping("/add")
    public void add(Comment comment,String content, HttpServletRequest request, HttpServletResponse response) {

        comment.setCcontent(content);
        Integer result = commentService.addComment(comment);
        response.setContentType("text/html;charset=utf-8");

        if (result > 0) {
            try {
                response.getWriter().print("<script>alert('评论成功');location.href='/article/detail/"+ comment.getAid()+"'</script>\n");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    @RequestMapping("/addReply")
    @ResponseBody
    public String add(Reply reply) {
        commentService.addReply(reply);
        return "ok";
    }
}
