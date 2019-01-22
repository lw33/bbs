package top.lw33.bbs.pojo;

import java.util.Date;

public class User {
    private Integer uid;

    private String passwd;

    private String name;

    private String gender;

    private Date birth;

    private String tel;

    private String vocation;

    private String address;

    private Integer isadmin;

    private String profile;

    private String introduction;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd == null ? null : passwd.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getVocation() {
        return vocation;
    }

    public void setVocation(String vocation) {
        this.vocation = vocation == null ? null : vocation.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Integer getIsadmin() {
        return isadmin;
    }

    public void setIsadmin(Integer isadmin) {
        this.isadmin = isadmin;
    }

    public String getProfile() {
        return profile;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", passwd='" + passwd + '\'' +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", birth=" + birth +
                ", tel='" + tel + '\'' +
                ", vocation='" + vocation + '\'' +
                ", address='" + address + '\'' +
                ", isadmin=" + isadmin +
                ", profile='" + profile + '\'' +
                ", introduction='" + introduction + '\'' +
                '}';
    }

    public void setProfile(String profile) {
        this.profile = profile == null ? null : profile.trim();
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? null : introduction.trim();
    }
}