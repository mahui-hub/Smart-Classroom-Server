package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
import net.jntoo.db.Query;

@Table(name = "dianzan")
public class Dianzan implements Serializable {
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
    @Column(name = "faburen")
    private String faburen;
    @Column(name = "beizhu")
    private String beizhu;
    @Column(name = "dianzanren")
    private String dianzanren;
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

    public String getFaburen() {
        return faburen;
    }
    public void setFaburen(String faburen) {
        this.faburen = faburen == null ? "" : faburen.trim();
    }

    public String getBeizhu() {
        return beizhu;
    }
    public void setBeizhu(String beizhu) {
        this.beizhu = beizhu == null ? "" : beizhu.trim();
    }

    public String getDianzanren() {
        return dianzanren;
    }
    public void setDianzanren(String dianzanren) {
        this.dianzanren = dianzanren == null ? "" : dianzanren.trim();
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
