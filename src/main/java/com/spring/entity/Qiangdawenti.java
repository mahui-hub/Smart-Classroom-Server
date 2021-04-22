package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
import net.jntoo.db.Query;

@Table(name = "qiangdawenti")
public class Qiangdawenti implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "bianhao")
    private String bianhao;
    @Column(name = "biaoti")
    private String biaoti;
    @Column(name = "tupian")
    private String tupian;
    @Column(name = "faburen")
    private String faburen;
    @Column(name = "beizhu")
    private String beizhu;
    @Column(name = "qiangdaren")
    private String qiangdaren;
    private Integer wentiqiangdaid;

    @Column(name = "addtime")
    private String addtime;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getHuidawentiCount()
    {
        return Query.make("huidawenti").where("qiangdawentiid" , id).count();
    }


    public String getBianhao() {
        return bianhao;
    }
    public void setBianhao(String bianhao) {
        this.bianhao = bianhao == null ? "" : bianhao.trim();
    }

    public String getBiaoti() {
        return biaoti;
    }
    public void setBiaoti(String biaoti) {
        this.biaoti = biaoti == null ? "" : biaoti.trim();
    }

    public String getTupian() {
        return tupian;
    }
    public void setTupian(String tupian) {
        this.tupian = tupian == null ? "" : tupian.trim();
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

    public String getQiangdaren() {
        return qiangdaren;
    }
    public void setQiangdaren(String qiangdaren) {
        this.qiangdaren = qiangdaren == null ? "" : qiangdaren.trim();
    }
    public Integer getWentiqiangdaid() {
        return wentiqiangdaid;
    }
    public void setWentiqiangdaid(Integer wentiqiangdaid) {
        this.wentiqiangdaid = wentiqiangdaid == null ? 0 : wentiqiangdaid;
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }
}
