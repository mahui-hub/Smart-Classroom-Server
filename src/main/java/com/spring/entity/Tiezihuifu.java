package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
import net.jntoo.db.Query;

@Table(name = "tiezihuifu")
public class Tiezihuifu implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "tiezibianhao")
    private String tiezibianhao;
    @Column(name = "biaoti")
    private String biaoti;
    @Column(name = "fenlei")
    private String fenlei;
    @Column(name = "huifuneirong")
    private String huifuneirong;
    @Column(name = "huifuren")
    private String huifuren;
    private Integer tieziid;

    @Column(name = "addtime")
    private String addtime;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }



    public String getTiezibianhao() {
        return tiezibianhao;
    }
    public void setTiezibianhao(String tiezibianhao) {
        this.tiezibianhao = tiezibianhao == null ? "" : tiezibianhao.trim();
    }

    public String getBiaoti() {
        return biaoti;
    }
    public void setBiaoti(String biaoti) {
        this.biaoti = biaoti == null ? "" : biaoti.trim();
    }

    public String getFenlei() {
        return fenlei;
    }
    public void setFenlei(String fenlei) {
        this.fenlei = fenlei == null ? "" : fenlei.trim();
    }

    public String getHuifuneirong() {
        return huifuneirong;
    }
    public void setHuifuneirong(String huifuneirong) {
        this.huifuneirong = huifuneirong == null ? "" : huifuneirong.trim();
    }

    public String getHuifuren() {
        return huifuren;
    }
    public void setHuifuren(String huifuren) {
        this.huifuren = huifuren == null ? "" : huifuren.trim();
    }
    public Integer getTieziid() {
        return tieziid;
    }
    public void setTieziid(Integer tieziid) {
        this.tieziid = tieziid == null ? 0 : tieziid;
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }
}
