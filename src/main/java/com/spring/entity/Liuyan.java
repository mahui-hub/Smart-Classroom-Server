package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
import net.jntoo.db.Query;

@Table(name = "liuyan")
public class Liuyan implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;
    @Column(name = "kechengid")
    private Integer kechengid;
    @Column(name = "wentibiaoti")
    private String wentibiaoti;
    @Column(name = "wentineirong")
    private String wentineirong;
    @Column(name = "dayineirong")
    private String dayineirong;
    @Column(name = "qiuzhuren")
    private String qiuzhuren;
    @Column(name = "jiedaren")
    private String jiedaren;
    @Column(name = "addtime")
    private String addtime;

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public Integer getKechengid() {
        return kechengid;
    }
    public void setKechengid(Integer kechengid) {
        this.kechengid = kechengid;
    }

    public String getWentibiaoti() {
        return wentibiaoti;
    }
    public void setWentibiaoti(String wentibiaoti) {
        this.wentibiaoti = wentibiaoti == null ? "" : wentibiaoti.trim();
    }

    public String getWentineirong() {
        return wentineirong;
    }
    public void setWentineirong(String wentineirong) {
        this.wentineirong = wentineirong == null ? "" : wentineirong.trim();
    }

    public String getDayineirong() {
        return dayineirong;
    }
    public void setDayineirong(String dayineirong) {
        this.dayineirong = dayineirong == null ? "" : dayineirong.trim();
    }

    public String getQiuzhuren() {
        return qiuzhuren;
    }
    public void setQiuzhuren(String qiuzhuren) {
        this.qiuzhuren = qiuzhuren == null ? "" : qiuzhuren.trim();
    }

    public String getJiedaren() {
        return jiedaren;
    }
    public void setJiedaren(String jiedaren) {
        this.jiedaren = jiedaren== null ? "" :jiedaren.trim();
    }

    public String getAddtime() {
        return addtime;
    }
    public void setAddtime(String addtime) {
        this.addtime = addtime == null ? "" : addtime.trim();
    }

}

