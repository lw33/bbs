package top.lw33.bbs.service;

import top.lw33.bbs.pojo.Article;

import java.util.List;

public interface ArticleService {


    /**
     * 查询所有帖子
     * @return
     */
    List<Article> getArticles();


    /**
     * 通过贴子id贴子
     * @param aid
     * @return
     */
    Article getArticleByAid(Integer aid);


    /**
     * 添加帖子
     * @param article
     * @return
     */
    Article addArticle(Article article);

    /**
     * 通过用户id查询用户发帖
     *
     * @param uid
     * @return
     */
    List<Article> selectArticleByUid(int uid);


    /**
     * 通过帖子id删除帖子
     * @param aid
     * @return
     */
    int deleteArticleByAid(int aid);


    /**
     * 修改帖子
     * @param article
     * @return
     */
    int updateArticle(Article article);

    //int deleteArticleByAid(int)

}
