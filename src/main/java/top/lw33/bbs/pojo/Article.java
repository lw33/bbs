package top.lw33.bbs.pojo;

import java.util.Date;

public class Article {
    private Integer aid;

    private String title;

    private Date cratetime;

    private Date lastmodify;

    private Integer uid;

    private String lable;

    private Integer istop;

    private Integer isexcellent;

    private Integer status;

    private String acontent;

    private User author;

    private Integer commentNum;

    public Integer getCommentNum() {
        return commentNum;
    }

    public void setCommentNum(Integer commentNum) {
        this.commentNum = commentNum;
    }

    @Override
    public String toString() {
        return "Article{" +
                "aid=" + aid +
                ", title='" + title + '\'' +
                ", cratetime=" + cratetime +
                ", lastmodify=" + lastmodify +
                ", uid=" + uid +
                ", lable='" + lable + '\'' +
                ", istop=" + istop +
                ", isexcellent=" + isexcellent +
                ", status=" + status +
                ", acontent='" + acontent + '\'' +
                ", author=" + author +
                '}';
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Date getCratetime() {
        return cratetime;
    }

    public void setCratetime(Date cratetime) {
        this.cratetime = cratetime;
    }

    public Date getLastmodify() {
        return lastmodify;
    }

    public void setLastmodify(Date lastmodify) {
        this.lastmodify = lastmodify;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getLable() {
        return lable;
    }

    public void setLable(String lable) {
        this.lable = lable == null ? null : lable.trim();
    }

    public Integer getIstop() {
        return istop;
    }

    public void setIstop(Integer istop) {
        this.istop = istop;
    }

    public Integer getIsexcellent() {
        return isexcellent;
    }

    public void setIsexcellent(Integer isexcellent) {
        this.isexcellent = isexcellent;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getAcontent() {
        return acontent;
    }

    public void setAcontent(String acontent) {
        this.acontent = acontent == null ? null : acontent.trim();
    }
}