package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
import net.jntoo.db.Query;

@Table(name = "dati")
public class Dati implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "bianhao")
    private String bianhao;
    @Column(name = "timu")
    private String timu;
    @Column(name = "faburen")
    private String faburen;
    @Column(name = "fujian")
    private String fujian;
    @Column(name = "fenshu")
    private Double fenshu;
    @Column(name = "beizhu")
    private String beizhu;
    @Column(name = "huidaren")
    private String huidaren;
    private Integer suitangceshiid;

    @Column(name = "addtime")
    private String addtime;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getDatipingyueCount()
    {
        return Query.make("datipingyue").where("datiid" , id).count();
    }


    public String getBianhao() {
        return bianhao;
    }
    public void setBianhao(String bianhao) {
        this.bianhao = bianhao == null ? "" : bianhao.trim();
    }

    public String getTimu() {
        return timu;
    }
    public void setTimu(String timu) {
        this.timu = timu == null ? "" : timu.trim();
    }

    public String getFaburen() {
        return faburen;
    }
    public void setFaburen(String faburen) {
        this.faburen = faburen == null ? "" : faburen.trim();
    }

    public String getFujian() {
        return fujian;
    }
    public void setFujian(String fujian) {
        this.fujian = fujian == null ? "" : fujian.trim();
    }

    public Double getFenshu() {
        return fenshu;
    }
    public void setFenshu(Double fenshu) {
        this.fenshu = fenshu == null ? 0.0f : fenshu;
    }

    public String getBeizhu() {
        return beizhu;
    }
    public void setBeizhu(String beizhu) {
        this.beizhu = beizhu == null ? "" : beizhu.trim();
    }

    public String getHuidaren() {
        return huidaren;
    }
    public void setHuidaren(String huidaren) {
        this.huidaren = huidaren == null ? "" : huidaren.trim();
    }
    public Integer getSuitangceshiid() {
        return suitangceshiid;
    }
    public void setSuitangceshiid(Integer suitangceshiid) {
        this.suitangceshiid = suitangceshiid == null ? 0 : suitangceshiid;
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }
}
