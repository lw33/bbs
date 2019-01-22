package top.lw33.bbs.pojo;

import java.util.Date;
import java.util.List;

public class Comment {
    private Integer cid;

    private Date date;

    private Integer aid;

    private Integer uid;

    private String ccontent;

    private User author;

    private List<Reply> replies;

    public List<Reply> getReplies() {
        return replies;
    }

    public void setReplies(List<Reply> replies) {
        this.replies = replies;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getCcontent() {
        return ccontent;
    }

    public void setCcontent(String ccontent) {
        this.ccontent = ccontent == null ? null : ccontent.trim();
    }

    @Override
    public String toString() {
        return "Comment{" +
                "cid=" + cid +
                ", date=" + date +
                ", aid=" + aid +
                ", uid=" + uid +
                ", ccontent='" + ccontent + '\'' +
                '}';
    }
}