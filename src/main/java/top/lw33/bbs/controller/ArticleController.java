package top.lw33.bbs.controller;

import top.lw33.bbs.config.Config;
import top.lw33.bbs.pojo.Article;
import top.lw33.bbs.pojo.Comment;
import top.lw33.bbs.pojo.User;
import top.lw33.bbs.service.ArticleService;
import top.lw33.bbs.service.CommentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/article")
public class ArticleController {

    @Autowired
    ArticleService articleService;

    @Autowired
    CommentService commentService;

    @RequestMapping("/getArticles/{pageNum}")
    public ModelAndView getUserList(ModelAndView modelAndView, @PathVariable("pageNum")Integer pageNum){

        if (pageNum == null) {
            pageNum = 1;
        }
        PageHelper.startPage(pageNum, Config.PAGESIZE);//当前页，页面大小
        //紧跟着的第一个select方法会被分页

        List<Article> articles=articleService.getArticles();
        PageInfo<Article> pageInfo=new PageInfo<>(articles);
        //pageInfo.get
        modelAndView.addObject("articles", articles);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.addObject("index", 1);
        modelAndView.setViewName("index");
        return modelAndView;
    }

    @RequestMapping("/manage/{pageNum}")
    public ModelAndView getArticleList(ModelAndView modelAndView, @PathVariable("pageNum")Integer pageNum, HttpSession session){

        if (pageNum == null) {
            pageNum = 1;
        }
        PageHelper.startPage(pageNum, Config.PAGESIZE);//当前页，页面大小
        //紧跟着的第一个select方法会被分页
        User user = (User) session.getAttribute("user");
        if (user == null) {
            modelAndView.setViewName("redirect:/index");
            return modelAndView;
        }
        List<Article> articles = null;
        if (user.getIsadmin() == 1) {
            articles = articleService.getArticles();
        } else {

            articles = articleService.selectArticleByUid(((User) session.getAttribute("user")).getUid());
        }
        //articles.forEach(article -> System.out.println(article.getAuthor().getName()));
        articles.forEach(article -> article.setCommentNum(commentService.getCommentNumByAid(article.getAid())));

        PageInfo<Article> pageInfo=new PageInfo<>(articles);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.addObject("articles", articles);
        modelAndView.addObject("index", 2);
        modelAndView.setViewName("articleManager");
        return modelAndView;
    }

    @RequestMapping("/addArticle")
    public void addArticle(Article article,String content, HttpServletResponse response) {
        article.setAcontent(content);
        articleService.addArticle(article);
        response.setContentType("text/html;charset=utf-8");
        try {
            response.getWriter().print("<script>alert('发帖成功');location.href='/article/manage/1'</script>\n");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    @RequestMapping("/detail/{aid}")
    public ModelAndView detail(ModelAndView modelAndView, @PathVariable("aid") Integer aid, Integer pageNum) {
        if (pageNum == null) {
            pageNum = 1;
        }
        if (aid != null) {
            List<Comment> comments = commentService.getCommentsByAid(aid);
            Article article = articleService.getArticleByAid(aid);
            Integer comNum = commentService.getCommentNumByAid(aid);
            article.setCommentNum(comNum);
            PageHelper.startPage(pageNum, Config.PAGESIZE);//当前页，页面大小
            //紧跟着的第一个select方法会被分页
            PageInfo<Comment> pageInfo = new PageInfo<>(comments);
            //pageInfo.get
            modelAndView.addObject("comments", comments);
            //comments.forEach(comment -> System.out.println(comment.getCcontent()));
            modelAndView.addObject("pageInfo", pageInfo);
            modelAndView.addObject("article", article);
            modelAndView.setViewName("articles/articleDetail");
            //return modelAndView;
        } else {

            modelAndView.setViewName("redirect:/index");
        }
        return modelAndView;
    }

    @RequestMapping("/showChangeArticle/{aid}")
    @ResponseBody
    public Article article(@PathVariable("aid") Integer aid) {
        if (aid != null) {
            Article article = articleService.getArticleByAid(aid);
            return article;
        }
        return null;
    }

    @RequestMapping("/update")
    public String update(Article article) {

        int i = articleService.updateArticle(article);
        if (i > 0) {
            return "redirect:/article/manage/1";
        }
        return null;
    }

    @RequestMapping("/delete")
    @ResponseBody
    public int delete(Integer aid) {
        if (aid == null) {
            return 0;
        }
        int i = articleService.deleteArticleByAid(aid);
        if (i > 0) {

            return 1;
        }
        return 0;
    }

    @RequestMapping("/updateSpecial")
    public void updateSpecial(Article article, HttpSession session) {
        if (((User) session.getAttribute("user")).getIsadmin() == 0) {
            return;
        }
        articleService.updateArticle(article);

    }


}
