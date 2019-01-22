package top.lw33.bbs.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.lw33.bbs.mapper.ArticleMapper;
import top.lw33.bbs.mapper.CommentMapper;
import top.lw33.bbs.mapper.ReplyMapper;
import top.lw33.bbs.mapper.UserMapper;
import top.lw33.bbs.pojo.Article;
import top.lw33.bbs.pojo.ArticleExample;
import top.lw33.bbs.pojo.CommentExample;
import top.lw33.bbs.pojo.ReplyExample;
import top.lw33.bbs.service.ArticleService;

import java.util.Date;
import java.util.List;
import java.util.Objects;

@Service
public class ArticleServiceImpl implements ArticleService {

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
    public List<Article> getArticles() {
        ArticleExample example = new ArticleExample();
        example.setOrderByClause("isTop DESC, isExcellent DESC, crateTime DESC");
        List<Article> articles = articleMapper.selectByExample(example);
        if (articles != null && articles.size() > 0) {
            articles.forEach(a->{
                a.setAuthor(userMapper.selectByPrimaryKey(a.getUid()));

            });
        }
        return articles;
    }

    @Override
    public Article addArticle(Article article) {
        if (Objects.nonNull(article)) {
            //article.set
            article.setCratetime(new Date());
            article.setLastmodify(new Date());
            article.setIsexcellent(0);
            article.setIstop(0);
            articleMapper.insert(article);
        }
        return article;
    }

    @Override
    public List<Article> selectArticleByUid(int uid) {
        //articleMapper.sele
        ArticleExample example = new ArticleExample();
        ArticleExample.Criteria criteria = example.createCriteria();
        criteria.andUidEqualTo(uid);
        //List<ArticleExample.Criteria> oredCriteria = example.getOredCriteria();
        example.setOrderByClause("isTop DESC, isExcellent DESC, crateTime DESC");
        List<Article> articles = articleMapper.selectByExample(example);
        return articles;
    }

    @Override
    public int deleteArticleByAid(int aid) {
        //commentMapper.deleteByPrimaryKey()
        //commentMapper.selectByExample();
        CommentExample example = new CommentExample();
        CommentExample.Criteria criteria = example.createCriteria();
        criteria.andAidEqualTo(aid);
        commentMapper.deleteByExample(example);

        ReplyExample replyExample = new ReplyExample();
        ReplyExample.Criteria replyExampleCriteria = replyExample.createCriteria();
        replyExampleCriteria.andAidEqualTo(aid);
        replyMapper.deleteByExample(replyExample);
        int i = articleMapper.deleteByPrimaryKey(aid);

        return i;
    }

    @Override
    public int updateArticle(Article article) {
        article.setLastmodify(new Date());
        //articleMapper.updateByExampleWithBLOBs()
        int i = articleMapper.updateByPrimaryKeySelective(article);
        return i;
    }

    @Override
    public Article getArticleByAid(Integer aid) {

        Article article = articleMapper.selectByPrimaryKey(aid);
        article.setAuthor(userMapper.selectByPrimaryKey(article.getUid()));
        return article;
    }
}
